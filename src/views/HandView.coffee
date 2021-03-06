class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el  
    @$('.score').text @collection.bestScore()
    # if !(@collection.isDealer)
    #   if @collection.scores()[0] > 21
    #     alert('Player Busts')
    #   if @collection.bestScore() == 21
    #     @collection.blackjack()
    # if (@collection.isDealer)
    #   if @collection.scores()[0] > 21
    #     alert('Dealer Busts')
