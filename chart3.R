library("dpylr")
library("ggplot2")
library("plotly")
library("stringr")

chart_3 <- read.csv("~/Desktop/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE) 

horizon_type <- chart_3 %>%
  filter(CheckoutType == "HORIZON") %>%
  group_by(CheckoutYear) %>%
  summarise(TotalCheckouts = sum(Checkouts))

overDrive_type <- chart_3 %>%
  filter(CheckoutType == "OVERDRIVE") %>%
  group_by(CheckoutYear) %>%
  summarise(TotalCheckouts = sum(Checkouts))

ggplot() +
  geom_line(data = horizon_type, aes(x = CheckoutYear, y = TotalCheckouts, color = "EBOOK")) +
  geom_line(data = overDrive_type, aes(x = CheckoutYear, y = TotalCheckouts, color = "BOOK")) +
  scale_color_manual(name = "Usage Class", values = c("HORIZON" = "green", "OVERDRIVE" = "purple")) +
  labs(title = "Year Trends between Horizon and overdrive",
       x = "Year",
       y = "Total Checkouts") +
  scale_y_continuous(labels = scales::comma) 

