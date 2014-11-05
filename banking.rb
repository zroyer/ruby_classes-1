class Person
	attr_reader :name
	attr_accessor :cash

    def initialize(name, cash)
        @name = name							#person's name
        @cash = cash							#amount of cash this person has on hand
        puts "Hi, #{@name}. You have $#{@cash}!"
    end
end

class Bank
	attr_reader :bank
	attr_reader :accounts

	def initialize(bank)
		@bank = bank 							#name of the banking institution
		@accounts = {}							#hash to store a person and their balance at this bank
		puts "#{bank} bank was just created."
	end

	def open_account(person)
		@accounts[person.name] = 0				#initializes the person's account balance to zero
		puts "#{person.name}, thanks for opening an account at #{bank}!"
	end

	def withdraw(person, amount)
		if (amount > @accounts[person.name])	#if the amount attemtempted to withdraw is more than is actually in the account
			puts "#{person.name} does not have enough funds in their account to withdraw that amount."
		else									#if there are enough funds to withdraw
			@accounts[person.name] -= amount	#take the money from the person's account
			person.cash += amount				#give the cash to the person
			puts "#{person.name} withdrew $#{amount} from #{bank}. #{person.name} has $#{person.cash}. #{person.name}'s account has $#{@accounts[person.name]}."
		end
	end

	def deposit(person, amount)
		if (amount > person.cash)				#if the person tries to deposit more cash than they have on hand
			puts "#{person.name} cannot deposit $#{amount}. #{person.name} only has #{person.cash}. Please try again."
		else									#if the person deposits an amount less than or equal to their cash on hand
			@accounts[person.name] += amount	#put that money into the person's account
			person.cash -= amount				#take the cash from the person			
			puts "#{person.name} deposited $#{amount} to #{bank}. #{person.name} has $#{person.cash}. #{person.name}'s acccount has $#{@accounts[person.name]}."
		end
	end
end

