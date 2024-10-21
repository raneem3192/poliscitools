# Plot Party Vote Shares
plot_party_vote_share <- function(data, party_column, vote_column) {
  library(ggplot2)

  vote_share <- analyze_vote_share(data, party_column, vote_column)  # Call the previous function

  ggplot(vote_share, aes(x = !!sym(party_column), y = vote_share, fill = !!sym(party_column))) +
    geom_bar(stat = "identity") +
    labs(title = "Party Vote Share", x = "Party", y = "Vote Share (%)") +
    theme_minimal()
}
