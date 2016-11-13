%%@hidden
-module (utils).
-export ([generateMap/2, post/4, put/4, get/3, generateQueryStr/2]).

generateMap(InitMap, []) -> InitMap;

generateMap(InitMap, OptList) ->
	[Opt|RemList] = OptList,
	{Key, Value} = Opt,
	MKey = list_to_binary(Key),
	StrBool = is_list(Value),
	if
		StrBool ->
			MValue = list_to_binary(Value);
		true -> 
			MValue = Value
	end,
	UpdatedMap = InitMap#{MKey => MValue},
	generateMap(UpdatedMap, RemList).

post(SecretKey, Url, BodyMap, Options) ->
	CompleteBodyMap = utils:generateMap(BodyMap, Options),
	BodyStr = binary_to_list(jsx:encode(CompleteBodyMap)),
	httpc_wrapper:postUrl(SecretKey, Url, BodyStr).	

put(SecretKey, Url, BodyMap, Options) ->
	CompleteBodyMap = utils:generateMap(BodyMap, Options),
	BodyStr = binary_to_list(jsx:encode(CompleteBodyMap)),
	httpc_wrapper:putUrl(SecretKey, Url, BodyStr).	

get(SecretKey, Url, Options) ->
	QueryUrl = Url ++ utils:generateQueryStr([], Options),
	httpc_wrapper:getUrl(SecretKey, QueryUrl).

generateQueryStr(InitStr,[]) ->
	InitStr;

generateQueryStr([], OptList) ->
	[Opt|RemList] = OptList,
	{Key, Value} = Opt,
	IntValueBool = is_integer(Value),
	BoolValueBool = is_boolean(Value),
	if
		BoolValueBool ->
			if
				Value ->
					NValue = "true";
				true ->
					NValue = "false"
			end;
		IntValueBool ->
			NValue = integer_to_list(Value);
		true ->
			NValue = Value
	end,
	UpdatedStr = "?" ++ Key ++ "=" ++ NValue,
	generateQueryStr(UpdatedStr, RemList);

generateQueryStr(InitStr,OptList) ->
	[Opt|RemList] = OptList,
	{Key, Value} = Opt,
	IntValueBool = is_integer(Value),
	BoolValueBool = is_boolean(Value),
	if
		BoolValueBool ->
			if
				Value ->
					NValue = "true";
				true ->
					NValue = "false"
			end;
		IntValueBool ->
			NValue = integer_to_list(Value);
		true ->
			NValue = Value
	end,
	UpdatedStr = InitStr ++ "&" ++ Key ++ "=" ++ NValue,
	generateQueryStr(UpdatedStr, RemList).
