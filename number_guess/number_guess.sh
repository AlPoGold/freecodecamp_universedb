#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GUESSING_GAME() {
  RANDOM_NUMBER=$((1 + $RANDOM % 1000))
  echo -e "Guess the secret number between 1 and 1000:"
  read USER_NUMBER
  COUNT_TRIES=1
  
  while [[ $USER_NUMBER != $RANDOM_NUMBER ]] 
    do
      if  [[ $USER_NUMBER =~ ^[0-9]+$ ]]
      then
    
        if [[  $USER_NUMBER -lt $RANDOM_NUMBER ]]
        then
          echo "It's lower than that, guess again:"
        elif [[ $USER_NUMBER -gt $RANDOM_NUMBER ]]
        then
          echo "It's higher than that, guess again:"
        fi
      else
        echo -e "That is not an integer, guess again:"
      fi
      read USER_NUMBER
      ((COUNT_TRIES++)) 
    done
    echo "You guessed it in $COUNT_TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    
    

}
START_GAME() {
  echo "Enter your username:"
  read USERNAME

  RES_USERNAME=$($PSQL "SELECT user_id, username, games_played, best_game FROM users WHERE username='$USERNAME'")
  if [[ -z  $RES_USERNAME ]]
  then
    echo -e "Welcome, $USERNAME! It looks like this is your first time here."
    # add new user
    RES_INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME')")
  else
     IFS="|" read -r USER_ID USERNAME_db GAMES_PLAYED BEST_GAME <<< $RES_USERNAME
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
  
  GUESSING_GAME
  (( GAMES_PLAYED++ ))

  $PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'"
  if [[ -z $BEST_GAME || $COUNT_TRIES -lt $BEST_GAME ]]
  then
   $PSQL "UPDATE users SET best_game=$COUNT_TRIES WHERE username='$USERNAME'"
  fi
  

}

START_GAME