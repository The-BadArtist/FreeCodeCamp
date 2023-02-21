#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "$($PSQL "TRUNCATE teams, games RESTART IDENTITY;")"



cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    # Select the team
    WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")"
    OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")"

    if [[ -z $WINNER_ID ]]
    then
    # Insert team if it doesn not exit
      INSERT_WINNER_ID="$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")"
      if [[ $INSERT_WINNER_ID == "INSERT 0 1" ]]
      then
        echo -e "\nWinner: $WINNER"  
      fi

      #Select after insertion
      WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")"
    fi 

    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT_ID="$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")"
      if [[ $INSERT_OPPONENT_ID == "INSERT 0 1" ]]
      then
        echo "Opponent: $OPPONENT"  
      fi

      OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")"
    fi 

    echo -e "\n$WINNER VS $OPPONENT"

    #Selects the game
    GAME_ID="$($PSQL "SELECT game_id FROM games WHERE winner_id=$WINNER_ID AND opponent_id=$OPPONENT_ID;")"

    #If game does not exist
    if [[ -z $GAME_ID ]]
    then
    #insert
    INSERT_GAME="$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);")"
      if [[ $INSERT_GAME == "INSERT 0 1" ]]
      then
       echo "The team values are $WINNER : $WINNER_GOALS VS $OPPONENT : $OPPONENT_GOALS"
      fi

    #Select new insert
    GAME_ID="$($PSQL "SELECT game_id FROM games WHERE winner_id=$WINNER_ID AND opponent_id=$OPPONENT_ID;")"
    fi
  fi


done 
