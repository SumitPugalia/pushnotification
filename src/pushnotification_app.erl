-module(pushnotification_app).
-behaviour(application).

%% Application callbacks
-export([start/0, start/2, stop/1]).


%% ===================================================================
%% Application callbacks
%% ===================================================================
start() ->
	start(starttype,startargs).


start(_StartType, _StartArgs) ->
    io:format("~n APPLICATION IS STARTING .....~n "),
    {ok,Sup} = sup_sup:start_link(),
    register(pushnotification, self()),
    io:format("~n Sup in Application = ~p  ~n ",[Sup]),
    {ok,Sup}.
	
stop(_Args) ->
    ok.

