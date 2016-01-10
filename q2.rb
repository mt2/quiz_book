# 四則演算が１つのパターン
def check1(target_ar, check_target)
    for i in 1...4 do
        t1 = target_ar.values_at(0).join("").to_i
        t2 = target_ar.values_at(1,2,3).join("").to_i
        
        tmp = cal([t1, t2], i)
        p "answer![0] --> #{tmp}" if tmp == check_target

        t1 = target_ar.values_at(0,1).join("").to_i
        t2 = target_ar.values_at(2,3).join("").to_i

        tmp = cal([t1, t2], i)
        p "answer![1] --> #{tmp}" if tmp == check_target
        
        t1 = target_ar.values_at(0,1,2).join("").to_i
        t2 = target_ar.values_at(3).join("").to_i

        tmp = cal([t1, t2], i)
        p "answer![2] --> #{tmp}" if tmp == check_target
    end
end

# 四則演算が2つのパターン
def check2(target_ar, check_target)
    t1 = target_ar.values_at(0).join("").to_i
    t2 = target_ar.values_at(1,2).join("").to_i
    t3 = target_ar.values_at(3).join("").to_i
    
    tmp = cal2([t1,t2,t3])
    ans = tmp.find {|num| num == check_target }
    p "answer![3] --> #{ans}" unless ans.nil?

    t1 = target_ar.values_at(0,1).join("").to_i
    t2 = target_ar.values_at(2).join("").to_i
    t3 = target_ar.values_at(3).join("").to_i

    tmp = cal2([t1,t2,t3])
    ans = tmp.find {|num| num == check_target }
    p "answer![4] --> #{ans}" unless ans.nil?
    
    t1 = target_ar.values_at(0).join("").to_i
    t2 = target_ar.values_at(1).join("").to_i
    t3 = target_ar.values_at(2,3).join("").to_i

    tmp = cal2([t1,t2,t3])
    ans = tmp.find {|num| num == check_target }
    p "answer![5] --> #{ans}" unless ans.nil?
end

# 四則演算が3つのパターン
def check3(target_ar, check_target)

    ret = []
    t1 = target_ar[0].to_i
    t2 = target_ar[1].to_i
    t3 = target_ar[2].to_i
    t4 = target_ar[3].to_i
    
    ret << t1 + t2 + t3 + t4
    ret << t1 + t2 - t3 - t4
    ret << t1 + t2 - t3 + t4
    ret << t1 + t2 - t3 * t4
    ret << t1 + t2 * t3 * t4
    ret << t1 + t2 * t3 - t4
    ret << t1 + t2 * t3 + t4
    
    ret << t1 - t2 - t3 - t4
    ret << t1 - t2 + t3 + t4
    ret << t1 - t2 + t3 - t4
    ret << t1 - t2 + t3 * t4
    ret << t1 - t2 * t3 * t4
    ret << t1 - t2 * t3 - t4
    ret << t1 - t2 * t3 + t4

    ret << t1 * t2 * t3 * t4
    ret << t1 * t2 + t3 + t4
    ret << t1 * t2 + t3 - t4
    ret << t1 * t2 + t3 * t4
    ret << t1 * t2 * t3 * t4
    ret << t1 * t2 * t3 - t4
    ret << t1 * t2 * t3 + t4

    ans = ret.find {|num| num == check_target }
    p "answer![6] --> #{ans}" unless ans.nil?
end

def cal(ar, type)
    total = 0
    ar.each do |val|
        if total == 0
          total = val
          next
        end
        total += val if type == 1
        total -= val if type == 2
        total *= val if type == 3
    end

    total
end

def cal2(ar)
    ret = []
    
    ret << ar[0] + ar[1] + ar[2]
    ret << ar[0] + ar[1] - ar[2]
    ret << ar[0] + ar[1] * ar[2]

    ret << ar[0] - ar[1] + ar[2]
    ret << ar[0] - ar[1] - ar[2]
    ret << ar[0] - ar[1] * ar[2]
    
    ret << ar[0] * ar[1] + ar[2]
    ret << ar[0] * ar[1] - ar[2]
    ret << ar[0] * ar[1] * ar[2]

    ret
end

for target in 1000..9999 do
    check_target = target.to_s.split("").reverse.join("").to_i
    # 頭が0から始まる数は作れない
    next unless check_target.to_s.length == 4

    check1(target.to_s.split(""), check_target)
    check2(target.to_s.split(""), check_target)
    check3(target.to_s.split(""), check_target)
end

##########################
# best answer
##########################
# ※※rubyの場合0から始まる数値は8進数として扱われる為、0の場合の例外処理が必要
ops = ["+", "-", "*", "/", ""]
for target in 5931..5931 do
    tt = target.to_s.split("")
    check_target = target.to_s.split("").reverse.join("").to_i
    
    ops.each do |op1|
        ops.each do |op2|
            ops.each do |op3|
                cal = tt[0].to_s + op1 + tt[1].to_s + op2 + tt[2].to_s + op3 + tt[3].to_s
                r = eval cal
                p "target:#{target} --> #{r} : #{cal}" if check_target == r
            end
        end
    end
end
