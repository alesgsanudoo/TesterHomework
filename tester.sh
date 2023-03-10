#!/bin/bash

usage() {
  echo "CS240 Tester - 0.2"
  echo ""
  echo "Usage: tester [-d] [-s <score>] <test_number> <num_tests>"
  echo "  -d: Debug mode [Save test Files] (optional)"
  echo "  -s <score>: Set maximum score (optional, default=100)"
  echo ""
  echo "Example: tester (-d) (-s 90) 5 (Homework number) 15000 (times)"
  echo ""
  exit 1
}

debug_mode=false
max_score=100

while getopts ":ds:" opt; do
  case ${opt} in
    d )
      debug_mode=true
      ;;
    s )
      max_score=$OPTARG
      if ! [[ "$max_score" =~ ^[0-9]+$ ]] || ((max_score < 0)) || ((max_score > 100)); then
        echo "CS240 Tester - 0.2"
        echo ""
        echo "Error: score must be an integer between 0 and 100."
        exit 1
      fi
      ;;
    \? )
      usage
      ;;
  esac
done
shift $((OPTIND -1))

if [ "$#" -ne 2 ]; then
  usage
fi

TEST_NUM=$1
NUM_TESTS=$2


if ! [[ "$NUM_TESTS" =~ ^[0-9]+$ ]]; then
  echo "CS240 Tester - 0.1"
  echo ""
  echo "Error: num_tests must be a positive integer."
  exit 1
fi

cd ~
if [[ ! -d "cs240/hw${TEST_NUM}" ]]; then
  echo "CS240 Tester - 0.1"
  echo ""
  echo "Error: Invalid directory!"
  exit 1
fi

cd ~/cs240/hw${TEST_NUM}

if [[ ! -x "./hw${TEST_NUM}_test" ]]; then
  echo "CS240 Tester - 0.1"
  echo ""
  echo "Error: Test executable not found!"
  exit 1
fi

RUN="./hw${TEST_NUM}_test"

function handle_interrupt {
  echo -e "\nControl+C detected. Exiting..."
  if ! $debug_mode; then
    rm -rf ~/cs240/hw$TEST_NUM/test_data_files
  fi
  exit 1
}

trap handle_interrupt SIGINT

passed=true

pass_count=0
for ((i=1; i<=$NUM_TESTS; i++)); do
  output="$($RUN 2>&1)"
  if [[ "$?" != "$max_score" ]]; then
    echo -e "\nTest #$i failed"
    echo "$output"
    score=${output##*: }
    score=${score%/*}
    passed=false
    break
  else
    ((pass_count++))
    echo -ne "\r#$pass_count tests passed."
    if [ $((i % 30)) = 0 ]; then
      if ! $debug_mode; then
        rm -rf ~/cs240/hw$TEST_NUM/test_data_files
      fi
      sleep 1;
    fi
  fi
done
if $passed; then
  echo -e "\n==========================="
  echo -e " "
  echo -e "Tests passed successfully!."
  echo -e ""
  echo -e " Homework: #$1"
  echo -e " Test count: $pass_count/$2"
  echo -e ""
  echo -e " Score: $max_score/$max_score"
  echo -e " "
  echo -e " You're done! :)"
  echo -e " "
  echo -e "==========================="
 else
  echo -e "\n==========================="
  echo -e " "
  echo -e "Test failed: #$pass_count"
  echo -e ""
  echo -e " Homework: #$1"
  echo -e " Test count: $pass_count/$2"
  echo -e " "
  if $debug_mode; then
    echo -e " Mode = Debug"
  else
    echo -e " Mode = Normal"
  fi
  echo -e " "
  echo -e " Score: $score/$max_score"
  echo -e " "
  echo -e " You're no done! :("
  echo -e " "
  echo -e "==========================="
 fi
