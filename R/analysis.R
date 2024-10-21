# Analyze Party Vote Share
analyze_vote_share <- function(data, party_column, vote_column) {
  if (!all(c(party_column, vote_column) %in% names(data))) {
    stop("The specified columns must exist in the data frame.")
  }

  vote_share <- data %>%
    group_by(!!sym(party_column)) %>%
    summarise(total_votes = sum(!!sym(vote_column), na.rm = TRUE)) %>%
    mutate(vote_share = total_votes / sum(total_votes) * 100)

  return(vote_share)
}
