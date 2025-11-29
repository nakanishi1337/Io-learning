Builder := Object clone
Builder indentLevel := 0          // ネストの深さを記録
Builder indent := method("  " repeated(indentLevel))

Builder forward := method(
    // <tag> の前にインデントをつける
    writeln(indent, "<", call message name, ">")

    // 中身の処理：ネストを1段深くする
    self indentLevel = self indentLevel + 1

    call message arguments foreach(
        arg,
        content := self doMessage(arg)
        if(content type == "Sequence",
            writeln(indent, content)
        )
    )

    // 閉じタグを書くのでインデントレベルを戻す
    self indentLevel = self indentLevel - 1
    writeln(indent, "</", call message name, ">")
)

Builder ul(
    li("Item 1"),
    li("Item 2"),
    li("Item 3")
)