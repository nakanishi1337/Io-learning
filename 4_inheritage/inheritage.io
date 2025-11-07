# Objectはルートレベルのオブジェクト
Object type println

# Vehicle のタイプは「Objectをプロトタイプに持つオブジェクト」
Vehicle := Object clone
Vehicle description := "Something that moves people or goods from one place to another"
Vehicle slotNames println
Vehicle type println

# Car のタイプは「Vehicleをプロトタイプに持つオブジェクト」
Car := Vehicle clone
Car slotNames println
Car type println
Vehicle description println # Vehicleのdescriptionスロットを継承している

# ferrari は「Carをプロトタイプにもつインスタンス」
ferrari := Car clone
ferrari slotNames println # typeスロットはインスタンスには存在しない
ferrari type println
ferrari description ::= "A fast sports car" # Carのdescriptionスロットをオーバーライド
ferrari description println