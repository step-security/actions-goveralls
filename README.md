[![StepSecurity Maintained Action](https://raw.githubusercontent.com/step-security/maintained-actions-assets/main/assets/maintained-action-banner.png)](https://docs.stepsecurity.io/actions/stepsecurity-maintained-actions)

# step-security/actions-goveralls

[![test](https://github.com/step-security/actions-goveralls/actions/workflows/test.yml/badge.svg)](https://github.com/step-security/actions-goveralls/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/step-security/actions-goveralls/badge.svg)](https://coveralls.io/github/step-security/actions-goveralls)

[Coveralls](https://coveralls.io/) GitHub Action with Go integration powered by [mattn/goveralls](https://github.com/mattn/goveralls).

## SYNOPSIS

### Basic Usage

Add the following step snippet to your workflows.

```yaml
- uses: actions/checkout@v7

- uses: actions/setup-go@v7
  with:
    go-version: "1.21"
- run: go test -v -coverprofile=profile.cov ./...

- uses: step-security/actions-goveralls@v1
  with:
    path-to-profile: profile.cov
```

### Parallel Job Example
Here is an example of matrix builds.

```yaml
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        go:
          - "1.21"
          - "1.20"
          - "1.19"
          - "1.18"
          - "1.17"
          - "1.16"
          - "1.15"
          - "1.14"
          - "1.13"
          - "1.12"
          - "1.11"

    steps:
      - uses: actions/setup-go@v7
        with:
          go-version: ${{ matrix.go }}
      - uses: actions/checkout@v7
      - run: go test -v -coverprofile=profile.cov ./...

      - name: Send coverage
        uses: step-security/actions-goveralls@v1
        with:
          path-to-profile: profile.cov
          flag-name: Go-${{ matrix.go }}
          parallel: true

  # notifies that all test jobs are finished.
  finish:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: step-security/actions-goveralls@v1
        with:
          parallel-finished: true
```
