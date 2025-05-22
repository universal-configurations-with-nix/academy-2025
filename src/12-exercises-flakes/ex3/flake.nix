{
  inputs = {
    # Това добавя ex1 директно:
    # ex1.url = "path:../ex1";
    # Но това позволява да използваме версията на ex1, дефинирана в ex2:
    ex1.follows = "ex2/ex1";
    ex2.url = "path:../ex2";
  };
  outputs = inputs: {
    columns = arg: start: end:
      if builtins.isString arg
      then inputs.ex1.columns arg start end
      else inputs.ex2.columns arg start end;
  };
}
