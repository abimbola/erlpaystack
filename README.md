
# erlpaystack

An Erlang implementation of PayStack Rest API

*   [Quickstart](#quickstart)
*   [Data Types](#types)
*   [Function Index](#index)
*   [Function Details](#functions)



## <a name="quickstart">Quickstart</a>

### to add to a rebar3 project
Add to `rebar.config`
```erlang
...
{erl_opts, [debug_info]}.
{deps, [
       ...
       {erlpaystack, {git, "https://github.com/abimbola/erlpaystack.git", {branch, "v1.0.1"}}}
]}.
...
```

### <a name="build">Build</a>

    $ rebar3 compile

### <a name="examples">Examples</a>

#### Ensure that dependencies are started - inets, ssl
	1> application:ensure_all_started(erlpaystack).
	{ok,[inets,crypto,asn1,public_key,ssl,erlpaystack]}

#### Intialize transaction with only mandatory parameters

	2> erlpaystack:initialize("A_Secret_Key_A_Secret_Key", 50000, "abimbola.adegun@gmail.com", []).
	{ok,#{<<"data">> => #{<<"access_code">> => <<"h5tm6epimb">>,
        <<"authorization_url">> => <<"https://paystack.com/secure/h5tm6epimb">>,
        <<"reference">> => <<"nwgxk2xvfz">>},
      	<<"message">> => <<"Authorization URL created">>,
      	<<"status">> => true}}

#### Intialize transaction with mandatory parameters and one optional parameter

	3> erlpaystack:initialize("A_Secret_Key_A_Secret_Key", 50000, "abimbola.adegun@gmail.com", 
	[{"reference", "YTUtrgwkwhsfs47596"}]).
	{ok,#{<<"data">> => #{<<"access_code">> => <<"mmww6r0qyn">>,
        <<"authorization_url">> => <<"https://paystack.com/secure/mmww6r0qyn">>,
        <<"reference">> => <<"YTUtrgwkwhsfs47596">>},
      	<<"message">> => <<"Authorization URL created">>,
      	<<"status">> => true}}

## <a name="types">Data Types</a>

### <a name="type-apioption">apioption()</a>

<tt>apioption() = {string(), string() | integer() | boolean() | #{}}</tt>

### <a name="type-apioptions">apioptions()</a>

<tt>apioptions() = [[apioption()](#type-apioption)] | []</tt>

### <a name="type-queryapioption">queryapioption()</a>

<tt>queryapioption() = {string(), string() | integer() | boolean()}</tt>

### <a name="type-queryapioptions">queryapioptions()</a>

<tt>queryapioptions() = [[queryapioption()](#type-queryapioption)] | []</tt>

## <a name="index">Function Index</a>

### <a name="transactions">Transactions</a>

| [initialize/4](#initialize-4) |
| [verify/2](#verify-2) |
| [list_transactions/2](#list_transactions-2) |
| [fetch_transaction/2](#fetch_transaction-2) |
| [charge_authorization/5](#charge_authorization-5) |
| [charge_token/3](#charge_token-3) |
| [view_transaction_timeline/2](#view_transaction_timeline-2) |
| [transaction_totals/2](#transaction_totals-2) |
| [export_transactions/2](#export_transactions-2) |

### <a name="customers">Customers</a>

| [create_customer/3](#create_customer-3) |
| [list_customers/2](#list_customers-2) |
| [fetch_customer/2](#fetch_customer-2) |
| [update_customer/3](#update_customer-3) |
| [white_black_list_customer/3](#white_black_list_customer-3) |

### <a name="plans">Plans</a>

| [create_plan/5](#create_plan-5) |
| [list_plans/2](#list_plans-2) |
| [fetch_plan/2](#fetch_plan-2) |
| [update_plan/3](#update_plan-3) |

### <a name="subscriptions">Subscriptions</a>

| [create_subscription/4](#create_subscription-4) |
| [list_subscriptions/2](#list_subscriptions-2) |
| [disable_subscription/3](#disable_subscription-3) |
| [enable_subscription/3](#enable_subscription-3) |
| [fetch_subscription/2](#fetch_subscription-2) |

### <a name="pages">Pages</a>

| [create_page/3](#create_page-3) |
| [list_pages/2](#list_pages-2) |
| [fetch_page/2](#fetch_page-2) |
| [update_page/3](#update_page-3) |
| [check_slug_availability/2](#check_slug_availability-2) |

### <a name="subaccounts">SubAccounts</a>

| [create_subaccount/6](#create_subaccount-6) |
| [list_subaccounts/2](#list_subaccounts-2) |
| [fetch_subaccount/2](#fetch_subaccount-2) |
| [update_subaccount/3](#update_subaccount-3) |
| [list_banks/2](#list_banks-2) |

### <a name="settlements">Settlements</a>

| [fetch_settlements/2](#fetch_settlements-2) |

### <a name="miscellaneous">Miscellaneous</a>

| [resolve_card_bin/2](#resolve_card_bin-2) |


## <a name="functions">Function Details</a>

### <a name="charge_authorization-5">charge_authorization/5</a>

<div class="spec">

<tt>charge_authorization(SecretKey::string(), AuthorizationCode::string(), Amount::integer(), Email::string(), Options::apioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="charge_token-3">charge_token/3</a>

<div class="spec">

<tt>charge_token(SecretKey::string(), Token::string(), Options::apioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="check_slug_availability-2">check_slug_availability/2</a>

<div class="spec">

<tt>check_slug_availability(SecretKey::string(), Slug::string()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="create_customer-3">create_customer/3</a>

<div class="spec">

<tt>create_customer(SecretKey::string(), Email::string(), Options::apioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="create_page-3">create_page/3</a>

<div class="spec">

<tt>create_page(SecretKey::string(), Name::string(), Options::apioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="create_plan-5">create_plan/5</a>

<div class="spec">

<tt>create_plan(SecretKey::string(), Name::string(), Amount::integer(), Interval::string(), Options::apioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="create_subaccount-6">create_subaccount/6</a>

<div class="spec">

<tt>create_subaccount(SecretKey::string(), BusinessName::string(), SettlementBank::string(), AccountNumber::string(), PercentageCharge::string(), Options::apioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="create_subscription-4">create_subscription/4</a>

<div class="spec">

<tt>create_subscription(SecretKey::string(), Customer::string(), Plan::string(), Options::apioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="disable_subscription-3">disable_subscription/3</a>

<div class="spec">

<tt>disable_subscription(SecretKey::string(), Code::string(), Token::string()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="enable_subscription-3">enable_subscription/3</a>

<div class="spec">

<tt>enable_subscription(SecretKey::string(), Code::string(), Token::string()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="export_transactions-2">export_transactions/2</a>

<div class="spec">

<tt>export_transactions(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="fetch_customer-2">fetch_customer/2</a>

<div class="spec">

<tt>fetch_customer(SecretKey::string(), IdOrCode::string()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="fetch_page-2">fetch_page/2</a>

<div class="spec">

<tt>fetch_page(SecretKey::string(), IdOrSlug::string()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="fetch_plan-2">fetch_plan/2</a>

<div class="spec">

<tt>fetch_plan(SecretKey::string(), IdOrCode::string()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="fetch_settlements-2">fetch_settlements/2</a>

<div class="spec">

<tt>fetch_settlements(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="fetch_subaccount-2">fetch_subaccount/2</a>

<div class="spec">

<tt>fetch_subaccount(SecretKey::string(), IdOrSlug::string()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="fetch_subscription-2">fetch_subscription/2</a>

<div class="spec">

<tt>fetch_subscription(SecretKey::string(), IdOrCode::string()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="fetch_transaction-2">fetch_transaction/2</a>

<div class="spec">

<tt>fetch_transaction(SecretKey::string(), Id::integer()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="initialize-4">initialize/4</a>

<div class="spec">

<tt>initialize(SecretKey::string(), Amount::integer(), Email::string(), Options::apioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="list_banks-2">list_banks/2</a>

<div class="spec">

<tt>list_banks(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="list_customers-2">list_customers/2</a>

<div class="spec">

<tt>list_customers(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="list_pages-2">list_pages/2</a>

<div class="spec">

<tt>list_pages(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="list_plans-2">list_plans/2</a>

<div class="spec">

<tt>list_plans(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="list_subaccounts-2">list_subaccounts/2</a>

<div class="spec">

<tt>list_subaccounts(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="list_subscriptions-2">list_subscriptions/2</a>

<div class="spec">

<tt>list_subscriptions(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="list_transactions-2">list_transactions/2</a>

<div class="spec">

<tt>list_transactions(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="resolve_card_bin-2">resolve_card_bin/2</a>

<div class="spec">

<tt>resolve_card_bin(SecretKey::string(), Bin::string()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="transaction_totals-2">transaction_totals/2</a>

<div class="spec">

<tt>transaction_totals(SecretKey::string(), QueryOptions::queryapioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="update_customer-3">update_customer/3</a>

<div class="spec">

<tt>update_customer(SecretKey::string(), IdOrCode::string(), Options::apioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="update_page-3">update_page/3</a>

<div class="spec">

<tt>update_page(SecretKey::string(), IdOrSlug::string(), Options::apioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="update_plan-3">update_plan/3</a>

<div class="spec">

<tt>update_plan(SecretKey::string(), IdOrCode::string(), Options::apioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="update_subaccount-3">update_subaccount/3</a>

<div class="spec">

<tt>update_subaccount(SecretKey::string(), IdOrSlug::string(), Options::apioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="verify-2">verify/2</a>

<div class="spec">

<tt>verify(SecretKey::string(), Reference::string()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="view_transaction_timeline-2">view_transaction_timeline/2</a>

<div class="spec">

<tt>view_transaction_timeline(SecretKey::string(), IdOrReference::string()) -> {ok, #{}} | {error, term()}</tt>

</div>

### <a name="white_black_list_customer-3">white_black_list_customer/3</a>

<div class="spec">

<tt>white_black_list_customer(SecretKey::string(), Customer::string(), Options::apioptions()) -> {ok, #{}} | {error, term()}</tt>

</div>
