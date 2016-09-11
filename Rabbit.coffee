class Rabbit
  constructor: (@adjective) ->
  speak: (line) ->
    console.log "The #{@adjective} rabbit says '#{line}'"


whiteRabbit = new Rabbit "white"
fatRabbit = new Rabbit "fat"

whiteRabbit.speak "Hurry!"
fatRabbit.speak "Tasty!"
