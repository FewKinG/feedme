//= require feedme_custom

function feedme_set_form_param(form, key, value) {
  form.append('<input type="hidden" class="feedme-element" name="elements[' + key + ']" value="' + value + '" />')
}

function feedme_clear_form(model) {	
	$("#feedme_" + model + " .feedme-element .feedme-input.value").val("")
	$("#feedme_" + model + " .feedme-element .feedme-input.html").html("")
}

function feedme_reset_form(form) {
  $("input[type=hidden].feedme-element", form).remove()
}

function feedme_client_validate(model, options) {
	options = options || {}
	var modelElem = $("#feedme_" + model)
	var rules = {}
	var messages = {}
	$(".feedme-element", modelElem).each(function(index, obj) {
		obj = $(obj)
		var inp
		var inpValidators = []
		if (obj.hasClass('text')) {
			inp = $("textarea", obj)
			inpValidators.push("required")
		} else if (obj.hasClass('textline')) {
			inp = $("input", obj)
			inpValidators.push("required")
		} else if (obj.hasClass('select')) {
			inp = $("select", obj)
			inpValidators.push("required")
		}
		var rule = {}
		var message = {}
		var name = inp.attr('name')
		for (var i = 0; i < inpValidators.length; i++) {
			var val = inpValidators[i]
			rule[val] = true
			message[val] = I18n.t("feedme.validations." + model + "." + obj.data('id') + "." + val)
		}
		rules[name] = rule
		messages[name] = message
	})
	var opts = {
		messages: messages,
		rules: rules
	}
	$("#feedme_inputs_" + model).validate(opts)
	$("#feedme_form_" + model).submit(function(event) {
		if (!$(".feedme-element .feedme-input", modelElem).valid()) {
			event.stopImmediatePropagation()
			return false
		}
	})
}

function feedme_clear_errors(model) {
	var elem = $("#feedme_" + model + " .feedme-element")
	elem.removeClass('feedme-error')
	$("label.feedme-error", elem).remove()
}

function feedme_show_errors(model, errors) {
	var model = $("#feedme_" + model)
	for (var err in errors) {
		var elem = $(".feedme-element[data-id='" + err + "']")
		var errLabel = $("<label>")
		errLabel.addClass('error')
		var errs = errors[err]
		for (var i = 0; i < errs.length; i++) {
			var errElem = $("<span>")
			errElem.html(errs[i])
			errLabel.append(errElem)
		}	
		elem.append(errLabel)
		$(".feedme-input", elem).addClass('error')
	}
}

function feedme_setup_form(model, form) {
  form.submit(function() {
    feedme_reset_form(form)
		feedme_clear_errors(model)
    $("#feedme_" + model + " .feedme-element").each(function(ind, element) {
      element = $(element)
      var value
      var key = element.data('id')
      if (element.hasClass('stars')) {
				value = feedme_get_star_value(element)
      }	else if (element.hasClass('text')) {
				value = feedme_get_text_value(element)
      } else if (element.hasClass('textline')) {
				value = feedme_get_textline_value(element)
			} else if (element.hasClass('select')) {
				value = feedme_get_select_value(element)
			}
      if (value) {
				feedme_set_form_param(form, key, value)
      }
    })
		feedme_disable_form(model)
  })
}

function feedme_disable_form(model) {
	var submit = $("#feedme_form_" + model + " input[type='submit']")
	submit.attr('disabled', 'disabled')
	submit.data('enabled-text', submit.val())
	submit.val(submit.data('disabled-text'))
}

function feedme_enable_form(model) {
	var submit = $("#feedme_form_" + model + " input[type='submit']")
	submit.removeAttr('disabled')
	submit.val(submit.data('enabled-text'))
}

function feedme_get_star_value(stars) {
  var active_star = $(".star.active", stars)
  return active_star.data("num")
}

function feedme_get_text_value(text) {
  return $("textarea", text).val()
}

function feedme_get_textline_value(textline) {
	return $("input", textline).val()
}

function feedme_get_select_value(select) {
	return $("select", select).val()
}

function feedme_init(model) {
	$("#feedme_" + model + " .feedme-element").each(function(ind, elem) {
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
