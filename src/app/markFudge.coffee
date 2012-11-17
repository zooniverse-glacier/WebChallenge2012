class MarkFudge
    
  @fudge :->
    $(".markdownSection").each (index,d)=>
      html = @generateHTML $(d).html()
      $(d).html html
      $(d).show()
  @generateHTML:(mark)->
    marked(mark)

window.App.MarkFudge = MarkFudge