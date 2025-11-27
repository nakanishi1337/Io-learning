// メッセージのメタ情報の扱い方

// postOffice オブジェクトを作成
postOffice := Object clone

// メソッド: call sender を使って、このメソッドを呼び出したオブジェクトを取得
postOffice packageSender := method(call sender)

// mailer オブジェクトを作成
mailer := Object clone

// メソッド: postOffice の packageSender メソッドを呼び出す
// packageSender は mailer を送り主として認識する
mailer deliver := method(postOffice packageSender)

// mailer deliver を実行 → mailer オブジェクト自体を返す（call sender）
mailer deliver println

// ===== メッセージのターゲット（メソッド定義元）を取得 =====

// メソッド: call target を使って、このメソッドが定義されたオブジェクトを取得
postOffice messageTarget := method(call target)

// postOffice messageTarget を実行 → postOffice オブジェクト自体を返す（call target）
postOffice messageTarget println

// ===== メッセージの引数と名前を取得 =====

// メソッド: call message arguments を使って、渡された引数をリストで取得
postOffice messageArgs := method(call message arguments)

// メソッド: call message name を使って、メソッド名を取得
postOffice messageName := method(call message name)

// messageArgs を 3 つの引数で呼び出す → list("one", 2, :three) を返す
postOffice messageArgs("one", 2, :three) println

// messageName を呼び出す → "messageName" という文字列を返す
postOffice messageName println