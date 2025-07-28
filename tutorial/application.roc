app [main!] { pf: platform "https://github.com/roc-lang/basic-cli/releases/download/0.19.0/Hj-J_zxz7V9YurCSTFcFdu6cQJie4guzsPMUi5kBYUk.tar.br" }

import pf.Stdout

birds = 3

iguanas = 2

Table : {
    height : U64,
    width : U64,
    title : Str,
    description : Str,
}

total = Num.to_str(birds + iguanas)

table : { height : U64, width : U64, title ?? Str, description ?? Str } -> Table
table = |{ height, width, title ?? "oak", description ?? "a wooden table" }| {
    title: title,
    description: description,
    height: height,
    width: width,
}

print_table! : Table => Result {} _
print_table! = |tbl|
    height_str = Num.to_str tbl.height
    width_str = Num.to_str tbl.width
    Stdout.line!("title: ${tbl.title}")?
    Stdout.line!("description: ${tbl.description}")?
    Stdout.line!("height: ${height_str}")?
    Stdout.line!("width: ${width_str}")?
    Ok {}

main! = |_args|
    Stdout.line!("There are ${total} animals.")?
    Stdout.line!("Hi there, from inside a Roc app. 🎉")?
    tbl = table { height: 10, width: 20, title: "yoooo" }
    print_table!(tbl)
