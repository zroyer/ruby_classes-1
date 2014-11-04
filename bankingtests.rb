require_relative 'banking'

chase = Bank.new("JP Morgan Chase") #JP Morgan Chase bank was just created.
wells_fargo = Bank.new("Wells Fargo") #Wells Fargo bank was just created.
me = Person.new("Shehzan", 500) #Hi, Shehzan. You have $500!
friend1 = Person.new("John", 1000) #Hi, John. You have $1000!
chase.open_account(me) #Shehzan, thanks for opening an account at JP Morgan Chase!
chase.open_account(friend1) #John, thanks for opening an account at JP Morgan Chase!
wells_fargo.open_account(me) #Shehzan, thanks for opening an account at Wells Fargo!
wells_fargo.open_account(friend1) #John, thanks for opening an account at Wells Fargo!

chase.deposit(me, 200) #Shehzan deposited $200 to JP Morgan Chase. Shehzan has $300. Shehzan's acccount has $200.
chase.deposit(friend1, 300) #John deposited $300 to JP Morgan Chase. John has $700. John's account has $300.
chase.withdraw(me, 50) #Shehzan withdrew $50 from JP Morgan Chase. Shehzan has $350. Shehzan's account has $150.

chase.transfer(me, wells_fargo, 100) #Shehzan transfered $100 from the JP Morgan Chase account to the Wells Fargo account. The JP Morgan Chase account has $50 and the Wells Fargo account has $100.