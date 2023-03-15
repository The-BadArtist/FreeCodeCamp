#! /bin/bash


#################REMOVE TRUCATE##################

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


# echo $($PSQL "TRUNCATE players, games RESTART IDENTITY")
echo -e "\n~~~~~ Number Guessing Game ~~~~~\n"

MAIN_MENU () {

  echo "Enter your username:"
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
    PLAYER_INFO=$($PSQL "SELECT name, games_played, best_game FROM players INNER JOIN games USING(player_id) WHERE player_id = $PLAYER_ID")
    echo "$PLAYER_INFO" | while IFS=\| read NAME GAMES_PLAYED BEST_GAME
    do
      echo -e "\nWelcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  fi

  #Creating the game function

  NUMBER=$(( $RANDOM %1000 + 1 ))

  #get player records
  PLAYER_RECORDS=$($PSQL "SELECT games_played, best_game FROM games WHERE player_id =$PLAYER_ID")
  #if player record does not exist
  if [[ -z $PLAYER_RECORDS ]]
  then
    INSERT_GAME_RECORDS=$($PSQL "INSERT INTO games(player_id) VALUES($PLAYER_ID)")

    PLAYER_RECORDS=$($PSQL "SELECT games_played, best_game FROM games WHERE player_id =$PLAYER_ID")
  fi

  #increment games played by 1
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM games WHERE player_id = $PLAYER_ID")
  GAMES_PLAYED_UPDATE=$(( $GAMES_PLAYED + 1 ))
  #initailize games_played to compare to number of tries
  BEST_GAME=$($PSQL "SELECT best_game FROM games WHERE player_id = $PLAYER_ID") 
  
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
    echo -e "\nYou guessed it in $NUMBER_OF_TRIES tries. The secret number was $NUMBER. Nice job!"
    #update player record when done with game
    if [[ $BEST_GAME == 0 || $BEST_GAME -gt $NUMBER_OF_TRIES ]]
    then
      BEST_GAME=$NUMBER_OF_TRIES
    fi

    RECORD_UPDATE=$($PSQL "UPDATE games SET games_played = $GAMES_PLAYED_UPDATE, best_game = $BEST_GAME WHERE player_id = $PLAYER_ID")
  fi

  MAIN_MENU
}


MAIN_MENU






