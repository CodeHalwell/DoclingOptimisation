#!/usr/bin/env bash
set -euo pipefail

THREADS=(6 10 12)
PDF_PATH="${1:-input/mortgage.pdf}"
OUT_DIR="output"
LOG_DIR="."

mkdir -p "$OUT_DIR"

if [[ ! -f "$PDF_PATH" ]]; then
  echo "Error: PDF not found at '$PDF_PATH'"
  echo "Usage: bash scripts/benchmark_threads.sh [input/path/to/file.pdf]"
  echo "Note: the PDF must be located under the ./input directory so it is visible inside the Docker container."
  exit 1
fi

echo "Benchmarking Docling thread counts on: $PDF_PATH"
echo

for t in "${THREADS[@]}"; do
  echo "Running threads=$t ..."
  DOCLING_NUM_THREADS="$t" docker compose run --rm docling "$PDF_PATH" \
    > "$OUT_DIR/attention_mac_t${t}.md" \
    2> "$LOG_DIR/timing_t${t}.log"
done

echo
printf "%-8s %-14s %-12s\n" "Threads" "Convert(s)" "Total(s)"
printf "%-8s %-14s %-12s\n" "-------" "----------" "--------"

for t in "${THREADS[@]}"; do
  convert_secs=$(grep -Eo 'Finished converting document .* in [0-9]+(\.[0-9]+)? sec\.' "timing_t${t}.log" | sed -E 's/.* in ([0-9]+(\.[0-9]+)?) sec\./\1/' | tail -1)
  total_secs=$(grep -Eo '\[ *[0-9.]+s\] Done — total [0-9.]+s' "timing_t${t}.log" | grep -Eo '[0-9.]+s' | tail -1 | tr -d 's')
  printf "%-8s %-14s %-12s\n" "$t" "${convert_secs:-n/a}" "${total_secs:-n/a}"
done

echo
if command -v sha256sum &>/dev/null; then
  sha256sum "$OUT_DIR/attention_mac_t6.md" "$OUT_DIR/attention_mac_t10.md" "$OUT_DIR/attention_mac_t12.md"
elif command -v shasum &>/dev/null; then
  shasum -a 256 "$OUT_DIR/attention_mac_t6.md" "$OUT_DIR/attention_mac_t10.md" "$OUT_DIR/attention_mac_t12.md"
else
  echo "Warning: no sha256sum or shasum found; skipping checksum verification"
fi
