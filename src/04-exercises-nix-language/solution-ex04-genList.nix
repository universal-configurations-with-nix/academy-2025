x:
  let
    sum = array:
      if array == [] then
        0
      else
        (builtins.head array) + sum (builtins.tail array);
  in
    if x <= 1 then
      null
    else
      # genList приема функция и дължина
      # Един вид, създава списък със стойности [ 0 1 ... (дължина - 1) ]
      # и заменя всяка стойност с резултатът от функцията, като ѝ е подадена
      # сегашната стойност от списъка (map операция).
      #
      # Пример:
      # builtins.genList (i: i * 10) 5)
      #
      # Прави нещо като
      #
      # array = [ 0 1 2 3 4 ]
      # func = i: i * 10
      # елемент на индекс 0 = func (elemAt array 0)  # което е 0 * 10 = 0
      # елемент на индекс 1 = func (elemAt array 1)  # което е 1 * 10 = 10
      # елемент на индекс 2 = func (elemAt array 2)  # което е 2 * 10 = 20
      # елемент на индекс 3 = func (elemAt array 3)  # което е 3 * 10 = 30
      # елемент на индекс 4 = func (elemAt array 4)  # което е 4 * 10 = 40

      # Тук, извикването на genList ще върне списъка
      # [ 1 2 3 ... x ]
      sum (builtins.genList (i: i + 1) x)
