% hello world program
-module(demo).
-export([start/0]).

start() ->
  io:fwrite("Hello, world!\n").
