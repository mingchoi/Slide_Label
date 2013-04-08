# Slide Label 0.1
# https://github.com/mingchoi
# MIT licensed
#
# Copyright (C) 2013 Mingchoi, http://mingchoi.twbbs.org

$.fn.extend
  Slide_Label: (element) ->

    #init
    new SLabel @, element

class SLabel

  constructor: (link, element)->

    # init the Div that contain the Label element
    gapBox = $("<div class='Slide_Label_Gap' style='display: none; position: absolute; padding-left: 10px; padding-right: 10px'></div>")
    gapBox.css 'width', parseInt(element.css('width').substr(0, element.css('width').length - 2), 10) + 0 + 'px'
    gapBox.append element
    $('body').append gapBox

    # hidding the element for animation
    element.hide()

    # adding EventListener to the Link
    link.mouseover =>
      @reposition link, gapBox
      gapBox.fadeIn 100, ->
        element.slideDown 400
    gapBox.mouseleave ->
      element.slideUp 200, ->
        gapBox.fadeOut 100


  reposition: (link, gapBox)->
    gapBox.css 'left', link.offset().left + link.width()*0.5 - gapBox.width()*0.5+ 'px'
    gapBox.css 'top', link.offset().top + link.height() + 'px'

