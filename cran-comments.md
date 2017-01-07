## Test environments

* local OS X install, R 3.3.2, R-release
* ubuntu 12.04 (on travis-ci), R-oldrel, R-devel, R-release
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 0 notes

* This is a new release.

## Reverse dependencies

This is a new release, so there are no reverse dependencies.

---

- examples and tests hit a live server but they httr::stop_on_status() on error and
  they run under the CRAN time limit for tests. If you'd rather they be in a 
  \dontrun{} block or just not run or tested on CRAN that's cool and I'll modify
  and re-submit.