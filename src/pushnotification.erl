-module(pushnotification).
-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).


%% ===================================================================
%% Application callbacks
%% ===================================================================
start(_StartType, _StartArgs) ->
  pushnotification_sup:start_link().

stop(_Args) ->
  ok.

