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
