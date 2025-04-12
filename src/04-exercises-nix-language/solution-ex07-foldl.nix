let
  inherit (builtins) length head tail foldl';

  second = list: head (tail list);

  clumpElements = list:
    if length list < 2 then
      [ ]
    else
      [ [ (head list) (second list) ] ] ++ clumpElements (tail (tail list));

  genAttrset = list:
    foldl'
      (acc: elem: acc // { ${head elem} = second elem; })
      { }
      (clumpElements list);
in
  genAttrset
