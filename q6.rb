
answer_count = 0
answer_target = []
end_flg = false

for target in 1..10000
	next unless target % 2 == 0
	start_target = target
	end_flg = false
	while end_flg == false

		# 偶数
		if start_target == target && target % 2 == 0
			target = target * 3 + 1
		end

		if target % 2 == 0
			target = target / 2
		else
			target = target * 3 + 1
		end

		if target == 1
			end_flg = true
		end
		if target == start_target
			end_flg = true
			answer_target << target
			answer_count += 1
		end
	end
end
p answer_target
p "answer : #{answer_count}"
