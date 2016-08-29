cat =
  color : 'grey',
  name : 'Spot',
  size : 46

console.log(cat)

cat.size = 47
console.log(cat)

delete cat.size
console.log(cat)

empty = {}
empty.notReally = 1000

console.log(empty.notReally)
console.log(empty)

thing = { 'gabba gabba' : 'hey', '5' : 10 }
console.log(thing)
console.log(thing['5'])

thing['5'] = 20
console.log(thing[2+3])

delete thing['gabba gabba']
console.log(thing)

#The operator of can be used to test whether an object has a certain property.
#It produces a boolean.
chineseBox = {}
chineseBox.content = chineseBox
console.log('content' of chineseBox)
console.log('content' of chineseBox.content)
console.log(chineseBox)

range = (num) ->
  if num <= 0 then []
  else
    arr = []
    for current in [0..num]
      arr[current] = current
    arr

console.log(range 0)
console.log(range 10)
console.log(range -1)
console.log(range 4)

mailArchive = ['mail one', 'mail two', 'mail three']
for current in [0...mailArchive.length]
  console.log("Processing e-mail ##{current}: " + mailArchive[current])

# array
mack = []
mack.push 'Mack'
mack.push 'the'
mack.push 'Knife'
console.log (mack.join ' ')
console.log(mack.pop())
console.log(mack)

a = ['A B', 'C', 'D']
console.log(a.join(' '))
console.log(a.join(' ').split(' '))
