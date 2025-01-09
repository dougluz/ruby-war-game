# frozen_string_literal: true

require 'gosu'
require_relative 'lib/game'

class WarGameWindow < Gosu::Window
  def initialize
    super 800, 600
    self.caption = 'War Card Game'

    @game = Game.new('Douglas', 'Mariana')
    @background_color = Gosu::Color.rgba(34, 139, 34, 255)
    @font = Gosu::Font.new(20)

    @player1_card_pos = [200, 300]
    @player2_card_pos = [600, 300]
  end

  def update
    return unless Gosu.button_down?(Gosu::KbSpace)

    @game.play_round unless @game.game_over?
  end

  def draw
    Gosu.draw_rect(0, 0, width, height, @background_color)

    @font.draw_text("#{@game.player1.name} #{@game.player1.hand.size} cards", 20, 20, 1)
    @font.draw_text("#{@game.player2.name} #{@game.player2.hand.size} cards", 20, 50, 1)

    draw_card(@game.player1.hand.first, @player1_card_pos)
    draw_card(@game.player2.hand.first, @player2_card_pos)

    return unless @game.game_over?

    winner = @game.player1.hand.empty? ? @game.player2.name : @game.player1.name
    @font.draw_text("#{winner} wins!", 300, 200, 1, 2.0, 2.0, Gosu::Color::RED)
  end

  def draw_card(card, position)
    return unless card

    @font.draw_text(card.to_s, position[0], position[1], 1)
  end
end

WarGameWindow.new.show
