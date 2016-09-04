# Functional Programming Chapter
xxx = [4...20]

for i in xxx by 3
  console.log i

forEach = (array, action) ->
  try
    action element for element in array
  catch error
    console.log(error.message)

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

map = (array, func) ->
  result = []
  forEach array, (element) ->
    result.push func element
  result

console.log map [0.01, 2, 9.89, Math.PI], Math.round

recluseFile = """
% The Book of Programming

%% The Two Aspects

Below the surface of the machine, the program moves.
Without effort, it expands and contracts. In great harmony,
electrons scatter and regroup. The forms on the monitor
are but ripples on the water. The essence stays invisibly
below.

When the creators built the machine, they put in the
processor and the memory. From these arise the two aspects
of the program.

The aspect of the processor is the active substance. It is
called Control. The aspect of the memory is the passive
substance. It is called Data.

Data is made of merely bits, yet it takes complex forms.
Control consists only of simple instructions, yet it
performs difficult tasks. From the small and trivial, the
large and complex arise.

The program source is Data. Control arises from it. The
Control proceeds to create new Data. The one is born from
the other, the other is useless without the one. This is
the harmonious cycle of Data and Control.

Of themselves, Data and Control are without structure. The
programmers of old moulded their programs out of this raw
substance. Over time, the amorphous Data has crystallised
into data types, and the chaotic Control was restricted
into control structures and functions.

%% Short Sayings

When a student asked Fu-Tzu about the nature of the cycle
of Data and Control, Fu-Tzu replied 'Think of a compiler,
compiling itself.'

A student asked 'The programmers of old used only simple
machines and no programming languages, yet they made
beautiful programs. Why do we use complicated machines
and programming languages?'. Fu-Tzu replied 'The builders
of old used only sticks and clay, yet they made beautiful
huts.'

A hermit spent ten years writing a program. 'My program can
compute the motion of the stars on a 286-computer running
MS DOS', he proudly announced. 'Nobody owns a 286-computer
or uses MS DOS anymore.', Fu-Tzu responded.

Fu-Tzu had written a small program that was full of global
state and dubious shortcuts. Reading it, a student asked
'You warned us against these techniques, yet I find them in
your program. How can this be?' Fu-Tzu said 'There is no
need to fetch a water hose when the house is not on fire.'
{This is not to be read as an encouragement of sloppy
programming, but rather as a warning against neurotic
adherence to rules of thumb.}

%% Wisdom

A student was complaining about digital numbers. 'When I
take the root of two and then square it again, the result
is already inaccurate!'. Overhearing him, Fu-Tzu laughed.
'Here is a sheet of paper. Write down the precise value of
the square root of two for me.'

Fu-Tzu said 'When you cut against the grain of the wood,
much strength is needed. When you program against the grain
of a problem, much code is needed.'

Tzu-li and Tzu-ssu were boasting about the size of their
latest programs. 'Two-hundred thousand lines', said Tzu-li,
'not counting comments!'. 'Psah', said Tzu-ssu, 'mine is
almost a *million* lines already.' Fu-Tzu said 'My best
program has five hundred lines.' Hearing this, Tzu-li and
Tzu-ssu were enlightened.

A student had been sitting motionless behind his computer
for hours, frowning darkly. He was trying to write a
beautiful solution to a difficult problem, but could not
find the right approach. Fu-Tzu hit him on the back of his
head and shouted '*Type something!*' The student started
writing an ugly solution. After he had finished, he
suddenly understood the beautiful solution.

%% Progression

A beginning programmer writes his programs like an ant
builds her hill, one piece at a time, without thought for
the bigger structure. His programs will be like loose sand.
They may stand for a while, but growing too big they fall
apart{Referring to the danger of internal inconsistency
and duplicated structure in unorganised code.}.

Realising this problem, the programmer will start to spend
a lot of time thinking about structure. His programs will
be rigidly structured, like rock sculptures. They are solid,
but when they must change, violence must be done to them
{Referring to the fact that structure tends to put
restrictions on the evolution of a program.}.

The master programmer knows when to apply structure and
when to leave things in their simple form. His programs
are like clay, solid yet malleable.

%% Language

When a programming language is created, it is given
syntax and semantics. The syntax describes the form of
the program, the semantics describe the function. When the
syntax is beautiful and the semantics are clear, the
program will be like a stately tree. When the syntax is
clumsy and the semantics confusing, the program will be
like a bramble bush.

Tzu-ssu was asked to write a program in the language
called  Java, which takes a very primitive approach to
functions. Every morning, as he sat down in front of his
computer, he started complaining. All day he cursed,
blaming the language for all that went wrong. Fu-Tzu
listened for a while, and then reproached him, saying
'Every language has its own way. Follow its form, do not
try to program as if you were using another language.'
"""
console.log # 'The End'


paragraphs = recluseFile.split '\n\n'
console.log "Found #{paragraphs.length} paragraphs"

#Exercise 22
processParagraphOld = (paragraph) ->
  # count number of % in the paragraph
  numPercent = count paragraph.split(''), (c) -> c is '%'
  type = if numPercent is 0 then 'p' else 'h' + numPercent
  content = paragraph.substring(numPercent)
  { "type" : type, "content" : content}

#console.log count '%% sssss %%'.split(''), (c) -> c is '%'

paragraphs = map recluseFile.split('\n\n'),
                 processParagraphOld
console.log(paragraph for paragraph in paragraphs[0...3])

#Exercise 23
splitParagraph = (text) ->
  # Find character position or end of text
  indexOrEnd = (character) ->
    index = text.indexOf character
    if index is -1 then text.length else index

  # Return and remove text upto next special
  # character or end of text
  takeNormal = ->
    end = reduce map(['*', '{'], indexOrEnd),
                 Math.min, text.length
    part = text.slice 0, end
    text = text.slice end
    part

  # Return and remove text upto character
  takeUpTo = (character) ->
    end = text.indexOf character, 1
    if end is -1
      throw new Error 'Missing closing ' +
                      '"' + character + '"'
    part = text.slice 1, end
    text = text.slice end + 1
    part

  fragments = []
  while text isnt ''
    if text[0] is '*'
      fragments.push
        type: 'emphasised',
        content: takeUpTo '*'
    else if text[0] is '{'
      fragments.push
        type: 'footnote',
        content: takeUpTo '}'
    else
      fragments.push
        type: 'normal',
        content: takeNormal()
  fragments

#Exercise 22
processParagraph = (paragraph) ->
  header = 0
  while paragraph[0] is '%'
    paragraph = paragraph.slice 1
    header++
  type: if header is 0 then 'p' else 'h' + header,
  content: splitParagraph paragraph

# Adhoc test
paragraphs = map recluseFile.split('\n\n'),
                 processParagraph
console.log(paragraph for paragraph in paragraphs[0...3])

extractFootnotes = (paragraphs) ->
  footnotes = []
  currentNote = 0
  replaceFootnote = (fragment) ->
    if fragment.type is 'footnote'
      ++currentNote
      footnotes.push fragment
      fragment.number = currentNote
      type: 'reference', number: currentNote
    else
      fragment

  forEach paragraphs, (paragraph) ->
    paragraph.content = map paragraph.content,
                            replaceFootnote
  footnotes

console.log 'Footnotes from the recluse:'
console.log extractFootnotes paragraphs
console.log paragraphs[20]

tag = (name, content, attributes) ->
  name: name
  attributes: attributes
  content: content

link = (target, text) ->
  tag "a", [text], href: target

console.log link "http://www.gokgs.com/", "Play Go!"

htmlDoc = (title, bodyContent) ->
  tag "html", [tag("head", [tag "title", [title]]),
               tag "body", bodyContent]

console.log htmlDoc "Quote", "In his house at R'lyeh " +
                      "dead Cthulu waits dreaming."


#{ name: 'a',
#  attributes: { href: 'http://www.gokgs.com/' },
#  content: [ 'Play Go!' ] }

#{ name: 'html',
#  attributes: undefined,
#  content:
#   [ { name: 'head', attributes: undefined, content: [Object] },
#     { name: 'body',
#       attributes: undefined,
#       content: 'In his house at R\'lyeh dead Cthulu waits dreaming.' }
#   ]
#}

# Exercise 24
image = (location) ->
  tag "img", [], src : location

console.log image 'http://wwww.abc.com/xyz.png'

escapeHTML = (text) ->
  replacements = [[/&/g, '&amp;']
                  [/"/g, '&quot;']
                  [/</g, '&lt;']
                  [/>/g, '&gt;']]
  forEach replacements, (replace) ->
    text = text?.replace replace[0], replace[1]
  text

console.log escapeHTML '< " & " >'

renderHTML = (element) ->
  pieces = []

  renderAttributes = (attributes) ->
    result = []
    if attributes
      for name of attributes
        result.push ' ' + name + '="' +
          escapeHTML(attributes[name]) + '"'
    result.join ''

  render = (element) ->
    # Text node
    if typeof element is 'string'
      pieces.push escapeHTML element
    # Empty tag
    else if not element.content or
                element.content.length is 0
      pieces.push '<' + element.name +
        renderAttributes(element.attributes) + '/>'
    # Tag with content
    else
      pieces.push '<' + element.name +
        renderAttributes(element.attributes) + '>'
      forEach element.content, render
      pieces.push '</' + element.name + '>'

  render element
  pieces.join ''

imageSource = 'http://autotelicum.github.com/Smooth-CoffeeScript'
linkOstrich = "#{imageSource}/img/ostrich.jpg"

console.log renderHTML link 'http://www.nedroid.com', 'Drawings!'
body = [tag('h1', ['The Test']),
        tag('p', ['Here is a paragraph ' +
                  'and an image...']),
        image(linkOstrich)]
doc = htmlDoc 'The Test', body
console.log renderHTML doc

footnote = (number) ->
  tag 'sup',
    [link '#footnote' + number, String number]

console.log footnote(42), 3

renderFragment = (fragment) ->
  if fragment.type is 'reference'
    footnote fragment.number
  else if fragment.type is 'emphasised'
    tag 'em', [fragment.content]
  else if fragment.type is 'normal'
    fragment.content

renderParagraph = (paragraph) ->
  tag paragraph.type,
    map paragraph.content, renderFragment

renderFootnote = (footnote) ->
  anchor = tag "a", [],
    name: "footnote" + footnote.number
  number = "[#{footnote.number}] "
  tag "p", [tag("small",
    [anchor, number, footnote.content])]

# <p>
#    <small>
#       <a name="footnote3" />[3] content
#    </small>
# </p>

renderFile = (file, title) ->
  paragraphs = map file.split('\n\n'),
                   processParagraph
  footnotes = map extractFootnotes(paragraphs),
                  renderFootnote
  body = map paragraphs,
             renderParagraph
  body = body.concat footnotes
  renderHTML htmlDoc title, body

page = renderFile recluseFile, 'The Book of Programming'
console.log page
