require 'pry'

class BoardCase
  attr_accessor :value, :id
    
  def initialize(id)
    # Nom de la case, si c'est A1, B2 (enfin bref on a compris)
    @id = id

    # Affichage de la case
    @value = " "
  end
    
end
  