# Нямаме оператор "деление с остатък", нито пък има такава функция в builtins
# Тази функция се намира в nixpkgs
# Казали сме, че не може да се използва nixpkgs, но това не забранява функции да се пренапишат
#
# Също в този случай, деление с остатък на две е естественото решение на процедурни езици,
# като C++, Java, ...
# Ако сравните с другите решения на тази задача, ще видите, че във функционалното програмиране
# друг вид мислене/идеи са нужни за ползотворно програмиране.
strings:
  let
    # Праввим това за удобство при добре познатите ни функции
    inherit (builtins) substring genList elemAt length;

    # В Nix не съществува оператор за модулно деление (деление с остатък)
    # Нито пък се намира функция в builtins
    # В nixpkgs има такава, но нас повече ни интересува дали числото е четно,
    # затова можем да изплзваме нещо по-просто.
    even = num: builtins.bitAnd num 1 == 0; # еквивалентно на (builtins.floor (num / 2) * 2) == num

    startsWithB = x: substring 0 1 x == "B";

    # Превръща списъка
    # [ "a" "b" "c" ]
    # в
    # [ { string = "a"; i = 0; } { string = "b"; i = 1; } { string = "c"; i = 2; } ]
    elementsWithIndecies = genList
      (i: { string = elemAt strings i; inherit i; })
      (length strings);

    validElements = builtins.filter
      ({ string, i }: (even i) && (startsWithB string))
      elementsWithIndecies;
  in
    # Връща списък с всички стойности под атрибут, от всички атрибутни множества в подадения списък
    # Превръща списъка
    # [ { string = "a"; i = 0; } { string = "b"; i = 1; } { string = "c"; i = 2; } ]
    # в
    # [ "a" "b" "c" ]
    builtins.catAttrs "string" validElements
