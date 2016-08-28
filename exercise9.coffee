makeAddFunction = (amount) ->
  add = (number) -> amount + number

# return a function x -> x + 2
addTwo = makeAddFunction 2
addFive = makeAddFunction 5

console.log (addTwo 1 + addFive 1)

findSequence = (goal) ->
  find = (start, history) ->
    if start is goal
      history
    else if start > goal
      null
    else
      #The use of the existential ? operator in the example can be read as
      #‘return the solution found by adding 5 to start, and if that fails,
      #return the solution found by multiplying start by 3’.
      find(start + 5, '(' + history + ' + 5)') ? \
      find(start * 3, '(' + history + ' * 3)')
  find 1, '1'

console.log(findSequence 24)

makeAddFunction2 = (amount) ->
  (number) -> number + amount

console.log(makeAddFunction2(11) 3)

greaterThan = (num1) ->
  (num2) -> num2 > num1

console.log(greaterThan(10) 10)
console.log(greaterThan(10) 8)
console.log(greaterThan(10) 12)
