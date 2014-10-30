class Account
    # THESE ATTRIBUTES DEFINE OUR CLASS ACCOUNT
    attr_reader :name, :balance
    def initialize(name, balance=100)
        @name = name
        @balance = balance
    end
    
    # PUBLIC INFO (IF YOU HAVE THE PIN (NOTICE PIN IS USED A LOT HERE)
    public
    def display_balance(pin_number)
        puts pin_number == pin ? "Balance: $#{@balance}." : pin_error
    end
    def withdraw(pin_number, amount)
        if balance < amount
            puts "Insufficient funds. Your balance is $#{@balance} and you are trying to withdraw $#{amount}. Please try again."
            return
        end
        if pin_number == pin
            @balance -= amount
            puts "Withdrew $#{amount}. New Balance: $#{@balance}."
        else
            puts pin_error
        end
    end
    def deposit(pin_number, amount)
        if pin_number == pin
            @balance += amount
            puts "Deposited $#{amount}. New Balance: $#{@balance}."
        else
            puts pin_error
        end
    end 
    
    # THIS WILL ALWAYS BE PRIVATE AND INACCESSIBLE
    private
    def pin
        @pin = 1234
    end
    def pin_error
        return "Access denied: incorrect PIN."
    end
end

# INTERFACE DESIGN FOR THE ATM MACHINE
def interface(account)
    puts "Welcome to SinSys Banking!\nWhat would you like to do?\n1 for Withdraw\n2 for Deposit\n3 for Balance"
    sel = gets.chomp.to_i
    puts "Please enter your PIN (our default is 1234)."
    our_pin = gets.chomp.to_i
    case sel
    when 1
        puts "Welcome! How much would you like to withdraw?"
        depAmount = gets.chomp.to_i
        account.withdraw(our_pin, depAmount)
    when 2
        puts "Welcome! How much would you like to deposit?"
        depAmount = gets.chomp.to_i
        account.deposit(our_pin, depAmount)
    when 3
        account.display_balance(our_pin)
    else
      puts "We don't understand. Have a wonderful day!"
    end
    puts "Would you like another transaction?\ny or n?"
    continue = gets.chomp
    if continue == "y"
        interface(account)
    elsif continue == "n"
        puts "Thanks for using SinSys Banking! Please take your receipt."
    end
end
# CREATE AN ACCOUNT
our_account = Account.new("Nicholas",32_512)
# RUN OUR RECURSIVE FUNCTION AS AN ATM MACHINE
interface(our_account)