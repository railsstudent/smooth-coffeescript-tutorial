# Functional Programming Chapter
xxx = [4...20]

for i in xxx by 3
  console.log i

forEach = (array, action) ->
  action element for element in array

plusTen = (num) ->
  num += 10
  console.log num

forEach [1..10], console.log
forEach [1..10], plusTen
forEach ['Wampeter', 'Foma', 'Granfalloon'], console.log
