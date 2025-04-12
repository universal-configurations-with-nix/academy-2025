attrset:
  # Внимателно с оператор ==
  # Списъци и атрибутни множества се проверяват рекурсивно
  # Сравнение с функции винаги връща false
  if attrset == { } then
    null
  else
    attrset.${builtins.head (builtins.attrNames attrset)}
    # напълно еквивалентна алтернатива на горния израз е
    # builtins.getAttr (builtins.head (builtins.attrNames attrset)) attrset
