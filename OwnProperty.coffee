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
