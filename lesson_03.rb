class Person
  attr_accessor :first_name, :last_name

  @@people = []    # VERY IMPORTANT

  def initialize(first_name, last_name)
  	@first_name = first_name  # OR self.first_name = first_name
  	@last_name = last_name    # OR self.first_name = first_name# OR self.last_name = last_name
  	@@people << self 
  end

  def self.search(last_name)
  	@@people.select{|p| p.last_name.capitalize == last_name}
  end

  def to_s
  	"#{first_name} #{last_name}"
  end

end


p1 = Person.new("John", "Smith")
p2 = Person.new("John", "Doe")
p3 = Person.new("Jane", "Smith")
p4 = Person.new("Jane", "Doe")

puts Person.search("Doe")