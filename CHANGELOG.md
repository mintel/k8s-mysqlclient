# Changelog

All notable changes to this project will be documented in this file.

## 0.5.1 (2020-11-03)
### Fixed
- Fix `cut` command and ensure we keep all chars from the environment variable

## 0.5.0 (2020-11-03)
### Changed
- Add `VAULT_ENABLED` option to enable/disable use of `vault-env`
- Add default for `DB_HOST`
- Add option for `DB_CONF` file path
- Make posix compliant

## 0.4.0 (2020-06-23)
### Changed
- Added and use `mintel` user
- Added `docker-entrypoint.sh` to write out the `$HOME/.my.cnf` file on startup from vault

## 0.3.0 (2020-06-23)
### Changed
- Renamed repo to `k8s-mysqlclient`
- Bump Alpine to `3.12.x`
- Added `banzaicloud/vault-env:1.3.2`
- Added `gcr.io/google_containers/pause-amd64`

## 0.2.0 (2020-03-31)
### Added
- Added `pause` binary from `gcr.io/google_containers/pause-amd64`

## 0.1.0 (2020-03-31)
### Added
- Added initial release
