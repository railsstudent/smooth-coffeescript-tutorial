roads = {}
makeRoad = (from, to, length) ->
  addRoad = (from, to) ->
    roads[from] = [] if not (from of roads)
    roads[from].push to: to, distance: length
  addRoad from, to
  addRoad to, from

# Map information
makeRoad 'Point Kiukiu', 'Hanaiapa', 19
makeRoad 'Point Kiukiu', 'Mt Feani', 15
makeRoad 'Point Kiukiu', 'Taaoa', 15

console.log roads


# Exercise 26
makeRoads = (from, to_length_pairs...) ->
  for i in [0...to_length_pairs.length] by 2
    makeRoad from, to_length_pairs[i], to_length_pairs[i+1]

makeRoads 'Point Kiukiu',
  'Hanaiapa', 19, 'Mt Feani', 15, 'Taaoa', 15

makeRoads 'Airport',
  'Hanaiapa', 6, 'Mt Feani', 5,
  'Atuona', 4, 'Mt Ootua', 11
makeRoads 'Mt Temetiu',
  'Mt Feani', 8, 'Taaoa', 4
makeRoads 'Atuona',
  'Taaoa', 3, 'Hanakee pearl lodge', 1
makeRoads 'Cemetery',
  'Hanakee pearl lodge', 6, 'Mt Ootua', 5
makeRoads 'Hanapaoa',
  'Mt Ootua', 3
makeRoads 'Puamua',
  'Mt Ootua', 13, 'Point Teohotepapapa', 14

console.log roads['Airport']

roadsFrom = (place) ->
  found = roads[place]
  return found if found?
  throw new Error "No place named '#{place}' found."

try
  console.log roadsFrom "Hanaiapa"
  console.log roadsFrom "Hanalapa"
catch error
  console.log "Oops #{error}"


gamblerPath = (from, to) ->

  randomInteger = (below) ->
    Math.floor Math.random() * below

  randomDirection = (from) ->
    options = roadsFrom from
    options[randomInteger(options.length)].to

  path = []
  loop
    path.push from
    break if from is to
    from = randomDirection from
  path

console.log gamblerPath 'Hanaiapa', 'Mt Feani'

_break = toString -> "Break"
_forEach = (array, action) ->
  try
    for element in array
      action element
  catch exception
    if exception isnt _break
      throw exception

console.log _forEach [1..3], (element) -> element * element

_member = (array, value) ->
  found = false
  _forEach array, (element) ->
    if element is value
      found = true
      throw _break
  found

 console.log _member [6, 7, 'Bordeaux'], 7

_any = (array, test) ->
  for element in array
    if test element
      return true
  false

console.log _any [3, 4, 0, -3, 2, 1], (n) -> n < 0
console.log _any [3, 4, 0, 2, 1], (n) -> n < 0

_member = (array, value) ->
  partial = (func, a...) -> (b...) -> func a..., b...
  _any array, partial ((a,b) -> a is b), value

console.log _member ["Fear", "Loathing"], "Denial"
console.log _member ["Fear", "Loathing"], "Loathing"
