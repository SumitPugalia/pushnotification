-module(meta_SUITE).

-include_lib("mixer/include/mixer.hrl").
-mixin([ktn_meta_SUITE]).

-export([
  init_per_suite/1,
  end_per_suite/1
]).

-spec init_per_suite(pn_ct:config()) -> pn_ct:config().
init_per_suite(Config) ->
  [{application, pushnotification} | Config].

-spec end_per_suite(pn_ct:config()) -> ok.
end_per_suite(_) -> ok.
