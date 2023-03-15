#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -c "

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU () {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "Welcome to My Salon, how can I help you?\n"

  SERVICE_MENU=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  
  echo "$SERVICE_MENU" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    [1-5]) SERVICES ;;
    6) EXIT ;;
    *) MAIN_MENU "Please choose a valid number" ;;
  esac
  
}

SERVICES () {
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE

  # select the customer by phone number
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # if customer doesnt exist
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nWhat is your name?"
    read CUSTOMER_NAME

    INSERT_CUSTOMER_DATA=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi

  # select the new inserted customer
   CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # time for the appointment
  echo -e "\nWhat will the time be for the appoinment?"
  read SERVICE_TIME

  #inserting the new appointment
  INSERT_APPOINTMENT_DATA=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  SALON_APPOINTMENT=$($PSQL "SELECT time, phone, customers.name AS customer_name, services.name AS service FROM appointments INNER JOIN customers USING(customer_id) INNER JOIN services USING(service_id) WHERE customer_id = $CUSTOMER_ID AND service_id = $SERVICE_ID_SELECTED")

  echo "$SALON_APPOINTMENT" | while read TIME BAR PHONE BAR CUSTOMER BAR SERVICE
  do
    echo -e "\nI have put you down for a $SERVICE at $TIME, $CUSTOMER.\n"
  done

  MAIN_MENU 
}

EXIT() {
  echo -e "\nThanks for stopping by MY SALON.\n"
}

MAIN_MENU
