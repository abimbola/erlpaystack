-module (erlpaystack).

-export ([initialize/4, verify/2]).
-define (InitUrl, "https://api.paystack.co/transaction/initialize").
-define (VerifyUrl, "https://api.paystack.co/transaction/verify").

-spec initialize(SecretKey::string(), Reference::string(), Amount::string(), Email::string()) -> {ok, term()} | {error, term()}.
-spec verify(SecretKey::string(), Reference::string()) -> {ok, term()} | {error, term()}.



initialize(SecretKey, Reference, Amount, Email) ->
	%%Url = "https://api.paystack.co/transaction/initialize",
	AuthHeader = {"Authorization", "Bearer " ++ SecretKey},
	ApplicationTypeHeader = "application/json",
	BodyMap = #{<<"reference">> => list_to_binary(Reference), <<"amount">> => list_to_binary(Amount), <<"email">> => list_to_binary(Email)},
	BodyStr = binary_to_list(jsx:encode(BodyMap)),
	Response = httpc:request(post, {?InitUrl, [AuthHeader], ApplicationTypeHeader, BodyStr}, [],[]),
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

verify(SecretKey, Reference) ->
	Url = ?VerifyUrl ++ "/" ++ Reference,
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