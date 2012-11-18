class Timeline 

  base_image: 'url'
  stage_colors: [
    '#29A8E0'
    '#80D017'
    '#FAAD18'
  ]

  constructor: (school, el) ->
    @school= school
    @el = $(el)
    @width = @el.width()
    @startTime = moment(school.events[0].date).subtract('days',20)
    @endTime = moment(school.events[school.events.length-1].date).add('days',20)
    @totalDays = moment(@startTime).diff(@endTime, 'days')
    @render()
    @currentlySelectedId=0
    @animating = true
    @animate()

    $(".marker").hover (e)=>
      @showStep($(e.currentTarget).data().id)
      clearTimeout @currentTimeout
      @animating = false 
    ,(e)=>
      @animating = true
      @animate()

  remove:=>
    @el.remove()
    clearTimeout @currentTimeout
    
  convertX:(event)->
    @days  = moment(@startTime).diff(event.date, 'days')
    (@days*1.0/(1.0*@totalDays))*@width

  animate:=>
    if @animating
      @currentTimeout = setTimeout @animate, 2000
    @currentlySelectedId = (@currentlySelectedId + 1) % @school.events.length    
    @showStep()

  showStep:(number = null)=>
    if number then @currentlySelectedId=number
    $(".marker").removeClass('active')
    $(".marker#{@currentlySelectedId}").addClass('active')


  render:=>
    markers = (@renderEvent(event,index) for event,index in @school.events )  
    content = """
      <div class='timeline'>
          <div class='bar'></div>
          <ul class='inner'> 
              <li class='marker stage0' style='left:0px'><div style='background-color:black' class='markerInner'></div></li>
                #{markers.join(" ")}
              <li class='marker stage0' style='right: 0'><div  style='background-color:black' class='markerInner'></div></li>
          </ul>
      </div>
    """
    @el.html content
  
  renderEvent: (event,id) ->
    xPoint = @convertX(event)
    stage  = event.phase
    stageCol = @stage_colors[stage - 1]

    tooltip =
      """
      <div class='tooltip'>
        <p class='phase'>Phase #{event.phase}</p>
        <p class='date'>#{moment(event.date).format("MMM Do YYYY")}</p>
        <p class='event'>#{event.description}</p>
      </div>
      """

    """
      <li class='marker marker#{id} stage#{stage}' data-id=#{id} style='left:#{xPoint}px'> #{tooltip} <div style='background-color:#{stageCol}' class='markerInner'></div></li>
    """

window.App.Timeline = Timeline