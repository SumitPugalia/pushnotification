-module(sup_sup).
-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).
-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================
%%--------------------------------------------------------------------
%% Function: start_link() -> {ok,Pid} | ignore | {error,Error}
%% Description: Starts the supervisor
%%--------------------------------------------------------------------
start_link() ->
  supervisor:start_link({local, ?SERVER}, ?MODULE, []).
%%====================================================================
%% Supervisor callbacks
%%====================================================================
%%--------------------------------------------------------------------
%% Func: init(Args) -> {ok,  {SupFlags,  [ChildSpec]}} |
%%                     ignore                          |
%%                     {error, Reason}
%% Description: Whenever a supervisor is started using
%% supervisor:start_link/[2,3], this function is called by the new process
%% to find out about restart strategy, maximum restart frequency and child
%% specifications.
%%--------------------------------------------------------------------
init([]) ->
	%% Dynamically load files if unloaded while using start.sh
	code:load_file(sup_sup),
	code:load_file(pushnotification_sup),
	code:load_file(emqttd_pushnotification),
        code:load_file(mochijson2),
	code:load_file(pushnotification_app),
	code:load_file(send_message),
{ok, {{one_for_one, 5, 60},[{pushnotification_sup,{pushnotification_sup, start_link, []},permanent,5000,supervisor,[pushnotification_sup]}]}}.
