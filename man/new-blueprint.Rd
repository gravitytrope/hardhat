% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/blueprint-formula.R, R/blueprint-recipe.R,
%   R/blueprint-xy.R, R/blueprint.R
\name{new_formula_blueprint}
\alias{new_formula_blueprint}
\alias{new_recipe_blueprint}
\alias{new_xy_blueprint}
\alias{new-blueprint}
\alias{new_blueprint}
\title{Create a new preprocessing blueprint}
\usage{
new_formula_blueprint(
  mold,
  forge,
  intercept = FALSE,
  allow_novel_levels = FALSE,
  ptypes = NULL,
  formula = NULL,
  indicators = TRUE,
  ...,
  subclass = character()
)

new_recipe_blueprint(
  mold,
  forge,
  intercept = FALSE,
  allow_novel_levels = FALSE,
  fresh = FALSE,
  ptypes = NULL,
  recipe = NULL,
  ...,
  subclass = character()
)

new_xy_blueprint(
  mold,
  forge,
  intercept = FALSE,
  allow_novel_levels = FALSE,
  ptypes = NULL,
  ...,
  subclass = character()
)

new_blueprint(
  mold,
  forge,
  intercept = FALSE,
  allow_novel_levels = FALSE,
  ptypes = NULL,
  ...,
  subclass = character()
)
}
\arguments{
\item{mold}{A named list with two elements, \code{clean} and \code{process}, see
the \code{\link[=new_blueprint]{new_blueprint()}} section, Mold Functions, for details.}

\item{forge}{A named list with two elements, \code{clean} and \code{process}, see
the \code{\link[=new_blueprint]{new_blueprint()}} section, Forge Functions, for details.}

\item{intercept}{A logical. Should an intercept be included in the
processed data? This information is used by the \code{process} function
in the \code{mold} and \code{forge} function list.}

\item{allow_novel_levels}{A logical. Should novel factor levels be allowed at
prediction time? This information is used by the \code{clean} function in the
\code{forge} function list, and is passed on to \code{\link[=scream]{scream()}}.}

\item{ptypes}{Either \code{NULL}, or a named list with 2 elements, \code{predictors}
and \code{outcomes}, both of which are 0-row tibbles. \code{ptypes} is generated
automatically at \code{\link[=mold]{mold()}} time and is used to validate \code{new_data} at
prediction time. At \code{\link[=mold]{mold()}} time, the information found in
\code{blueprint$mold$process()$ptype} is used to set \code{ptypes} for the \code{blueprint}.}

\item{formula}{Either \code{NULL}, or a formula that specifies how the
predictors and outcomes should be preprocessed. This argument is set
automatically at \code{\link[=mold]{mold()}} time.}

\item{indicators}{A logical. Should factors be expanded into dummy variables?}

\item{...}{Name-value pairs for additional elements of blueprints that
subclass this blueprint.}

\item{subclass}{A character vector. The subclasses of this blueprint.}

\item{fresh}{Should already trained operations be re-trained when \code{prep()} is
called?}

\item{recipe}{Either \code{NULL}, or an unprepped recipe. This argument is set
automatically at \code{\link[=mold]{mold()}} time.}
}
\value{
A preprocessing blueprint, which is a list containing the inputs used as
arguments to the function, along with a class specific to the type
of blueprint being created.
}
\description{
These are the base classes for creating new preprocessing blueprints. All
blueprints inherit from the one created by \code{new_blueprint()}, and the default
method specific blueprints inherit from the other three here.

If you want to create your own processing blueprint for a specific method,
generally you will subclass one of the method specific blueprints here. If
you want to create a completely new preprocessing blueprint for a totally new
preprocessing method (i.e. not the formula, xy, or recipe method) then
you should subclass \code{new_blueprint()}.
}
\section{Mold Functions}{


\code{blueprint$mold} should be a named list with two elements, both of which
are functions:
\itemize{
\item \code{clean}: A function that performs initial cleaning of the user's input
data to be used in the model.
\itemize{
\item \emph{Arguments}:
\itemize{
\item If this is an xy blueprint, \code{blueprint}, \code{x} and \code{y}.
\item Otherwise, \code{blueprint} and \code{data}.
}
\item \emph{Output}: A named list of three elements:
\itemize{
\item \code{blueprint}: The blueprint, returned and potentially updated.
\item If using an xy blueprint:
\itemize{
\item \code{x}: The cleaned predictor data.
\item \code{y}: The cleaned outcome data.
}
\item If not using an xy blueprint:
\itemize{
\item \code{data}: The cleaned data.
}
}
}
\item \code{process}: A function that performs the actual preprocessing of the data.
\itemize{
\item \emph{Arguments}:
\itemize{
\item If this is an xy blueprint, \code{blueprint}, \code{x} and \code{y}.
\item Otherwise, \code{blueprint} and \code{data}.
}
\item \emph{Output}: A named list of 5 elements:
\itemize{
\item \code{blueprint}: The blueprint, returned and potentially updated.
\item \code{predictors}: A tibble of predictors.
\item \code{outcomes}: A tibble of outcomes.
\item \code{ptypes}: A named list with 2 elements, \code{predictors} and \code{outcomes},
where both elements are 0-row tibbles.
\item \code{extras}: Varies based on the blueprint. If the blueprint has no
extra information, \code{NULL}. Otherwise a named list of the
extra elements returned by the blueprint.
}
}
}

Both \code{blueprint$mold$clean()} and \code{blueprint$mold$process()} will be called,
in order, from \code{\link[=mold]{mold()}}.
}

\section{Forge Functions}{


\code{blueprint$forge} should be a named list with two elements, both of which
are functions:
\itemize{
\item \code{clean}: A function that performs initial cleaning of \code{new_data}:
\itemize{
\item \emph{Arguments}:
\itemize{
\item \code{blueprint}, \code{new_data}, and \code{outcomes}.
}
\item \emph{Output}: A named list of the following elements:
\itemize{
\item \code{blueprint}: The blueprint, returned and potentially updated.
\item \code{predictors}: A tibble containing the cleaned predictors.
\item \code{outcomes}: A tibble containing the cleaned outcomes.
\item \code{extras}: A named list of any extras obtained while cleaning. These
are passed on to the \code{process()} function for further use.
}
}
\item \code{process}: A function that performs the actual preprocessing of the data
using the known information in the \code{blueprint}.
\itemize{
\item \emph{Arguments}:
\itemize{
\item \code{blueprint}, \code{new_data}, \code{outcomes}, \code{extras}.
}
\item \emph{Output}: A named list of the following elements:
\itemize{
\item \code{blueprint}: The blueprint, returned and potentially updated.
\item \code{predictors}: A tibble of the predictors.
\item \code{outcomes}: A tibble of the outcomes, or \code{NULL}.
\item \code{extras}: Varies based on the blueprint. If the blueprint has no
extra information, \code{NULL}. Otherwise a named list of the
extra elements returned by the blueprint.
}
}
}

Both \code{blueprint$forge$clean()} and \code{blueprint$forge$process()} will be called,
in order, from \code{\link[=forge]{forge()}}.
}

