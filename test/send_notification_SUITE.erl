-module(send_notification_SUITE).

-export([init_per_suite/1, end_per_suite/1]).
-export([all/0]).
-export([send/1]).

-spec all() -> [atom()].
all() -> [send].

-spec init_per_suite(pn_ct:config()) -> pn_ct:config().
init_per_suite(Config) ->
  _ = application:start(pushnotification),
  Config.

-spec end_per_suite(pn_ct:config()) -> ok.
end_per_suite(_) ->
  application:stop(pushnotification).

-spec send(pn_ct:config()) -> ok.
send(_Config) ->
  _ = send_notification ! {send_message, hello, [self()]},
  ok = receive
          hello -> ok
       after 1000 ->
          notok
       end.

