# Числата от 1 до x образуват аритметична прогресия
# Припомняме от основно училище, аритметична прогресия се нарича редицата числа
# a1, a2, a3, ..., an
# Такива, че a2 - a1 = a3 - a2 = ... = d
#
# Имаме формулата за общия член:
# an = a1 + (n - 1) * d
# Имаме и формулата за сума на членове от a1 до an:
# Sn = a1 + a2 + ... + an = n * (a1 + an)/2 = n * (2 * a1 + (n - 1) * d) / 2
#
# В нашия случай, d = 1, n = x и a1 = 1
# Формулата за сума се свежда до:
# Sn = x * (1 + x) / 2
x: if x <= 1 then null else x * (1 + x) / 2
