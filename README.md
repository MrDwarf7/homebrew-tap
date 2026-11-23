# Homebrew tap

Personal Homebrew tap for macOS tools.

## Packages

| Cask        | Description                                                       |
| ----------- | ----------------------------------------------------------------- |
| `tcut`      | Includes Homebrew's FFmpeg for MP4, GIF, WebM, and WebP rendering |
| `tcut-lite` | Same `tcut` CLI, without an FFmpeg dependency                     |

## Install

```sh
brew install --cask mrdwarf7/tap/<cask>
```

The [tcut](https://github.com/AmanVarshney01/tcut) casks use upstream binaries
for Apple Silicon and Intel on macOS 13 or newer. Both install the `tcut`
command. Uninstall the previous cask before switching, including `tcut-full`
if you installed it under the old name. The lite cask can still use FFmpeg
if it is already on your `PATH`.

Run `brew update && brew upgrade` for updates.

## Maintenance

[Update casks](.github/workflows/update.yml) runs daily at 00:17 UTC. You can
also run it from the Actions tab. The job checks for stable releases with
`brew livecheck`, then uses `brew bump-cask-pr --write-only` to update versions
and checksums. It pushes a commit only when a cask changes.

To update the casks by hand from a trusted checkout of the tap:

```sh
bash scripts/update-casks.sh mrdwarf7/tap
```

Brew edits its registered tap checkout (`brew --repository mrdwarf7/tap`),
so run this there if you want to review the diff and commit it yourself.

To add another GitHub-hosted standalone CLI, copy
[`_template/github-release-cli.rb`](_template/github-release-cli.rb) into
`Casks/<token>.rb`. Fill in the release metadata and name the file after the
cask token. Check the result with `brew livecheck --cask mrdwarf7/tap/<token>`.
The nightly job picks up new casks without a workflow change. See the
[Homebrew Cask Cookbook](https://docs.brew.sh/Cask-Cookbook) for other layouts.
