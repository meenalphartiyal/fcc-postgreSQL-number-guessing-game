#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER()
{
  USER_ID=$1
  COUNT_GUESS=1    # for best game
  RANDOM_NUM=$((1 + $RANDOM % 1000))
  #echo "Hint: Secret number is: $RANDOM_NUM"
  echo "Guess the secret number between 1 and 1000: "
  while read GUESS
  do
    # if the input is not a number
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      echo -n "That is not an integer, guess again: "
    else
      if [[ $GUESS -eq $RANDOM_NUM ]]
      then
        break;
      else 
        if [[ $GUESS -gt $RANDOM_NUM ]]
        then
          echo -n "It's lower than that, guess again: "
        elif [[ $GUESS -lt $RANDOM_NUM ]]
        then
          echo -n "It's higher than that, guess again: "
        fi 
      fi
    fi
    COUNT_GUESS=$(( $COUNT_GUESS + 1 ))
  done

  if [[ $COUNT_GUESS -eq 1 ]]
  then
    echo -e "\nYou guessed it in $COUNT_GUESS try. The secret number was $RANDOM_NUM. Nice job!"
  else
    echo -e "\nYou guessed it in $COUNT_GUESS tries. The secret number was $RANDOM_NUM. Nice job!"
  fi

  # inserting data into database for new users
  BEST_GAME=$($PSQL "SELECT best_game FROM game_play WHERE user_id = $USER_ID")
  if [[ -z $BEST_GAME ]]
  then
    UPDATE_NEW_USER_DATA=$($PSQL "UPDATE game_play SET best_game = $COUNT_GUESS")
  else
    GAME_PLAYED=$($PSQL "SELECT game_played FROM game_play WHERE user_id = $USER_ID")
    BEST_GAME=$($PSQL "SELECT best_game FROM game_play WHERE user_id = $USER_ID")
    
    TRIES=$(expr $GAME_PLAYED + 1)
    UPDATE_OLD_USER_GAME_PLAYED=$($PSQL "UPDATE game_play SET game_played = $TRIES WHERE user_id = $USER_ID")

    if [[ $COUNT_GUESS -lt $BEST_GAME ]]
    then
      UPDATE_OLD_USER_BEST_GAME=$($PSQL "UPDATE game_play SET best_game = $COUNT_GUESS WHERE user_id = $USER_ID")
    fi
  fi

  
}

echo "Enter your username:"
read USER_NAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name = '$USER_NAME'")

if [[ -z $USER_ID ]]
then
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
  # add user to users table
  INSERT_USER=$($PSQL "INSERT INTO users(user_name) VALUES('$USER_NAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name = '$USER_NAME'")
  INSERT_NEW_USER_GAME_DATA=$($PSQL "INSERT INTO game_play(user_id, game_played) VALUES($USER_ID, 1)")
  # goto guess method
  RANDOM_NUMBER $USER_ID
else
  GAME_PLAYED=$($PSQL "SELECT game_played FROM game_play WHERE user_id = $USER_ID")
  BEST_GAME=$($PSQL "SELECT best_game FROM game_play WHERE user_id = $USER_ID")
  if [[ $GAME_PLAYED -eq 1 ]]
  then
    echo "Welcome back, $USER_NAME! You have played $GAME_PLAYED game, and your best game took $BEST_GAME guesses."
  else
    echo "Welcome back, $USER_NAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
  # goto guess method
  RANDOM_NUMBER $USER_ID
fi
