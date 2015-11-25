require 'pry'

class User
  attr_accessor :name, :password

  def self.users_db
    [User.new("rafa","123"), User.new("natalia","111")]
  end

  def initialize(name, password)
    @name = name
    @password = password
  end

  def self.valid_credentials? user_candidate
    users_db.find do |user|
      user.equal? user_candidate
    end
  end

  def equal? user
    self.name == user.name && self.password == user.password
  end
end


