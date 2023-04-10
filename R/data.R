#' A dataset with four subscales measuring different types of fear
#'
#' This dataset is a questionnaire with 23 items with four subscales measuring
#' different types of fear
#'
#' @format A data frame with 2571 rows and 23 variables:
#' \describe{
#'   \item{C1}{fear of computers, question 1}
#'   \item{C2}{fear of computers, question 2}
#'   \item{C3}{fear of computers, question 3}
#'   \item{C4}{fear of computers, question 4}
#'   \item{C5}{fear of computers, question 5}
#'   \item{C6}{fear of computers, question 6}
#'   \item{C7}{fear of computers, question 7}
#'   \item{M1}{fear of maths, question 1}
#'   \item{M2}{fear of maths, question 2}
#'   \item{M3}{fear of maths, question 3}
#'   \item{P1}{fear of peer evaluation, question 1}
#'   \item{P2}{fear of peer evaluation, question 2}
#'   \item{P3}{fear of peer evaluation, question 3}
#'   \item{P4}{fear of peer evaluation, question 4}
#'   \item{P5}{fear of peer evaluation, question 5}
#'   \item{S1}{fear of statistics, question 1}
#'   \item{S2}{fear of statistics, question 2}
#'   \item{S3}{fear of statistics, question 3}
#'   \item{S4}{fear of statistics, question 4}
#'   \item{S5}{fear of statistics, question 5}
#'   \item{S6}{fear of statistics, question 6}
#'   \item{S7}{fear of statistics, question 7}
#'   \item{S8}{fear of statistics, question 8}
#' }
#'
#' @source \url{https://rpubs.com/hauselin/reliabilityanalysis}
"psych_data"

#' A nested dataset with four subscales measuring different types of fear
#'
#' This is the nested version of psych_data, where each row corresponds to
#' one type of fear.
#'
#' @format A data frame/tbl/tbl_df with 4 rows and 2 variables:
#' \describe{
#'   \item{Assessment}{type of fear}
#'   \item{data}{a long-form dataset with three variables: Student, Question, and UserScore}
#' }
"psych_data_nested"



#' A subset of the 2009 PISA data
#'
#' This is a subset of the student results from the 2009 Programme of
#' International Student Assessment (PISA) as provided by the Organization for
#'  Economic Co-operation and Development (OECD). See http://www.pisa.oecd.org/
#'  for more information including the code book.
#'
#'
#' @format A data frame/tbl/tbl_df with 475460 rows and 5 variables:
#' \describe{
#'   \item{country}{Country}
#'   \item{sex}{sex}
#'   \item{math}{first plausible value from MATH scale (PV1MATH)}
#'   \item{reading}{first plausible value from READING scale (PV1READ)}
#'   \item{weight}{sampling weights}
#' }
"pisas09_subset"
