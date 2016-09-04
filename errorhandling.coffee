# Error Handling Chapter
between = (string, start, end) ->
  startAt = string.indexOf start
  if startAt is -1 then return
  startAt += start.length
  endAt = string.indexOf end, startAt
  if endAt is -1 then return
  string[startAt...endAt]

console.log(between 'bu ] boo [ bah ] gzz', '[ ', ' ]')
console.log(between 'bu [ boo bah gzz', '[ ', ' ]')

lastElement = (array) ->
  if array.length > 0
    array[array.length - 1]
  else
    throw new Error('Cannot take the last element of an empty array')

lastElementPlusTen = (array) ->
  lastElement(array) + 10

console.log (lastElementPlusTen [1..5])

lastElementPlusNumber = (array) ->
  (num) -> lastElement(array) + num

try
  console.log ( (lastElementPlusNumber [1..20]) 102)
catch error
  console.log 'Something went wrong: ' + error
