#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME_INPUT

USERID_EXIST=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME_INPUT'")

if [[ -z $USERID_EXIST ]]
then
  INSERT_USERNAME=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME_INPUT')")
  USERID_EXIST=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME_INPUT'")
  echo -e "\nWelcome, $USERNAME_INPUT! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(user_id) FROM games WHERE user_id=$USERID_EXIST")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USERID_EXIST AND won=true")
  echo -e "\nWelcome back, $USERNAME_INPUT! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi


RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))

GUESS_COUNT=0

echo -e "\nGuess the secret number between 1 and 1000:"

while true
do
  read NUMBER_INPUT
  
   #GUESS VALIDATION
  if [[ ! "$NUMBER_INPUT" =~ ^[0-9]+$ ]]
  then 
    echo -e "\nThat is not an integer, guess again:"
    continue
  fi

  #COMPARATION
  if [[ $NUMBER_INPUT -eq $RANDOM_NUMBER ]]
  then
    ((GUESS_COUNT++))
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
    
    INSERT_GUESS_RESULT=$($PSQL "INSERT INTO games(user_id, guesses, won) VALUES($USERID_EXIST, $GUESS_COUNT, true)")
    exit
  elif [[ $NUMBER_INPUT -lt $RANDOM_NUMBER ]]
  then
    ((GUESS_COUNT++))
    echo "It's higher than that, guess again:"
  else
    ((GUESS_COUNT++))
    echo "It's lower than that, guess again:" 
  fi

done

INSERT_GUESS_RESULT=$($PSQL "INSERT INTO games(user_id, guesses, won) VALUES($USERID_EXIST, $GUESS_COUNT, false)")
echo -e "\nYou've ran out of guesses!"
