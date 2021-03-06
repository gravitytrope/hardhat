## Test environments
* local R installation, R 3.6.0
* ubuntu 16.04 (on travis-ci), R 3.6.0
* win-builder (devel)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

## 0.1.0 Resubmission

### Review 3 - 2019-12-06

> You have examples for unexported functions which cannot run in this way.
Please either add hardhat::: to the function calls in the examples, omit
these examples or export these functions. e.g. scream(), shrink(), in
scream.Rd and shrink.Rd

Both `scream()` and `shrink()` are already exported, and their help files do not use any unexported functions.

> \dontrun{} should only be used if the example really cannot be executed
(e.g. because of missing additional software, missing API keys, ...) by
the user. That's why wrapping examples in \dontrun{} adds the comment
("# Not run:") as a warning for the user.
Does not seem necessary.
Please unwrap the examples if they are executable in < 5 sec, or replace
\dontrun{} with \donttest{}.

Removed all uses of `\dontrun{}`.

> Please add \value to .Rd files regarding exported methods and explain
the functions results in the documentation.
(See: Writing R Extensions
<https://cran.r-project.org/doc/manuals/r-release/R-exts.html#Documenting-functions>
)
If a function does not return a value, please document that too, e.g.
\value{None}.

Added return value descriptions for all exported functions.

### Review 2 - 2019-11-28

> Please omit the redundant 'Toolkit for' from your title.

Changed the Title from "A Toolkit for the Construction of Modeling Packages" to "Construct Modeling Packages".

> The Description field is intended to be a (one paragraph) description
of what the package does and why it may be useful. Please elaborate.

Changed the Description from:

"Provides infrastructure for building new modeling packages, including functionality around preprocessing, predicting, and validating input."

to:

"Building modeling packages is hard. A large amount of effort generally goes into providing an implementation for a new method that is efficient, fast, and correct, but often less emphasis is put on the user interface. A good interface requires specialized knowledge about S3 methods and formulas, which the average package developer might not have. The goal of 'hardhat' is to reduce the burden around building new modeling packages by providing functionality for preprocessing, predicting, and validating input."

> If there are references describing (the theoretical backgrounds of) the
methods in your package, please add these in the description field of
your DESCRIPTION file in the form
authors (year) <doi:...>
authors (year) <arXiv:...>
authors (year, ISBN:...)
or if those are not available: <https:...>
with no space after 'doi:', 'arXiv:', 'https:' and angle brackets for
auto-linking.

There are no references for the methods in this package.

### Review 1 - 2019-11-21

> Found the following (possibly) invalid URLs:
     URL: https://github.com/tidymodels/hardhat/actions?workflow=R-CMD-check
       From: README.md
       Status: 404
       Message: Not Found

Removed invalid URL link as requested. It is valid when signed in to GitHub,
but 404s otherwise.
