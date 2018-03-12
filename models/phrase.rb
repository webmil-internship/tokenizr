# Valid phrases
class Phrase < Sequel::Model
  many_to_one :passkey
end
