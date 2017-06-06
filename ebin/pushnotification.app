%% -*- Mode: Erlang; fill-column: 75; comment-column: 50 -*-
{application, pushnotiication,
    [
        {description, "Pushnotification Application"},
        {vsn, "0.0.1"},
        {registered, [pushnotification_app]},
        {modules, [pushnotification_app, pushnotification_sup,pushnotification,sup_sup]},
        {applications, [kernel, stdlib]},
        {mod, {pushnotification_app, []}},
        {env, [
		%% Environment Parameters
        ]}
    ]
}.
