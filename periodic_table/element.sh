#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
else
  ELEMENT_INFO=$($PSQL "SELECT atomic_number, symbol, name, types.type, atomic_mass, melting_point_celsius, boiling_point_celsius 
                        FROM elements 
                        JOIN properties USING(atomic_number) 
                        JOIN types USING(type_id) 
                        WHERE atomic_number::text='$1' OR symbol ='$1' OR name ='$1'")

  # Check if element was found
  if [[ -z $ELEMENT_INFO ]]; then
    echo "I could not find that element in the database."
  else
    IFS="|" read -r ATOMIC_NUMBER SYMBOL NAME TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<< $ELEMENT_INFO
    
    echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
fi
