console.log("2 + 2 gives #{2+2}")

currentNumber = 0
while currentNumber <= 12
  console.log(currentNumber)
  currentNumber += 2


counter = 0
while counter <= 12 then counter += 2
console.log(counter)


myPow = (base, exp) ->
  counter = 0
  ans = 1
  while counter < exp
    ans *= base
    counter += 1
  return ans

console.log(myPow(2, 0))
console.log(myPow(2, 5))
console.log(myPow(2, 10))

drawTriangle = (numLine, ch) ->
  strTriangle = ''
  strLineStr = ''
  counter = 0
  while counter < numLine
    if counter > 0
      strTriangle = strTriangle + '\n'
    strLineStr = strLineStr + ch
    strTriangle = strTriangle + strLineStr
    counter += 1
  return strTriangle

console.log(drawTriangle(10, '#'))
console.log(drawTriangle(3, '*'))
