class Dictionary
  constructor: (@values = {})->

  store: (name, value) ->
    @values[name] = value

  lookup: (name) ->
    @values[name]

  contains: (name) ->
    Object::hasOwnProperty.call(@values, name) and
    Object::propertyIsEnumerable.call(@values, name)

  each: (action) ->
    for own property, value of @values
      action property, value

colours = new Dictionary
  Grover: 'blue'
  Elmo: 'orange'
  Bert: 'yellow'

console.log colours.contains 'Glover'
colours.each  (name, colour) ->
  console.log "#{name} is #{colour}."
