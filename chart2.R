library("plotly")
library("ggplot2")
trend_two <- read.csv("~/Desktop/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

phy_dig <- trend_two %>% group_by(UsageClass, CheckoutMonth) %>% 
  filter(CheckoutYear =="2022") %>%
  summarise(Checkouts = sum(Checkouts))

ggplot(data = phy_dig) +
  geom_line(mapping = aes(x = CheckoutMonth, y = Checkouts, color = UsageClass))  +
  geom_point(mapping = aes(x = CheckoutMonth, y = Checkouts, color = UsageClass,
    text = paste("Monthly Checkouts:", Checkouts, 
                 sep = "\n", "Month Number:", CheckoutMonth))) +
  labs(title = "Physical & Digital Checkout / Month", x = "Month", y = "# of Checkouts")

