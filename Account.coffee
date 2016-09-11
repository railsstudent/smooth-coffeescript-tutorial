class Account
  constructor: -> @balance = 0
  transfer: (amount) -> @balance += amount
  getBalance: -> @balance
  batchTransfer: (amtList) ->
    for amount in amtList
      @transfer amount

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
