vizzini := Object clone
vizzini talk := method(
    "Fezzik, are there rocks ahead?" println yield
    "No more rhyme now, I mean it." println yield
)

fezzik := Object clone
fezzik rhyme := method(
    yield "If there are, we'll all be dead!" println
    yield "Any body want a peanut?" println
)

# 登録した順番にメソッドの中身がなくなるまで交互に実行される
# @を一つしかない場合はフューチャを返し、@@を二つにするとnilを返す
vizzini @@talk; fezzik @@rhyme
Coroutine currentCoroutine pause