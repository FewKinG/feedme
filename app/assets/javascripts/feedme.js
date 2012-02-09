function feedme_init(model) {
  $("#feedme_" + model + " .element").each(function(ind, elem) {
    elem = $(elem)
    if (elem.hasClass('stars')) {
      $(".star", elem).each(function(index, star) {
	star = $(star)
	star.click(function() {
	  $(".star", star.parent()).each(function(index, otherStar) {
	    $(otherStar).removeClass("active")
	  })
	  star.addClass("active")
	})
      })
    }
  })
}
