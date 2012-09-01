-module(lister).
-export([filter/2,reverse/1,concatenate/1,flatten/1]).

filter([H|_T], Int) when H =:= Int->
  [H];
filter(List, Int) ->
  [NewHead| T] = List,
  [NewHead] ++ filter(T, Int).

reverse([]) ->
  [];

reverse(L) ->
  [H|T] = L,
  reverse(T) ++ [H].

concatenate(N) when is_integer(N) ->
  N;

concatenate([]) ->
  [];

concatenate([H|T]) when is_integer(H)->
  [H] ++ concatenate(T);

concatenate([H|T]) when is_list(H)->
  H ++ concatenate(T).


flatten([]) ->
  [];

flatten([[N]]) ->
  N;

%%flatten([H|[HT|T]]) when is_integer(HT) ->
%%  HT;

flatten(N) when is_integer(N)->
  [N];

flatten([H|[HT|T]]) ->
  FL = flatten(H)++flatten(HT)++flatten(T),
  concatenate(FL);

flatten(V) ->
  V.

%%flatten([H|T]) when is_list(H) ->
%%  H;

