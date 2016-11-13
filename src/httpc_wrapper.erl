-module (httpc_wrapper).
-export ([getUrl/2, postUrl/3, putUrl/3]).

-spec getUrl(SecretKey::string(), Url::string()) -> {ok, map()} | {error, term()}.

getUrl(SecretKey, Url) ->
	AuthHeader = {"Authorization", "Bearer " ++ SecretKey},
	Response = httpc:request(get, {Url, [AuthHeader]}, [],[]),
	case Response of
		{ok, Result} ->
			case Result of
				{{_HttpVersion, 200, _Reason}, _Header, Body} ->
					{ok, jsx:decode(list_to_binary(Body), [return_maps])};
				{{_HttpVersion, 201, _Reason}, _Header, Body} ->
					{ok, jsx:decode(list_to_binary(Body), [return_maps])};
				{{_HttpVersion, StatusCode, Reason}, _Header, Body} ->
					{error, {StatusCode, Reason, Body}};	
				{200, Body} ->
					{ok, jsx:decode(list_to_binary(Body), [return_maps])};
				{201, Body} ->
					{ok, jsx:decode(list_to_binary(Body), [return_maps])};
				{StatusCode, Body} ->
					{error, {StatusCode, Body}};
				Error ->
					{error, Error}
			end;
		{error, Reason} ->
			{error, Reason}
	end.

-spec postUrl(SecretKey::string(), Url::string(), BodyStr::string()) -> {ok, map()} | {error, term()}.

postUrl(SecretKey, Url, BodyStr) ->
	AuthHeader = {"Authorization", "Bearer " ++ SecretKey},
	ApplicationTypeHeader = "application/json",
	Response = httpc:request(post, {Url, [AuthHeader], ApplicationTypeHeader, BodyStr}, [],[]),
	case Response of
		{ok, Result} ->
			case Result of
				{{_HttpVersion, 200, _Reason}, _Header, Body} ->
					{ok, jsx:decode(list_to_binary(Body), [return_maps])};
				{{_HttpVersion, 201, _Reason}, _Header, Body} ->
					{ok, jsx:decode(list_to_binary(Body), [return_maps])};
				{{_HttpVersion, StatusCode, Reason}, _Header, Body} ->
					{error, {StatusCode, Reason, Body}};	
				{200, Body} ->
					{ok, jsx:decode(list_to_binary(Body), [return_maps])};
				{201, Body} ->
					{ok, jsx:decode(list_to_binary(Body), [return_maps])};
				{StatusCode, Body} ->
					{error, {StatusCode, Body}};
				Error ->
					{error, Error}
			end;
		{error, Reason} ->
			{error, Reason}
	end.

-spec putUrl(SecretKey::string(), Url::string(), BodyStr::string()) -> {ok, map()} | {error, term()}.

putUrl(SecretKey, Url, BodyStr) ->
	AuthHeader = {"Authorization", "Bearer " ++ SecretKey},
	ApplicationTypeHeader = "application/json",
	Response = httpc:request(put, {Url, [AuthHeader], ApplicationTypeHeader, BodyStr}, [],[]),
	case Response of
		{ok, Result} ->
			case Result of
				{{_HttpVersion, 200, _Reason}, _Header, Body} ->
					{ok, jsx:decode(list_to_binary(Body), [return_maps])};
				{{_HttpVersion, 201, _Reason}, _Header, Body} ->
					{ok, jsx:decode(list_to_binary(Body), [return_maps])};
				{{_HttpVersion, StatusCode, Reason}, _Header, Body} ->
					{error, {StatusCode, Reason, Body}};	
				{200, Body} ->
					{ok, jsx:decode(list_to_binary(Body), [return_maps])};
				{201, Body} ->
					{ok, jsx:decode(list_to_binary(Body), [return_maps])};
				{StatusCode, Body} ->
					{error, {StatusCode, Body}};
				Error ->
					{error, Error}
			end;
		{error, Reason} ->
			{error, Reason}
	end.