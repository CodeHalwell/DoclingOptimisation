[Skip to content](https://github.com/astral-sh/uv/releases#start-of-content)

You signed in with another tab or window. [Reload](https://github.com/astral-sh/uv/releases) to refresh your session.You signed out in another tab or window. [Reload](https://github.com/astral-sh/uv/releases) to refresh your session.You switched accounts on another tab or window. [Reload](https://github.com/astral-sh/uv/releases) to refresh your session.Dismiss alert

{{ message }}

[astral-sh](https://github.com/astral-sh)/ **[uv](https://github.com/astral-sh/uv)** Public

- [Notifications](https://github.com/login?return_to=%2Fastral-sh%2Fuv) You must be signed in to change notification settings
- [Fork\\
2.6k](https://github.com/login?return_to=%2Fastral-sh%2Fuv)
- [Star\\
79.4k](https://github.com/login?return_to=%2Fastral-sh%2Fuv)


# Releases: astral-sh/uv

Releases · astral-sh/uv

## 0.10.4

10 hours ago
17 Feb 22:04


![@github-actions](https://avatars.githubusercontent.com/in/15368?s=40&v=4)[github-actions](https://github.com/apps/github-actions)

[0.10.4](https://github.com/astral-sh/uv/tree/0.10.4)

[`079e3fd`](https://github.com/astral-sh/uv/commit/079e3fd059c3d073151a6ac3b39eb129d66b517d)

This commit was created on GitHub.com and signed with GitHub’s **verified signature**.


GPG key ID: B5690EEEBB952194

Verified
on Feb 17, 2026, 04:15 PM

[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).


Compare

# Choose a tag to compare

## Sorry, something went wrong.

Filter

Loading

## Sorry, something went wrong.

### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

## No results found

[View all tags](https://github.com/astral-sh/uv/tags)

[0.10.4](https://github.com/astral-sh/uv/releases/tag/0.10.4)[Latest](https://github.com/astral-sh/uv/releases/latest)

[Latest](https://github.com/astral-sh/uv/releases/latest)

## Release Notes

Released on 2026-02-17.

### Enhancements

- Remove duplicate references to the affected paths when showing `uv python` errors ( [#18008](https://github.com/astral-sh/uv/pull/18008))
- Skip discovery of workspace members that contain only git-ignored files, including in sub-directories ( [#18051](https://github.com/astral-sh/uv/pull/18051))

### Bug fixes

- Don't panic when initialising a package at the filesystem root (e.g. `uv init / --name foo`) ( [#17983](https://github.com/astral-sh/uv/pull/17983))
- Fix permissions on `wheel` and `sdist` files produced by the `uv_build` build backend ( [#18020](https://github.com/astral-sh/uv/pull/18020))
- Revert locked file change to fix locked files on NFS mounts ( [#18071](https://github.com/astral-sh/uv/pull/18071))

## Install uv 0.10.4

### Install prebuilt binaries via shell script

```
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/astral-sh/uv/releases/download/0.10.4/uv-installer.sh | sh
```

### Install prebuilt binaries via powershell script

```
powershell -ExecutionPolicy Bypass -c "irm https://github.com/astral-sh/uv/releases/download/0.10.4/uv-installer.ps1 | iex"
```

## Download uv 0.10.4

| File | Platform | Checksum |
| --- | --- | --- |
| [uv-aarch64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-aarch64-apple-darwin.tar.gz) | Apple Silicon macOS | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-aarch64-apple-darwin.tar.gz.sha256) |
| [uv-x86\_64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-x86_64-apple-darwin.tar.gz) | Intel macOS | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-x86_64-apple-darwin.tar.gz.sha256) |
| [uv-aarch64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-aarch64-pc-windows-msvc.zip) | ARM64 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-aarch64-pc-windows-msvc.zip.sha256) |
| [uv-i686-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-i686-pc-windows-msvc.zip) | x86 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-i686-pc-windows-msvc.zip.sha256) |
| [uv-x86\_64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-x86_64-pc-windows-msvc.zip) | x64 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-x86_64-pc-windows-msvc.zip.sha256) |
| [uv-aarch64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-aarch64-unknown-linux-gnu.tar.gz) | ARM64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-aarch64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-i686-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-i686-unknown-linux-gnu.tar.gz) | x86 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-i686-unknown-linux-gnu.tar.gz.sha256) |
| [uv-powerpc64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-powerpc64-unknown-linux-gnu.tar.gz) | PPC64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-powerpc64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-powerpc64le-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-powerpc64le-unknown-linux-gnu.tar.gz) | PPC64LE Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-powerpc64le-unknown-linux-gnu.tar.gz.sha256) |
| [uv-riscv64gc-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-riscv64gc-unknown-linux-gnu.tar.gz) | RISCV Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-riscv64gc-unknown-linux-gnu.tar.gz.sha256) |
| [uv-s390x-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-s390x-unknown-linux-gnu.tar.gz) | S390x Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-s390x-unknown-linux-gnu.tar.gz.sha256) |
| [uv-x86\_64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-x86_64-unknown-linux-gnu.tar.gz) | x64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-x86_64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-armv7-unknown-linux-gnueabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-armv7-unknown-linux-gnueabihf.tar.gz) | ARMv7 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-armv7-unknown-linux-gnueabihf.tar.gz.sha256) |
| [uv-aarch64-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-aarch64-unknown-linux-musl.tar.gz) | ARM64 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-aarch64-unknown-linux-musl.tar.gz.sha256) |
| [uv-i686-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-i686-unknown-linux-musl.tar.gz) | x86 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-i686-unknown-linux-musl.tar.gz.sha256) |
| [uv-x86\_64-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-x86_64-unknown-linux-musl.tar.gz) | x64 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-x86_64-unknown-linux-musl.tar.gz.sha256) |
| [uv-arm-unknown-linux-musleabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-arm-unknown-linux-musleabihf.tar.gz) | ARMv6 MUSL Linux (Hardfloat) | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-arm-unknown-linux-musleabihf.tar.gz.sha256) |
| [uv-armv7-unknown-linux-musleabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-armv7-unknown-linux-musleabihf.tar.gz) | ARMv7 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-armv7-unknown-linux-musleabihf.tar.gz.sha256) |

## Verifying GitHub Artifact Attestations

The artifacts in this release have attestations generated with GitHub Artifact Attestations. These can be verified by using the [GitHub CLI](https://cli.github.com/manual/gh_attestation_verify):

```
gh attestation verify <file-path of downloaded artifact> --repo astral-sh/uv
```

You can also download the attestation from [GitHub](https://github.com/astral-sh/uv/attestations) and verify against that directly:

```
gh attestation verify <file-path of downloaded artifact> --bundle <file-path of downloaded attestation>
```

Assets42

- [dist-manifest.json](https://github.com/astral-sh/uv/releases/download/0.10.4/dist-manifest.json)



sha256:09e8e5004024a001f4d53f6b78faea607c5fc641fea48899fbc5d1e3aeb84184



41.4 KB10 hours ago2026-02-17T22:04:11Z

- [sha256.sum](https://github.com/astral-sh/uv/releases/download/0.10.4/sha256.sum)



sha256:d789c01cd7f588c99cbb0185e1ab4db2e760331121cad49570f8890e538d4a4f



81 Bytes10 hours ago2026-02-17T22:04:11Z

- [source.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.4/source.tar.gz)



sha256:ed9ad20b94f3aa09a561b3914979f24aa974d4f77c977231b36957288b1b7c2d



4.71 MB10 hours ago2026-02-17T22:04:11Z

- [source.tar.gz.sha256](https://github.com/astral-sh/uv/releases/download/0.10.4/source.tar.gz.sha256)



sha256:d789c01cd7f588c99cbb0185e1ab4db2e760331121cad49570f8890e538d4a4f



81 Bytes10 hours ago2026-02-17T22:04:11Z

- [uv-aarch64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-aarch64-apple-darwin.tar.gz)



sha256:a6852e4dc565c8fedcf5adcdf09fca7caf5347739bed512bd95b15dada36db51



18.4 MB10 hours ago2026-02-17T22:04:11Z

- [uv-aarch64-apple-darwin.tar.gz.sha256](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-aarch64-apple-darwin.tar.gz.sha256)



sha256:f47d7fd3f8a4add4143cdcb781328930c48fe3e2abe7990230f7ba18ee0b7423



97 Bytes10 hours ago2026-02-17T22:04:11Z

- [uv-aarch64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-aarch64-pc-windows-msvc.zip)



sha256:77f859cfc26181bdfb94087ce42336d9e2d9e0700bc42f6668445cde517198ce



19.6 MB10 hours ago2026-02-17T22:04:11Z

- [uv-aarch64-pc-windows-msvc.zip.sha256](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-aarch64-pc-windows-msvc.zip.sha256)



sha256:121c2ef372817fad0cc8268395598a13b05dc689f4b56d4d5deeb0af2b83c673



97 Bytes10 hours ago2026-02-17T22:04:12Z

- [uv-aarch64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-aarch64-unknown-linux-gnu.tar.gz)



sha256:c84a6e6405715caa6e2f5ef8e5f29a5d0bc558a954e9f1b5c082b9d4708c222e



20.2 MB10 hours ago2026-02-17T22:04:12Z

- [uv-aarch64-unknown-linux-gnu.tar.gz.sha256](https://github.com/astral-sh/uv/releases/download/0.10.4/uv-aarch64-unknown-linux-gnu.tar.gz.sha256)



sha256:d90fbf79d5e2944f0996251a2da6f4fe2e1f8b5c44213abea4fd30174a54bbfb



102 Bytes10 hours ago2026-02-17T22:04:12Z

- [Source code(zip)](https://github.com/astral-sh/uv/archive/refs/tags/0.10.4.zip)

11 hours ago2026-02-17T21:15:57Z

- [Source code(tar.gz)](https://github.com/astral-sh/uv/archive/refs/tags/0.10.4.tar.gz)

11 hours ago2026-02-17T21:15:57Z

- Show all 42 assets
Loading


### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

alexSkiba15, smarlhens, uwu-420, biduhf, barbashovtd, iAGorynT, Hellevar, Zombi3h3art, yghaderi, OttoAndrey, and bkis reacted with thumbs up emojiuwu-420, Marukome0743, and geyerandreas reacted with hooray emojiuwu-420 and sweetburble reacted with heart emojiuwu-420, unclepomedev, SymphonySimper, aaravind100, yeikel, and bkis reacted with rocket emoji

All reactions

- ![+1](https://github.githubassets.com/assets/1f44d-41cb66fe1e22.png)11 reactions
- ![tada](https://github.githubassets.com/assets/1f389-36899a2cb781.png)3 reactions
- ![heart](https://github.githubassets.com/assets/2764-982dc91ea48a.png)2 reactions
- ![rocket](https://github.githubassets.com/assets/1f680-d0ef47fdb515.png)6 reactions

18 people reacted

## 0.10.3

2 days ago
16 Feb 11:28


![@github-actions](https://avatars.githubusercontent.com/in/15368?s=40&v=4)[github-actions](https://github.com/apps/github-actions)

[0.10.3](https://github.com/astral-sh/uv/tree/0.10.3)

[`c75a0c6`](https://github.com/astral-sh/uv/commit/c75a0c625cbed187d64bbb6c406afd94f3d5da49)

This commit was created on GitHub.com and signed with GitHub’s **verified signature**.


GPG key ID: B5690EEEBB952194

Verified
on Feb 16, 2026, 05:42 AM

[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).


Compare

# Choose a tag to compare

## Sorry, something went wrong.

Filter

Loading

## Sorry, something went wrong.

### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

## No results found

[View all tags](https://github.com/astral-sh/uv/tags)

[0.10.3](https://github.com/astral-sh/uv/releases/tag/0.10.3)

## Release Notes

Released on 2026-02-16.

### Python

- Add CPython 3.15.0a6

### Enhancements

- Don't open file locks for writing ( [#17956](https://github.com/astral-sh/uv/pull/17956))
- Make Windows trampoline error messages consistent with uv proper ( [#17969](https://github.com/astral-sh/uv/pull/17969))
- Log which preview features are enabled ( [#17968](https://github.com/astral-sh/uv/pull/17968))

### Preview features

- Add support for ruff version constraints and `exclude-newer` in `uv format` ( [#17651](https://github.com/astral-sh/uv/pull/17651))
- Fix script path handling when `target-workspace-discovery` is enabled ( [#17965](https://github.com/astral-sh/uv/pull/17965))
- Use version constraints to select the default ruff version used by `uv format` ( [#17977](https://github.com/astral-sh/uv/pull/17977))

### Bug fixes

- Avoid matching managed Python versions by prefixes, e.g. don't match CPython 3.10 when `cpython-3.1` is specified ( [#17972](https://github.com/astral-sh/uv/pull/17972))
- Fix handling of `--allow-existing` with minor version links on Windows ( [#17978](https://github.com/astral-sh/uv/pull/17978))
- Fix panic when encountering unmanaged workspace members ( [#17974](https://github.com/astral-sh/uv/pull/17974))
- Improve accuracy of request timing ( [#18007](https://github.com/astral-sh/uv/pull/18007))
- Reject `u64::MAX` in version segments to prevent overflow ( [#17985](https://github.com/astral-sh/uv/pull/17985))

### Documentation

- Reference Debian Trixie instead of Bookworm ( [#17991](https://github.com/astral-sh/uv/pull/17991))

## Install uv 0.10.3

### Install prebuilt binaries via shell script

```
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/astral-sh/uv/releases/download/0.10.3/uv-installer.sh | sh
```

### Install prebuilt binaries via powershell script

```
powershell -ExecutionPolicy Bypass -c "irm https://github.com/astral-sh/uv/releases/download/0.10.3/uv-installer.ps1 | iex"
```

## Download uv 0.10.3

| File | Platform | Checksum |
| --- | --- | --- |
| [uv-aarch64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-aarch64-apple-darwin.tar.gz) | Apple Silicon macOS | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-aarch64-apple-darwin.tar.gz.sha256) |
| [uv-x86\_64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-x86_64-apple-darwin.tar.gz) | Intel macOS | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-x86_64-apple-darwin.tar.gz.sha256) |
| [uv-aarch64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-aarch64-pc-windows-msvc.zip) | ARM64 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-aarch64-pc-windows-msvc.zip.sha256) |
| [uv-i686-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-i686-pc-windows-msvc.zip) | x86 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-i686-pc-windows-msvc.zip.sha256) |
| [uv-x86\_64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-x86_64-pc-windows-msvc.zip) | x64 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-x86_64-pc-windows-msvc.zip.sha256) |
| [uv-aarch64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-aarch64-unknown-linux-gnu.tar.gz) | ARM64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-aarch64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-i686-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-i686-unknown-linux-gnu.tar.gz) | x86 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-i686-unknown-linux-gnu.tar.gz.sha256) |
| [uv-powerpc64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-powerpc64-unknown-linux-gnu.tar.gz) | PPC64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-powerpc64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-powerpc64le-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-powerpc64le-unknown-linux-gnu.tar.gz) | PPC64LE Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-powerpc64le-unknown-linux-gnu.tar.gz.sha256) |
| [uv-riscv64gc-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-riscv64gc-unknown-linux-gnu.tar.gz) | RISCV Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-riscv64gc-unknown-linux-gnu.tar.gz.sha256) |
| [uv-s390x-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-s390x-unknown-linux-gnu.tar.gz) | S390x Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-s390x-unknown-linux-gnu.tar.gz.sha256) |
| [uv-x86\_64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-x86_64-unknown-linux-gnu.tar.gz) | x64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-x86_64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-armv7-unknown-linux-gnueabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-armv7-unknown-linux-gnueabihf.tar.gz) | ARMv7 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-armv7-unknown-linux-gnueabihf.tar.gz.sha256) |
| [uv-aarch64-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-aarch64-unknown-linux-musl.tar.gz) | ARM64 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-aarch64-unknown-linux-musl.tar.gz.sha256) |
| [uv-i686-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-i686-unknown-linux-musl.tar.gz) | x86 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-i686-unknown-linux-musl.tar.gz.sha256) |
| [uv-x86\_64-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-x86_64-unknown-linux-musl.tar.gz) | x64 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-x86_64-unknown-linux-musl.tar.gz.sha256) |
| [uv-arm-unknown-linux-musleabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-arm-unknown-linux-musleabihf.tar.gz) | ARMv6 MUSL Linux (Hardfloat) | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-arm-unknown-linux-musleabihf.tar.gz.sha256) |
| [uv-armv7-unknown-linux-musleabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-armv7-unknown-linux-musleabihf.tar.gz) | ARMv7 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.3/uv-armv7-unknown-linux-musleabihf.tar.gz.sha256) |

## Verifying GitHub Artifact Attestations

The artifacts in this release have attestations generated with GitHub Artifact Attestations. These can be verified by using the [GitHub CLI](https://cli.github.com/manual/gh_attestation_verify):

```
gh attestation verify <file-path of downloaded artifact> --repo astral-sh/uv
```

You can also download the attestation from [GitHub](https://github.com/astral-sh/uv/attestations) and verify against that directly:

```
gh attestation verify <file-path of downloaded artifact> --bundle <file-path of downloaded attestation>
```

Assets42

Loading

### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

dikesh, geyerandreas, wojiushixiaobai, hungfnguyen, OttoAndrey, wanderingeek, CaptainDriftwood, NEFORCEO, gssantana, biduhf, and 18 more reacted with thumbs up emoji![tada](https://github.githubassets.com/assets/1f389-36899a2cb781.png)14EDM115, EphraimCompEng, wanderingeek, unclepomedev, NEFORCEO, gssantana, uwu-420, thinh9e, boolka, arsenylosev, and 4 more reacted with hooray emoji![heart](https://github.githubassets.com/assets/2764-982dc91ea48a.png)7uwu-420, arsenylosev, AlbertoBarrago, bkis, arnobaer, wanderingeek, and shinGangan reacted with heart emoji![rocket](https://github.githubassets.com/assets/1f680-d0ef47fdb515.png)7SymphonySimper, NEFORCEO, gssantana, uwu-420, arsenylosev, aaravind100, and wanderingeek reacted with rocket emoji![eyes](https://github.githubassets.com/assets/1f440-ee44e91e92a7.png)2Ogawara-Seiji and shinGangan reacted with eyes emoji

All reactions

- ![+1](https://github.githubassets.com/assets/1f44d-41cb66fe1e22.png)28 reactions
- ![tada](https://github.githubassets.com/assets/1f389-36899a2cb781.png)14 reactions
- ![heart](https://github.githubassets.com/assets/2764-982dc91ea48a.png)7 reactions
- ![rocket](https://github.githubassets.com/assets/1f680-d0ef47fdb515.png)7 reactions
- ![eyes](https://github.githubassets.com/assets/1f440-ee44e91e92a7.png)2 reactions

42 people reacted

## 0.10.2

last week
10 Feb 19:20


![@github-actions](https://avatars.githubusercontent.com/in/15368?s=40&v=4)[github-actions](https://github.com/apps/github-actions)

[0.10.2](https://github.com/astral-sh/uv/tree/0.10.2)

[`a788db7`](https://github.com/astral-sh/uv/commit/a788db7e5d33392b523bd6d45929da2c99da9477)

This commit was created on GitHub.com and signed with GitHub’s **verified signature**.


GPG key ID: B5690EEEBB952194

Verified
on Feb 10, 2026, 01:21 PM

[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).


Compare

# Choose a tag to compare

## Sorry, something went wrong.

Filter

Loading

## Sorry, something went wrong.

### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

## No results found

[View all tags](https://github.com/astral-sh/uv/tags)

[0.10.2](https://github.com/astral-sh/uv/releases/tag/0.10.2)

## Release Notes

Released on 2026-02-10.

### Enhancements

- Deprecate unexpected ZIP compression methods ( [#17946](https://github.com/astral-sh/uv/pull/17946))

### Bug fixes

- Fix `cargo-install` failing due to missing `uv-test` dependency ( [#17954](https://github.com/astral-sh/uv/pull/17954))

## Install uv 0.10.2

### Install prebuilt binaries via shell script

```
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/astral-sh/uv/releases/download/0.10.2/uv-installer.sh | sh
```

### Install prebuilt binaries via powershell script

```
powershell -ExecutionPolicy Bypass -c "irm https://github.com/astral-sh/uv/releases/download/0.10.2/uv-installer.ps1 | iex"
```

## Download uv 0.10.2

| File | Platform | Checksum |
| --- | --- | --- |
| [uv-aarch64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-aarch64-apple-darwin.tar.gz) | Apple Silicon macOS | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-aarch64-apple-darwin.tar.gz.sha256) |
| [uv-x86\_64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-x86_64-apple-darwin.tar.gz) | Intel macOS | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-x86_64-apple-darwin.tar.gz.sha256) |
| [uv-aarch64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-aarch64-pc-windows-msvc.zip) | ARM64 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-aarch64-pc-windows-msvc.zip.sha256) |
| [uv-i686-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-i686-pc-windows-msvc.zip) | x86 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-i686-pc-windows-msvc.zip.sha256) |
| [uv-x86\_64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-x86_64-pc-windows-msvc.zip) | x64 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-x86_64-pc-windows-msvc.zip.sha256) |
| [uv-aarch64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-aarch64-unknown-linux-gnu.tar.gz) | ARM64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-aarch64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-i686-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-i686-unknown-linux-gnu.tar.gz) | x86 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-i686-unknown-linux-gnu.tar.gz.sha256) |
| [uv-powerpc64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-powerpc64-unknown-linux-gnu.tar.gz) | PPC64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-powerpc64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-powerpc64le-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-powerpc64le-unknown-linux-gnu.tar.gz) | PPC64LE Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-powerpc64le-unknown-linux-gnu.tar.gz.sha256) |
| [uv-riscv64gc-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-riscv64gc-unknown-linux-gnu.tar.gz) | RISCV Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-riscv64gc-unknown-linux-gnu.tar.gz.sha256) |
| [uv-s390x-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-s390x-unknown-linux-gnu.tar.gz) | S390x Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-s390x-unknown-linux-gnu.tar.gz.sha256) |
| [uv-x86\_64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-x86_64-unknown-linux-gnu.tar.gz) | x64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-x86_64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-armv7-unknown-linux-gnueabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-armv7-unknown-linux-gnueabihf.tar.gz) | ARMv7 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-armv7-unknown-linux-gnueabihf.tar.gz.sha256) |
| [uv-aarch64-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-aarch64-unknown-linux-musl.tar.gz) | ARM64 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-aarch64-unknown-linux-musl.tar.gz.sha256) |
| [uv-i686-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-i686-unknown-linux-musl.tar.gz) | x86 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-i686-unknown-linux-musl.tar.gz.sha256) |
| [uv-x86\_64-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-x86_64-unknown-linux-musl.tar.gz) | x64 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-x86_64-unknown-linux-musl.tar.gz.sha256) |
| [uv-arm-unknown-linux-musleabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-arm-unknown-linux-musleabihf.tar.gz) | ARMv6 MUSL Linux (Hardfloat) | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-arm-unknown-linux-musleabihf.tar.gz.sha256) |
| [uv-armv7-unknown-linux-musleabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-armv7-unknown-linux-musleabihf.tar.gz) | ARMv7 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.2/uv-armv7-unknown-linux-musleabihf.tar.gz.sha256) |

## Verifying GitHub Artifact Attestations

The artifacts in this release have attestations generated with GitHub Artifact Attestations. These can be verified by using the [GitHub CLI](https://cli.github.com/manual/gh_attestation_verify):

```
gh attestation verify <file-path of downloaded artifact> --repo astral-sh/uv
```

You can also download the attestation from [GitHub](https://github.com/astral-sh/uv/attestations) and verify against that directly:

```
gh attestation verify <file-path of downloaded artifact> --bundle <file-path of downloaded attestation>
```

Assets42

Loading

### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

geyerandreas, iliqiliev, uwu-420, biduhf, alexSkiba15, EphraimCompEng, azzamsa, n4gp73e, iAGorynT, Perer876, and 24 more reacted with thumbs up emojihuyndao, uwu-420, thinh9e, Perer876, methbkts, gssantana, binbjz, EDM115, and Denisskas reacted with hooray emojiuwu-420, Perer876, gssantana, binbjz, and Denisskas reacted with heart emojiuwu-420, SymphonySimper, 4ydan, unclepomedev, aaravind100, dikesh, bkis, binbjz, Amraa1, Denisskas, and 2 more reacted with rocket emojixplosionmind, gssantana, binbjz, and Denisskas reacted with eyes emoji

All reactions

- ![+1](https://github.githubassets.com/assets/1f44d-41cb66fe1e22.png)34 reactions
- ![tada](https://github.githubassets.com/assets/1f389-36899a2cb781.png)9 reactions
- ![heart](https://github.githubassets.com/assets/2764-982dc91ea48a.png)5 reactions
- ![rocket](https://github.githubassets.com/assets/1f680-d0ef47fdb515.png)12 reactions
- ![eyes](https://github.githubassets.com/assets/1f440-ee44e91e92a7.png)4 reactions

45 people reacted

## 0.10.1

last week
10 Feb 11:50


![@github-actions](https://avatars.githubusercontent.com/in/15368?s=40&v=4)[github-actions](https://github.com/apps/github-actions)

[0.10.1](https://github.com/astral-sh/uv/tree/0.10.1)

[`b1b14d3`](https://github.com/astral-sh/uv/commit/b1b14d39aef8e307ec5cf1d7243819fd5a2cc544)

This commit was created on GitHub.com and signed with GitHub’s **verified signature**.


GPG key ID: B5690EEEBB952194

Verified
on Feb 10, 2026, 06:14 AM

[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).


Compare

# Choose a tag to compare

## Sorry, something went wrong.

Filter

Loading

## Sorry, something went wrong.

### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

## No results found

[View all tags](https://github.com/astral-sh/uv/tags)

[0.10.1](https://github.com/astral-sh/uv/releases/tag/0.10.1)

## Release Notes

Released on 2026-02-10.

### Enhancements

- Don't panic on metadata read errors ( [#17904](https://github.com/astral-sh/uv/pull/17904))
- Skip empty workspace members instead of failing ( [#17901](https://github.com/astral-sh/uv/pull/17901))
- Don't fail creating a read-only `sdist-vX/.git` if it already exists ( [#17825](https://github.com/astral-sh/uv/pull/17825))

### Documentation

- Suggest `uv python update-shell` over `uv tool update-shell` in Python docs ( [#17941](https://github.com/astral-sh/uv/pull/17941))

## Install uv 0.10.1

### Install prebuilt binaries via shell script

```
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/astral-sh/uv/releases/download/0.10.1/uv-installer.sh | sh
```

### Install prebuilt binaries via powershell script

```
powershell -ExecutionPolicy Bypass -c "irm https://github.com/astral-sh/uv/releases/download/0.10.1/uv-installer.ps1 | iex"
```

## Download uv 0.10.1

| File | Platform | Checksum |
| --- | --- | --- |
| [uv-aarch64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-aarch64-apple-darwin.tar.gz) | Apple Silicon macOS | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-aarch64-apple-darwin.tar.gz.sha256) |
| [uv-x86\_64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-x86_64-apple-darwin.tar.gz) | Intel macOS | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-x86_64-apple-darwin.tar.gz.sha256) |
| [uv-aarch64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-aarch64-pc-windows-msvc.zip) | ARM64 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-aarch64-pc-windows-msvc.zip.sha256) |
| [uv-i686-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-i686-pc-windows-msvc.zip) | x86 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-i686-pc-windows-msvc.zip.sha256) |
| [uv-x86\_64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-x86_64-pc-windows-msvc.zip) | x64 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-x86_64-pc-windows-msvc.zip.sha256) |
| [uv-aarch64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-aarch64-unknown-linux-gnu.tar.gz) | ARM64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-aarch64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-i686-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-i686-unknown-linux-gnu.tar.gz) | x86 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-i686-unknown-linux-gnu.tar.gz.sha256) |
| [uv-powerpc64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-powerpc64-unknown-linux-gnu.tar.gz) | PPC64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-powerpc64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-powerpc64le-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-powerpc64le-unknown-linux-gnu.tar.gz) | PPC64LE Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-powerpc64le-unknown-linux-gnu.tar.gz.sha256) |
| [uv-riscv64gc-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-riscv64gc-unknown-linux-gnu.tar.gz) | RISCV Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-riscv64gc-unknown-linux-gnu.tar.gz.sha256) |
| [uv-s390x-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-s390x-unknown-linux-gnu.tar.gz) | S390x Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-s390x-unknown-linux-gnu.tar.gz.sha256) |
| [uv-x86\_64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-x86_64-unknown-linux-gnu.tar.gz) | x64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-x86_64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-armv7-unknown-linux-gnueabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-armv7-unknown-linux-gnueabihf.tar.gz) | ARMv7 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-armv7-unknown-linux-gnueabihf.tar.gz.sha256) |
| [uv-aarch64-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-aarch64-unknown-linux-musl.tar.gz) | ARM64 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-aarch64-unknown-linux-musl.tar.gz.sha256) |
| [uv-i686-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-i686-unknown-linux-musl.tar.gz) | x86 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-i686-unknown-linux-musl.tar.gz.sha256) |
| [uv-x86\_64-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-x86_64-unknown-linux-musl.tar.gz) | x64 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-x86_64-unknown-linux-musl.tar.gz.sha256) |
| [uv-arm-unknown-linux-musleabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-arm-unknown-linux-musleabihf.tar.gz) | ARMv6 MUSL Linux (Hardfloat) | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-arm-unknown-linux-musleabihf.tar.gz.sha256) |
| [uv-armv7-unknown-linux-musleabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-armv7-unknown-linux-musleabihf.tar.gz) | ARMv7 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.10.1/uv-armv7-unknown-linux-musleabihf.tar.gz.sha256) |

## Verifying GitHub Artifact Attestations

The artifacts in this release have attestations generated with GitHub Artifact Attestations. These can be verified by using the [GitHub CLI](https://cli.github.com/manual/gh_attestation_verify):

```
gh attestation verify <file-path of downloaded artifact> --repo astral-sh/uv
```

You can also download the attestation from [GitHub](https://github.com/astral-sh/uv/attestations) and verify against that directly:

```
gh attestation verify <file-path of downloaded artifact> --bundle <file-path of downloaded attestation>
```

Assets42

Loading

### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

smarlhens, chneau, OttoAndrey, arsenylosev, mikir12, biduhf, azzamsa, uwu-420, gminos, Hellevar, and 16 more reacted with thumbs up emojiMorethanevil, chneau, arsenylosev, uwu-420, thinh9e, audio-engineer, kurtnettle, EphraimCompEng, sckott, gssantana, and 4 more reacted with hooray emojiuwu-420, arnobaer, gssantana, binbjz, and Denisskas reacted with heart emojiuwu-420, tobhofmann, SymphonySimper, aaravind100, dikesh, bkis, binbjz, and Denisskas reacted with rocket emoji

All reactions

- ![+1](https://github.githubassets.com/assets/1f44d-41cb66fe1e22.png)26 reactions
- ![tada](https://github.githubassets.com/assets/1f389-36899a2cb781.png)14 reactions
- ![heart](https://github.githubassets.com/assets/2764-982dc91ea48a.png)5 reactions
- ![rocket](https://github.githubassets.com/assets/1f680-d0ef47fdb515.png)8 reactions

39 people reacted

## 0.10.0

2 weeks ago
05 Feb 21:01


![@github-actions](https://avatars.githubusercontent.com/in/15368?s=40&v=4)[github-actions](https://github.com/apps/github-actions)

[0.10.0](https://github.com/astral-sh/uv/tree/0.10.0)

[`0ba4324`](https://github.com/astral-sh/uv/commit/0ba432459aa4e84d793fd8cfc98d13cf619316bb)

This commit was created on GitHub.com and signed with GitHub’s **verified signature**.


GPG key ID: B5690EEEBB952194

Verified
on Feb 5, 2026, 03:28 PM

[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).


Compare

# Choose a tag to compare

## Sorry, something went wrong.

Filter

Loading

## Sorry, something went wrong.

### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

## No results found

[View all tags](https://github.com/astral-sh/uv/tags)

[0.10.0](https://github.com/astral-sh/uv/releases/tag/0.10.0)

## Release Notes

Since we released uv [0.9.0](https://github.com/astral-sh/uv/releases/tag/0.9.0) in October of 2025, we've accumulated various changes that improve correctness and user experience, but could break some workflows. This release contains those changes; many have been marked as breaking out of an abundance of caution. We expect most users to be able to upgrade without making changes.

This release also includes the stabilization of preview features. Python upgrades are now stable, including the `uv python upgrade` command, `uv python install --upgrade`, and automatically upgrading Python patch versions in virtual environments when a new version is installed. The `add-bounds` and `extra-build-dependencies` settings are now stable. Finally, the `uv workspace dir` and `uv workspace list` utilities for writing scripts against workspace members are now stable.

### Breaking changes

- **Require `--clear` to remove existing virtual environments in `uv venv`** ( [#17757](https://github.com/astral-sh/uv/pull/17757))

Previously, `uv venv` would prompt for confirmation before removing an existing virtual environment in interactive contexts, and remove it without confirmation in non-interactive contexts. Now, `uv venv` requires the `--clear` flag to remove an existing virtual environment. A warning for this change was added in [uv 0.8](https://github.com/astral-sh/uv/blob/main/changelogs/0.8.x.md#breaking-changes).

You can opt out of this behavior by passing the `--clear` flag or setting `UV_VENV_CLEAR=1`.

- **Error if multiple indexes include `default = true`** ( [#17011](https://github.com/astral-sh/uv/pull/17011))

Previously, uv would silently accept multiple indexes with `default = true` and use the first one. Now, uv will error if multiple indexes are marked as the default.

You cannot opt out of this behavior. Remove `default = true` from all but one index.

- **Error when an `explicit` index is unnamed** ( [#17777](https://github.com/astral-sh/uv/pull/17777))

Explicit indexes can only be used via the `[tool.uv.sources]` table, which requires referencing the index by name. Previously, uv would silently accept unnamed explicit indexes, which could never be referenced. Now, uv will error if an explicit index does not have a name.

You cannot opt out of this behavior. Add a `name` to the explicit index or remove the entry.

- **Install alternative Python executables using their implementation name** ( [#17756](https://github.com/astral-sh/uv/pull/17756), [#17760](https://github.com/astral-sh/uv/pull/17760))

Previously, `uv python install` would install PyPy, GraalPy, and Pyodide executables with names like `python3.10` into the bin directory. Now, these executables will be named using their implementation name, e.g., `pypy3.10`, `graalpy3.10`, and `pyodide3.12`, to avoid conflicting with CPython installations.

You cannot opt out of this behavior.

- **Respect global Python version pins in `uv tool run` and `uv tool install`** ( [#14112](https://github.com/astral-sh/uv/pull/14112))

Previously, `uv tool run` and `uv tool install` did not respect the global Python version pin (set via `uv python pin --global`). Now, these commands will use the global Python version when no explicit version is requested.

For `uv tool install`, if the tool is already installed, the Python version will not change unless `--reinstall` or `--python` is provided. If the tool was previously installed with an explicit `--python` flag, the global pin will not override it.

You can opt out of this behavior by providing an explicit `--python` flag.

- **Remove Debian Bookworm, Alpine 3.21, and Python 3.8 Docker images** ( [#17755](https://github.com/astral-sh/uv/pull/17755))

The Debian Bookworm and Alpine 3.21 images were replaced by Debian Trixie and Alpine 3.22 as defaults in [uv 0.9](https://github.com/astral-sh/uv/pull/15352). These older images are now removed. Python 3.8 images are also removed, as Python 3.8 is no longer supported in the Trixie or Alpine base images.

The following image tags are no longer published:


  - `uv:bookworm`, `uv:bookworm-slim`
  - `uv:alpine3.21`
  - `uv:python3.8-*`

Use `uv:debian` or `uv:trixie` instead of `uv:bookworm`, `uv:alpine` or `uv:alpine3.22` instead of `uv:alpine3.21`, and a newer Python version instead of `uv:python3.8-*`.

- **Drop PPC64 (big endian) builds** ( [#17626](https://github.com/astral-sh/uv/pull/17626))

uv no longer provides pre-built binaries for PPC64 (big endian). This platform appears to be largely unused and is only supported on a single manylinux version. PPC64LE (little endian) builds are unaffected.

Building uv from source is still supported for this platform.

- **Skip generating `activate.csh` for relocatable virtual environments** ( [#17759](https://github.com/astral-sh/uv/pull/17759))

Previously, `uv venv --relocatable` would generate an `activate.csh` script that contained hardcoded paths, making it incompatible with relocation. Now, the `activate.csh` script is not generated for relocatable virtual environments.

You cannot opt out of this behavior.

- **Require username when multiple credentials match a URL** ( [#16983](https://github.com/astral-sh/uv/pull/16983))

When using `uv auth login` to store credentials, you can register multiple username and password combinations for the same host. Previously, when uv needed to authenticate and multiple credentials matched the URL (e.g., when retrieving a token with `uv auth token`), uv would pick the first match. Now, uv will error instead.

You cannot opt out of this behavior. Include the username in the request, e.g., `uv auth token --username foo example.com`.

- **Avoid invalidating the lockfile versions after an `exclude-newer` change** ( [#17721](https://github.com/astral-sh/uv/pull/17721))

Previously, changing the `exclude-newer` setting would cause package versions to be upgraded, ignoring the lockfile entirely. Now, uv will only change package versions if they are no longer within the `exclude-newer` range.

You can restore the previous behavior by using `--upgrade` or `--upgrade-package` to opt-in to package version changes.

- **Upgrade `uv format` to Ruff 0.15.0** ( [#17838](https://github.com/astral-sh/uv/pull/17838))

`uv format` now uses [Ruff 0.15.0](https://github.com/astral-sh/ruff/releases/tag/0.15.0), which uses the [2026 style guide](https://astral.sh/blog/ruff-v0.15.0#the-ruff-2026-style-guide). See the blog post for details.

The formatting of code is likely to change. You can opt out of this behavior by requesting an older Ruff version, e.g., `uv format --version 0.14.14`.

- **Update uv crate test features to use `test-` as a prefix** ( [#17860](https://github.com/astral-sh/uv/pull/17860))

This change only affects redistributors of uv. The Cargo features used to gate test dependencies, e.g., `pypi`, have been renamed with a `test-` prefix for clarity, e.g., `test-pypi`.


### Stabilizations

- **`uv python upgrade` and `uv python install --upgrade`** ( [#17766](https://github.com/astral-sh/uv/pull/17766))

When installing Python versions, an [intermediary directory](https://docs.astral.sh/uv/concepts/python-versions/#minor-version-directories) without the patch version attached will be created, and virtual environments will be transparently upgraded to new patch versions.

See the [Python version documentation](https://docs.astral.sh/uv/concepts/python-versions/#upgrading-python-versions) for more details.

- **`uv add --bounds` and the `add-bounds` configuration option** ( [#17660](https://github.com/astral-sh/uv/pull/17660))

This does not come with any behavior changes. You will no longer see an experimental warning when using `uv add --bounds` or `add-bounds` in configuration.

- **`uv workspace list` and `uv workspace dir`** ( [#17768](https://github.com/astral-sh/uv/pull/17768))

This does not come with any behavior changes. You will no longer see an experimental warning when using these commands.

- **`extra-build-dependencies`** ( [#17767](https://github.com/astral-sh/uv/pull/17767))

This does not come with any behavior changes. You will no longer see an experimental warning when using `extra-build-dependencies` in configuration.


There are no breaking changes to [`uv_build`](https://docs.astral.sh/uv/concepts/build-backend/). If you have an upper bound in your `[build-system]` table, you should update it, e.g., from `<0.10.0` to `<0.11.0`.

### Enhancements

- Improve ABI tag error message phrasing ( [#17878](https://github.com/astral-sh/uv/pull/17878))
- Introduce a 10s connect timeout ( [#17733](https://github.com/astral-sh/uv/pull/17733))
- Allow using `pyx.dev` as a target in `uv auth` commands despite `PYX_API_URL` differing ( [#17856](https://github.com/astral-sh/uv/pull/17856))

### Bug fixes

- Support all CPython ABI tag suffixes properly ( [#17817](https://github.com/astral-sh/uv/pull/17817))
- Add support for detecting PowerShell on Linux and macOS ( [#17870](https://github.com/astral-sh/uv/pull/17870))
- Retry timeout errors for streams ( [#17875](https://github.com/astral-sh/uv/pull/17875))

## Install uv 0.10.0

### Install prebuilt binaries via shell script

```
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/astral-sh/uv/releases/download/0.10.0/uv-installer.sh | sh
```

### Install prebuilt binaries via powershell script

```
powershell -ExecutionPolicy Bypass -c "irm https://github.com/astral-sh/uv/releases/download/0.10.0/uv-installer.ps1 | iex"
```

## Download uv 0.10.0

| File | Platform | Checksum |
| --- | --- | --- |
| [uv-aarch64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.10.0/uv-aarch64-apple-darwin.tar.gz) | Apple Silicon macOS | \[checksum\]( [https://github.com/astral-sh/uv/releases/download/0.10.0/uv-aarch64](https://github.com/astral-sh/uv/releases/download/0.10.0/uv-aarch64)... |

[Read more](https://github.com/astral-sh/uv/releases/tag/0.10.0)

Assets42

Loading

### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

smarlhens, azzamsa, laurenzpavlosmalisianos, johnnymillergh, haarisr, alexSkiba15, 4p3rtur3, OttoAndrey, vain-Liang, Samuel-Tefera, and 33 more reacted with thumbs up emojimkniewallner, jcpunk, j178, lucaspar, neutrinoceros, aetriusgx, classronin, omega-lua, jsleeper-netspi, astrojuanlu, and 64 more reacted with hooray emojibrian316, at146, aetriusgx, classronin, gssantana, jsleeper-netspi, boccileonardo, azzamsa, YannMagnin, jonigl, and 20 more reacted with heart emojimkniewallner, lucaspar, pdjohntony, AjayKMehta, Morethanevil, classronin, gssantana, jsleeper-netspi, shunichironomura, npikall, and 31 more reacted with rocket emojixplosionmind, TomaTTC, and binbjz reacted with eyes emoji

All reactions

- ![+1](https://github.githubassets.com/assets/1f44d-41cb66fe1e22.png)43 reactions
- ![tada](https://github.githubassets.com/assets/1f389-36899a2cb781.png)74 reactions
- ![heart](https://github.githubassets.com/assets/2764-982dc91ea48a.png)30 reactions
- ![rocket](https://github.githubassets.com/assets/1f680-d0ef47fdb515.png)41 reactions
- ![eyes](https://github.githubassets.com/assets/1f440-ee44e91e92a7.png)3 reactions

125 people reacted

## 0.9.30

2 weeks ago
04 Feb 21:49


![@github-actions](https://avatars.githubusercontent.com/in/15368?s=40&v=4)[github-actions](https://github.com/apps/github-actions)

[0.9.30](https://github.com/astral-sh/uv/tree/0.9.30)

[`ea45608`](https://github.com/astral-sh/uv/commit/ea4560831e503c6ce34d18739476a71ac6e9a9de)

This commit was created on GitHub.com and signed with GitHub’s **verified signature**.


GPG key ID: B5690EEEBB952194

Verified
on Feb 4, 2026, 04:18 PM

[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).


Compare

# Choose a tag to compare

## Sorry, something went wrong.

Filter

Loading

## Sorry, something went wrong.

### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

## No results found

[View all tags](https://github.com/astral-sh/uv/tags)

[0.9.30](https://github.com/astral-sh/uv/releases/tag/0.9.30)

## Release Notes

Released on 2026-02-04.

### Python

- Add CPython 3.14.3 and 3.13.12 ( [#17849](https://github.com/astral-sh/uv/pull/17849))

### Enhancements

- Allow comma-separated values for `--extra` option ( [#17525](https://github.com/astral-sh/uv/pull/17525))
- Check all files during a dry-run publish instead of stopping at the first failure ( [#17785](https://github.com/astral-sh/uv/pull/17785))
- Clarify `UV_HTTP_TIMEOUT` error message ( [#17493](https://github.com/astral-sh/uv/pull/17493))

### Preview features

- Use relocatable virtual environments by default ( [#17770](https://github.com/astral-sh/uv/pull/17770))

### Bug fixes

- Fix deadlock on token refresh in `uv publish` when using pyx ( [#17832](https://github.com/astral-sh/uv/pull/17832))
- Ignore global Python pins when incompatible with project ( [#15473](https://github.com/astral-sh/uv/pull/15473))

## Install uv 0.9.30

### Install prebuilt binaries via shell script

```
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/astral-sh/uv/releases/download/0.9.30/uv-installer.sh | sh
```

### Install prebuilt binaries via powershell script

```
powershell -ExecutionPolicy Bypass -c "irm https://github.com/astral-sh/uv/releases/download/0.9.30/uv-installer.ps1 | iex"
```

## Download uv 0.9.30

| File | Platform | Checksum |
| --- | --- | --- |
| [uv-aarch64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-aarch64-apple-darwin.tar.gz) | Apple Silicon macOS | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-aarch64-apple-darwin.tar.gz.sha256) |
| [uv-x86\_64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-x86_64-apple-darwin.tar.gz) | Intel macOS | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-x86_64-apple-darwin.tar.gz.sha256) |
| [uv-aarch64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-aarch64-pc-windows-msvc.zip) | ARM64 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-aarch64-pc-windows-msvc.zip.sha256) |
| [uv-i686-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-i686-pc-windows-msvc.zip) | x86 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-i686-pc-windows-msvc.zip.sha256) |
| [uv-x86\_64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-x86_64-pc-windows-msvc.zip) | x64 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-x86_64-pc-windows-msvc.zip.sha256) |
| [uv-aarch64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-aarch64-unknown-linux-gnu.tar.gz) | ARM64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-aarch64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-i686-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-i686-unknown-linux-gnu.tar.gz) | x86 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-i686-unknown-linux-gnu.tar.gz.sha256) |
| [uv-powerpc64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-powerpc64-unknown-linux-gnu.tar.gz) | PPC64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-powerpc64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-powerpc64le-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-powerpc64le-unknown-linux-gnu.tar.gz) | PPC64LE Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-powerpc64le-unknown-linux-gnu.tar.gz.sha256) |
| [uv-riscv64gc-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-riscv64gc-unknown-linux-gnu.tar.gz) | RISCV Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-riscv64gc-unknown-linux-gnu.tar.gz.sha256) |
| [uv-s390x-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-s390x-unknown-linux-gnu.tar.gz) | S390x Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-s390x-unknown-linux-gnu.tar.gz.sha256) |
| [uv-x86\_64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-x86_64-unknown-linux-gnu.tar.gz) | x64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-x86_64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-armv7-unknown-linux-gnueabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-armv7-unknown-linux-gnueabihf.tar.gz) | ARMv7 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-armv7-unknown-linux-gnueabihf.tar.gz.sha256) |
| [uv-aarch64-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-aarch64-unknown-linux-musl.tar.gz) | ARM64 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-aarch64-unknown-linux-musl.tar.gz.sha256) |
| [uv-i686-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-i686-unknown-linux-musl.tar.gz) | x86 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-i686-unknown-linux-musl.tar.gz.sha256) |
| [uv-x86\_64-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-x86_64-unknown-linux-musl.tar.gz) | x64 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-x86_64-unknown-linux-musl.tar.gz.sha256) |
| [uv-arm-unknown-linux-musleabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-arm-unknown-linux-musleabihf.tar.gz) | ARMv6 MUSL Linux (Hardfloat) | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-arm-unknown-linux-musleabihf.tar.gz.sha256) |
| [uv-armv7-unknown-linux-musleabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-armv7-unknown-linux-musleabihf.tar.gz) | ARMv7 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.30/uv-armv7-unknown-linux-musleabihf.tar.gz.sha256) |

## Verifying GitHub Artifact Attestations

The artifacts in this release have attestations generated with GitHub Artifact Attestations. These can be verified by using the [GitHub CLI](https://cli.github.com/manual/gh_attestation_verify):

```
gh attestation verify <file-path of downloaded artifact> --repo astral-sh/uv
```

You can also download the attestation from [GitHub](https://github.com/astral-sh/uv/attestations) and verify against that directly:

```
gh attestation verify <file-path of downloaded artifact> --bundle <file-path of downloaded attestation>
```

Assets44

Loading

### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

uwu-420, edgarrmondragon, barbashovtd, classronin, anomatomato, gh640, iAGorynT, sweetburble, gminos, FHU-yezi, and 18 more reacted with thumbs up emojiuwu-420, classronin, Sayemahamed, arsenylosev, geyerandreas, thinh9e, methbkts, Denisskas, gdamjan, gssantana, and 7 more reacted with hooray emojiuwu-420, classronin, Sayemahamed, arsenylosev, shinGangan, Denisskas, Chili-Man, gssantana, abraaoz, natanim-kemal, and 2 more reacted with heart emojiuwu-420, unclepomedev, rigilfanov, Sayemahamed, arsenylosev, beusj, Denisskas, aaravind100, gssantana, dikesh, and 3 more reacted with rocket emojishinGangan, gssantana, Denisskas, xplosionmind, and binbjz reacted with eyes emoji

All reactions

- ![+1](https://github.githubassets.com/assets/1f44d-41cb66fe1e22.png)28 reactions
- ![tada](https://github.githubassets.com/assets/1f389-36899a2cb781.png)17 reactions
- ![heart](https://github.githubassets.com/assets/2764-982dc91ea48a.png)12 reactions
- ![rocket](https://github.githubassets.com/assets/1f680-d0ef47fdb515.png)13 reactions
- ![eyes](https://github.githubassets.com/assets/1f440-ee44e91e92a7.png)5 reactions

51 people reacted

## 0.9.29

2 weeks ago
03 Feb 19:42


![@github-actions](https://avatars.githubusercontent.com/in/15368?s=40&v=4)[github-actions](https://github.com/apps/github-actions)

[0.9.29](https://github.com/astral-sh/uv/tree/0.9.29)

[`1f1321d`](https://github.com/astral-sh/uv/commit/1f1321d8420e2c97c3bdfac80cc2fd7fee92e209)

This commit was created on GitHub.com and signed with GitHub’s **verified signature**.


GPG key ID: B5690EEEBB952194

Verified
on Feb 3, 2026, 02:06 PM

[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).


Compare

# Choose a tag to compare

## Sorry, something went wrong.

Filter

Loading

## Sorry, something went wrong.

### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

## No results found

[View all tags](https://github.com/astral-sh/uv/tags)

[0.9.29](https://github.com/astral-sh/uv/releases/tag/0.9.29)

## Release Notes

Released on 2026-02-03.

### Python

- Update to Pyodide 0.29.3 ( [#17730](https://github.com/astral-sh/uv/pull/17730))

### Enhancements

- Add wheel-tag-style aliases for manylinux platform names ( [#17750](https://github.com/astral-sh/uv/pull/17750))
- Hint on `uv version --bump dev` similar to pre-release bumps ( [#17796](https://github.com/astral-sh/uv/pull/17796))
- Improve display of RFC 9457 Problem Detail responses in `uv publish` server errors ( [#17787](https://github.com/astral-sh/uv/pull/17787))
- Improve the wording of publish errors during dry-run ( [#17782](https://github.com/astral-sh/uv/pull/17782))
- Set backoff to 10 retries ( [#17816](https://github.com/astral-sh/uv/pull/17816))
- Add properties to synthentic and project roots in Cyclone DX exports ( [#17820](https://github.com/astral-sh/uv/pull/17820))
- Identify the invidividual clients in `uv publish` trace logs ( [#17784](https://github.com/astral-sh/uv/pull/17784))

### Preview features

- Remove special casing for `base` and `default` conda environment names ( [#17758](https://github.com/astral-sh/uv/pull/17758))

### Bug fixes

- Fix `PYTHONHOME` inheritance when spawning different Python versions ( [#17821](https://github.com/astral-sh/uv/pull/17821))
- Fix wheel rejections on freethreading+debug builds ( [#17812](https://github.com/astral-sh/uv/pull/17812))
- Pad with zeros during comparisons in `EqualStar` and `NotEqualStar` operators ( [#17751](https://github.com/astral-sh/uv/pull/17751))
- Reject unknown field names in conflict declarations ( [#17727](https://github.com/astral-sh/uv/pull/17727))
- Fix panics in `system-configuration` in sandboxes ( [#17829](https://github.com/astral-sh/uv/pull/17829))

### Documentation

- Update pip pre-release compatibility information ( [#17788](https://github.com/astral-sh/uv/pull/17788))

### Security

- Hide a subset of environment variable values in `--help` ( [#17745](https://github.com/astral-sh/uv/pull/17745))

## Install uv 0.9.29

### Install prebuilt binaries via shell script

```
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/astral-sh/uv/releases/download/0.9.29/uv-installer.sh | sh
```

### Install prebuilt binaries via powershell script

```
powershell -ExecutionPolicy Bypass -c "irm https://github.com/astral-sh/uv/releases/download/0.9.29/uv-installer.ps1 | iex"
```

## Download uv 0.9.29

| File | Platform | Checksum |
| --- | --- | --- |
| [uv-aarch64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-aarch64-apple-darwin.tar.gz) | Apple Silicon macOS | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-aarch64-apple-darwin.tar.gz.sha256) |
| [uv-x86\_64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-x86_64-apple-darwin.tar.gz) | Intel macOS | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-x86_64-apple-darwin.tar.gz.sha256) |
| [uv-aarch64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-aarch64-pc-windows-msvc.zip) | ARM64 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-aarch64-pc-windows-msvc.zip.sha256) |
| [uv-i686-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-i686-pc-windows-msvc.zip) | x86 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-i686-pc-windows-msvc.zip.sha256) |
| [uv-x86\_64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-x86_64-pc-windows-msvc.zip) | x64 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-x86_64-pc-windows-msvc.zip.sha256) |
| [uv-aarch64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-aarch64-unknown-linux-gnu.tar.gz) | ARM64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-aarch64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-i686-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-i686-unknown-linux-gnu.tar.gz) | x86 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-i686-unknown-linux-gnu.tar.gz.sha256) |
| [uv-powerpc64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-powerpc64-unknown-linux-gnu.tar.gz) | PPC64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-powerpc64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-powerpc64le-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-powerpc64le-unknown-linux-gnu.tar.gz) | PPC64LE Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-powerpc64le-unknown-linux-gnu.tar.gz.sha256) |
| [uv-riscv64gc-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-riscv64gc-unknown-linux-gnu.tar.gz) | RISCV Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-riscv64gc-unknown-linux-gnu.tar.gz.sha256) |
| [uv-s390x-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-s390x-unknown-linux-gnu.tar.gz) | S390x Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-s390x-unknown-linux-gnu.tar.gz.sha256) |
| [uv-x86\_64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-x86_64-unknown-linux-gnu.tar.gz) | x64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-x86_64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-armv7-unknown-linux-gnueabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-armv7-unknown-linux-gnueabihf.tar.gz) | ARMv7 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-armv7-unknown-linux-gnueabihf.tar.gz.sha256) |
| [uv-aarch64-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-aarch64-unknown-linux-musl.tar.gz) | ARM64 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-aarch64-unknown-linux-musl.tar.gz.sha256) |
| [uv-i686-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-i686-unknown-linux-musl.tar.gz) | x86 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-i686-unknown-linux-musl.tar.gz.sha256) |
| [uv-x86\_64-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-x86_64-unknown-linux-musl.tar.gz) | x64 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-x86_64-unknown-linux-musl.tar.gz.sha256) |
| [uv-arm-unknown-linux-musleabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-arm-unknown-linux-musleabihf.tar.gz) | ARMv6 MUSL Linux (Hardfloat) | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-arm-unknown-linux-musleabihf.tar.gz.sha256) |
| [uv-armv7-unknown-linux-musleabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-armv7-unknown-linux-musleabihf.tar.gz) | ARMv7 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.29/uv-armv7-unknown-linux-musleabihf.tar.gz.sha256) |

## Verifying GitHub Artifact Attestations

The artifacts in this release have attestations generated with GitHub Artifact Attestations. These can be verified by using the [GitHub CLI](https://cli.github.com/manual/gh_attestation_verify):

```
gh attestation verify <file-path of downloaded artifact> --repo astral-sh/uv
```

You can also download the attestation from [GitHub](https://github.com/astral-sh/uv/attestations) and verify against that directly:

```
gh attestation verify <file-path of downloaded artifact> --bundle <file-path of downloaded attestation>
```

Assets44

Loading

### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

brian316, Perer876, Berrones-Edwin, 4p3rtur3, uwu-420, vain-Liang, OttoAndrey, Denisskas, jenchen95, Samuel-Tefera, and 11 more reacted with thumbs up emojikurtnettle, unclepomedev, 4p3rtur3, uwu-420, arsenylosev, geyerandreas, methbkts, the-data-viking, thinh9e, gminos, and 9 more reacted with hooray emoji![heart](https://github.githubassets.com/assets/2764-982dc91ea48a.png)124p3rtur3, uwu-420, arsenylosev, kindofabuzz, Denisskas, iliqiliev, bkis, jenchen95, shinGangan, wanderingeek, and 2 more reacted with heart emoji![rocket](https://github.githubassets.com/assets/1f680-d0ef47fdb515.png)9uwu-420, arsenylosev, sweetburble, Denisskas, aaravind100, wanderingeek, classronin, dikesh, and SymphonySimper reacted with rocket emoji![eyes](https://github.githubassets.com/assets/1f440-ee44e91e92a7.png)1shinGangan reacted with eyes emoji

All reactions

- ![+1](https://github.githubassets.com/assets/1f44d-41cb66fe1e22.png)21 reactions
- ![tada](https://github.githubassets.com/assets/1f389-36899a2cb781.png)19 reactions
- ![heart](https://github.githubassets.com/assets/2764-982dc91ea48a.png)12 reactions
- ![rocket](https://github.githubassets.com/assets/1f680-d0ef47fdb515.png)9 reactions
- ![eyes](https://github.githubassets.com/assets/1f440-ee44e91e92a7.png)1 reaction

41 people reacted

## 0.9.28

3 weeks ago
29 Jan 20:19


![@github-actions](https://avatars.githubusercontent.com/in/15368?s=40&v=4)[github-actions](https://github.com/apps/github-actions)

[0.9.28](https://github.com/astral-sh/uv/tree/0.9.28)

[`0e1351e`](https://github.com/astral-sh/uv/commit/0e1351e4006c3c03bbb60a9ec3ef5ded010c4a8c)

This commit was created on GitHub.com and signed with GitHub’s **verified signature**.


GPG key ID: B5690EEEBB952194

Verified
on Jan 29, 2026, 02:51 PM

[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).


Compare

# Choose a tag to compare

## Sorry, something went wrong.

Filter

Loading

## Sorry, something went wrong.

### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

## No results found

[View all tags](https://github.com/astral-sh/uv/tags)

[0.9.28](https://github.com/astral-sh/uv/releases/tag/0.9.28)

## Release Notes

Released on 2026-01-29.

### Python

- Update CPython to use [OpenSSL 3.5.5](https://github.com/openssl/openssl/releases/tag/openssl-3.5.5) which includes fixes for high severity CVEs ( [python-build-standalone#960](https://github.com/astral-sh/python-build-standalone/pull/960))

### Enhancements

- Add support for Pyodide interpreter on Windows ( [#17658](https://github.com/astral-sh/uv/pull/17658))
- Warn if multiple indexes include `default = true` ( [#17713](https://github.com/astral-sh/uv/pull/17713))
- Skip uploads when validation reports 'Already uploaded' ( [#17412](https://github.com/astral-sh/uv/pull/17412))

### Configuration

- Add a reflink alias for the "clone" link mode ( [#17724](https://github.com/astral-sh/uv/pull/17724))

### Bug fixes

- Ensure `uv.exe` exits when `uvw.exe` or `uvx.exe` is killed ( [#17500](https://github.com/astral-sh/uv/pull/17500))

## Install uv 0.9.28

### Install prebuilt binaries via shell script

```
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/astral-sh/uv/releases/download/0.9.28/uv-installer.sh | sh
```

### Install prebuilt binaries via powershell script

```
powershell -ExecutionPolicy Bypass -c "irm https://github.com/astral-sh/uv/releases/download/0.9.28/uv-installer.ps1 | iex"
```

## Download uv 0.9.28

| File | Platform | Checksum |
| --- | --- | --- |
| [uv-aarch64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-aarch64-apple-darwin.tar.gz) | Apple Silicon macOS | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-aarch64-apple-darwin.tar.gz.sha256) |
| [uv-x86\_64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-x86_64-apple-darwin.tar.gz) | Intel macOS | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-x86_64-apple-darwin.tar.gz.sha256) |
| [uv-aarch64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-aarch64-pc-windows-msvc.zip) | ARM64 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-aarch64-pc-windows-msvc.zip.sha256) |
| [uv-i686-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-i686-pc-windows-msvc.zip) | x86 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-i686-pc-windows-msvc.zip.sha256) |
| [uv-x86\_64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-x86_64-pc-windows-msvc.zip) | x64 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-x86_64-pc-windows-msvc.zip.sha256) |
| [uv-aarch64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-aarch64-unknown-linux-gnu.tar.gz) | ARM64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-aarch64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-i686-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-i686-unknown-linux-gnu.tar.gz) | x86 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-i686-unknown-linux-gnu.tar.gz.sha256) |
| [uv-powerpc64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-powerpc64-unknown-linux-gnu.tar.gz) | PPC64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-powerpc64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-powerpc64le-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-powerpc64le-unknown-linux-gnu.tar.gz) | PPC64LE Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-powerpc64le-unknown-linux-gnu.tar.gz.sha256) |
| [uv-riscv64gc-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-riscv64gc-unknown-linux-gnu.tar.gz) | RISCV Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-riscv64gc-unknown-linux-gnu.tar.gz.sha256) |
| [uv-s390x-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-s390x-unknown-linux-gnu.tar.gz) | S390x Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-s390x-unknown-linux-gnu.tar.gz.sha256) |
| [uv-x86\_64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-x86_64-unknown-linux-gnu.tar.gz) | x64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-x86_64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-armv7-unknown-linux-gnueabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-armv7-unknown-linux-gnueabihf.tar.gz) | ARMv7 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-armv7-unknown-linux-gnueabihf.tar.gz.sha256) |
| [uv-aarch64-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-aarch64-unknown-linux-musl.tar.gz) | ARM64 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-aarch64-unknown-linux-musl.tar.gz.sha256) |
| [uv-i686-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-i686-unknown-linux-musl.tar.gz) | x86 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-i686-unknown-linux-musl.tar.gz.sha256) |
| [uv-x86\_64-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-x86_64-unknown-linux-musl.tar.gz) | x64 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-x86_64-unknown-linux-musl.tar.gz.sha256) |
| [uv-arm-unknown-linux-musleabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-arm-unknown-linux-musleabihf.tar.gz) | ARMv6 MUSL Linux (Hardfloat) | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-arm-unknown-linux-musleabihf.tar.gz.sha256) |
| [uv-armv7-unknown-linux-musleabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-armv7-unknown-linux-musleabihf.tar.gz) | ARMv7 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.28/uv-armv7-unknown-linux-musleabihf.tar.gz.sha256) |

## Verifying GitHub Artifact Attestations

The artifacts in this release have attestations generated with GitHub Artifact Attestations. These can be verified by using the [GitHub CLI](https://cli.github.com/manual/gh_attestation_verify):

```
gh attestation verify <file-path of downloaded artifact> --repo astral-sh/uv
```

You can also download the attestation from [GitHub](https://github.com/astral-sh/uv/attestations) and verify against that directly:

```
gh attestation verify <file-path of downloaded artifact> --bundle <file-path of downloaded attestation>
```

Assets44

Loading

### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

uwu-420, CaptainDriftwood, brian316, barbashovtd, classronin, vain-Liang, edgarrmondragon, sckott, iliqiliev, ifzm, and 21 more reacted with thumbs up emojiAnkurMal and VictorSturnichCapel reacted with laugh emojiuwu-420, classronin, thinh9e, Morethanevil, EphraimCompEng, Denisskas, kurtnettle, EDM115, wanderingeek, Splines, and 8 more reacted with hooray emojiuwu-420, Bahdan321, jonigl, classronin, shinGangan, iliqiliev, Denisskas, arnobaer, xplosionmind, pfm-my, and 4 more reacted with heart emojiuwu-420, classronin, SymphonySimper, Denisskas, aaravind100, wanderingeek, dikesh, arsenylosev, and NotDonCitron reacted with rocket emoji![eyes](https://github.githubassets.com/assets/1f440-ee44e91e92a7.png)3shinGangan, xplosionmind, and pfm-my reacted with eyes emoji

All reactions

- ![+1](https://github.githubassets.com/assets/1f44d-41cb66fe1e22.png)31 reactions
- ![smile](https://github.githubassets.com/assets/1f604-7528822fb4c5.png)2 reactions
- ![tada](https://github.githubassets.com/assets/1f389-36899a2cb781.png)18 reactions
- ![heart](https://github.githubassets.com/assets/2764-982dc91ea48a.png)14 reactions
- ![rocket](https://github.githubassets.com/assets/1f680-d0ef47fdb515.png)9 reactions
- ![eyes](https://github.githubassets.com/assets/1f440-ee44e91e92a7.png)3 reactions

53 people reacted

## 0.9.27

3 weeks ago
26 Jan 23:30


![@github-actions](https://avatars.githubusercontent.com/in/15368?s=40&v=4)[github-actions](https://github.com/apps/github-actions)

[0.9.27](https://github.com/astral-sh/uv/tree/0.9.27)

[`b5797b2`](https://github.com/astral-sh/uv/commit/b5797b2ab4200e719f9d9095de8e062fff7eb51a)

This commit was created on GitHub.com and signed with GitHub’s **verified signature**.


GPG key ID: B5690EEEBB952194

Verified
on Jan 26, 2026, 05:38 PM

[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).


Compare

# Choose a tag to compare

## Sorry, something went wrong.

Filter

Loading

## Sorry, something went wrong.

### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

## No results found

[View all tags](https://github.com/astral-sh/uv/tags)

[0.9.27](https://github.com/astral-sh/uv/releases/tag/0.9.27)

## Release Notes

Released on 2026-01-26.

### Python

- Upgrade Pyodide to 0.29.2 ( [#17652](https://github.com/astral-sh/uv/pull/17652))
- Upgrade to GraalPy 25.0.2 ( [#17634](https://github.com/astral-sh/uv/pull/17634))

### Enhancements

- Add `-t` shortform for `--target` to `uv pip` subcommands ( [#17501](https://github.com/astral-sh/uv/pull/17501))
- Add support for ROCm 7.0 and 7.1 accelerator backends ( [#17681](https://github.com/astral-sh/uv/pull/17681))
- Further improve free-threading ABI incompatibility errors ( [#17491](https://github.com/astral-sh/uv/pull/17491))
- Implement `uv pip freeze --exclude` flag ( [#17045](https://github.com/astral-sh/uv/pull/17045))
- Improve warnings for `--system` and `--no-system` in `uv venv` ( [#17647](https://github.com/astral-sh/uv/pull/17647))
- Make `uv pip compile` attempt to download a specified `--python-version` if it can. ( [#17249](https://github.com/astral-sh/uv/pull/17249))
- Support Trusted Publishing with pyx ( [#17438](https://github.com/astral-sh/uv/pull/17438))
- Fix JSON schema for `exclude-newer-package` ( [#17665](https://github.com/astral-sh/uv/pull/17665))

### Preview features

- Better detection for conflicting packages ( [#17623](https://github.com/astral-sh/uv/pull/17623))
- Upgrade based on outdated build versions in `uv python upgrade` ( [#17653](https://github.com/astral-sh/uv/pull/17653))

### Bug fixes

- Change chocolatey system test to ensure uv uses the right python ( [#17533](https://github.com/astral-sh/uv/pull/17533))
- Fix infinite loop when `SSL_CERT_FILE` is a directory ( [#17503](https://github.com/astral-sh/uv/pull/17503))

### Documentation

- Add cargo-xwin to the CONTRIBUTING guide ( [#17507](https://github.com/astral-sh/uv/pull/17507))
- Fix typo in the documentation of UV\_PUBLISH\_INDEX ( [#17672](https://github.com/astral-sh/uv/pull/17672))
- Move MSRV to platform support section ( [#17534](https://github.com/astral-sh/uv/pull/17534))
- Update the testing instructions in the CONTRIBUTING guide ( [#17528](https://github.com/astral-sh/uv/pull/17528))
- Use `--locked` to install `cargo-xwin` in guide ( [#17530](https://github.com/astral-sh/uv/pull/17530))
- Warn about PyPy being unmaintained ( [#17643](https://github.com/astral-sh/uv/pull/17643))
- docs: Correct gitlab-ci.yml to .gitlab-ci.yml ( [#17682](https://github.com/astral-sh/uv/pull/17682))

### Other changes

- Update MSRV to 1.91 ( [#17677](https://github.com/astral-sh/uv/pull/17677))

## Install uv 0.9.27

### Install prebuilt binaries via shell script

```
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/astral-sh/uv/releases/download/0.9.27/uv-installer.sh | sh
```

### Install prebuilt binaries via powershell script

```
powershell -ExecutionPolicy Bypass -c "irm https://github.com/astral-sh/uv/releases/download/0.9.27/uv-installer.ps1 | iex"
```

## Download uv 0.9.27

| File | Platform | Checksum |
| --- | --- | --- |
| [uv-aarch64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-aarch64-apple-darwin.tar.gz) | Apple Silicon macOS | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-aarch64-apple-darwin.tar.gz.sha256) |
| [uv-x86\_64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-x86_64-apple-darwin.tar.gz) | Intel macOS | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-x86_64-apple-darwin.tar.gz.sha256) |
| [uv-aarch64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-aarch64-pc-windows-msvc.zip) | ARM64 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-aarch64-pc-windows-msvc.zip.sha256) |
| [uv-i686-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-i686-pc-windows-msvc.zip) | x86 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-i686-pc-windows-msvc.zip.sha256) |
| [uv-x86\_64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-x86_64-pc-windows-msvc.zip) | x64 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-x86_64-pc-windows-msvc.zip.sha256) |
| [uv-aarch64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-aarch64-unknown-linux-gnu.tar.gz) | ARM64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-aarch64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-i686-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-i686-unknown-linux-gnu.tar.gz) | x86 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-i686-unknown-linux-gnu.tar.gz.sha256) |
| [uv-powerpc64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-powerpc64-unknown-linux-gnu.tar.gz) | PPC64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-powerpc64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-powerpc64le-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-powerpc64le-unknown-linux-gnu.tar.gz) | PPC64LE Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-powerpc64le-unknown-linux-gnu.tar.gz.sha256) |
| [uv-riscv64gc-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-riscv64gc-unknown-linux-gnu.tar.gz) | RISCV Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-riscv64gc-unknown-linux-gnu.tar.gz.sha256) |
| [uv-s390x-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-s390x-unknown-linux-gnu.tar.gz) | S390x Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-s390x-unknown-linux-gnu.tar.gz.sha256) |
| [uv-x86\_64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-x86_64-unknown-linux-gnu.tar.gz) | x64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-x86_64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-armv7-unknown-linux-gnueabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-armv7-unknown-linux-gnueabihf.tar.gz) | ARMv7 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-armv7-unknown-linux-gnueabihf.tar.gz.sha256) |
| [uv-aarch64-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-aarch64-unknown-linux-musl.tar.gz) | ARM64 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-aarch64-unknown-linux-musl.tar.gz.sha256) |
| [uv-i686-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-i686-unknown-linux-musl.tar.gz) | x86 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-i686-unknown-linux-musl.tar.gz.sha256) |
| [uv-x86\_64-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-x86_64-unknown-linux-musl.tar.gz) | x64 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-x86_64-unknown-linux-musl.tar.gz.sha256) |
| [uv-arm-unknown-linux-musleabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-arm-unknown-linux-musleabihf.tar.gz) | ARMv6 MUSL Linux (Hardfloat) | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-arm-unknown-linux-musleabihf.tar.gz.sha256) |
| [uv-armv7-unknown-linux-musleabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-armv7-unknown-linux-musleabihf.tar.gz) | ARMv7 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.27/uv-armv7-unknown-linux-musleabihf.tar.gz.sha256) |

## Verifying GitHub Artifact Attestations

The artifacts in this release have attestations generated with GitHub Artifact Attestations. These can be verified by using the [GitHub CLI](https://cli.github.com/manual/gh_attestation_verify):

```
gh attestation verify <file-path of downloaded artifact> --repo astral-sh/uv
```

You can also download the attestation from [GitHub](https://github.com/astral-sh/uv/attestations) and verify against that directly:

```
gh attestation verify <file-path of downloaded artifact> --bundle <file-path of downloaded attestation>
```

Assets44

Loading

### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

![+1](https://github.githubassets.com/assets/1f44d-41cb66fe1e22.png)34iAGorynT, unclepomedev, classronin, jessielw, vain-Liang, iliqiliev, jenchen95, zvbarev, OttoAndrey, stevleibelt, and 24 more reacted with thumbs up emoji![tada](https://github.githubassets.com/assets/1f389-36899a2cb781.png)22methbkts, thinh9e, EphraimCompEng, classronin, jessielw, jenchen95, Morethanevil, gaardhus, uwu-420, bkis, and 12 more reacted with hooray emoji![heart](https://github.githubassets.com/assets/2764-982dc91ea48a.png)8uwu-420, bkis, shinGangan, xplosionmind, Denisskas, richlamdev, gssantana, and arsenylosev reacted with heart emoji![rocket](https://github.githubassets.com/assets/1f680-d0ef47fdb515.png)18classronin, aaravind100, jessielw, geyerandreas, jenchen95, sbiquard, uwu-420, shinGangan, tobhofmann, Denisskas, and 8 more reacted with rocket emoji![eyes](https://github.githubassets.com/assets/1f440-ee44e91e92a7.png)2shinGangan and gssantana reacted with eyes emoji

All reactions

- ![+1](https://github.githubassets.com/assets/1f44d-41cb66fe1e22.png)34 reactions
- ![tada](https://github.githubassets.com/assets/1f389-36899a2cb781.png)22 reactions
- ![heart](https://github.githubassets.com/assets/2764-982dc91ea48a.png)8 reactions
- ![rocket](https://github.githubassets.com/assets/1f680-d0ef47fdb515.png)18 reactions
- ![eyes](https://github.githubassets.com/assets/1f440-ee44e91e92a7.png)2 reactions

57 people reacted

## 0.9.26

Jan 15
15 Jan 20:55


![@github-actions](https://avatars.githubusercontent.com/in/15368?s=40&v=4)[github-actions](https://github.com/apps/github-actions)

[0.9.26](https://github.com/astral-sh/uv/tree/0.9.26)

[`ee4f003`](https://github.com/astral-sh/uv/commit/ee4f0036283a350681a618176484df6bcde27507)

This commit was created on GitHub.com and signed with GitHub’s **verified signature**.


GPG key ID: B5690EEEBB952194

Verified
on Jan 15, 2026, 03:25 PM

[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).


Compare

# Choose a tag to compare

## Sorry, something went wrong.

Filter

Loading

## Sorry, something went wrong.

### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

## No results found

[View all tags](https://github.com/astral-sh/uv/tags)

[0.9.26](https://github.com/astral-sh/uv/releases/tag/0.9.26)

## Release Notes

Released on 2026-01-15.

### Python

- Add CPython 3.15.0a5

### Enhancements

- Add a hint to update uv when a managed Python download is not found ( [#17461](https://github.com/astral-sh/uv/pull/17461))
- Improve cache initialization failure error message ( [#17469](https://github.com/astral-sh/uv/pull/17469))
- Improve error message for abi3 wheels on free-threaded Python ( [#17442](https://github.com/astral-sh/uv/pull/17442))
- Add support for `--no-sources-package` ( [#14910](https://github.com/astral-sh/uv/pull/14910))

### Preview features

- Add `METADATA.json` and `WHEEL.json` in uv build backend ( [#15510](https://github.com/astral-sh/uv/pull/15510))
- Add support for GCS request signing ( [#17474](https://github.com/astral-sh/uv/pull/17474))
- Adjust the process ulimit to the maximum allowed on startup ( [#17464](https://github.com/astral-sh/uv/pull/17464))

### Bug fixes

- Lock to avoid concurrent refresh of pyx tokens ( [#17479](https://github.com/astral-sh/uv/pull/17479))

### Documentation

- Add linting and formatting instructions to the CONTRIBUTING guide ( [#17470](https://github.com/astral-sh/uv/pull/17470))
- Avoid rendering `pyproject.toml` examples for more system-level settings ( [#17462](https://github.com/astral-sh/uv/pull/17462))

## Install uv 0.9.26

### Install prebuilt binaries via shell script

```
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/astral-sh/uv/releases/download/0.9.26/uv-installer.sh | sh
```

### Install prebuilt binaries via powershell script

```
powershell -ExecutionPolicy Bypass -c "irm https://github.com/astral-sh/uv/releases/download/0.9.26/uv-installer.ps1 | iex"
```

## Download uv 0.9.26

| File | Platform | Checksum |
| --- | --- | --- |
| [uv-aarch64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-aarch64-apple-darwin.tar.gz) | Apple Silicon macOS | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-aarch64-apple-darwin.tar.gz.sha256) |
| [uv-x86\_64-apple-darwin.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-x86_64-apple-darwin.tar.gz) | Intel macOS | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-x86_64-apple-darwin.tar.gz.sha256) |
| [uv-aarch64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-aarch64-pc-windows-msvc.zip) | ARM64 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-aarch64-pc-windows-msvc.zip.sha256) |
| [uv-i686-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-i686-pc-windows-msvc.zip) | x86 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-i686-pc-windows-msvc.zip.sha256) |
| [uv-x86\_64-pc-windows-msvc.zip](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-x86_64-pc-windows-msvc.zip) | x64 Windows | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-x86_64-pc-windows-msvc.zip.sha256) |
| [uv-aarch64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-aarch64-unknown-linux-gnu.tar.gz) | ARM64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-aarch64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-i686-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-i686-unknown-linux-gnu.tar.gz) | x86 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-i686-unknown-linux-gnu.tar.gz.sha256) |
| [uv-powerpc64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-powerpc64-unknown-linux-gnu.tar.gz) | PPC64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-powerpc64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-powerpc64le-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-powerpc64le-unknown-linux-gnu.tar.gz) | PPC64LE Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-powerpc64le-unknown-linux-gnu.tar.gz.sha256) |
| [uv-riscv64gc-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-riscv64gc-unknown-linux-gnu.tar.gz) | RISCV Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-riscv64gc-unknown-linux-gnu.tar.gz.sha256) |
| [uv-s390x-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-s390x-unknown-linux-gnu.tar.gz) | S390x Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-s390x-unknown-linux-gnu.tar.gz.sha256) |
| [uv-x86\_64-unknown-linux-gnu.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-x86_64-unknown-linux-gnu.tar.gz) | x64 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-x86_64-unknown-linux-gnu.tar.gz.sha256) |
| [uv-armv7-unknown-linux-gnueabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-armv7-unknown-linux-gnueabihf.tar.gz) | ARMv7 Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-armv7-unknown-linux-gnueabihf.tar.gz.sha256) |
| [uv-aarch64-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-aarch64-unknown-linux-musl.tar.gz) | ARM64 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-aarch64-unknown-linux-musl.tar.gz.sha256) |
| [uv-i686-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-i686-unknown-linux-musl.tar.gz) | x86 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-i686-unknown-linux-musl.tar.gz.sha256) |
| [uv-x86\_64-unknown-linux-musl.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-x86_64-unknown-linux-musl.tar.gz) | x64 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-x86_64-unknown-linux-musl.tar.gz.sha256) |
| [uv-arm-unknown-linux-musleabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-arm-unknown-linux-musleabihf.tar.gz) | ARMv6 MUSL Linux (Hardfloat) | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-arm-unknown-linux-musleabihf.tar.gz.sha256) |
| [uv-armv7-unknown-linux-musleabihf.tar.gz](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-armv7-unknown-linux-musleabihf.tar.gz) | ARMv7 MUSL Linux | [checksum](https://github.com/astral-sh/uv/releases/download/0.9.26/uv-armv7-unknown-linux-musleabihf.tar.gz.sha256) |

## Verifying GitHub Artifact Attestations

The artifacts in this release have attestations generated with GitHub Artifact Attestations. These can be verified by using the [GitHub CLI](https://cli.github.com/manual/gh_attestation_verify):

```
gh attestation verify <file-path of downloaded artifact> --repo astral-sh/uv
```

You can also download the attestation from [GitHub](https://github.com/astral-sh/uv/attestations) and verify against that directly:

```
gh attestation verify <file-path of downloaded artifact> --bundle <file-path of downloaded attestation>
```

Assets44

Loading

### Uh oh!

There was an error while loading. [Please reload this page](https://github.com/astral-sh/uv/releases).

![+1](https://github.githubassets.com/assets/1f44d-41cb66fe1e22.png)34smarlhens, NestorSkiad, uwu-420, barbashovtd, Perer876, blueloveTH, iliqiliev, classronin, zvbarev, harkabeeparolus, and 24 more reacted with thumbs up emoji![tada](https://github.githubassets.com/assets/1f389-36899a2cb781.png)14uwu-420, methbkts, blueloveTH, thinh9e, classronin, Denisskas, kurtnettle, Oidaho, gomills, gssantana, and 4 more reacted with hooray emoji![heart](https://github.githubassets.com/assets/2764-982dc91ea48a.png)14uwu-420, shinGangan, blueloveTH, richlamdev, classronin, Denisskas, bkis, gomills, gssantana, xplosionmind, and 4 more reacted with heart emoji![rocket](https://github.githubassets.com/assets/1f680-d0ef47fdb515.png)17aaravind100, geyerandreas, ravenexp, uwu-420, unclepomedev, gminos, shinGangan, blueloveTH, SymphonySimper, Denisskas, and 7 more reacted with rocket emoji![eyes](https://github.githubassets.com/assets/1f440-ee44e91e92a7.png)5shinGangan, blueloveTH, Denisskas, xplosionmind, and csiscs reacted with eyes emoji

All reactions

- ![+1](https://github.githubassets.com/assets/1f44d-41cb66fe1e22.png)34 reactions
- ![tada](https://github.githubassets.com/assets/1f389-36899a2cb781.png)14 reactions
- ![heart](https://github.githubassets.com/assets/2764-982dc91ea48a.png)14 reactions
- ![rocket](https://github.githubassets.com/assets/1f680-d0ef47fdb515.png)17 reactions
- ![eyes](https://github.githubassets.com/assets/1f440-ee44e91e92a7.png)5 reactions

52 people reacted

Previous _1_ [2](https://github.com/astral-sh/uv/releases?page=2) [3](https://github.com/astral-sh/uv/releases?page=3) [4](https://github.com/astral-sh/uv/releases?page=4) [5](https://github.com/astral-sh/uv/releases?page=5)… [25](https://github.com/astral-sh/uv/releases?page=25) [26](https://github.com/astral-sh/uv/releases?page=26) [Next](https://github.com/astral-sh/uv/releases?page=2)

Previous [Next](https://github.com/astral-sh/uv/releases?page=2)

You can’t perform that action at this time.