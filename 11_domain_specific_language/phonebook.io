# := のような独自の代入演算子 : を作る
# 内容はatPutNumberメソッドを呼び出す
OperatorTable addAssignOperator(":", "atPutNumber")

// {...}はcurlyBracketsのシンタックスシュガー
// r doMassage(arg)はr atPutNumber("Alice", "123-4567")のようになる
curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg,
            arg println 
            r doMessage(arg)
        )
    r
)

// self atPutで自身のMapに値を格納する
Map atPutNumber := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1))
)

// doStringは文字列をコードとして実行する組み込み関数
s := File with("phonebook.txt") openForReading contents
phoneNumbers := doString(s)
phoneNumbers keys println
phoneNumbers values println