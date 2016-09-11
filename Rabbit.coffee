class Rabbit
  constructor: (@adjective) ->
  speak: (line) ->
    console.log "The #{@adjective} rabbit says '#{line}'"


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
