#!/bin/sh

envFile=~/.local/bin/red_env.sh
changeValue=100

function send_notification() {
	val=$(printf "%.0f\n" "$(bc -l <<< "($REDSHIFT_TEMP-1100)/238")")
	dunstify -a "redshift.sh" -u low -r 9991 -h int:value:"$val" -i "redshift-$1" "🏮🙄: $val%" -t 2000
}

changeMode() {
  sed -i "s/REDSHIFT=$1/REDSHIFT=$2/g" $envFile 
  REDSHIFT=$2
  echo $REDSHIFT
}

changeTemp() {
  if [ "$2" -gt 1000 ] && [ "$2" -lt 25000 ]
  then
    sed -i "s/REDSHIFT_TEMP=$1/REDSHIFT_TEMP=$2/g" $envFile 
    redshift -P -O $((REDSHIFT_TEMP+changeValue))
  fi
}

case $1 in 
  toggle) 
    if [ "$REDSHIFT" = on ];
    then
      changeMode "$REDSHIFT" off
      redshift -x
	dunstify -t 2000 -r 9993 -u low "🏮🙄:OFF"
    else
      changeMode "$REDSHIFT" on
      redshift -O "$REDSHIFT_TEMP"
	dunstify -t 2000 -r 9993 -u low "🏮🙄:ON"
    fi ;;
  increase)
    changeTemp $((REDSHIFT_TEMP)) $((REDSHIFT_TEMP+changeValue))
	send_notification $1
    ;;
  decrease)
    changeTemp $((REDSHIFT_TEMP)) $((REDSHIFT_TEMP-changeValue));
	send_notification $1
    ;;
  temperature)
    case $REDSHIFT in
      on)
        printf "%dK" "$REDSHIFT_TEMP"
        ;;
      off)
        printf "off"
        ;;
    esac
    ;;
esac
