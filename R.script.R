# load auk package

library(auk)                          # load the auk package
birds <- ebird_taxonomy %>%           # start with the ebird_taxonomy data
  as_tibble() %>%                     # tibbles print better in the console
  filter(category == "species")       # remove non-species taxa

# birds data

birds

distinct(birds, order)

count(birds, order)

# Create canvas for the graph

ggplot(data = birds)

ggplot(data = birds) +
  geom_bar(mapping = aes(x = order))

ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_infreq(order)))

ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_infreq(order)), fill = "#C5351B") 

ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_infreq(order)), fill = "#C5351B") +
  labs(x = "Order", x = "Frequency (number of species)")

# Final graph 

ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_infreq(order)), fill = "#C5351B", 
           width = 0.4) +
  labs(x = "Order", y = "Frequency (number of species)") +
  #scale_y_continuous(limits =  c(0, NA), expand = expansion(mult = 0.4)) +
  theme_classic(base_size = 13) +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(.8)),
    axis.text.x = element_text(angle = 50 , hjust = 1),
    axis.ticks.x = element_blank()
  ) + 
  scale_y_log10(expand = expansion(mult = 0))


