# 回文かどうかチェックする関数
def check(target)
    is_check = false
    target_ar = target.to_s.split("")
    
    if target_ar.count.even?
        chack_count = target_ar.count / 2
    else
        chack_count = (target_ar.count - 1) / 2
    end
    
    start_val = []
    for num in 0...chack_count do
        start_val << target_ar[num]
    end
    
    end_val = []
    for num in (target_ar.count - chack_count)...target_ar.count do
        end_val << target_ar[num]
    end
    
    end_val = end_val.reverse

    is_check = true if start_val.join("") == end_val.join("")
    is_check
end

flg = false
target = 10
while flg == false do
    target+=1
    if check(target.to_s(2)) && check(target.to_s(8)) && check(target)
        flg = true 
        p target # 585
    end
end