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
    {ok,Sup} = sup_sup:start_link(),
    register(pushnotification, self()),
    {ok,Sup}.
	
stop(_Args) ->
    ok.

