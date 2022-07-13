
macronom_colors <- function(x = 1:13) {
  
  
  mycolors <- c("#000000", "#9D9062", "#548235", "#7f7f7f", "#3d5481", "#6c2111", "#fcc607", "#daac92", "#C8C0A0", "#6c86a0",    "#666f50", "#d26413")
  names(mycolors) <- c("black", "brown1", "green1", "grey", "blue", "burgundy", "yellow1", "powder", "brown3",  "lightblue",  "olivia","bronze")

  if (is.null(x)) {
    p <- mycolors %>%
      enframe() %>%
      mutate(
        c = (row_number() -1) %% 5,
        r = (row_number() - 1) %/% 5
      ) %>%
      ggplot(aes(c, -r, fill = name, label = str_c(name, "\n", value))) +
      geom_tile(color = "black", show.legend = FALSE) +
      scale_fill_manual(values = mycolors) +
      geom_text(color = "white", fontface = "bold") +
      theme_void()

    return(p)
  }

  if (length(x) == 1) {
  if (x == "low") return("#D22211") # for gradient values
  if (x == "high") return("#469240")
  }

  as.character(mycolors[x])

}
