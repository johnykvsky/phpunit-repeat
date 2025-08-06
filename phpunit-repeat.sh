# #!/bin/bash
# since at the moment PHPUnit is missing --repeat

# A simple help function to display usage information
help() {
  echo "Usage: $0 [OPTIONS]"
  echo "  -r <number>   Repeat the action <number> times."
  echo "  -f <string>   Filter the output using <string>."
  echo "  --help, -h    Display this help message and exit."
  echo
  echo "example usage: phpunit-repeat.sh -r 10 -f myFailingTest"
  echo
  exit 0
}

repeat=5
filter=""

# Loop through all arguments, handling both short and long options
while [[ "$#" -gt 0 ]]; do
  case "$1" in
    -r)
      # Check if -r has an argument and if it's a number
      if [[ -z "$2" ]] || ! [[ "$2" =~ ^[0-9]+$ ]]; then
        echo "Error: -r requires a numeric argument." >&2
        help
      fi
      repeat=$2
      shift 2 # Shift past the flag and its argument
      ;;
    -f)
      # Check if -f has an argument
      if [[ -z "$2" ]]; then
        echo "Error: -f requires an argument." >&2
        help
      fi
      filter=" --filter $2"
      shift 2 # Shift past the flag and its argument
      ;;
    -h|--help)
      help
      ;;
    *)
      # Handle any other unrecognized arguments
      echo "Error: Unrecognized option '$1'" >&2
      help
      ;;
  esac
done

echo "Repeat count: $repeat"
echo "Filter option: $filter"
echo "---"
read -p "Press any key to continue... " -n 1 -s -r
echo

count=1

for ((count=1; count<=repeat; count++)); do
  php vendor-bin/phpunit --no-coverage --stop-on-failure $filter

  # Check if phpunit failed and exit
  if [ $? -ne 0 ]; then
    echo "PHPUnit failed. Exiting."
    exit 1
  fi

  echo
  echo "Executed $count/$repeat time(s)."
  echo "------------------------------"
done
