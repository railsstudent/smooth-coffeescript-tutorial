class Rabbit
  constructor: (@adjective) ->
  speak: (line) ->
    console.log "The #{@adjective} rabbit says '#{line}'"

class WeightyRabbit extends Rabbit
  constructor: (adjective, @weight) ->
    super adjective
  adjustedWeight: (relativeGravity) ->
    (@weight * relativeGravity).toPrecision 2

whiteRabbit = new Rabbit "white"
fatRabbit = new Rabbit "fat"

whiteRabbit.speak "Hurry!"
fatRabbit.speak "Tasty!"

killerRabbit = new Rabbit 'killer'
killerRabbit.speak 'GRAAAAAAAAAH!'
console.log killerRabbit


makeRabbit = (adjective) ->
  adjective : adjective
  speak: (line) -> console.log adjective + ': ' + line

blackRabbit = makeRabbit 'black'
blackRabbit.speak 'I need to take a bath!!!!'
console.log blackRabbit

console.log killerRabbit.constructor.name
console.log blackRabbit.constructor.name

tinyRabbit = new WeightyRabbit "tiny", 1.01
jumboRabbit = new WeightyRabbit "jumbo", 7.47

moonGravity = 1/6
jumboRabbit.speak "Carry me, I weigh
#{jumboRabbit.adjustedWeight(moonGravity)}"
tinyRabbit.speak "He ain't heavy, he is my brother"
