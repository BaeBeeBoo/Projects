## Pao Ying Chub Game!!
## unlimited times

# loop control
count <- 0
win <- 0
lose <- 0
tie <- 0

# dataframe
number <- c(1,2,3,4)
bot <- c("rock", "paper", "scissor","quit")
df <- data.frame(number, bot)

# greeting
print("Hello! Welcome to Pao-Ying-Chub Game!!")
print("What's your name ?")
user_name <- readLines("stdin", n=1)
print(paste("Hi", user_name, "Please choose the number : start game press 0,  quit game press 4"))
start <- readLines("stdin", n=1)
if(start == 4){print("Bye!")}
while (start == 0){
  print("Enter the following number to play the game 1: rock, 2: paper, 3: scissors")
  print("Let's play!")
  user_play <- readLines("stdin", n=1)
  bot_play <- sample(c(1,2,3), size =1)

## play
  if (user_play == bot_play){
    print(paste("user:",user_play, "vs bot:",bot_play))
    print(" result: tie")
    tie <- tie +1
  } else 
    if(user_play == 1 & bot_play == 2 |
      user_play == 2 & bot_play == 3 |
      user_play == 3 & bot_play == 1){
      print(paste("user:",user_play, "vs bot:",bot_play))
      print("result: lose") 
      lose <- lose +1
      }
      else if (user_play == 2 & bot_play == 1 |
      user_play == 3 & bot_play == 2 |
      user_play == 1 & bot_play == 3){
      print(paste("user:",user_play, "vs bot:",bot_play))
      print("result: win") 
      win <- win +1
      }
                            
  ## break
  else if (user_play == 4){
    print("play result")
    print(paste("Win:", win))
    print(paste("Lose:", lose))
    print(paste("tie:",tie))
    print("Bye!")
    break
  }
  
}

