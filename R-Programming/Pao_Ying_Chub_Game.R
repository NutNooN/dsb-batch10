game_gon <- function() {
    username <- readline("Hi! What is your name:")
    print(paste(username, " 👋👋👋 Welcome! to game rock ✊, paper 🖐️, scissors ✌️"))
    print("Select your choice and beat the bot.")
    print("At the end, it will sum up the final score. If you're ready, let's go.")

    hand <- c(rock = "r", paper = "p", scissors = "s")
    score <- c(Win = 0, Lose = 0, Tie =0)

    while(TRUE) {
    flush.console()
    message("rock = r, paper = p, scissors = s, quit = q")
    user <- tolower(readline("Your choice:"))

        if  (user == "q") {

            if (grep(max(score), score)==1) {
                print("You win 🥇")
            }
            else if (grep(max(score), score)==2) {
                print("You lose 🥹")
            }
            else if (grep(max(score), score)==3) {
                print("You tie 😎")
            }
            print(score)
            print("Thank you!")
            break
        }

        else {
            bot <- sample(hand,1)
            #tie
            if (user == bot) {
                score["Tie"] <- score["Tie"] +1
                print(score)
            }
            #win
            else if (user == "r" & bot == "s" ||
                    user == "p" & bot == "r" ||
                    user == "s" & bot == "p") {
                    score["Win"] <- score["Win"]+1
                    print(score)
                    }
            #lose
            else if (user == "r" & bot == "p" ||
                    user == "p" & bot == "s" ||
                    user == "s" & bot == "r") {
                    score["Lose"] <- score["Lose"] + 1
                    print(score)
                    }
        }
    }

}
