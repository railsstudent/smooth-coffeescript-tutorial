absolute = (num) ->
  if num < 0 then -num
  else num

console.log(absolute -3.5)
console.log(absolute 0)
console.log(absolute 3.5)

yell = (message) ->
  return message + '!!'

console.log(yell 'Yow')
