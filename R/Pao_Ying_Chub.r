win <- 0
lose <- 0
tie <- 0

number <- c(1,2,3,4)
items <- c("rock", "paper", "scissor","quit")
df <- data.frame(number, items)

play_game <- function(){
  
  print("Hello! Welcome to Pao-Ying-Chub Game!!")
  print("What's your name?")
  user_name <- readLines("stdin", n=1)
  print(paste("Hi!", user_name, ":)"))
  print("Please choose the number start game press [0] | quit game press [4]")
  start <- readLines("stdin", n=1)
  
  if(start == 4){print("Bye!")}
  while (start == 0){
  print("Enter the following number to play the game")
  print("1:rock, 2:paper, 3:scissor")
  print("Let's play!")
  user_play <- readLines("stdin", n=1)
  bot_play <- sample(c(1,2,3),1)

  if (user_play == bot_play){
    print(paste("User:",user_play, "vs Bot:",bot_play))
    print("You tie!")
    tie <- tie +1
    
  } else if(user_play == 1 & bot_play == 2 |
      user_play == 2 & bot_play == 3 |
      user_play == 3 & bot_play == 1){
      print(paste("User:",user_play, "vs Bot:",bot_play))
      print("You lose!") 
      lose <- lose +1
    
      } else if (user_play == 2 & bot_play == 1 |
      user_play == 3 & bot_play == 2 |
      user_play == 1 & bot_play == 3){
      print(paste("User:",user_play, "vs Bot:",bot_play))
      print("You win!") 
      win <- win +1
    
      } else if (user_play == 4){
      print("The results")
      print(paste("Win:", win))
      print(paste("Lose:", lose))
      print(paste("Tie:",tie))
      print("Bye!")
      break
      }
    
    } 
}

play_game()
