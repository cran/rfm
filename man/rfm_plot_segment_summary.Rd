% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rfm-segment.R
\name{rfm_plot_segment_summary}
\alias{rfm_plot_segment_summary}
\title{Visulaize segment summary}
\usage{
rfm_plot_segment_summary(
  x,
  metric = NULL,
  sort = FALSE,
  ascending = FALSE,
  flip = FALSE,
  bar_color = NULL,
  plot_title = NULL,
  xaxis_label = NULL,
  yaxis_label = NULL,
  axis_label_size = 8,
  axis_label_angle = 315,
  bar_labels = TRUE,
  interactive = FALSE,
  animate = FALSE,
  print_plot = TRUE
)
}
\arguments{
\item{x}{An object of class \code{rfm_segment_summary}.}

\item{metric}{Metric to be visualized. Defaults to \code{"customers"}. Valid
 values are:
\itemize{
\item \code{"customers"}
\item \code{"orders"}
\item \code{"revenue"}
\item \code{"aov"}
}}

\item{sort}{logical; if \code{TRUE}, sort metrics.}

\item{ascending}{logical; if \code{TRUE}, sort metrics in ascending order.}

\item{flip}{logical; if \code{TRUE}, creates horizontal bar plot.}

\item{bar_color}{Color of the bars.}

\item{plot_title}{Title of the plot.}

\item{xaxis_label}{X axis label.}

\item{yaxis_label}{Y axis label.}

\item{axis_label_size}{Font size of X axis tick labels.}

\item{axis_label_angle}{Angle of X axis tick labels.}

\item{bar_labels}{If \code{TRUE}, add labels to the bars. Defaults to
\code{TRUE}.}

\item{interactive}{If \code{TRUE}, uses \code{plotly} as the visualization
engine. If \code{FALSE}, uses \code{ggplot2}.}

\item{animate}{If \code{TRUE}, animates the bars. Defaults to \code{FALSE}.}

\item{print_plot}{logical; if \code{TRUE}, prints the plot else returns a
plot object.}
}
\description{
Generates plots for customers, orders, revenue and average order value for
  each segment.
}
\examples{
# analysis date
analysis_date <- as.Date('2006-12-31')

# generate rfm score
rfm_result <- rfm_table_order(rfm_data_orders, customer_id, order_date,
revenue, analysis_date)

# segment names
segment_names <- c("Champions", "Potential Loyalist", "Loyal Customers",
                   "Promising", "New Customers", "Can't Lose Them",
                   "At Risk", "Need Attention", "About To Sleep", "Lost")

# segment intervals
recency_lower <-   c(5, 3, 2, 3, 4, 1, 1, 1, 2, 1)
recency_upper <-   c(5, 5, 4, 4, 5, 2, 2, 3, 3, 1)
frequency_lower <- c(5, 3, 2, 1, 1, 3, 2, 3, 1, 1)
frequency_upper <- c(5, 5, 4, 3, 3, 4, 5, 5, 3, 5)
monetary_lower <-  c(5, 2, 2, 3, 1, 4, 4, 3, 1, 1)
monetary_upper <-  c(5, 5, 4, 5, 5, 5, 5, 5, 4, 5)

# generate segments
segments <- rfm_segment(rfm_result, segment_names, recency_lower,
recency_upper, frequency_lower, frequency_upper, monetary_lower,
monetary_upper)

# segment summary
segment_overview <- rfm_segment_summary(segments)

# plot segment summary
# summarize metric for all segments
# ggplot2
rfm_plot_segment_summary(segment_overview)

# plotly
rfm_plot_segment_summary(segment_overview, interactive = TRUE)

# select metric to be visualized
rfm_plot_segment_summary(segment_overview, metric = "orders")

# sort the metric in ascending order
rfm_plot_segment_summary(segment_overview, metric = "orders", sort = TRUE,
  ascending = TRUE)

# default sorting is in descending order
rfm_plot_segment_summary(segment_overview, metric = "orders", sort = TRUE)

# horizontal bars
rfm_plot_segment_summary(segment_overview, metric = "orders", flip = TRUE)

}
