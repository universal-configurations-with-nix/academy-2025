{
  outputs = inputs: {
    separator = ",";
    columns = let
        # "A,B,C" става [ "A" "B" "C" ]
        columns = string:
          builtins.filter
            (x: ! builtins.isList x)
            (builtins.split inputs.self.separator string); # split връща [ "A" [] "B" [] "C" ]

        # [ "A" "B" "C" ] става [ "A" "C" ] (примерно)
        removeElements = start: end: current: list:
          if list == [ ]
          then [ ]
          else
            (if start <= current && current <= end
              then []
              else [(builtins.head list)])
            ++ (removeElements start end (current + 1) (builtins.tail list));

        # [ "A" "C" ] става "A,C"
        combine = list:
          builtins.concatStringsSep inputs.self.separator list;
      in
        string: start: end:
          combine
            (removeElements
              start
              end
              1
              (columns string));
  };
}
