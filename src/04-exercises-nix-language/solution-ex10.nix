let
  inherit (builtins) mapAttrs foldl';

  isContainer = val: builtins.isAttrs val || builtins.isList val;

  mergeValues = a: b:
    if builtins.typeOf a != builtins.typeOf b || ! isContainer a then
      [ a b ]
    else if builtins.isList a then
      a ++ b
    else
      deepUpdate a b;

  deepUpdate = attrset1: attrset2:
    attrset1 //
      (mapAttrs
        (name: value:
          if attrset1 ? ${name} then
            mergeValues attrset1.${name} attrset2.${name}
          else
            value)
        attrset2);
in
  foldl'
    (acc: attrset: deepUpdate acc attrset)
    { }
