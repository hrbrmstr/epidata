## Test environments

* local OS X install, R 3.4.4
* ubuntu 12.04 (on travis-ci), R-oldrel, R-devel, R-release
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 0 notes

* This is a bugfix release.

## Reverse dependencies

This is a new release, so there are no reverse dependencies.

---

- Big #ty to Kurt for reaching out. EPI changed their API endpoint
  to https which caused the error. This has been fixed.
- Also added a few new API endpoints and updated others to account for
  new fields being available.