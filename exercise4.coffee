#for number in [0..12] by 2 then show number
#for number in [0..12] by 2
#   show number
#show number for number in [0..12] by 2

myPow2 = (base, exp) ->
  ans = 1
  for i in [0...exp] then ans *= base
  return ans

console.log(myPow2(2, 0))
console.log(myPow2(2, 5))
console.log(myPow2(2, 10))

drawTriangle2 = (numLine, ch) ->
  strTriangle = ''
  strLineStr = ''
  for line in [1..numLine]
    strLineStr += ch
    if line > 1 then strTriangle += '\n'
    strTriangle += strLineStr
  return strTriangle

console.log(drawTriangle2(5, '-'))
console.log(drawTriangle2(3, '*'))
console.log(drawTriangle2(10, '#'))
