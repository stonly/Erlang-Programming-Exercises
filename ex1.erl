-module(ex1).
-export([sumall/1, sumall/2, create/1, rev_create/1, printn/2, printeven/1]).

sumall(N) when N == 0 ->
  N;
sumall(N) when N >= 1 andalso is_integer(N) ->
  N + sumall(N - 1);

sumall(_N) ->
 {error, invalid_number_provided}.


sumall(N,M) when N =:= M  ->
  M;
sumall(N,M) when N < M andalso is_integer(N) andalso is_integer(M) ->
  io:format('~n~p + ~p~n',[N,M]),
  M + sumall(N,M - 1);

sumall(_N,_M) ->
 {error, invalid_number_provided}.


create(N) when N >= 1 andalso is_integer(N)->
  R = [X || X <- lists:seq(1,N)],
  R.

rev_create(N) when N == 0 andalso is_integer(N)->
  [];
rev_create(N) when N >= 1 andalso is_integer(N)->
  [N|rev_create(N-1)].


printn(M,N) when M =:= N ->
  io:format("Number:~p~n",[M]);

printn(M,N) ->
  io:format("Number:~p~n",[M]),
  printn(M+1,N).

printeven(N) ->
  io:format("Number:~p~n",[N]).
