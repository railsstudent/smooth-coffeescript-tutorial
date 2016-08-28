#if not -> unless
fun = on
console.log('The show is on !') unless fun is off

current = 20
current++ until current % 7 is 0
console.log(current)


luckyNumber = Math.floor Math.random() * 6 + 1
console.log('Lucky number: ' + luckyNumber)
numRolls = 0
loop
  rollANum = Math.floor Math.random() * 6 + 1
  console.log('Roll: ' + rollANum)
  numRolls++
  if luckyNumber is rollANum then break
console.log('number of rolls: ' + numRolls)
