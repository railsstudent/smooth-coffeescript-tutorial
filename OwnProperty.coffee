Object::allProperties = ->
  for property of this
    property

test = x: 10, y: 3
console.log test.allProperties()

Object::ownProperties = ->
  for own property of this
    property

test = 'Fat Igor' : true, 'Fireball' : true
console.log test.ownProperties()
console.log test.allProperties()

forEachOf = (obj, action) ->
  for own property, value of obj
    action property, value

chimera = head: "lion", body: "goat", tail: "snake"

console.log chimera.head
console.log chimera.body
console.log chimera.tail

forEachOf chimera, (name, value) ->
  console.log "The #{name} of a #{value}"

forEachIn = (object, action) ->
  for property of object
    if Object::hasOwnProperty.call object, property
      action property, object[property]

test = name: 'Mordecai', hasOwnProperty: "Uh-oh"
forEachIn test, (name, value) ->
  console.log "Property #{name} = #{value}"

test = name: "Mordecai", hasOwnProperty: "Uh-oh"
for own property, value of test
  console.log "Property #{property} = #{value}"
