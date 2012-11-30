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

  $('form.contact').validate
    onkeyup: false
    rules:
      name:
        required: true
      email:
        required: true
        email: true
      body:
        required: true
    messages:
      name:
        required: 'You better enter your name so I know what to call you.'
      email:
        required: 'I need your email address to you know, email you with.'
        email: 'This isn\'t a real email address.'
      body:
        required: 'You don\'t have anything to tell me? Aww come on.'
    errorPlacement: (error, element) =>
      $('form.contact').prepend(error)
