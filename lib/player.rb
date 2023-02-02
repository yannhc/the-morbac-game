class Player
    attr_reader :name, :symbol
    attr_accessor :win
      
    def initialize(name, symbol, win)
      # @name le pseudo du joueur
      @name = name
      # @symbol, un symbole du jeu du morpion : X ou O 
      @symbol = symbol
      # Pour compter les victoires
      @win = win
    end
  
  end