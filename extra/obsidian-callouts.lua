function BlockQuote(el)
    local first = el.content[1]

    if not first or first.t ~= "Para" then
        return nil
    end

    local text = pandoc.utils.stringify(first)
    local callout_type, title_text =
        text:match("^%[!([%w%-_]+)%]%s*(.*)$")

    if not callout_type then
        return nil
    end

    table.remove(el.content, 1)

    callout_type = callout_type:lower()

    local title
    if title_text == "" then
        title = { pandoc.Str(callout_type:gsub("^%l", string.upper)) }
    else
        local raw = first.content
        table.remove(raw, 1) -- remove "[!INFO]"

        if raw[1] and raw[1].t == "Space" then
            table.remove(raw, 1)
        end

        title = raw
    end

    return pandoc.Div({
        pandoc.Div({
            pandoc.Para(title),
        }, { class = "callout-title" }),

        pandoc.Div(el.content, {
            class = "callout-content",
        }),
    }, {
        class = "callout callout-" .. callout_type,
    })
end
