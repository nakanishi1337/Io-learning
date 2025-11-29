OperatorTable addOperator("[]", 1)

List squareBrackets := method(
    l := List clone
    call message arguments foreach(arg,
        l append(self doMessage(arg))
    )
    l
)

List [1, 2, 3, "hello"] println
