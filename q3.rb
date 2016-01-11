# 全て裏返しのカード配列を作成する
card = []
for num in 0...100
	card[num] = false
end

#️ カードを裏返す処理
for try_num in 1..100
	tmp_cnt = 0
	is_check = true
	chek_count = try_num

	card.each_index {|card_num|
		next unless try_num <= card_num
		if chek_count == card_num
			if card[card_num] == true
				card[card_num] = false
			else
				card[card_num] = true
			end
			chek_count = card_num + try_num + 1
		end
		tmp_cnt += 1
	}
end

ans = []
card.each_index {|card_num|
	# 問題は1から始まるカードだが、0から始まるカードで計算した為、最後に1を足す
	ans << (card_num + 1) if card[card_num] == false
}
p ans