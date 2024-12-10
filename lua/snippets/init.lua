local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

local to = s("to", {
	i(1, "cond"),
	t(" ? "),
	i(2, "then"),
	t(" : "),
	i(3, "else"),
})

local csharp = {
	to,
	s("pp", {
		i(1, "public"),
		t(" "),
		i(2, "string"),
		t(" "),
		i(3, "Name"),
		t(" { get; set; }"),
	}),
}

local js_ts = {
	s("cl", fmt("console.log({})", { i(1) })),
	s("map", {
		t("map("),
		i(1, "item"),
		t(" => {"),
		i(2),
		t("})"),
	}),
	to,
}

ls.add_snippets("javascript", js_ts)
ls.add_snippets("typescript", js_ts)
ls.add_snippets("cs", csharp)
