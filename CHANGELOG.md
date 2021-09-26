# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.1.3] - unreleased

## [0.1.2] - 2021-09-24
### Added
- Get-WrikeApiVersion
- Get-WrikeCustomField
- Get-WrikeFolder
- Get-WikeFolderHistory
- New-WrikeFieldFilter

### Changed
- Breaking change - changed the ContactId parameter to Id on Get-WrikeContact and Get-WrikeContactHistory. Would have added ContactId back as an alias were there more users, but since maybe nobody is using this module yet, I decided against it.

## [0.1.1] - 2021-09-22
### Added
- New Get-WrikeContactHistory function.
- Formatting for Wrike contact records to improve output in terminal or Out-GridView for example.
### Changed
- Added a ContactId parameter to Get-WrikeContact with an alias for Id.
- Deduplicate the Include parameter values in case user provides the same optional field names more than once.

## [0.1.0] - 2021-09-20

This is the initial release. I hope it makes your day, and enables you to build useful automation for your business. Enjoy!
