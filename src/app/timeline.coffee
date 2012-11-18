class Timeline 

  base_image: 'url'
  stage_colors: [
    '#29A8E0'
    '#80D017'
    '#FAAD18'
  ]

  constructor: (school, el, width) ->
    @school= school
    @el = $(el)
    @width = width
    @startTime = moment(school.events[0].date).subtract('days',20)
    console.log @startTime , moment(school.events[0].date)
    @endTime = moment(school.events[school.events.length-1].date).add('days',20)
    @totalDays = moment(@startTime).diff(@endTime, 'days')
    @render()

  convertX:(event)->
    @days  = moment(@startTime).diff(event.date, 'days')
    (@days*1.0/(1.0*@totalDays))*@width

  render:->
    markers = (@renderEvent(event,index) for event,index in @school.events )  
    content = """
      <div style='width:#{@width}px' class='timeline'>
          <div class='bar'></div>
          <ul class='inner'> 
              <li class='marker stage0' style='left:0px'><div style='background-color:black' class='markerInner'></div></li>
                #{markers.join(" ")}
              <li class='marker stage0' style='left:#{@width}px'><div  style='background-color:black' class='markerInner'></div></li>
          </ul>
      </div>
    """
    @el.html content
  
  renderEvent:(event,id)->
    xPoint = @convertX(event)
    stage  = event.stage
    stageCol = @stage_colors[stage-1]

    tooltip="""
      <div class='tooltip'>
        <p class='phase'>Phase #{event.stage}</p>
        <p class='date'>#{moment(event.date).format("Do MMMM YYYY")}</p>
        <p class='event'>#{event.text}</p>
      </div>
    """

    """
      <li class='marker stage#{stage}' data-id=#{id} style='left:#{xPoint}px'> #{tooltip} <div style='background-color:#{stageCol}' class='markerInner'></div></li>
    """

window.App.Timeline = Timeline