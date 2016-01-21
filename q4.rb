n = 20
m = 3

list = []
for num in 1..n
	list << num
end

target = [list]

ans_count = 0
end_flg = false
while end_flg == false
	start_target_count = target.count

	for m_count in 1..m
		long_t = target[0]
		ling_index = 0
		for count in 0...target.count
			# 一番長い配列を探す
			if long_t.count < target[count].count
				long_t = target[count]
				ling_index = count
			end
		end

		# 一番長い配列の個数が１つの場合はそこで終了する
		if long_t.count == 1
			end_flg = true
			break
		end

		split_index = 0
		if long_t.count % 2 == 0
			split_index = long_t.count / 2
		else
			split_index = (long_t.count+1) / 2
		end

		a1 = long_t.slice(0...split_index)
		a2 = long_t.slice((split_index)...long_t.count)

		# 一番要素が長い配列を削除して、分解したものを追加する
		target.delete_at(ling_index)
		target << a1
		target << a2

		# m人全員が分解できない場合、分解上限に達したらこの回は終了する
		if start_target_count < m
			if start_target_count <= m_count
				p "break!!"
				break 
			end
		end
	end
	p target
	ans_count+=1
end
p "answer!#{ans_count}"