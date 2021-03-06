% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bind-fmap-join.R
\name{monad-generics}
\alias{bind}
\alias{fmap}
\alias{join}
\alias{monad-generics}
\title{Monad generics.}
\usage{
fmap(.m, .f, ...)

bind(.m, .f, ...)

join(.m)
}
\arguments{
\item{.m}{The monad}

\item{.f}{A function, formula, or atomic vector.

  If a \strong{function}, it is used as is.

  If a \strong{formula}, e.g. \code{~ .x + 2}, it is converted to a
  function with two arguments, \code{.x} or \code{.} and \code{.y}. This
  allows you to create very compact anonymous functions with up to
  two inputs.

  If \strong{character} or \strong{integer vector}, e.g. \code{"y"}, it
  is converted to an extractor function, \code{function(x) x[["y"]]}. To
  index deeply into a nested list, use multiple values; \code{c("x", "y")}
  is equivalent to \code{z[["x"]][["y"]]}. You can also set \code{.null}
  to set a default to use instead of \code{NULL} for absent components.}

\item{...}{Additonal arguments passed on to \code{.f}.}
}
\description{
To make a class a monad, you need to define three generics: \code{fmap},
\code{bind}, and \code{join}. \code{fmap} takes a non-monad function,
and applies it to a monad by unwrapping, applying, and rewrapping.
\code{bind} apply a function that takes a regular value and returns a monad,
by unwrapping and applying. \code{join} collapses a monad that's nested
inside itself.
}
\details{
Any object with a \code{fmap} method is called a \code{functor}.
}
\examples{
# Functions are functors
add1 <- function(x) x + 1
add2 <- function(x) x + 2

add3 <- add1 \%>>\% add2
add3(10)
}

