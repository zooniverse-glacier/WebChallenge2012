class MarkFudge
    
  @fudge :->
    $(".markdownSection").each (index,d)=>
      html = @generateHTML $(d).html().replace(/^\s+/, '')
      $(d).html html
      $(d).show()
  @generateHTML:(mark)->
    marked(mark)

window.App.MarkFudge = MarkFudge