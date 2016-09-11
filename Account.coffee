

class Account
  constructor: -> @balance = 0
  transfer: (amount) -> @balance += amount
  getBalance: -> @balance
  #batchTransfer: (amtList) ->
  #  for amount in amtList
  #    @transfer amount
  reduce = (array, combine, base) ->
    forEach array, (element) ->
      base = combine base, element
    base

  forEach = (array, action) ->
    try
      action element for element in array
    catch error
      console.log(error.message)

  batchTransfer: (amtList) ->
    add = (a,b) -> a+b
    sum = (list) -> reduce list, add, 0
    @balance += sum amtList

yourAccount = new Account()
oldBalance = yourAccount.getBalance()
yourAccount.transfer salary = 1000
newBalance = yourAccount.getBalance()
console.log "Books balance:
 #{salary is newBalance - oldBalance}."

class AccountWithFee extends Account
  fee: 5
  transfer: (amount) ->
    super amount - @fee

yourAccount = new AccountWithFee()
oldBalance = yourAccount.getBalance()
yourAccount.transfer salary = 1000
newBalance = yourAccount.getBalance()
console.log "Books balance: (AccountWithFee)
 #{salary is newBalance - oldBalance}."

class LimitedAccount extends Account
  constructor: ->
    super
    @resetLimit()

  resetLimit: -> @dailyLimit = 50

  transfer: (amount) ->
    if amount < 0 and (@dailyLimit += amount) < 0
      throw new Error "You maxed out!"
    else
      super amount

  lacc = new LimitedAccount()
  lacc.transfer 50
  console.log "Start balance #{lacc.getBalance()}"

  try
    lacc.batchTransfer [-1..-10]
  catch error then console.log error.message
  console.log "After batch balance #{lacc.getBalance()}"
