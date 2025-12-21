class ATM():
    ## attribute
    def __init__(self, account_no, name, balance, pin):
        self.account_no = account_no
        self.name = name
        self.balance = balance
        self.pin = pin

    ## method
    def __str__(self):
        text = (f"Hello {self.name}! This is your account inof., account_no: {self.account_no}, balance: {self.balance}")
        return text

    def deposit(self, amount):
        amount = int(input(amount))
        if amount > 0:
            self.balance += amount
            print(f"Completed! {self.name} This is yourNew Balance {self.balance}")
        else:
            print(f"Hello {self.name}! Please input amount > 0")

    def withdraw(self, amount):
        amount = int(input(amount))
        if amount >0 and amount <= self.balance:
            self.balance -= amount
            print(f"Completed! {self.name} This is your New Balance {self.balance}")
        else:
            print(f"Hello {self.name}! Please input amount >0 and <=balance")

    def change_pin(self, old_pin, new_pin):
        old_pin = str(input(old_pin))
        new_pin = str(input(new_pin))
        if self.pin == old_pin:
            self.pin == new_pin
            print("Successful setting pin!")
        else:
            print("Please recheck! pin length is 4 / old_pin is incorrect")

## input data
user1 = ATM("01","Toy",1000,"0909")
user2 = ATM("02","Nut",500,"1234")
user3 = ATM("03","Noon",300,"9876")
user4 = ATM("04","Nan",400,"4567")
user5 = ATM("05","Meaow",800,"2425")

## method : account_info.
print(user1)

## method : deposit
user2.deposit("Enter you amount: ")

## method : withdraw
user2.withdraw("Enter you amount: ")

## method : change password
user5.change_pin("Enter you old pin(4): ","Enter you new pin(4): " )
