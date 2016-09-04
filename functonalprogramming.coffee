# Functional Programming Chapter
xxx = [4...20]

for i in xxx by 3
  console.log i

forEach = (array, action) ->
  try
    action element for element in array
  catch error
    console.log(err.message)

plusTen = (num) ->
  num += 10
  console.log num

forEach [1..10], console.log
forEach [1..10], plusTen
forEach ['Wampeter', 'Foma', 'Granfalloon'], console.log

sum = (numbers) ->
  total = 0
  forEach numbers, (number) -> total += number
  total

console.log sum [1, 10, 100, 1000]

retrieveMails = -> [
  "Nephew,\n\nI bought a computer as soon as I received your letter. " +
    "It took me two days to make it do 'internet', but I just kept calling " +
    "the nice man at the computer shop, and in the end he came down to help " +
    "personally. Send me something back if you receive this, so I know " +
    "whether it actually works.\n\nLove,\nAunt Emily",
  "Dear Nephew,\n\nVery good! I feel quite proud about being so " +
    "technologically minded, having a computer and all. I bet Mrs. Goor down " +
    "the street wouldn't even know how to plug it in, that witch.\n\nAnyway, " +
    "thanks for sending me that game, it was great fun. After three days, I " +
    "beat it. My friend Mrs. Johnson was quite worried when I didn't come " +
    "outside or answer the phone for three days, but I explained to her that " +
    "I was working with my computer.\n\nMy cat had two kittens yesterday! " +
    "I didn't even realize the thing was pregnant. I've listed the names at " +
    "the bottom of my letter, so that you will know how to greet them the " +
    "next time you come over.\n\nSincerely,\nAunt Emily\n\nborn 15/02/1999 " +
    "(mother Spot): Clementine, Fireball",
  "[... and so on ...]\n\nborn 21/09/2000 (mother Spot): " +
    "Yellow Emperor, Black Leclère",
  "...\n\nborn 02/04/2001 (mother Clementine): Bugeye," +
    " Wolverine, Miss Bushtail",
  "...\n\ndied 12/12/2002: Clementine\n\ndied 15/12/2002: Wolverine",
  "...\n\nborn 15/11/2003 (mother Spot): White Fang",
  "...\n\nborn 10/04/2003 (mother Miss Bushtail): Yellow Bess",
  "...\n\ndied 30/05/2004: Yellow Emperor",
  "...\n\nborn 01/06/2004 (mother Miss Bushtail): Catharina, Fat Igor",
  "...\n\nborn 20/09/2004 (mother Yellow Bess): Doctor Hobbles the 2nd, Noog",
  "...\n\nborn 15/01/2005 (mother Yellow Bess): The Moose, Liger\n\ndied " +
    "17/01/2005: Liger",
  "Dear nephew,\n\nYour mother told me you have taken up skydiving. Is this " +
    "true? You watch yourself, young man! Remember what happened to my " +
    "husband? And that was only from the second floor!\n\nAnyway, things " +
    "are very exciting here. I have spent all week trying to get the " +
    "attention of Mr. Drake, the nice gentleman who moved in next\ndoor, " +
    "but I think he is afraid of cats. Or allergic to them? I am\ngoing to " +
    "try putting Fat Igor on his shoulder next time I see him, very curious " +
    "what will happen.\n\nAlso, the scam I told you about is going better " +
    "than expected. I have already gotten back five 'payments', and only one " +
    "complaint. It is starting to make me feel a bit bad though. And you are " +
    "right that it is probably illegal in some way.\n\n(... etc ...)\n\nMuch " +
    "love,\nAunt Emily\n\ndied 27/04/2006: Black Leclère\n\nborn 05/04/2006 " +
    "(mother Lady Penelope): Red Lion, Doctor Hobbles the 3rd, Little Iroquois",
  "...\n\nborn 22/07/2006 (mother Noog): Goblin, Reginald, Little Maggie",
  "...\n\ndied 13/02/2007: Spot\n\ndied 21/02/2007: Fireball",
  "...\n\nborn 05/02/2007 (mother Noog): Long-ear Johnson",
  "...\n\nborn 03/03/2007 (mother Catharina): Asoka, Dark Empress, Rabbitface",
]
between = (paragraph, startPattern, endPattern) ->
  idx1 = paragraph.indexOf startPattern
  idx1 += startPattern.length
  idx2 = paragraph.indexOf endPattern, idx1
  paragraph[idx1...idx2]

startsWith = (fullString, startPrefix) ->
  fullString[0...startPrefix.length] is startPrefix

catNames = (paragraph) ->
  index = paragraph.indexOf(':')
  strNames = paragraph[index + 2...]
  arrNames = strNames.split(', ')
  return arrNames

mailArchive = retrieveMails()

extractDate = (paragraph) ->
  # extract string before the first colon
  # split string by space
  # get the second string and convert it to date object
  strDate = paragraph.split(':')[0].split(' ')[1]
  arrDate = strDate.split('/')
  dateOfEvent = new Date (Number arrDate[2]), (Number arrDate[1]) - 1,
                    (Number arrDate[0])
  return dateOfEvent

extractMother = (paragraph) ->
  between paragraph, '(mother ', ')'

catRecord = (name, birthdate, mother) ->
  name:   name
  birth:  birthdate
  mother: mother

addCats = (set, names, birthdate, mother) ->
  for name in names
    set[name] = catRecord name, birthdate, mother

deadCats = (set, names, deathdate) ->
  for name in names
    set[name].death = deathdate

findCats = ->
  mailArchive = retrieveMails()
  cats = {'Spot': catRecord 'Spot',
    new Date(1997, 2, 5), 'unknown'}

  handleParagraph = (paragraph) ->
    if startsWith paragraph, 'born'
      addCats cats, catNames(paragraph),
              extractDate(paragraph),
              extractMother(paragraph)
    else if startsWith paragraph, 'died'
      deadCats cats, catNames(paragraph),
               extractDate(paragraph)

  for email in mailArchive
    forEach email.split('\n'), handleParagraph
  cats

catData = findCats()
console.log(catData['Clementine'])
console.log(catData[catData['Clementine'].mother])

console.log Math.min.apply null, [5, 6]

negate = (func) ->
  (args...) -> not func args...

morethan = (x, y) -> x > y
lessthan = negate morethan

console.log (lessthan 5, 7)
console.log (lessthan 7, 7)
console.log (lessthan 9, 7)

reduce = (array, combine, base) ->
  forEach array, (element) ->
    base = combine base, element
  base

add = (a , b) -> a + b
sum2 = (numbers) -> reduce numbers, add, 0
console.log 'sum2: ', sum2 [1, 10, 100]
console.log 'sum2: ', sum2 [1...10]

#Exercise 21
countZeroes = (numbers) ->
  checkZero = (total, num) -> if num is 0 then total + 1 else total
  reduce numbers, checkZero, 0

count = (numbers, testFunc) ->
  reduce numbers,
    (total, number) -> if testFunc number then total + 1 else total,
    0

countZeroes2 = (numbers) -> count numbers, (number) -> number is 0

console.log countZeroes [1, 3, 0, 2, 0]
console.log countZeroes [1, 3, 4, 2, 5, 6]

console.log count [1, 3, 0, 2, 0, 2, 2], (x) -> x is 0


console.log countZeroes2 [1, 3, 0, 2, 0]
console.log countZeroes2 [1, 3, 4, 2, 5, 6]
bits = [1, 0, 1, 0, 0, 1, 1, 1, 0]
console.log countZeroes2 bits
