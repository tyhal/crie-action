

# Crie GitHub Action
A straightforward meta-linter GitHub Action that covers all programming languages, making static analysis accessible for development teams.

## Usage
Add this action to your GitHub workflow:
``` yaml
name: Code Quality
on: [push, pull_request]

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: tyhal/crie@main
        with:
          only_changed_files: true
          target_branch: origin/main # this is the branch to compare our current workspace against to detect changes
```


## Repository
Find the source code and contribute at: https://github.com/tyhal/crie

