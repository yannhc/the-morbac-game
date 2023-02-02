require 'pry'
require_relative 'board'
require_relative 'player'
require_relative 'boardcase'
require_relative 'game'

class Application

  # Ici, on annonce la présentation et le message pour commencer le jeu
  def start_game
    system('clear')
    puts " "
    puts " "
    puts "\t\t\t         - The MORBAC GAME -         "
    puts "\t\t\t    -- Le mini jeu by Sam & Yann --      "
    puts " "
    puts " "
    puts "      Salut à toi jeune entrepeneur, amuses toi avec le jeux du morpion"
    puts "      Si t'es pas bête, tu connais déjà les règles"
    puts "      Si t'es con, va sur Google"
    puts "      Ehhhh zéééééé partie ! "
    puts " "
  end

  # On demande au joueur 1 son nom
  def ask_player1
    puts "      C'est quoi ton blaze ? "
    print "      JOUEUR 1 : "
    player1 = gets.chomp
    puts "      T'auras comme symbole le X (tmanière t'as pas le choix)"
    puts " "
    return player1
  end

  # On demande au joueur 2 son nom
  def ask_player2
    puts "      Blaze du deuxième joueur ? "
    print "      JOUEUR 2 : "
    player2 = gets.chomp
    puts "      Ben toi t'auras le O (si t'es pas content, on s'en fiche royalement)"
    puts " "
    puts " "
    puts "      Aller on peut enfin commencer"
    puts "      Appuie sur entrer gogolito"
    gets.chomp
    return player2
  end

  # On demande aux joueurs s'ils veulent refaire une partie ou pas
  def ask_again(game)
    puts "      On recommence ? OUI / NON"
    print "      > "
    input = gets.chomp
    puts " "
    while input != "OUI" || input != "NON"
      case input
      when "OUI"
        # Si oui, on efface les données de la partie d'avant 
        input = " "
        game.new_round
        game.turn
      when "NON"
        # Si non, fin
        game.game_end
        break
      else
        # Si l'entrée n'est pas formulée de la bonne manière, on retourne à l'input
        puts "      On recommence ? OUI / NON"
        puts "      Ecrit OUI ou NON (En majuscule imbécile) : "
        print "      > "
        input = gets.chomp
        puts " "
      end
    end

  end

  # Ici on lance l'application 
  def perform
    start_game
    player1 = ask_player1
    player2 = ask_player2

    game = Game.new(player1, player2) # On lance le premier jeu
    game.turn

    ask_again(game) # Ici, c'est la boucle. Tant qu'un joueur ne dit pas stop, on relance le jeu.
  end
  
end
