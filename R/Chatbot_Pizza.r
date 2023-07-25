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

pizza_chatbot <- function() {

print("Wellcome to Bina pizza!. Please type [ready] to view our menu")
  
  while (TRUE) {
    ready <- readLines("stdin", n = 1)
    if (tolower(ready) == "ready") {
      break
    }
    print("Wellcome to Bina pizza!. Please type [ready] to view our menu")
  }
  
  print(pizza)
  print("What do you want a flavours of pizza?")

  customer_flavour<-readLines("stdin",n=1)
  if(customer_flavour=="cheesy puff spicy seafood"){
    total<-total+189
    print(total)
  }else if(customer_flavour=="mighty meat"){
    total<-total+139
    print(total)
  }else{
    total<-total+179
    print(total)
  }
    
    print("What do you want a size of pizza?")
    print(pizza_size)
    customer_order_size<-toupper(readLines("stdin",n=1))
  if(customer_order_size=="L"){
    total<-total+300
    print(total)
  } else if(customer_order_size=="M"){
    total<-total+200
    print(total)  
  }else{
    total<-total+100
    print(total)  
  }

    print("Would you like anything else?")
    print("press[1] to add appetizer")
    print("press[2] no adding and go to summary")
    customer_add<-readLines("stdin",n=1)
  
  while(TRUE){
  if(customer_add=="2"){
    print("---Summary your order---")
    print(customer_flavour)
    print(customer_order_size)
    print(total)
    print("Thank you, enjoy!!")
    break 
  } else if(customer_add=="1"){
    print(extra_appetizer)
    print("Add your appetizer")
  } 

  customer_appetizer<-readLines("stdin",n=1)
  if(customer_appetizer=="bread sticks"){
    total<-total+79
  }else if(customer_appetizer=="fish fingers"){
    total<-total+89
  }else if(customer_appetizer=="calamari"){
    total<-total+99
  } 

  print("---Summary your order---")
  print(customer_flavour)
  print(customer_order_size)
  print(customer_appetizer)
  print(total)
  print("Thank you, enjoy!!")
  break

  }
} 
  
pizza_chatbot()
