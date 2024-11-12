#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"


MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo -e "\n~~~~~ MY SALON ~~~~~\n"
  echo -e "Welcome to My Salon, how can I help you?\n"

  $PSQL "SELECT service_id, name FROM services" | while IFS="|" read SERVICE_ID NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_SELECTED
  # check if id is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "Invalid service. What would you like today?"
  else
    RESULT_SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    if [[ -z $RESULT_SERVICE_NAME ]]
    then
      MAIN_MENU "I could not find that service. What would you like today?"
    else
      MAKE_APPOINTMENT $SERVICE_ID_SELECTED
    fi
  fi
}
MAKE_APPOINTMENT(){
  SERVICE_ID=$1
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]
  then
    echo "I don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_RESULT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi
  echo "What time would you like your $RESULT_SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
  echo "I have put you down for a $RESULT_SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  INSERT_RESULT=$($PSQL "INSERT INTO appointments (time, customer_id, service_id) VALUES ('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID)")
  # echo $INSERT_RESULT
}

MAIN_MENU