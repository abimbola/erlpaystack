-module (utils).
-export ([generateMap/2]).

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