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

range = (start, end) ->
  if arguments.length < 2
    end = start
    start = 0

  arr = []
  for current in [start..end]
    arr.push current
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

# Exercise 13
startsWith = (fullString, startPrefix) ->
  fullString[0...startPrefix.length] is startPrefix

console.log(startsWith('Mississippi River', 'Miss') is true)
console.log(startsWith('Mississippi River', 'Misst') is false)
console.log(startsWith('Mississippi River', 'wil') is false)
console.log(startsWith('rotation', 'rot') is true)

console.log 'Pip'.charAt 250
console.log 'Nop'.slice 1, 10
console.log 'Pin'[1...10]
console.log startsWith('Idiots', 'Most honoured colleagues')

catNames = (paragraph) ->
  index = paragraph.indexOf(':')
  strNames = paragraph[index + 2...]
  arrNames = strNames.split(', ')
  return arrNames

console.log(catNames('dead: bobby,mary,bill'))
console.log(catNames('born: bobby,mary,bill'))

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

mailArchive = retrieveMails()
for email, i in mailArchive
  console.log("Processing e-mail ##{i} #{email[0..15]}...")

mailArchive = retrieveMails()
livingCats = 'Spot': true

for email, i in mailArchive
  paragraphs = email.split '\n'
  for paragraph in paragraphs
    if startsWith paragraph, 'born'
      names = catNames paragraph
      for name in names
        livingCats[name] = true
    else if startsWith paragraph, 'died'
      names = catNames paragraph
      for name in names
        delete livingCats[name]

console.log(livingCats, on)

#But how do we list all the cats that are alive? The of keyword is somewhat
#similar to the in keyword when it is used together with for:
console.log('List living cats:')
for name of livingCats
  console.log name

extractDate = (paragraph) ->
  # extract string before the first colon
  # split string by space
  # get the second string and convert it to date object
  strDate = paragraph.split(':')[0].split(' ')[1]
  arrDate = strDate.split('/')
  dateOfEvent = new Date (Number arrDate[2]), (Number arrDate[1]) - 1,
                    (Number arrDate[0])
  return dateOfEvent

console.log('died 27/04/2006: Black Leclère')
console.log(extractDate('died 27/04/2006: Black Leclère'))
console.log(extractDate('born 15/11/2003 (mother Spot): White Fang'))

between = (paragraph, startPattern, endPattern) ->
  idx1 = paragraph.indexOf startPattern
  idx1 += startPattern.length
  idx2 = paragraph.indexOf endPattern, idx1
  paragraph[idx1...idx2]

console.log(between 'born 15/11/2003 (mother Spot): White Fang',
        '(mother ', ')')
console.log(between 'bu ] boo [ bah ] gzz', '[ ', ' ]')

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
    paragraphs = email.split '\n'
    for paragraph in paragraphs
      handleParagraph paragraph
  cats

catData = findCats()

console.log(catData['Clementine'])
console.log(catData[catData['Clementine'].mother])

# Exercise 17
formatDate = (date) ->
  pad = (number) ->
    if number < 10 then '0' + number else number
  "#{pad date.getDate()}/" +
  "#{pad date.getMonth() + 1}/" +
  "#{date.getFullYear()}"

catInfo = (data, name) ->
  unless name of data
    return "No cat by the name of #{name} is known."
  cat = data[name]
  message = "#{name}," +
            " born #{formatDate cat.birth}" +
            " from mother #{cat.mother}"
  if "death" of cat
    message += ", died #{formatDate cat.death}"
  "#{message}."

console.log (catInfo catData, "Fat Igor")
console.log (formatDate new Date 2000, 0, 1)

# Exercise 18
oldestCat = (data) ->
  oldest = null
  for name of data
    cat = data[name]
    unless 'death' of cat
      if oldest is null or oldest.birth > cat.birth
        oldest = cat
  oldest?.name
console.log (oldestCat catData)

# Exercise 19
console.log(range 4, 9)
console.log(range 12, 12)
console.log(range 4)

# Exercise 20
sum = (numbers) ->
  accum = 0
  for val in numbers
    accum = accum + val
  accum

console.log (sum [1..10])
console.log (sum (range 1, 10))
