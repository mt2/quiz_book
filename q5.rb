
answer_count = 0
max_chane_count = 15

for change_count in 0..max_chane_count
	t = (10 * change_count)
	if t == 1000
		p "total_1000---------"
		p "type :10  count :[#{change_count}]"
		p "-------------------"
		answer_count += 1
		break
	elsif t > 1000
		break
	end

	limit = max_chane_count - change_count
    for change_count2 in 0..limit
    	t = (10 * change_count) + (50 * change_count2) 
		if t == 1000
			p "total_1000---------"
			p "type :10  count :[#{change_count}]"
			p "type :50  count :[#{change_count2}]"
			p "-------------------"
			answer_count += 1
			break
		elsif t > 1000
			break
		end

    	limit2 = limit - change_count2
		 for change_count3 in 0..limit2
		 	t = (10 * change_count) + (50 * change_count2) + (100 * change_count3)
			if t == 1000
				p "total_1000---------"
				p "type :10  count :[#{change_count}]"
				p "type :50  count :[#{change_count2}]"
				p "type :100 count :[#{change_count3}]"
				p "-------------------"
				answer_count += 1
				break
			elsif t > 1000
				break
			end

		 	limit3 = limit2 - change_count3
		 	for change_count4 in 0..limit3
		 		t = (10 * change_count) + (50 * change_count2) + (100 * change_count3) + (500 * change_count4)
		 		if t == 1000
					p "total_1000---------"
					p "type :10  count :[#{change_count}]"
					p "type :50  count :[#{change_count2}]"
					p "type :100 count :[#{change_count3}]"
					p "type :500 count :[#{change_count4}]"
					p "-------------------"
					answer_count += 1
					total = 0
					break
				elsif t > 1000
					break
				end
		 	end
		 end
    end
end

p "answer_count >> #{answer_count}"

