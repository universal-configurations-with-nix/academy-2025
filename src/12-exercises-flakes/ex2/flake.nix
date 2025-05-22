{
  inputs = {
    ex1.url = "path:../ex1";
  };
  outputs = inputs: {
    columns = let
        fileRows = filepath:
          builtins.filter
            (x: ! builtins.isList x)
            (builtins.split
              "\n"
              (builtins.readFile filepath));

        removeColumns = row: start: end:
          inputs.ex1.columns row start end;

        combineFileRows = fileRows:
          builtins.concatStringsSep "\n" fileRows;
      in
        filepath: start: end:
          combineFileRows
            (builtins.map
              (row: removeColumns row start end)
              (fileRows filepath));
  };
}
