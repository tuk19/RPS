
def start_rps(text)
    puts(text)
    puts("0(グー) 1(チョキ) 2(パー) 3(戦わない)")
    player_rps = gets.chomp.to_i
    return player_rps
end

def judg_hand(player_rps)
    if player_rps == 3 then
        puts("やっぱ、やーめた")
        exit
    else
        player_hand = rps_hand(player_rps)
    end
    
    puts("ぽい！")
    cp_rps= Random.rand(3)
    cp_hand = rps_hand(cp_rps)
    
    puts ("-----------------------------")
    puts("あなた：#{player_hand}を出しました")
    puts("相手：#{cp_hand}を出しました")
    puts ("-----------------------------")
    return player_rps, cp_rps
end

def rps_hand(num)
    hand = ""
    case num
        when 0
            hand = "グー"
        when 1
            hand ="チョキ"
        when 2
            hand = "パー"
    end
    return hand
end

def start_ltw(text)
    puts(text)
    puts("0(上) 1(下) 2(左) 3(右)")
    player_ltw = gets.chomp.to_i
    return player_ltw
end

def ltw_direction(num)
    ltw = ""
    case num
        when 0
            ltw = "上"
        when 1
            ltw = "下"
        when 2
            ltw = "左"
        when 3
            ltw = "右"
    end
    return ltw
end


winner = 0
player_dir = 5
cp_dir = 5

puts("じゃんけんしましょ")
while player_dir != cp_dir || winner == 0 do
    rps_text = "じゃんけん..."
    player_rps = start_rps(rps_text)
    while player_rps >= 4 do
        rps_text = "0~3を選んでください"
        player_rps = start_rps(rps_text)
    end

    player_rps, cp_rps = judg_hand(player_rps)

    while player_rps == cp_rps do
        rps_text = "あいこで..."
        player_rps = start_rps(rps_text)
        while player_rps >= 4 do
            rps_text = "0~3を選んでください"
            player_rps = start_rps(rps_text)
        end
        player_rps, cp_rps = judg_hand(player_rps)
    end

    if player_rps == 0 && cp_rps == 2 then
        player_rps = 3
    elsif player_rps == 2 && cp_rps == 0 then
        player_rps = -1
    end

    if player_rps < cp_rps then
        winner = 1
    elsif player_rps > cp_rps then
        winner = 2
    end
        
    ltw_text = "あっち向いて..."
    player_ltw = start_ltw(ltw_text)
    while player_ltw >= 4 do
        ltw_text = "0~3を選んでください"
        player_ltw = start_ltw(ltw_text)
    end

    player_dir = ltw_direction(player_ltw)
    cp_ltw = Random.rand(4)
    cp_dir = ltw_direction(cp_ltw)

    puts("ぽい")
    puts ("-----------------------------")
    puts("あなた：#{player_dir}")
    puts("相手：#{cp_dir}")
    puts ("-----------------------------")

    if player_dir == cp_dir then
        if winner == 1 then
            puts("あなたの勝ちです")
        elsif winner == 2 then
            puts("あなたの負けです")
        end
    end

end