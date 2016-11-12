-module (erlpaystack).

-export ([initialize/4, charge_token/3, verify/2, fetch_transaction/2, charge_authorization/5, list_transactions/2, view_transaction_timeline/2, transaction_totals/2, export_transactions/2]).

-export ([create_customer/3, list_customers/2, fetch_customer/2, update_customer/3, white_black_list_customer/3]).

-define (InitUrl, "https://api.paystack.co/transaction/initialize").
-define (VerifyUrl, "https://api.paystack.co/transaction/verify").
-define (FetchTransUrl, "https://api.paystack.co/transaction").
-define (ChargeTokenUrl, "https://api.paystack.co/transaction/charge_token").
-define (ChargeAuthUrl, "https://api.paystack.co/transaction/charge_authorization").
-define (ListTransUrl, "https://api.paystack.co/transaction").
-define (ViewTransTimeLineUrl, "https://api.paystack.co/transaction/timeline").
-define (TransactionTotalsUrl, "https://api.paystack.co/transaction/totals").
-define (ExportTransactionsUrl, "https://api.paystack.co/transaction/export").

-define (CustomerUrl, "https://api.paystack.co/customer").
-define (WhiteBlackCustomerUrl, "https://api.paystack.co/customer/set_risk_action
").


-type apioption()::{string(), string()|integer()|boolean()|map()}.
-type queryapioption()::{string(), string()|integer()|boolean()}.
-type apioptions()::[apioption()]|[].
-type queryapioptions()::[queryapioption()]|[].
-spec initialize(SecretKey::string(), Amount::integer(), Email::string(), Options::apioptions()) -> {ok, map()} | {error, term()}.
-spec verify(SecretKey::string(), Reference::string()) -> {ok, map()} | {error, term()}.
-spec fetch_transaction(SecretKey::string(), Id::integer()) -> {ok, map()} | {error, term()}.
-spec charge_token(SecretKey::string(), Token::string(), Options::apioptions()) -> {ok, map()} | {error, term()}.
-spec charge_authorization(SecretKey::string(), AuthorizationCode::string(), Amount::integer(), Email::string(), Options::apioptions()) -> {ok, map()} | {error, term()}.
-spec list_transactions(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, map()} | {error, term()}.
-spec view_transaction_timeline(SecretKey::string(), Reference::string()) -> {ok, map()} | {error, term()}.
-spec transaction_totals(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, map()} | {error, term()}.
-spec export_transactions(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, map()} | {error, term()}.

-spec create_customer(SecretKey::string(), Email::string(), Options::apioptions()) -> {ok, map()} | {error, term()}.
-spec list_customers(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, map()} | {error, term()}.
-spec fetch_customer(SecretKey::string(), Id::string()) -> {ok, map()} | {error, term()}.
-spec white_black_list_customer(SecretKey::string(), Customer::string(), Options::apioptions()) -> {ok, map()} | {error, term()}.
-spec update_customer(SecretKey::string(), Customer::string(), Options::apioptions()) -> {ok, map()} | {error, term()}.


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

view_transaction_timeline(SecretKey, Reference) ->
	Url = ?ViewTransTimeLineUrl ++ "/" ++ Reference,
	utils:get(SecretKey, Url, []).

transaction_totals(SecretKey, QueryOptions) ->
	Url = ?TransactionTotalsUrl,
	utils:get(SecretKey, Url, QueryOptions). 

export_transactions(SecretKey, QueryOptions) ->
	Url = ?ExportTransactionsUrl,
	utils:get(SecretKey, Url, QueryOptions). 

%%Customers API

create_customer(SecretKey, Email, Options) ->
	Url = ?CustomerUrl,
	BodyMap = #{<<"email">> => list_to_binary(Email)},
	utils:post(SecretKey, Url, BodyMap, Options).

list_customers(SecretKey, QueryOptions) ->
	Url = ?CustomerUrl,
	utils:get(SecretKey, Url, QueryOptions). 
	
fetch_customer(SecretKey, Id) ->
	Url = ?CustomerUrl ++ "/" ++ Id,
	utils:get(SecretKey, Url, []).

white_black_list_customer(SecretKey, Customer, Options) ->
	Url = ?WhiteBlackCustomerUrl,
	BodyMap = #{<<"customer">> => list_to_binary(Customer)},
	utils:post(SecretKey, Url, BodyMap, Options).

update_customer(SecretKey ,Customer, Options) ->
	Url = ?CustomerUrl ++ "/" ++ Customer,
	BodyMap = #{},
	utils:put(SecretKey, Url, BodyMap, Options).






