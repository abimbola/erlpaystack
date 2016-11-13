-module (erlpaystack).

-export ([initialize/4, charge_token/3, verify/2, fetch_transaction/2, charge_authorization/5, list_transactions/2, view_transaction_timeline/2, transaction_totals/2, export_transactions/2]).

-export ([create_customer/3, list_customers/2, fetch_customer/2, update_customer/3, white_black_list_customer/3]).

-export ([create_plan/5, list_plans/2, fetch_plan/2, update_plan/3]).

-export ([create_subscription/4, list_subscriptions/2, disable_subscription/3, enable_subscription/3, fetch_subscription/2]).

-export ([create_page/3, list_pages/2, fetch_page/2, update_page/3, check_slug_availability/2]).

-export ([create_subaccount/6, list_subaccounts/2, fetch_subaccount/2, update_subaccount/3, list_banks/2]).

-export ([fetch_settlements/2]).

-export ([resolve_card_bin/2]).

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

-define (PlanUrl, "https://api.paystack.co/plan").

-define (SubscriptionUrl, "https://api.paystack.co/subscription").

-define (PageUrl, "https://api.paystack.co/page").

-define (SubaccountUrl, "https://api.paystack.co/subaccount").

-define (BankUrl, "https://api.paystack.co/bank").

-define (SettlementUrl, "https://api.paystack.co/settlement").

-define (BinUrl, "https://api.paystack.co/decision/bin").


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

-spec create_plan(SecretKey::string(), Name::string(), Amount::integer(), Interval::string(), Options::apioptions()) -> {ok, map()} | {error, term()}.
-spec list_plans(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, map()} | {error, term()}.
-spec fetch_plan(SecretKey::string(), Id::string()) -> {ok, map()} | {error, term()}.
-spec update_plan(SecretKey::string(), Id::string(), Options::apioptions()) -> {ok, map()} | {error, term()}.

-spec create_subscription(SecretKey::string(), Customer::string(), Plan::string(), Options::apioptions()) -> {ok, map()} | {error, term()}.
-spec list_subscriptions(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, map()} | {error, term()}.
-spec disable_subscription(SecretKey::string(), Code::string(), Token::string()) -> {ok, map()} | {error, term()}.
-spec enable_subscription(SecretKey::string(), Code::string(), Token::string()) -> {ok, map()} | {error, term()}.
-spec fetch_subscription(SecretKey::string(), Id::string()) -> {ok, map()} | {error, term()}.

-spec create_page(SecretKey::string(), Name::string(), Options::apioptions()) -> {ok, map()} | {error, term()}.
-spec list_pages(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, map()} | {error, term()}.
-spec fetch_page(SecretKey::string(), Id::string()) -> {ok, map()} | {error, term()}.
-spec update_page(SecretKey::string() ,Id::string(), Options::apioptions()) -> {ok, map()} | {error, term()}.
-spec check_slug_availability(SecretKey::string(), Slug::string()) ->  {ok, map()} | {error, term()}.

-spec create_subaccount(SecretKey::string(), BusinessName::string(), SettlementBank::string(), AccountNumber::string(), PercentageCharge::string(), Options::apioptions()) -> {ok, map()} | {error, term()}.
-spec list_subaccounts(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, map()} | {error, term()}.
-spec fetch_subaccount(SecretKey::string(), Id::string()) -> {ok, map()} | {error, term()}.
-spec update_subaccount(SecretKey::string() ,Id::string(), Options::apioptions()) -> {ok, map()} | {error, term()}.
-spec list_banks(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, map()} | {error, term()}.

-spec fetch_settlements(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, map()} | {error, term()}.

-spec resolve_card_bin(SecretKey::string(), Bin::string()) -> {ok, map()} | {error, term()}.

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

%%Plans API

create_plan(SecretKey, Name, Amount, Interval, Options) ->
	Url = ?PlanUrl,
	BodyMap = #{<<"name">> => list_to_binary(Name), <<"amount">> => Amount, <<"interval">> => list_to_binary(Interval)},
	utils:post(SecretKey, Url, BodyMap, Options).

list_plans(SecretKey, QueryOptions) ->
	Url = ?PlanUrl,
	utils:get(SecretKey, Url, QueryOptions). 

fetch_plan(SecretKey, Id) ->
	Url = ?PlanUrl ++ "/" ++ Id,
	utils:get(SecretKey, Url, []).

update_plan(SecretKey ,Id, Options) ->
	Url = ?PlanUrl ++ "/" ++ Id,
	BodyMap = #{},
	utils:put(SecretKey, Url, BodyMap, Options).

%%Subscriptions API

create_subscription(SecretKey, Customer, Plan, Options) ->
	Url = ?SubscriptionUrl,
	BodyMap = #{<<"customer">> => list_to_binary(Customer), <<"plan">> => list_to_binary(Plan)},
	utils:post(SecretKey, Url, BodyMap, Options).

list_subscriptions(SecretKey, QueryOptions) ->
	Url = ?SubscriptionUrl,
	utils:get(SecretKey, Url, QueryOptions). 

disable_subscription(SecretKey, Code, Token) ->
	Url = ?SubscriptionUrl ++ "/" ++ "disable",
	BodyMap = #{<<"code">> => list_to_binary(Code), <<"token">> => list_to_binary(Token)},
	utils:post(SecretKey, Url, BodyMap, []).

enable_subscription(SecretKey, Code, Token) ->
	Url = ?SubscriptionUrl ++ "/" ++ "enable",
	BodyMap = #{<<"code">> => list_to_binary(Code), <<"token">> => list_to_binary(Token)},
	utils:post(SecretKey, Url, BodyMap, []).

fetch_subscription(SecretKey, Id) ->
	Url = ?SubscriptionUrl ++ "/" ++ Id,
	utils:get(SecretKey, Url, []).

%% Pages API

create_page(SecretKey, Name, Options) ->
	Url = ?PageUrl,
	BodyMap = #{<<"name">> => list_to_binary(Name)},
	utils:post(SecretKey, Url, BodyMap, Options).

list_pages(SecretKey, QueryOptions) ->
	Url = ?PageUrl,
	utils:get(SecretKey, Url, QueryOptions). 

fetch_page(SecretKey, Id) ->
	Url = ?PageUrl ++ "/" ++ Id,
	utils:get(SecretKey, Url, []).

update_page(SecretKey ,Id, Options) ->
	Url = ?PageUrl ++ "/" ++ Id,
	BodyMap = #{},
	utils:put(SecretKey, Url, BodyMap, Options).

check_slug_availability(SecretKey, Slug) ->
	Url = ?PageUrl ++ "/" ++ "check_slug_availability" ++ "/" ++  Slug,
	utils:get(SecretKey, Url, []).

%%Subaccounts API

create_subaccount(SecretKey, BusinessName, SettlementBank, AccountNumber, PercentageCharge, Options) ->
	Url = ?SubaccountUrl,
	BodyMap = #{<<"business_name">> => list_to_binary(BusinessName), <<"settlement_bank">> => SettlementBank, <<"account_number">> => list_to_binary(AccountNumber), <<"percentage_charge">> => list_to_binary(PercentageCharge)},
	utils:post(SecretKey, Url, BodyMap, Options).

list_subaccounts(SecretKey, QueryOptions) ->
	Url = ?SubaccountUrl,
	utils:get(SecretKey, Url, QueryOptions). 

fetch_subaccount(SecretKey, Id) ->
	Url = ?SubaccountUrl ++ "/" ++ Id,
	utils:get(SecretKey, Url, []).

update_subaccount(SecretKey ,Id, Options) ->
	Url = ?SubaccountUrl ++ "/" ++ Id,
	BodyMap = #{},
	utils:put(SecretKey, Url, BodyMap, Options).

list_banks(SecretKey, QueryOptions) ->
	Url = ?BankUrl,
	utils:get(SecretKey, Url, QueryOptions). 

%%Settlements API

fetch_settlements(SecretKey, QueryOptions) ->
	Url = ?SettlementUrl,
	utils:get(SecretKey, Url, QueryOptions).

%% Miscellaneous API

resolve_card_bin(SecretKey, Bin) ->
	Url = ?BinUrl ++ "/" ++ Bin,
	utils:get(SecretKey, Url, []).




