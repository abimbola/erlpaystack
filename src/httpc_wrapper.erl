-module (httpc_wrapper).
-export ([getUrl/2, postUrl/3]).

getUrl(SecretKey, Url) ->
	AuthHeader = {"Authorization", "Bearer " ++ SecretKey},
	Response = httpc:request(get, {Url, [AuthHeader]}, [],[]),
	case Response of
		{ok, Result} ->
			case Result of
				{{_HttpVersion, 200, _Reason}, _Header, Body} ->
					{ok, jsx:decode(list_to_binary(Body), [return_maps])};
				Error ->
					{error, Error}
			end;
		{error, Reason} ->
			{error, Reason}
	end.

postUrl(SecretKey, Url, BodyStr) ->
	AuthHeader = {"Authorization", "Bearer " ++ SecretKey},
	ApplicationTypeHeader = "application/json",
	Response = httpc:request(post, {Url, [AuthHeader], ApplicationTypeHeader, BodyStr}, [],[]),
	case Response of
		{ok, Result} ->
			case Result of
				{{_HttpVersion, 200, _Reason}, _Header, Body} ->
					{ok, jsx:decode(list_to_binary(Body), [return_maps])};
				Error ->
					{error, Error}
			end;
		{error, Reason} ->
			{error, Reason}
	end.