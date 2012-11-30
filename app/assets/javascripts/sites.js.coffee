jQuery ->

  $("a[rel*=external]").click (e) ->
    window.open $(this).attr("href")
    e.preventDefault()

  $('nav#sites li a, a.hire').click (e) ->
   e.preventDefault()
   target = $("#{$(@).attr('href')}").offset().top
   $('html,body').animate({scrollTop: target},{easing: 'swing', duration: 500})

  $('ul#work li').waypoint (event, direction) ->
    $('nav#sites ul li a').removeClass('current')
    slug = $(@).attr('id')
    nav = $("nav#sites ul li a.#{slug}")
    if direction == 'down'
      nav.addClass('current')
    else
      nav.parent().prev().find('a').addClass('current')

  $('#intro').waypoint ->
    $('nav#sites ul li a').removeClass('current')
    $('nav#sites ul li a:first').addClass('current')
  ,
    offset: -30
