-module(db).
-export([new/0,write/3,search/3,read/2,delete/2,destroy/1]).
%%,destroy/1,match/2]).

new() ->
  [{"T",1},{"S",2}].

destroy(_DB) ->
  [].

write(KEY, VAL, DB) ->
  [{KEY, VAL}] ++ search(KEY, DB, DB).

search(_KEY,DB, []) ->
  DB;

search(KEY, DB, NEWDB) ->
  [{ThisKey,ThisVal}|NEWNEWDB] = DB,
  if 
    ThisKey =:= KEY ->
      NEWNEWDB;
    true ->
      NEWDB2 = NEWNEWDB ++ [{ThisKey,ThisVal}],
      [_|UPDB] = NEWDB,
      search(KEY, NEWDB2, UPDB)
  end.

read(KEY, DB) ->
  read(KEY, DB, DB).

delete(KEY, DB) ->
  search(KEY, DB, DB).

read(_KEY,DB, []) ->
  {error,not_found};

read(KEY, DB, NEWDB) ->
  [{ThisKey,ThisVal}|NEWNEWDB] = DB,
  if 
    ThisKey =:= KEY ->
      ThisVal;
    true ->
      NEWDB2 = NEWNEWDB ++ [{ThisKey,ThisVal}],
      [_|UPDB] = NEWDB,
      read(KEY, NEWDB2, UPDB)
  end.
