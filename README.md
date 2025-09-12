# Crie GitHub Action

A straightforward meta-linter GitHub Action that covers all programming languages, making static analysis accessible for development teams.

## Usage

Add this action to your GitHub workflow:

```yaml
name: Code Quality
on: [push, pull_request]

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: tyhal/crie@main
```

## Repository

Find the source code and contribute at: https://github.com/tyhal/crie
