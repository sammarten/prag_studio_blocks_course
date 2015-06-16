class DatabaseDriver
  def initialize(database, user, password)
    @database = database
    @user = user
    @password = password
    @connected = false
  end

  def connect
    # connects to database
    @connected = true
    puts "Connected to #{@database} as #{@user}."
  end

  def disconnect
    # disconnects from database
    puts "Disconnected."
  end

  def execute(sql)
    raise "Not connected!" unless @connected
    puts "Executing #{sql}..."
    # executes SQL
  end

  def self.open(database, user, password)
    driver = DatabaseDriver.new(database, user, password)
    driver.connect

    return driver unless block_given?

    begin
      yield(driver)
    ensure
      driver.disconnect
    end
  end

  def transactionally
    puts "Beginning transaction..."
    yield
    puts "Committed transaction."
  rescue
    puts "Rolled back transaction!"
  end
end

# driver = DatabaseDriver.new("my_database", "admin", "secret")

# driver.connect
# driver.execute("SELECT * FROM ORDERS")
# driver.execute("SELECT * FROM USERS")
# driver.disconnect

# driver = DatabaseDriver.open("my_database", "admin", "secret")
# driver.execute("SELECT * FROM ORDERS")
# driver.execute("SELECT * FROM USERS")
# driver.disconnect

DatabaseDriver.open("my_database", "admin", "secret") do |driver|
  driver.transactionally do
    driver.execute("UPDATE ORDERS SET status='completed'")
    driver.execute("DELETE * FROM SHIPPING_QUEUE")
  end

  # not run in a transaction
  driver.execute("SELECT * FROM ORDERS")
  driver.execute("SELECT * FROM USERS")
end

puts "---"

DatabaseDriver.open("my_database", "admin", "secret") do |driver|
  driver.transactionally do
    driver.execute("UPDATE ORDERS SET status='completed'")
    raise "Boom!"
    driver.execute("DELETE * FROM SHIPPING_QUEUE")
  end
end