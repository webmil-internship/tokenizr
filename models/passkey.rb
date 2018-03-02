# Search results, main table
class Passkey < Sequel::Model
  one_to_many :phrases
end
