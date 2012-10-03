$(document).ready ->

  nextSite = $('#1')

  $('.down-arrow').click (e) ->
   e.preventDefault()
   $('html,body').animate({scrollTop: nextSite.offset().top}, 500)


  $('ul#work li').waypoint (event, direction) ->
    nextId = parseInt($(@).attr('id'))
    if direction == 'down'
      nextId++
    if nextId == $('ul#work li').length + 1
      nextSite = $('.intro')
      $('.down-arrow').addClass('back-to-top')
      label = 'Back to Top'
    else
      nextSite = $("##{nextId}")
      label = nextSite.data('site-name')
    $('.down-arrow span').html(label)

  $('h2').waypoint (event, direction)->
    if direction == 'up'
      $('.down-arrow').removeClass('back-to-top')
      $('.down-arrow span').html('View my work')
