# 本来存在しないメソッドは親に渡す
# それを行うのがforwardメソッドであるが、それを上書きする
# ul, liのようなメソッドは存在しないため、独自のforwardメソッドで処理される

Builder := Object clone

Builder forward := method(
    writeln("<", call message name, ">")
    call message arguments foreach(
        arg,
        content := self doMessage(arg);
        if(content type == "Sequence", writeln(content))
    )
    writeln("</", call message name, ">")
)

Builder ul(
    li("Item 1"),
    li("Item 2"),
    li("Item 3")
)