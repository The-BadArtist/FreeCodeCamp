#! /bin/bash


#################REMOVE TRUCATE##################

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


# echo $($PSQL "TRUNCATE players, games RESTART IDENTITY")

echo -e "\n~~~~~ Number Guessing Game ~~~~~\n"


DISPLAY () {
  echo -e "\nEnter your username:"
  read USERNAME

PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE name = '$USERNAME'")

if [[ -z $PLAYER_ID ]]
then
  # insert user if they did not exist
  INSERT_USERNAME=$($PSQL "INSERT INTO players(name) VALUES('$USERNAME')")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

  PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE name = '$USERNAME'")
else
  #if user exist, present their stats;
  PLAYER_NAME=$($PSQL "SELECT name FROM players WHERE player_id = $PLAYER_ID")
  PLAYER_GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE player_id = $PLAYER_ID")
  PLAYER_BEST_GAME=$($PSQL "SELECT MIN(best_game) FROM games WHERE player_id = $PLAYER_ID")
  echo -e "\nWelcome back, $PLAYER_NAME! You have played $PLAYER_GAMES_PLAYED games, and your best game took $PLAYER_BEST_GAME guesses."
fi

#Creating the game function

NUMBER=$(( $RANDOM %1000 + 1 ))

#initailize games_played to compare to number of tries
BEST_GAME=$($PSQL "SELECT MIN(best_game) FROM games WHERE player_id = $PLAYER_ID") 
if [[ -z $BEST_GAME ]]
then
  BEST_GAME=0
fi

NUMBER_GUESS
}


NUMBER_GUESS () {
  echo -e "\nGuess the secret number between 1 and 1000:"
  (( NUMBER_OF_TRIES = NUMBER_OF_TRIES + 1 ))
  read USER_GUESS
  if (( $USER_GUESS != $NUMBER ))
  then
    if [[ $USER_GUESS =~ ^[0-9]+$ ]]
    then
      if [[ $USER_GUESS > $NUMBER ]]
      then
        echo "It's lower than that, guess again:"
        NUMBER_GUESS 
      else
        echo "It's higher than that, guess again:"
        NUMBER_GUESS 
      fi
    else
      echo "That is not an integer, guess again:"
      NUMBER_GUESS 
    fi
  else
    echo -e "\nYou guessed it in $NUMBER_OF_TRIES tries. The secret number was $NUMBER. Nice job!\n"
    #update player record when done with game

    if [[ $BEST_GAME == 0 || $BEST_GAME -gt $NUMBER_OF_TRIES ]]
    then
      BEST_GAME=$NUMBER_OF_TRIES
    fi

    INSERT_GAME_DATA=$($PSQL "INSERT INTO games(best_game ,player_id) VALUES($BEST_GAME,$PLAYER_ID)")
  fi

  

  DISPLAY
}

DISPLAY

 

