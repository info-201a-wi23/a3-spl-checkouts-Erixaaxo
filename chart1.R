library("ggplot2")
library("plotly")
library("stringr")

checkout_df <- read.csv("~/Desktop/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

dig_books <- checkout_df %>%
  filter(MaterialType == "EBOOK") %>%
  group_by(CheckoutYear) %>%
  summarize(TotalCheckouts = sum(Checkouts))

phys_books <- checkout_df %>%
  filter(MaterialType == "BOOK") %>%
  group_by(CheckoutYear) %>%
  summarise(TotalCheckouts = sum(Checkouts))

ggplot() +
  geom_line(data = dig_books, aes(x = CheckoutYear, y = TotalCheckouts, color = "EBOOK")) +
  geom_line(data = phys_books, aes(x = CheckoutYear, y = TotalCheckouts, color = "BOOK")) +
  scale_color_manual(name = "Usage Class", values = c("EBOOK" = "blue", "BOOK" = "red")) +
  labs(title = "Year Trends between Ebook and Book",
       x = "Year",
       y = "Total Checkouts") +
  scale_y_continuous(labels = scales::comma) 

