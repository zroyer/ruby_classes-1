#Zach Royer's MakerSquare Technical Interview Coding Challenge 

class Bank
	attr_reader :bank, :accounts

	def initialize(bank)
		@bank = bank 									#name of the banking institution
		@accounts = {}									#hash to store a person and their balance at this bank
		puts "#{bank} bank was just created."
	end

	def open_account(person)
		@accounts[person.name] = 0						#initializes the person's account balance to zero
		puts "#{person.name}, thanks for opening an account at #{bank}!"
	end

	def withdraw(person, amount)
		if 	amount > @accounts[person.name]				#Extra Credit level 1: Validate - if the amount attemtempted to withdraw is more than is actually in the account
			puts "#{person.name} does not have enough money in the account to withdraw $#{amount} (#{person.name} only has $#{@accounts[person.name]} in the account)."
		else											#if there are enough funds to withdraw
			@accounts[person.name] -= amount			#take the money from the person's account
			person.cash += amount						#give the cash to the person
			puts "#{person.name} withdrew $#{amount} from #{bank}. #{person.name} has $#{person.cash}. #{person.name}'s account has $#{@accounts[person.name]}."
		end
	end

	def deposit(person, amount)
		if  amount > person.cash						#Extra Credit level 1: Validate - if the person tries to deposit more cash than they have on hand
			puts "#{person.name} does not have enough cash to deposit $#{amount} (#{person.name} only has $#{person.cash} cash)."
		else											#if the person deposits an amount less than or equal to their cash on hand
			@accounts[person.name] += amount			#put that money into the person's account
			person.cash -= amount						#take the cash from the person			
			puts "#{person.name} deposited $#{amount} to #{bank}. #{person.name} has $#{person.cash}. #{person.name}'s acccount has $#{@accounts[person.name]}."
		end
	end

	def transfer(person, recipient, amount)
		if  amount > @accounts[person.name]				#Extra Credit level 1: Validate - if the person does NOT have enough money in the benefactor account
			puts "#{person.name} does not have enough money in the account to transfer $#{amount}."
		else											#if the person DOES have enough money in the benefactor account
			@accounts[person.name] -= amount			#take the money out of the benefactor account
			recipient.accounts[person.name] += amount	#put the money into the recipient account
			puts "#{person.name} transfered $#{amount} from the #{bank} account to the #{recipient.bank} account. The #{bank} account has $#{@accounts[person.name]} and the #{recipient.bank} account has $#{recipient.accounts[person.name]}."
		end
	end

	def total_cash_in_bank								#Extra Credit level 2: Count totals
		cash = 0
		accounts.each do |person, balance|				#loop through the account hash
			cash += balance								#add each person's account balance to the total
		end
		"#{bank} has $#{cash} in the bank."
	end
end

class Person
	attr_reader :name
	attr_accessor :cash

    def initialize(name, cash)
        @name = name.downcase.capitalize				#person's name
        @cash = cash									#amount of cash this person has on hand
        puts "Hi, #{@name}. You have $#{@cash}!"
    end
end


# Test code:
chase = Bank.new("JP Morgan Chase")
wells_fargo = Bank.new("Wells Fargo")
me = Person.new("Shehzan", 500)
friend1 = Person.new("John", 1000)
chase.open_account(me)
chase.open_account(friend1)
wells_fargo.open_account(me)
wells_fargo.open_account(friend1)
chase.deposit(me, 200)
chase.deposit(friend1, 300)
chase.withdraw(me, 50)
chase.transfer(me, wells_fargo, 100)
chase.deposit(me, 5000)
chase.withdraw(me, 5000)
puts chase.total_cash_in_bank
puts wells_fargo.total_cash_in_bank