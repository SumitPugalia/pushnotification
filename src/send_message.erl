-module(send_message).
-export([send_message/1]).

-record(mqtt_message, {
    id              :: pos_integer(),         %% Global unique message ID
    pktid           :: pos_integer(),         %% PacketId
    from            :: {binary(), undefined | binary()}, %% ClientId and Username
    topic           :: binary(),             %% Topic that the message is published to
    qos     = 0     :: 0 | 1 | 2,            %% Message QoS
    flags   = []    :: [retain | dup | sys], %% Message Flags
    retain  = false :: boolean(),            %% Retain flag
    dup     = false :: boolean(),            %% Dup flag
    sys     = false :: boolean(),            %% $SYS flag
    headers = []    :: list(),
    payload         :: binary(),             %% Payload
    timestamp       :: pos_integer()         %% os:timestamp to seconds
}).

%% Replace emqttd@127.0.0.1 with the node nam eyou have started your emqttd application
-define(emqttdnode,'emqttd@127.0.0.1').



send_message(Text) ->
        ClientId = gen_server:call(pushnotification,get_all_client),
        lists:foreach(fun(Client) ->
		Topic = Client,
		{M,S,MM} = os:timestamp(),
                Time = (M*1000000 + S)*1000 + round(MM/1000),
		%% Replace with your packet structure....
                Json = {struct,[{<<"category">>,1},{<<"data">>,{struct,[{<<"text">>,list_to_binary(Text)}]}},{<<"name">>,<<"Me">>},{<<"time">>,Time},{<<"senderId">>,<<"test">>}]},
		Payload = iolist_to_binary(mochijson2:encode(Json)),
                Msg = #mqtt_message{id = 1,pktid =1, from = <<"test">>,topic = Topic,qos = 1, flags = [], retain = false,dup = false, sys = false, headers= [], payload = Payload,timestamp = Time},
		rpc:cast(?emqttdnode,emqttd,publish,[Msg])
	end,ClientId).
