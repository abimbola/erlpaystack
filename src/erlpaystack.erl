-module (erlpaystack).

-export ([initialize/4, verify/2, fetch_transaction/2]).
-define (InitUrl, "https://api.paystack.co/transaction/initialize").
-define (VerifyUrl, "https://api.paystack.co/transaction/verify").
-define (FetchTransUrl, "https://api.paystack.co/transaction").

-type apioption()::{string(), string()|integer()|boolean()|map()}.
-type apioptions()::[apioption()]|[].
-spec initialize(SecretKey::string(), Amount::integer(), Email::string(), Options::apioptions()) -> {ok, map()} | {error, term()}.
-spec verify(SecretKey::string(), Reference::string()) -> {ok, map()} | {error, term()}.
-spec fetch_transaction(SecretKey::string(), Id::integer()) -> {ok, map()} | {error, term()}.



initialize(SecretKey, Amount, Email, Options) ->
	Url = ?InitUrl,
	BodyMap = #{<<"amount">> => Amount, <<"email">> => list_to_binary(Email)},
	CompleteBodyMap = utils:generateMap(BodyMap, Options),
	BodyStr = binary_to_list(jsx:encode(CompleteBodyMap)),
	httpc_wrapper:postUrl(SecretKey, Url, BodyStr).	

verify(SecretKey, Reference) ->
	Url = ?VerifyUrl ++ "/" ++ Reference,
	httpc_wrapper:getUrl(SecretKey, Url).

fetch_transaction(SecretKey, Id) ->
	Url = ?FetchTransUrl ++ "/" ++ integer_to_list(Id),
	httpc_wrapper:getUrl(SecretKey, Url).


	