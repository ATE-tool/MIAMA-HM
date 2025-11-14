# function for plotting death or disease rates by sex and age

# plot assumes the data contains 'color_col' (a column with a separate identifier
# for each colour, eg imd_decile) and 'group_col' (a column with a separate identifier 
# for each separate line to be shown on the plot, eg LSOA)

rateplot <- function(data_plot, ylab_plot, legend_name, plot_title) {
  p <- ggplot(data_plot, 
                      aes(x = age, y = rate1000,
                          col = colour_col,  # Color by  eg IMD decile
                          group = group_col)) +  # separate line, eg for each LSOA
    geom_line(lwd = 0.7, alpha = 0.5) +  # Reduce opacity to manage overplotting
    facet_wrap(~ sex) +  # Compare IMD deciles within each sex
    xlab("Age (years)") +  
    ylab(ylab_plot) + 
    scale_y_continuous(trans = "log", breaks = c(0.2, 0.5, 1, 5, 10, 50, 100, 200)) +
    scale_color_viridis_d(option = "C", name = legend_name) +  # Use discrete color scale
    theme_bw(base_size = 14) +  
    theme(
      strip.text = element_text(face = "bold"),
      legend.position = "bottom"  # Move legend for readability
    ) +
    ggtitle(plot_title)  # Add title
  
  return(p)
}
