-module(pushnotification_SUITE).

-export([all/0]).
-export([application_api/1]).

-spec all() -> [application_api].
all() -> [application_api].

-spec application_api(sa_ct:config()) -> ok.
application_api(_Config) ->
  false = is_app_running(),
  ok = application:start(pushnotification),
  true = is_app_running(),
  ok = application:stop(pushnotification),
  false = is_app_running(),
  ok.

%% private
is_app_running() ->
  lists:member(pushnotification, [App || {App, _, _} <- application:which_applications()]).
