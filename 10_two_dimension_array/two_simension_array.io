// two dimension array sum
array2d := list(
    list(1, 2, 3),
    list(4, 5, 6),
    list(7, 8, 9)
)

sum := 0
array2d foreach(row,
    row foreach(element,
        sum = sum + element
    )
)
"2D Array Sum: " print
sum println


// リストの数値の平均算出スロット
List average := method(
    sum := 0
    self foreach(element,
        sum = sum + element
    )
    return sum / self size
)
list(10, 20, 30) average println


// 2次元リストのプロトタイプ
// dim(x,y)は要素数がx, yのリスト割り当て 
List dim := method(x, y,
    result := list()
    x repeat(
        row := list()
        y repeat(
            row append(0)
        )
        result append(row)
    )
    return result
)
matrix := list dim(3, 3)
matrix println

// set (x,y,value)
List set := method(x, y, value,
    self at(x) atPut(y, value)
)
matrix set(0, 1, 32)
matrix set(1, 1, 42)
matrix println

// get (x,y)
List get := method(x, y,
    return self at(x) at(y)
)
matrix get(1, 1) println

// 転置 (transpose)
List transpose := method(
    rows := self size
    cols := self at(0) size
    new_matrix := list dim(cols, rows)
    
    rows repeat(x,
        cols repeat(y,
            new_matrix set(y, x, self get(x, y))
        )
    )
    return new_matrix
)
transposed := matrix transpose
transposed println

// 行列をファイルに書き出し
List writeToFile := method(filename,
    file := File with(filename)
    file remove
    file openForAppending
    self foreach(row,
        line := ""
        row foreach(element,
            line = line .. element asString .. " "
        )
        file write(line .. "\n")
    )
    file close
    ("Matrix written to " .. filename) println
)

// ファイルに書き出し
matrix writeToFile("matrix.txt")

// ファイルから読み込み
List readFromFile := method(filename,
    file := File with(filename)
    file openForReading
    result := list()
    file foreachLine(line,
        row := list()
        line split(" ") foreach(element,
            if(element != "",
                row append(element asNumber)
            )
        )
        if(row size > 0,
            result append(row)
        )
    )
    file close
    return result
)

loaded_matrix := list readFromFile("matrix.txt")
"Loaded Matrix: " print
loaded_matrix println