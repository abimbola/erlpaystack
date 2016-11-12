-module (erlpaystack).

-export ([initialize/4, charge_token/3, verify/2, fetch_transaction/2, charge_authorization/5, list_transactions/2]).
-define (InitUrl, "https://api.paystack.co/transaction/initialize").
-define (VerifyUrl, "https://api.paystack.co/transaction/verify").
-define (FetchTransUrl, "https://api.paystack.co/transaction").
-define (ChargeTokenUrl, "https://api.paystack.co/transaction/charge_token").
-define (ChargeAuthUrl, "https://api.paystack.co/transaction/charge_authorization").
-define (ListTransUrl, "https://api.paystack.co/transaction").

-type apioption()::{string(), string()|integer()|boolean()|map()}.
-type queryapioption()::{string(), string()|integer()}.
-type apioptions()::[apioption()]|[].
-type queryapioptions()::[queryapioption()]|[].
-spec initialize(SecretKey::string(), Amount::integer(), Email::string(), Options::apioptions()) -> {ok, map()} | {error, term()}.
-spec verify(SecretKey::string(), Reference::string()) -> {ok, map()} | {error, term()}.
-spec fetch_transaction(SecretKey::string(), Id::integer()) -> {ok, map()} | {error, term()}.
-spec charge_token(SecretKey::string(), Token::string(), Options::apioptions()) -> {ok, map()} | {error, term()}.
-spec charge_authorization(SecretKey::string(), AuthorizationCode::string(), Amount::integer(), Email::string(), Options::apioptions()) -> {ok, map()} | {error, term()}.
-spec list_transactions(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, map()} | {error, term()}.

initialize(SecretKey, Amount, Email, Options) ->
	Url = ?InitUrl,
	BodyMap = #{<<"amount">> => Amount, <<"email">> => list_to_binary(Email)},
	utils:post(SecretKey, Url, BodyMap, Options).

verify(SecretKey, Reference) ->
	Url = ?VerifyUrl ++ "/" ++ Reference,
	utils:get(SecretKey, Url, []).

fetch_transaction(SecretKey, Id) ->
	Url = ?FetchTransUrl ++ "/" ++ integer_to_list(Id),
	utils:get(SecretKey, Url, []). 

charge_token(SecretKey, Token, Options) ->
	Url = ?ChargeTokenUrl,
	BodyMap = #{<<"token">> => list_to_binary(Token)},
	utils:post(SecretKey, Url, BodyMap, Options).

charge_authorization(SecretKey, AuthorizationCode, Amount, Email, Options) ->
	Url = ?ChargeAuthUrl,
	BodyMap = #{<<"authorization_code">> => AuthorizationCode, <<"amount">> => Amount, <<"email">> => list_to_binary(Email)},
	utils:post(SecretKey, Url, BodyMap, Options).

list_transactions(SecretKey, QueryOptions) ->
	Url = ?ListTransUrl,
	utils:get(SecretKey, Url, QueryOptions). 



	