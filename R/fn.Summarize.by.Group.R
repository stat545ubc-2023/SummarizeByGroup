#' @title Create summary statistics of a numeric variable grouped by a categorical variable in a data frame
#' @details Given a data frame, a categorical (group) variable and a numeric (metric) variable,
#'          compute the Count, Sum, and Mean of the metric variable grouped by the group variable
#'
#' @param df a data frame object
#' @param group a string of non-numeric variable to be grouped by
#' @param metric a string of numeric metric on which statistics to be computed
#' @param ... not used.
#' @importFrom dplyr %>%
#' @importFrom dplyr group_by
#' @importFrom dplyr summarize
#' @importFrom dplyr ungroup
#' @export
#' @return a data frame with 4 columns: Group - Count - Sum - Mean
#'
#' @examples
#' library(MASS)
#' fn.Summarize.by.Group(Insurance, 'District', 'Claims')
#' fn.Summarize.by.Group(Insurance, 'District', 'Holders')
fn.Summarize.by.Group <- function(df, group, metric, ...) {
  if(!(is.data.frame(df))) {
    stop('df must be a data frame.')
  }
  if(!(group %in% colnames(df))) {
    stop(paste0(group, ' is not found in the data.'))
  }
  if(!(metric %in% colnames(df))) {
    stop(paste0(metric, ' is not found in the data.'))
  }
  if(is.numeric(unlist(df[group]))) {
    stop(paste0('The group (', group, ') must not be of numeric type.'))
  }
  if(!is.numeric(unlist(df[metric]))) {
    stop(paste0('The metric (', metric, ') must be of numeric type.'))
  }
  result <- df %>%
    group_by(get(group)) %>%
    summarize(
      # Holders = sum(Holders),
      Count = sum(!is.na(get(metric))),
      Metric_Sum = sum(get(metric), na.rm = T),
      Metric_Mean = round(mean(get(metric), na.rm = T),2)
    ) %>%
    ungroup() %>%
    as.data.frame()

  return(result)
}
