local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node
local f = ls.function_node

-- Função auxiliar para criar snippets de docstring
local function docstring(args)
    return fmt([[
    """
    {}

    Args:
        {}

    Returns:
        {}
    """
    ]], { i(1, "Description"), i(2, "args"), i(3, "return value") })
end

-- Snippets para Python
ls.add_snippets("python", {
    -- Funções
    s("def", fmt([[
    def {}({}):
        {}
    ]], { i(1, "name"), i(2, "params"), i(3, "pass") })),

    s("defd", fmt([[
    def {}({}):
        """
        {}

        Args:
            {}

        Returns:
            {}
        """
        {}
    ]], { 
        i(1, "name"), 
        i(2, "params"), 
        i(3, "Description"),
        i(4, "args"),
        i(5, "return value"),
        i(6, "pass") 
    })),

    -- Classes
    s("class", fmt([[
    class {}:
        def __init__(self{}):
            {}
    ]], { i(1, "ClassName"), i(2, ", params"), i(3, "self.var = var") })),

    -- Testes
    s("test", fmt([[
    def test_{}():
        # Arrange
        {}
        
        # Act
        {}
        
        # Assert
        {}
    ]], { i(1, "function_name"), i(2), i(3), i(4) })),

    -- Imports comuns
    s("imp", fmt("import {}", { i(1) })),
    s("impf", fmt("from {} import {}", { i(1), i(2) })),
    
    -- Estruturas de controle
    s("ifmain", fmt([[
    if __name__ == '__main__':
        {}
    ]], { i(1, "main()") })),

    s("for", fmt([[
    for {} in {}:
        {}
    ]], { i(1, "item"), i(2, "items"), i(3, "pass") })),

    s("while", fmt([[
    while {}:
        {}
    ]], { i(1, "condition"), i(2, "pass") })),

    -- Try/Except
    s("try", fmt([[
    try:
        {}
    except {} as {}:
        {}
    ]], { i(1), i(2, "Exception"), i(3, "e"), i(4, "pass") })),

    -- Context Manager
    s("with", fmt([[
    with {} as {}:
        {}
    ]], { i(1), i(2), i(3, "pass") })),
})

-- Definir snippets JavaScript/TypeScript
local js_ts_snippets = {
    -- Funções
    s("func", fmt([[
    function {}({}) {{
        {}
    }}
    ]], { i(1, "name"), i(2, "params"), i(3, "// code") })),

    s("arrow", fmt([[
    const {} = ({}) => {{
        {}
    }}
    ]], { i(1, "name"), i(2, "params"), i(3, "// code") })),

    -- Console logs
    s("cl", fmt("console.log({});", { i(1, "value") })),
    s("ce", fmt("console.error({});", { i(1, "error") })),
    s("cw", fmt("console.warn({});", { i(1, "warning") })),

    -- Async/Await
    s("async", fmt([[
    async function {}({}) {{
        {}
    }}
    ]], { i(1, "name"), i(2, "params"), i(3, "// code") })),

    s("await", fmt("const {} = await {};", { i(1, "result"), i(2, "promise") })),

    -- Try/Catch
    s("try", fmt([[
    try {{
        {}
    }} catch ({} as {}) {{
        {}
    }}
    ]], { i(1), i(2, "error"), i(3, "Error"), i(4, "// handle error") })),

    -- React Components
    s("rfc", fmt([[
    import React from 'react';

    interface {}Props {{
        {}
    }}

    export const {}: React.FC<{}Props> = ({}) => {{
        return (
            <div>
                {}
            </div>
        );
    }};
    ]], { 
        i(1, "ComponentName"),
        i(2, "// props"),
        f(function(args) return args[1][1] end, {1}),
        f(function(args) return args[1][1] end, {1}),
        i(3, "// props destructuring"),
        i(4, "// content")
    })),

    -- React Hooks
    s("use", fmt([[
    const [{}, set{}] = useState({});
    ]], { 
        i(1, "state"),
        f(function(args) 
            return args[1][1]:gsub("^%l", string.upper)
        end, {1}),
        i(2, "initialValue")
    })),

    s("useEffect", fmt([[
    useEffect(() => {{
        {}
        return () => {{
            {}
        }};
    }}, [{}]);
    ]], { i(1, "// effect"), i(2, "// cleanup"), i(3, "dependencies") })),

    -- Jest Tests
    s("test", fmt([[
    describe('{}', () => {{
        it('should {}', () => {{
            // Arrange
            {}
            
            // Act
            {}
            
            // Assert
            {}
        }});
    }});
    ]], { i(1, "component/function"), i(2, "do something"), i(3), i(4), i(5) })),
}

-- Adicionar snippets para JavaScript e TypeScript
ls.add_snippets("javascript", js_ts_snippets)
ls.add_snippets("typescript", js_ts_snippets)

-- Configuração do LuaSnip
ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
}) 