jQuery(document).on 'turbolinks:load', ->
  $('.scroller').slick({
    dots: true
    speed: 780
    fade: true
    autoplay: true
    autoplaySpeed: 1800
  })
