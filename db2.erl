-module(db2).
-export([new/0,write/3,read/2,delete/2,destroy/1]).

new() ->
  [{"T",1},{"S",2}].

destroy(_DB) ->
  [].

write(KEY, VAL, DB) ->
  lists:append([[{KEY, VAL}],delete(KEY, DB)]).

delete(KEY, DB) ->
  lists:keydelete(KEY,1,DB).

read(KEY, DB) ->
  lists:keyfind(KEY,1,DB).
