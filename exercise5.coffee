for counter in [0..20]
  if counter % 4 is 0
    console.log(counter)
  else
    console.log('(' + counter + ')')

for counter in [0..20]
  if counter > 15 then console.log(counter + '**')
  else if counter > 10 then console.log(counter + '*')
  else console.log(counter)

answer = prompt 'what is 2+2?'
intAnswer = parseInt(answer)
if intAnswer is 4
  alert 'you are correct'
else if intAnswer is 3 or intAnswer is 5
  alert 'Almost!'
else
  alert 'You cannot do math, stupid!'
