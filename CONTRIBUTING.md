# Contribution Guidelines

## Development

### Setup

This project depends on [mise-en-place](https://mise.jdx.dev/) to manage its
tools and scripts.

Install `mise`, then run the following:
```shell
mise install
```

### Linting

The project enforces linting based on `terraform fmt`. Lint the code by running `mise run lint`.


### Testing

Refer to terraform's documentation on how to test terraform code. This project exposes a script for testing:
`mise run test`.

### Release Flow

This project's release cycle is fully automated. It leverages the [git-tag-from-semver-increment-workflow](https://github.com/infra-blocks/git-tag-from-semver-increment-workflow)
to accomplish this. Refer to its documentation for usage information.
