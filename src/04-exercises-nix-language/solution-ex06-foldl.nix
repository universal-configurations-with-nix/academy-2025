strings:
  let
    # Праввим това за удобство при добре познатите ни функции
    inherit (builtins) foldl' substring;

    # В Nix не съществува оператор за модулно деление (деление с остатък)
    # Нито пък се намира функция в builtins
    # В nixpkgs има такава, но нас повече ни интересува дали числото е четно,
    # затова можем да изплзваме нещо по-просто.
    even = num: builtins.bitAnd num 1 == 0; # еквивалентно на (builtins.floor (num / 2) * 2) == num

    startsWithB = x: substring 0 1 x == "B";

    validElemList = i: string: if even i && startsWithB string then [ string ] else [ ];

    final = foldl'
      ({ i, result }: string: { i = i + 1; result = result ++ (validElemList i string); })
      { i = 0; result = []; }
      strings;
  in
    final.result
