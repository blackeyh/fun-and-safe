extends Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set initial visibility or settings for the label
	self.visible = true  # Ensure the label is visible (optional)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.is_hurt:
		if get_tree().current_scene.name == "main":
		# Set the message about staying away from fire
			text = "لماذا يجب أن نبقى بعيدين عن النار؟"
		elif get_tree().current_scene.name == "level2":
			text = "لماذا يجب أن نحذر من المياه العميقة؟"
		elif get_tree().current_scene.name == "level3":
			text ="لماذا يجب أن نحذر على الطريق؟"
		elif get_tree().current_scene.name == "level4":
			text = "لماذا يجب أن نتعامل بحرص مع الادوات الحادة "
		elif get_tree().current_scene.name == "level5":
			text = "لماذا يجب أن ننتبه للطعام اللذى نأكله؟"
		elif get_tree().current_scene.name == "level6":
			text = "لماذا يجب أن ننتبه لألعابنا؟"

	# Check if the current scene is "main"
	elif get_tree().current_scene.name == "main" and Global.hurtbuttonpressed == true:

		# Check conditions and set the appropriate text based on coin_count
		if Global.coin_count <= 3:
			text = "احرص على إبقاء مسافة 30 سنتيميتر بينك وبين أي نيران مشتعلة"
		elif Global.coin_count <= 6:
			text = "لا تعلب أبدًا باللولاعات أو أعواد الثقاب"
		elif Global.coin_count <= 9:
			text = "احذر من اللعب في أماكن تواجد المدافئ"
		elif Global.coin_count <= 12:
			text = "لا تلعب بالقرب من الشموع"
		elif Global.coin_count <= 15:
			text = "لا تفتح باب الفرن بنفسك"
	
	# Check if the current scene is "level2"
	elif get_tree().current_scene.name == "level2" and Global.hurtbuttonpressed == true:
		# Check conditions and set the appropriate text based on coin_count for level2
		if Global.coin_count <= 3:
			text = "لا تقترب من حواف المسابح أو البرك."
		elif Global.coin_count <= 6:
			text = "لا تلعب بالقرب من البرك أو الأنهار أو البحر دون أن يكون معك شخص بالغ،فالماء قد يكون عميقًا أو به تيارات قد تجذبك."
		elif Global.coin_count <= 9:
			text = "إذا أردت السباحة ، فارتدِ سترة النجاة دائما"
		elif Global.coin_count <= 12:
			text = "لا تلعب بالقرب من الأمواج القوية"
	
	# Check if the current scene is "level3"
	elif get_tree().current_scene.name == "level3" and Global.hurtbuttonpressed == true:
		# Check conditions and set the appropriate text based on coin_count for level3
		if Global.coin_count <= 3:
			text = "دائماً امشِ على الرصيف بعيداً عن السيارات."
		elif Global.coin_count <= 6:
			text = "انتظر حتى تتحول إشارة المشاة إلى الأخضر قبل عبور الشارع."
		elif Global.coin_count <= 9:
			text = "اعبر الشارع عند ممرات المشاة المحددة فقط."
		elif Global.coin_count <= 12:
			text = "توقف و انظر قبل أن تعبر الطريق"
		elif Global.coin_count <= 15:
			text = "امسك دائما بيد شخص بالغ عند العبور"
	# Check if the current scene is "level4"
	elif get_tree().current_scene.name == "level4" and Global.hurtbuttonpressed == true:
		# Check conditions and set the appropriate text based on coin_count for level4
		if Global.coin_count <= 3:
			text = "الأدوات الحادة مثل السكاكين أو المقصات يمكن أن تسبب إصابات خطيرة. لا تلمسها أو تستخدمها من دون إشراف شخص بالغ"
		elif Global.coin_count <= 6:
			text = "إذا كنت بحاجة إلى استخدام أداة حادة ، فاجعلها بعيدة عن وجهك"
		elif Global.coin_count <= 9:
			text = "عندما تستخدم الأدوات الحادة ، ركز جيداً ولا تشتت انتباهك"
		elif Global.coin_count <= 12:
			text = "إذا أسقطت سكين أو مقص لا تحاول التقاطها بنفسك اطلب المساعدة من شخص كبير"
		elif Global.coin_count <= 15:
			text = "لا تقترب من والديك أثناء تعاملهما مع الأدوات الحادة"
	elif get_tree().current_scene.name == "level5" and Global.hurtbuttonpressed == true:
		# Check conditions and set the appropriate text based on coin_count for level4
		if Global.coin_count <= 3:
			text = "تحقق دائماًمن تواريخ الصلاحية قبل تناول الطعام"
		elif Global.coin_count <= 6:
			text = " لا تلعب أو تجري أثناء الأكل ، اجلس واستمتع بوجبتك بسلام"
		elif Global.coin_count <= 9:
			text = "اغسل يديك جيداً قبل تناول الطعام"
		elif Global.coin_count <= 12:
			text = "لا تترك الطعام خارج الثلاجة لفترة طويلة"
		elif Global.coin_count <= 15:
			text = "غطِّ طعامك جيداً ؛ لحمياته من الحشرات والغبار"
	elif get_tree().current_scene.name == "level6" and Global.hurtbuttonpressed == true:
		# Check conditions and set the appropriate text based on coin_count for level4
		if Global.coin_count <= 3:
			text = "لا تضع الألعاب الصغيرة في فمك ؛ لأنها قد تسبب الاختناق"
		elif Global.coin_count <= 6:
			text = "تأكد من تنظيف المكان بعد أن تنتهي من اللعب ولا تتكرك ألعابك على الأرض"
		elif Global.coin_count <= 9:
			text = "احذر أثناء لعبك بألعابك من أن تبتلعها"
		elif Global.coin_count <= 12:
			text = "لا تقذف الألعاب على صديقك عند اللعب"
	# Check if the current scene is "main"
	elif get_tree().current_scene.name == "main" and Global.hurtbuttonpressed == true:

		# Check conditions and set the appropriate text based on coin_count
		if Global.coin_count <= 3:
			text = "احرص على إبقاء مسافة 30 سنتيميتر بينك وبين أي نيران مشتعلة"
		elif Global.coin_count <= 6:
			text = "لا تعلب أبدًا باللولاعات أو أعواد الثقاب"
		elif Global.coin_count <= 9:
			text = "احذر من اللعب في أماكن تواجد المدافئ"
		elif Global.coin_count <= 12:
			text = "لا تلعب بالقرب من الشموع"
		elif Global.coin_count <= 15:
			text = "لا تفتح باب الفرن بنفسك"
	
	# Check if the current scene is "level2"
	elif get_tree().current_scene.name == "level2" and Global.hurtbuttonpressed == true:
		# Check conditions and set the appropriate text based on coin_count for level2
		if Global.coin_count <= 3:
			text = "لا تقترب من حواف المسابح أو البرك."
		elif Global.coin_count <= 6:
			text = "لا تلعب بالقرب من البرك أو الأنهار أو البحر دون أن يكون معك شخص بالغ،فالماء قد يكون عميقًا أو به تيارات قد تجذبك."
		elif Global.coin_count <= 9:
			text = "إذا أردت السباحة ، فارتدِ سترة النجاة دائما"
		elif Global.coin_count <= 12:
			text = "لا تلعب بالقرب من الأمواج القوية"
	
	# Check if the current scene is "level3"
	elif get_tree().current_scene.name == "level3" and Global.hurtbuttonpressed == true:
		# Check conditions and set the appropriate text based on coin_count for level3
		if Global.coin_count <= 3:
			text = "دائماً امشِ على الرصيف بعيداً عن السيارات."
		elif Global.coin_count <= 6:
			text = "انتظر حتى تتحول إشارة المشاة إلى الأخضر قبل عبور الشارع."
		elif Global.coin_count <= 9:
			text = "اعبر الشارع عند ممرات المشاة المحددة فقط."
		elif Global.coin_count <= 12:
			text = "توقف و انظر قبل أن تعبر الطريق"
		elif Global.coin_count <= 15:
			text = "امسك دائما بيد شخص بالغ عند العبور"
	# Check if the current scene is "level4"
	elif get_tree().current_scene.name == "level4" and Global.hurtbuttonpressed == true:
		# Check conditions and set the appropriate text based on coin_count for level4
		if Global.coin_count <= 3:
			text = "الأدوات الحادة مثل السكاكين أو المقصات يمكن أن تسبب إصابات خطيرة. لا تلمسها أو تستخدمها من دون إشراف شخص بالغ"
		elif Global.coin_count <= 6:
			text = "إذا كنت بحاجة إلى استخدام أداة حادة ، فاجعلها بعيدة عن وجهك"
		elif Global.coin_count <= 9:
			text = "عندما تستخدم الأدوات الحادة ، ركز جيداً ولا تشتت انتباهك"
		elif Global.coin_count <= 12:
			text = "إذا أسقطت سكين أو مقص لا تحاول التقاطها بنفسك اطلب المساعدة من شخص كبير"
		elif Global.coin_count <= 15:
			text = "لا تقترب من والديك أثناء تعاملهما مع الأدوات الحادة"
	elif get_tree().current_scene.name == "level5" and Global.hurtbuttonpressed == true:
		# Check conditions and set the appropriate text based on coin_count for level4
		if Global.coin_count <= 3:
			text = "تحقق دائماًمن تواريخ الصلاحية قبل تناول الطعام"
		elif Global.coin_count <= 6:
			text = " لا تلعب أو تجري أثناء الأكل ، اجلس واستمتع بوجبتك بسلام"
		elif Global.coin_count <= 9:
			text = "اغسل يديك جيداً قبل تناول الطعام"
		elif Global.coin_count <= 12:
			text = "لا تترك الطعام خارج الثلاجة لفترة طويلة"
		elif Global.coin_count <= 15:
			text = "غطِّ طعامك جيداً ؛ لحمياته من الحشرات والغبار"
	elif get_tree().current_scene.name == "level6" and Global.hurtbuttonpressed == true:
		# Check conditions and set the appropriate text based on coin_count for level4
		if Global.coin_count <= 3:
			text = "لا تضع الألعاب الصغيرة في فمك ؛ لأنها قد تسبب الاختناق"
		elif Global.coin_count <= 6:
			text = "تأكد من تنظيف المكان بعد أن تنتهي من اللعب ولا تتكرك ألعابك على الأرض"
		elif Global.coin_count <= 9:
			text = "احذر أثناء لعبك بألعابك من أن تبتلعها"
		elif Global.coin_count <= 12:
			text = "لا تقذف الألعاب على صديقك عند اللعب"
	# Check if the current scene is "main"
	elif get_tree().current_scene.name == "main" and Global.hurtbuttonpressed == true:

		# Check conditions and set the appropriate text based on coin_count
		if Global.coin_count <= 3:
			text = "احرص على إبقاء مسافة 30 سنتيميتر بينك وبين أي نيران مشتعلة"
		elif Global.coin_count <= 6:
			text = "لا تعلب أبدا باللولاعات أو أعواد الثقاب"
		elif Global.coin_count <= 9:
			text = "احذر من اللعب في أماكن تواجد المدافئ"
		elif Global.coin_count <= 12:
			text = "لا تلعب بالقرب من الشموع"
		elif Global.coin_count <= 15:
			text = "لا تفتح باب الفرن بنفسك"
	
	# Check if the current scene is "level2"
	elif get_tree().current_scene.name == "level2" and Global.hurtbuttonpressed == true:
		# Check conditions and set the appropriate text based on coin_count for level2
		if Global.coin_count <= 3:
			text = "لا تقترب من حواف المسابح أو البرك العميقة."
		elif Global.coin_count <= 6:
			text = "لا تلعب بالقرب من البرك أو الأنهار أو البحر دون أن يكون معك شخص بالغ،فالماء قد يكون عميقًا أو به تيارات قد تجذبك."
		elif Global.coin_count <= 9:
			text = "إذا أردت السباحة ، فارتدِ سترة النجاة دائما"
		elif Global.coin_count <= 12:
			text = "لا تلعب بالقرب من الأمواج القوية"
		elif Global.coin_count <= 15:
			text = "لا تدفع اصدقائك فالماء"
	
	# Check if the current scene is "level3"
	elif get_tree().current_scene.name == "level3" and Global.hurtbuttonpressed == true:
		# Check conditions and set the appropriate text based on coin_count for level3
		if Global.coin_count <= 3:
			text = "دائماً امشِ على الرصيف بعيداً عن السيارات."
		elif Global.coin_count <= 6:
			text = "انتظر حتى تتحول إشارة المشاة إلى الأخضر قبل عبور الشارع."
		elif Global.coin_count <= 9:
			text = "اعبر الشارع عند ممرات المشاة المحددة فقط."
		elif Global.coin_count <= 12:
			text = "توقف و انظر قبل ان تعبر الطريق"
		elif Global.coin_count <= 15:
			text = "امسك دائما بيد شخص بالغ عند العبور"
	# Check if the current scene is "level4"
	elif get_tree().current_scene.name == "level4" and Global.hurtbuttonpressed == true:
		# Check conditions and set the appropriate text based on coin_count for level4
		if Global.coin_count <= 3:
			text = "الأدوات الحادة مثل السكاكين أو المقصات يمكن أن تسبب إصابات خطيرة. لا تلمسها أو تستخدمها من دون إشراف شخص بالغ"
		elif Global.coin_count <= 6:
			text = "إذا كنت بحاجة إلى استخدام أداة حادة ، فاجعلها بعيدة عن وجهك"
		elif Global.coin_count <= 9:
			text = "عندما تستخدم الأدوات الحادة ، ركز جيدا ولا تشتت انتباهك"
		elif Global.coin_count <= 12:
			text = "اذا سقطت سكين او مقص لا تحاول التقاطها بنفسك اطلب المساعدة من شخص كبير"
		elif Global.coin_count <= 15:
			text = "لا تقترب من والديك اثناء تعاملهما مع الادوات الحادة"
	elif get_tree().current_scene.name == "level5" and Global.hurtbuttonpressed == true:
		# Check conditions and set the appropriate text based on coin_count for level4
		if Global.coin_count <= 3:
			text = "تحقق دائما من تواريخ الصلاحية قبل تناول الطعام"
		elif Global.coin_count <= 6:
			text = " لا تلعب أو تجري أثناء الأكل ، اجلس واستمتع بوجبتك بسلام"
		elif Global.coin_count <= 9:
			text = "اغسل يديك جيداً قبل تناول الطعام"
		elif Global.coin_count <= 12:
			text = "لا تترك الطعام خارج الثلاجة لفترة طويلة"
		elif Global.coin_count <= 15:
			text = "غطِّ طعامك جيداً ؛ لحمياته من الحشرات والغبار"
	elif get_tree().current_scene.name == "level6" and Global.hurtbuttonpressed == true:
		# Check conditions and set the appropriate text based on coin_count for level4
		if Global.coin_count <= 3:
			text = "لا تضع الألعاب الصغيرة في فمك ؛ لإنها قد تسبب الاختناق"
		elif Global.coin_count <= 6:
			text = "تاكد من تنظيف المكان بعد ان تنتهى من اللعب ولا تتكرك العابك على الأرض"
		elif Global.coin_count <= 9:
			text = "احذر وانت تمشى فالبيت لكى لا تدس على العابك"
		elif Global.coin_count <= 12:
			text = "لا ترمى الالعاب على صديقك عند اللعب"
		elif Global.coin_count <= 15:
			text = "لا تضع الالعاب فى فمك او عينيك"
