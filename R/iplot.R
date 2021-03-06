## iplot
## Karl W Broman

#' Interactive scatterplot
#'
#' Creates an interactive scatterplot.
#'
#' @param x Numeric vector of x values
#' @param y Numeric vector of y values
#' @param group Optional vector of categories for coloring the points
#' @param indID Optional vector of character strings, shown with tool tips
#' @param chartOpts A list of options for configuring the chart.  Each
#'   element must be named using the corresponding option.
#'
#' @return None.
#'
#' @keywords hplot
#'
#' @examples
#' x <- rnorm(100)
#' grp <- sample(1:3, 100, replace=TRUE)
#' y <- x*grp + rnorm(100)
#' iplot(x, y, grp)
#'
#' @export
iplot <-
function(x, y, group, indID, chartOpts=NULL)
{
    if(length(x) != length(y))
        stop("length(x) != length(y)")
    if(missing(group) || is.null(group))
        group <- rep(1, length(x))
    else if(length(group) != length(x))
        stop("length(group) != length(x)")
    if(missing(indID) || is.null(indID))
        indID <- as.character(seq(along=x))
    else if(length(indID) != length(x))
        stop("length(indID) != length(x)")
    indID <- as.character(indID)

    x <- list(data = data.frame(x=x, y=y, group=group, indID=indID),
              chartOpts=chartOpts)

    htmlwidgets::createWidget("iplot", x,
                              width=chartOpts$width,
                              height=chartOpts$height,
                              package="testjs")
}
