pizza_name<-c("sliced pork shabu","hawaiian", "super deluxe","cheesy puff spicy seafood","mighty meat")
pizza_price<-c(179,179,179,189,139)
pizza<-data.frame(pizza_name,pizza_price) 

pizza_size<-c("L","M","S")
pizza_size_price<-c(300,200,100)
sizing<-data.frame(pizza_size,pizza_size_price)

pizza_appetizer<-c("bread sticks","fish fingers","calamari")
pizza_appetizer_price<-c(79,89,99)
extra_appetizer<-data.frame(pizza_appetizer,pizza_appetizer_price)

total<-0

chatbot_pizza <- function() {

print("Wellcome to Bina pizza!")
print("What's your name?")
customer<-toupper(readLines("stdin",n=1))
print(paste("Hello K.",customer,",","Please type [ready] to view our menu"))
  
  while (TRUE) {
    ready <- readLines("stdin", n = 1)
    if (tolower(ready) == "ready") {
      break
    }
    print("Please type [ready] to view our menu")
  }
  
  print(pizza)
  print("What do you want a flavours of pizza?")

  while(TRUE){
  customer_flavour<-readLines("stdin",n=1)
  if(customer_flavour %in% pizza_name){
  print (paste("Perfect!", pizza[pizza$pizza_name == customer_flavour, 1]))
  total <- total + pizza[pizza$pizza_name == customer_flavour, 2]
  print(total)
  break
  } else {
    print("Sorry, We don't have this flavour")
  }
  }
    
    print(sizing)
    print("What do you want a size of pizza?")

  while(TRUE){
    customer_order_size<-toupper(readLines("stdin",n=1))
  if(customer_order_size %in% pizza_size){
    print (paste("Size!", sizing[sizing$pizza_size == customer_order_size, 1]))
    total <- total + sizing[sizing$pizza_size == customer_order_size, 2]
    print(total)
    break
  } else {
    print("Sorry, We don't have this size")
  }
  }

    print("Would you like anything else?")
    print("Press [1] to add appetizer")
    print("Press [2] no adding and go to summary")
    customer_add<-readLines("stdin",n=1)
  
  while(TRUE){
  if(customer_add=="2"){
    print("---Summary your order---")
    print(paste("K.",customer))
    print(paste("Pizza:",customer_flavour))
    print(paste("Size:",customer_order_size))
    print(paste("Totol",total,"bath"))
    print("Thank you, Enjoy eating!!")
    break 
  } else if(customer_add=="1"){
    print(extra_appetizer)
    print("What would you like to appetizer?")
  } 

  while(TRUE){
  customer_appetizer<-readLines("stdin",n=1)
  if(customer_appetizer %in% pizza_appetizer){
  print (paste("Excellent!", extra_appetizer[extra_appetizer$pizza_appetizer == customer_appetizer, 1]))
  total <- total + extra_appetizer[extra_appetizer$pizza_appetizer == customer_appetizer, 2]
  print(total)
  break
  } else {
    print("Sorry, We don't have this appetizer")
  }
  }

  print("---Summary your order---")
  print(paste("K.",customer))
  print(paste("Pizza:",customer_flavour))
  print(paste("Size:",customer_order_size))
  print(paste("Appetizer:",customer_appetizer))
  print(paste("Totol",total,"bath"))
  print("Thank you, Enjoy eating!!")
  break

  }
  
} 
  
chatbot_pizza()
