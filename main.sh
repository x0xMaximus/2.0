#!/bin/bash

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BROWN_ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT_GRAY='\033[0;37m'

DARK_GRAY='\033[1;30m'
LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[0;32m'
YELLOW='\033[1;33m'
LIGHT_BLUE='\033[1;34m'
LIGHT_PURPLE='\033[1;35m'
LIGHT_CYAN='\033[1;36m'
WHITE='\033[1;37m'

NC='\033[0m'

max=100
width=100
bar_char="#"

author() {
  printf "${WHITE}███╗   ███╗ █████╗ ██╗  ██╗    ███╗   ██╗ █████╗ ███╗   ██╗██╗███████╗\n"
  printf "${WHITE}████╗ ████║██╔══██╗╚██╗██╔╝    ████╗  ██║██╔══██╗████╗  ██║██║██╔════╝\n"
  printf "${WHITE}██╔████╔██║███████║ ╚███╔╝     ██╔██╗ ██║███████║██╔██╗ ██║██║███████╗\n"
  printf "${WHITE}██║╚██╔╝██║██╔══██║ ██╔██╗     ██║╚██╗██║██╔══██║██║╚██╗██║██║╚════██║\n"
  printf "${WHITE}██║ ╚═╝ ██║██║  ██║██╔╝ ██╗    ██║ ╚████║██║  ██║██║ ╚████║██║███████║\n"
  printf "${WHITE}╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚══════╝\n"
}

while true; do
  author
  printf "${GREEN}[LOG] Installing Dependencies${NC}\n"
  printf "${LIGHT_RED}"

  #sudo apt-get --yes install java open-cobol erlang ghc6 ghc6-prof ghc6-doc gfortran intercal ocaml php golang python nodejs ruby
  brew update
  brew upgrade

  brew install gcc
  #brew install g++
  #brew install gcc45 --enable-cxx
  brew install Caskroom/cask/java
  brew install java app-engine-java-sdk javarepl jslint4java libreadline-java
  brew install open-cobol
  brew install intercal
  brew install erlang
  brew install haskell-stack
  brew install ocaml
  brew install go
  #brew install gfortran 
  brew install ruby
  brew install python
  brew install nodejs

  printf "${GREEN}[LOG] Running C${NC}\n"
  cd c
  printf "${BLUE}"
  gcc -o c_demo demo.c
  ./c_demo
  cd ../

  printf "${GREEN}[LOG] Running C++${NC}\n"
  cd cpp
  printf "${BLUE}"
  g++ -o cpp_demo demo.cpp
  ./cpp_demo
  cd ../

  printf "${GREEN}[LOG] Running JAVA${NC}\n"
  cd java
  printf "${BLUE}"
  javac Demo.java
  java Demo
  cd ../

  printf "${GREEN}[LOG] Running COBOL${NC}\n"
  cd cobol
  printf "${BLUE}"
  cobc -free -x -o cbl_demo demo.cbl
  ./cbl_demo
  cd ../

  printf "${GREEN}[LOG] Running ERLANG${NC}\n"
  cd erlang
  printf "${BLUE}"
  erlc demo.erl
  erl -noshell -s demo start -s init stop
  cd ../

  printf "${GREEN}[LOG] Running HASKELL${NC}\n"
  cd haskell
  printf "${BLUE}"
  ghc -O2 --make demo.hs -threaded -rtsopts
  ./demo
  cd ../

  printf "${GREEN}[LOG] Running INTERCAL${NC}\n"
  cd intercal
  printf "${BLUE}"
  ick demo.i
  ./demo
  cd ../

  printf "${GREEN}[LOG] Running OCAML${NC}\n"
  cd ocaml
  printf "${BLUE}"
  ocamlc -o demo demo.ml
  ./demo
  cd ../

  printf "${GREEN}[LOG] Running PHP${NC}\n"
  cd php
  printf "${BLUE}"
  php demo.php
  cd ../

  printf "${GREEN}[LOG] Running GO${NC}\n"
  cd go
  printf "${BLUE}"
  go run main.go
  cd ../

  printf "${GREEN}[LOG] Running FORTRAN${NC}\n"
  cd fortran
  printf "${BLUE}"
  gfortran -o fortran_demo demo.f03
  ./fortran_demo
  cd ../

  printf "${GREEN}[LOG] Running PERL${NC}\n"
  cd perl
  printf "${BLUE}"
  perl demo.pl
  cd ../

  printf "${GREEN}[LOG] Running RUBY${NC}\n"
  cd ruby
  printf "${BLUE}"
  ruby demo.rb
  cd ../

  printf "${GREEN}[LOG] Running PYTHON${NC}\n"
  cd python
  printf "${BLUE}"
  python demo.py
  cd ../

  printf "${GREEN}[LOG] Running NODE.JS${NC}\n"
  cd nodejs
  printf "${BLUE}"
  node demo.js
  cd ../


  printf ${CYAN}
  for i in {1..100}
  do
    # Compute the percentage.
    perc=$(( $i * 100 / max ))
    # Compute the number of blocks to represent the percentage.
    num=$(( $i * width / max ))
    # Create the progress bar string.
    bar=
    if [ $num -gt 0 ]; then
    bar=$(printf "%0.s${bar_char}" $(seq 1 $num))
    fi
    # Print the progress bar.
    line=$(printf "%s [%-${width}s] (%d%%)" "$title" "$bar" "$perc")
    echo -en "${line}\r"
  done
  printf "\n"
  printf "\n"
  printf "\n"

  sleep 3
done
