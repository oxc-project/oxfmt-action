<p align="center">
  <br>
  <br>
  <a href="https://oxc.rs" target="_blank" rel="noopener noreferrer">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://oxc.rs/oxc-light.svg">
      <source media="(prefers-color-scheme: light)" srcset="https://oxc.rs/oxc-dark.svg">
      <img alt="Oxc logo" src="https://oxc.rs/oxc-dark.svg" height="60">
    </picture>
  </a>
  <br>
  <br>
  <br>
</p>

<div align="center">

[![OXC Stars][oxc-stars-badge]][oxc-github-url]
[![Website][website-badge]][website-url]
[![CI](https://github.com/oxc-project/oxfmt-action/actions/workflows/ci.yml/badge.svg)](https://github.com/oxc-project/oxfmt-action/actions/workflows/ci.yml)
[![npm][npm-badge]][npm-url]
[![Discord chat][discord-badge]][discord-url]

</div>

## ⚓ Run [Oxfmt][oxc-github-url] on your repo

This action checks formatting of your JS/TS codebase with
[Oxfmt][oxc-github-url]. Pull requests will only have their changed files
checked by default.

For monorepos, you can use the `working-directory` input to check only a specific subdirectory.

## ⚡ Quick Start
Here's a minimal example to get you started:
```yaml
# .github/workflows/ci.yml
name: CI
on:
  pull_request:
    branches:
      - main
    types: [opened, synchronize]
  push:
    branches:
      - main

jobs:
  format:
    name: Format (Oxfmt)
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: oxc-project/oxfmt-action@v0.1.0
```

## Example
Here's a more complete example with all available options:
```yaml
name: Format
on: [push, pull_request]

jobs:
  format:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - uses: oxc-project/oxfmt-action@latest
      with:
        # Path to an Oxfmt configuration file.
        config: .oxfmtrc.json

        # Path to an ignore file. If not specified, .gitignore and
        # .prettierignore in the current directory are used.
        ignore-path: .prettierignore

        # By default, oxfmt-action will only check changed files when run on
        # pull requests. To disable this behavior, set this to true.
        # Note that this setting has no affect on any other kind of trigger.
        all-files: false

        # Explicitly specify the base branch that PRs will be compared against.
        # By default the branch the PR is attempting to merge into will be used.
        # Has no affect on any other kind of trigger.
        base-branch: main

        # Use a specific version of Oxfmt. You can also specify a SemVer
        # pattern. This gets forwarded to npx. By default, 'latest' is used.
        # See: https://www.npmjs.com/package/oxfmt
        version: latest

        # Specify a working directory to run oxfmt in. Useful for monorepos
        # where you want to check only a specific subdirectory.
        working-directory: frontend
```

## ❤ Who's [Sponsoring Oxc](https://github.com/sponsors/Boshen)?

<p align="center">
  <a href="https://github.com/sponsors/Boshen">
    <img src="https://raw.githubusercontent.com/Boshen/sponsors/main/sponsors.svg" alt="My sponsors" />
  </a>
</p>

[oxc-stars-badge]: https://img.shields.io/github/stars/oxc-project/oxc?style=social
[oxc-github-url]: https://github.com/oxc-project/oxc
[npm-badge]: https://img.shields.io/npm/v/oxfmt/latest?color=brightgreen
[npm-url]: https://www.npmjs.com/package/oxfmt/v/latest
[website-badge]: https://img.shields.io/badge/Website-blue
[website-url]: https://oxc.rs
[discord-badge]: https://img.shields.io/discord/1079625926024900739?logo=discord&label=Discord
[discord-url]: https://discord.gg/9uXCAwqQZW
