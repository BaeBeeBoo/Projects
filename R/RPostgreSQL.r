library(RPostgreSQL)
library(tidyverse)

# create connect
con <- dbConnect(PostgreSQL(),
                 host = "___.db.elephantsql.com",
                 port = 5432,
                 user = "____",
                 password = "____",
                 dbname = "____")

pizza_menu <- data.frame(id = 1:5,
                         name = c("mighty meat", "hawaiian", "super deluxe", "sliced pork shabu", "shrimp cocktail"),
                         pizza_price = c(339,379,379,379,439))

pasta_menu <- data.frame(id = 1:5,
                         name = c("spicy sausage spaghetti", "spaghetti keemao sausage", "spaghetti carbonara", "spicy bacon spaghetti", "spaghetti kheemao seafood"),
                         pasta_price = c(129,129,139,139,169))

dessert_menu <- data.frame(id = 1:4,
                           name = c("chocolate ice cream", "chocolate chip ice cream", "very strawberry ice cream", "mocha almond fudge ice cream"),
                           dessert_price = c(49,49,49,49))

# write tables
dbWriteTable(con, "pizza_menu", pizza_menu)
dbWriteTable(con, "pasta_menu", pasta_menu)
dbWriteTable(con, "dessert_menu", dessert_menu)

# list all tables
dbListTables(con)

## get data 
dbGetQuery(con, "select * from pasta_menu")

## close connection
dbDisconnect(con)
