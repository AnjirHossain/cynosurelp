# lil ting
TaskText.y = 380

tmp_flow = new FlowComponent
tmp_flow.showNext(VP_2_Mobile)

# ring animation config
ring_anim = new Animation
	layer: Ring
	properties: { rotation: 360 }
	repeat: Infinity
	time: 4
	curve: Bezier.linear
	
ring_anim_2 = new Animation
	layer: Ring_2
	properties: { rotation: -360 }
	repeat: Infinity
	time: 4.8
	curve: Bezier.linear
	
ring_anim_3 = new Animation
	layer: Ring_3
	properties: { rotation: 360 }
	repeat: Infinity
	time: 4.5
	curve: Bezier.linear
		
# wireup ring animation
ring_anim.start()
ring_anim_2.start()
ring_anim_3.start()

# clock config
minval = 25
secval = 0
	
getValLabel = (val) ->
	if val < 10
		return '0' + val
	else
		return val
		
minval_label = getValLabel(minval)
secval_label = getValLabel(secval)

updateClockVals = ->
	if secval > 0
		secval -= 1
		secval_label = getValLabel(secval)
		sec.childrenWithName('label')[0].text = secval_label
	else
		secval = 59
		minval -= 1
		minval_label = getValLabel(minval)
		secval_label = getValLabel(secval)
		sec.childrenWithName('label')[0].text = secval_label
		min.childrenWithName('label')[0].text = minval_label

start_clock = ->
	if minval == 0
		min.childrenWithName('label')[0].text = '00'
		sec.childrenWithName('label')[0].text = '00'
		return
	
	Utils.delay 1, ->
		updateClockVals()

	return start_clock()
	
