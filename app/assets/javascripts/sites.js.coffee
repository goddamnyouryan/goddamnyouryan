$(document).ready ->

  $("a[rel*=external]").click (e) ->
    window.open $(this).attr("href")
    e.preventDefault()

  nextSite = $('#1')

  $('.down-arrow').click (e) ->
   e.preventDefault()
   $('html,body').animate({scrollTop: nextSite.offset().top},{easing: 'swing', duration: 500})

  $('ul#work li').waypoint (event, direction) ->
    nextId = parseInt($(@).attr('id'))
    if direction == 'down'
      nextId++
      if $(@).hasClass('dark')
        $('.down-arrow').addClass('dark')
      else
        $('.down-arrow').removeClass('dark')
    if nextId == $('ul#work li').length + 1
      nextSite = $('.intro')
      $('.down-arrow').addClass('back-to-top')
      label = 'Back to Top'
    else
      nextSite = $("##{nextId}")
      label = nextSite.data('site-name')
      $('.down-arrow').removeClass('back-to-top')
    if direction == 'up'
      nextId--
      prevSite = $("##{nextId}")
      if prevSite.hasClass('dark')
        $('.down-arrow').addClass('dark')
      else
        $('.down-arrow').removeClass('dark')
    $('.down-arrow span').html(label)
  ,
    offset: 660

  $('ul#work li:first').waypoint (event, direction)->
    if direction == 'up'
      $('.down-arrow').removeClass('back-to-top')
      $('.down-arrow').removeClass('dark')
      $('.down-arrow span').html('View my work')
