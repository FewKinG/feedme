function feedme_set_form_param(form, key, value) {
  form.append('<input type="hidden" name="' + key + '" value="' + value + '" />')
}

function feedme_reset_form(form) {
  $("input[type=hidden]", form).remove()
}

function feedme_setup_form(model, form) {
  form.submit(function() {
    feedme_reset_form(form)
    $("#feedme_" + model + " .element").each(function(ind, element) {
      element = $(element)
      var value
      var key = element.attr('id')
      if (element.hasClass('stars')) {
	value = feedme_get_star_value(element)
      }	else if (element.hasClass('text')) {
	value = feedme_get_text_value(element)
      }
      alert(key + "=" + value)
      if (value) {
	feedme_set_form_param(form, key, value)
      }
    })  
  })
}

function feedme_get_star_value(stars) {
  var active_star = $(".star.active", stars)
  return active_star.data("num")
}

function feedme_get_text_value(text) {
  return $("textarea", text).val()
}

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

  feedme_setup_form(model, $("#feedme_form_" + model))
}
