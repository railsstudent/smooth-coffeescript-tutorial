# Object Oriented chapter
rabbit = {}
rabbit.speak = (line) ->
  console.log "The rabbit says '#{line}'"
rabbit.speak "Well, now you're asking me."


speak = (line) ->
  console.log "The #{this.adjective} rabbit says '#{line}'"

whiteRabbit = adjective: "white", speak : speak
fatRabbit = adjective: "fat", speak: speak

whiteRabbit.speak "Oh my ears and whiskers, " +
    "how late it's getting!"
fatRabbit.speak "I could sure use a carrot right now."

speak.apply fatRabbit, ['Yum.']
speak.call fatRabbit, 'Burp.'
