require 'pry'
require_relative 'board'
require_relative 'player'
require_relative 'boardcase'

class Game < Board
  attr_accessor :players, :board, :current_player
   
  def initialize(player1, player2)
    @board = Board.new

    @players = []

    # Ici on crée nos joueur qui iront dans un array
    @current_player = Player.new(player1, "O", 0)
    @players << @current_player
    @current_player = Player.new(player2, "X", 0)
    @players << @current_player

  end

  def score 
    # Scores de fin de partie
    puts " "
    puts " "
    print "      "
    puts "-" * 48
    puts "                  -- Vos scores finaux --          "
    puts "            #{players[0].name} a gagné #{players[0].win} fois !                  "
    puts "            #{players[1].name} a gagné #{players[1].win} fois !                  "
    print "      "
    puts "-" * 48
    puts " "

  end

  # Ici on lance une partie complète (rattaché au fichier board.rb)
  def turn

    loop do

    system('clear') # On enlève les données du tableau

      board.board_display

      # Tour du joueur 1
      puts "      C'est au tour de : #{players[0].name}"
      board.play_turn("01")
      board.board_display

      # Si victoire du joueur 1, on sort de la boucle
      if board.victory == "X"
        puts "      Bien joué frerot #{players[0].name} ! "
        puts "      T'as gagné !"
        players[0].win += 1
        break
      end

      # Si égalité, on sort de la boucle
      if board.victory == "égalité"
        puts "      Egalité, vous êtes vraiment nuls"
        puts "      Relancez il me faut un gagnant !"
        break
      end

      # Tour du joueur 2
      puts "      C'est au tour de : #{players[1].name}"
      board.play_turn("02")
      board.board_display

      # Si victoire du joueur 2, on sort de la boucle
      if board.victory == "O"
        puts "      Bien joué frerot #{players[1].name} ! "
        puts "      T'as gagné !"
        players[0].win +=1
        break
      end

    end

    score # Là on affiche les scores

  end

  def new_round
    board.board_clean # Enlève les données du tableau pour une nouvelle partie
  end

  def game_end
    # Fin de la partie et scores finaux
    system('clear') # Supprime les données du tableau
    puts " "
    puts " "
    puts " "
    puts " "
    puts "      FINITO !"
    puts "      C'était cool ? "
    puts " "
    puts "      Vos scores finaux "
    puts "      ça casse pas 3 pattes à un canard dis donc ! "
    score
    puts " "
    puts " "
    puts " "
  end    
  
end
  