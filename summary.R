library("dplyr")
library("stringr")
library("ggplot2")

# Download dataframe
spl_df <- read.csv("~/Desktop/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

#find out which year had the most digital checkouts
digital_Usage <- spl_df %>% 
  filter(UsageClass == "Digital") %>% 
  group_by(CheckoutYear) %>% 
  summarize(total_digCheckouts = sum(Checkouts)) %>% 
  arrange(desc(total_digCheckouts)) %>% 
  pull(CheckoutYear)

# what was the most checked out book for both years?
mostCheck_book <- spl_df %>% 
  group_by(Title) %>% 
  summarize(total_checkouts = sum(Checkouts)) %>% 
  arrange(desc(total_checkouts)) %>% 
  pull(Title)

#checkouts per month for ebooks
checkouts_Month <- spl_df %>%
  filter(MaterialType == "EBOOK") %>%
  group_by(CheckoutMonth, MaterialType) %>%
  select(CheckoutMonth, MaterialType, Checkouts) %>%
  mutate(checkouts = sum(Checkouts, na.rm = TRUE))

# Find average checkout of each
avg_checkouts <- spl_df %>%
  group_by(Checkouts) %>%
  summarize(avg_checkouts = mean(Checkouts)) %>%
  pull(avg_checkouts)

# what was the most popular subject 
best_sub <- spl_df %>% 
  filter(Checkouts == max(Checkouts)) %>% 
  pull(Subjects)
