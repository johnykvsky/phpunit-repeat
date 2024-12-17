# #!/bin/bash
# since at the moment PHPUnit is missing --repeat

repeat=5
filter=""

help()
{
   # Display help
   echo "Simple script to repeat all/given PHPUnit tests"
   echo
   echo "Syntax: script [-r|-f|-h]"
   echo "options:"
   echo "-r             Number of repeats. Default: 5"
   echo "-f             Additional param for --filter. Default: none, not used"
   echo "-h|-help       This help"
   echo
   echo "example usage: phpunit-repeat.sh -r 10 -f myFailingTest"
   echo
   exit 1
}

while getopts r:f:help:h: flag
do
    case "${flag}" in
        r)  shift
            case $1 in
              *[!0-9]* | "") ;;
              *) repeat=$1; shift ;;
            esac ;;
        f) filter=" --filter ${OPTARG}";;
        help) help
          exit;;
        h) help
          exit;;
    esac
done

count=1

while php vendor/bin/phpunit --stop-on-failure $filter
do
  echo;
  echo "Executed $count/$repeat time(s)";
  echo "";
  count=$(( $count + 1 ));
  if [ $count -gt $repeat ]
  then
    break;
  fi
done
