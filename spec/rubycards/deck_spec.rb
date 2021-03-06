require 'spec_helper'

include RubyCards

describe Deck do
  subject(:deck) { Deck.new }

  describe '#initialize' do
    it 'initializes 52 cards' do
      deck.cards.count.should == 52
      # test indexing
      deck[0].should be_a Card
      # test enumerability
      deck.each { |card| card.should be_a Card }
    end
  end

  describe '#shuffle!' do
    it 'shuffles the cards' do
      cards_before_shuffling = deck.cards.dup
      deck.shuffle!
      deck.cards.should_not == cards_before_shuffling
    end

    it 'returns itself' do
      should == deck.shuffle!
    end
  end

  describe '#draw' do
    it 'draws a single card from the deck' do
      first_card = deck.cards.first
      cards_expected_after_draw = deck.cards[1..-1]
      deck.draw.should == first_card
      deck.cards.should == cards_expected_after_draw
    end
  end

  describe '#empty?' do
    context 'empty deck' do
      it 'returns true' do
        deck.cards.count.times { deck.draw }
        deck.empty?.should be_true
      end
    end

    context 'full deck' do
      it 'returns false' do
        deck.empty?.should be_false
      end
    end
  end
end
