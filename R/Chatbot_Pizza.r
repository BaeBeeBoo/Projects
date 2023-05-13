# Pizza
pizza_id       <- c(1, 2, 3, 4, 5)
pizza_menu     <- c("Hawaiian", "Meat Deluxe", "Double Cheese", "Seafood Bacon", "Spicy Grilled Chicken")
meduim_size     <- c(379, 379, 279, 539, 339)
large_price    <- c(499, 499, 399, 689, 459)
df_pizza  <- data.frame(pizza_id, pizza_menu, meduim_size, large_price)

# Drink
drink_id <- c(1, 2, 3)
drink_menu <- c("Water", "Coke", "Sprite")
drink_price <- c(20, 35, 35)
df_drink <- data.frame(drink_id, drink_menu, drink_price)

# Order
pizza_order <- NULL
price_pizza <- NULL
drink_order <- NULL
price_drink <- NULL

# control loop
ctrl1 <- "3"
ctrl2 <- "1"

# Welcome Customer
print("Welcome to Bina's Pizza!")

print("What is your name?")
name <- readLines("stdin", n=1) 
paste("Hello K.",name)

print ("What would you like to have?")
print (df_pizza)

  # Pizza Order
while(ctrl1 == "3"){
  print("Please select the number of pizza!")
  pizza_a <- readLines("stdin", n = 1) 
 if(as.numeric(pizza_a) %in% 1:5){
   print("Your pizza is :")
   pizza_order <-append(pizza_order, print(df_pizza[[pizza_a,2]]))
 }
  print("What size please? (meduim/ large)")
   pizza_b <- toupper(readLines("stdin", n = 1))
  if(pizza_b == "MEDUIM"){
    price_pizza <- append(price_pizza, as.numeric(df_pizza[[pizza_a,3]]))
  }
  else if(pizza_b == "LARGE"){
    price_pizza <- append(price_pizza, as.numeric(df_pizza[[pizza_a,4]]))
  }
    
    print("Do you want to order more pizza? (yes/no)")
  ctrl1 <- readLines("stdin", n = 1) 
  if(ctrl1 == "No" | ctrl1 != "Yes"){
  print("Do you want some drinks?")
    
  # Drink Order
print("Please press '1' for YES | press '2' for NO")
  ctrl2 <- readLines("stdin", n = 1)
while(ctrl2 == "1"){
  print("What would you like to drink?")
  print(df_drink)
  print("Please select the number of drinks!")
  drink_a <- readLines("stdin", n = 1) 
 if(as.numeric(drink_a) %in% 1:3){
   print("Your order is :")
   drink_order <- append(drink_order, print(df_drink[[drink_a,2]]))
   price_drink <- append(price_drink, as.numeric(df_drink[[drink_a,3]]))

   print("Do you want anything more? (yes/no)")
   drink_b <- readLines("stdin", n = 1)
   if(drink_b == "No" | drink_b != "Yes"){
   print("All right! Let's summary your order")
   break}
   }
 }
  if(ctrl2 == "2"){
  print("All right! Let's summary your order")
  }
  }
}

#Summary Order
all_order <- list(Pizza = as.character(pizza_order),
                          Pizza_price = as.numeric(price_pizza),
                    Drinks = as.character(drink_order),
                    Drinks_price = as.numeric(price_drink)
                   )
sum_pizza <- sum(all_order$Pizza_price)
sum_drink <- sum(all_order$Drinks_price)

price <- sum_pizza + sum_drink

print("------------- Receipt -------------")
print(paste("Customer Name: " ,name))
print("------------- Your Order -------------")
print(all_order)
print(paste("Total :", price," THB"))
print("------------THANK YOU------------")

