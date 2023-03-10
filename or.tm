# OR.tm
# 二つのビットパターンのORを返す


# 入力例
# 0101|0011=
# -> 0111


# q_0 1つ目で判定し交代

q_0, 0', 0', R, q_0
q_0,  0, 0', R, q_1


# q_1 1つ目で0だった時の伝達

q_1,  0,  0, R, q_1
q_1,  1,  1, R, q_1
q_1, 0', 0', R, q_1
q_1, 1', 1', R, q_1
q_1,  |,  |, R, q_2


# q_2 1つ目で0だった時2つ目で判定し交代

q_2, 0', 0', R, q_2
q_2, 1', 1', R, q_2
q_2,  0, 0', R, q_3
q_2,  1, 1', R, q_4


# q_3 2つ目で0だった時の伝達

q_3,  0,  0, R, q_3
q_3,  1,  1, R, q_3
q_3, 0', 0', R, q_3
q_3, 1', 1', R, q_3
q_3,  =,  =, R, q_3
q_3,  _,  0, L, q_B


# q_4 2つ目で1だった時の伝達

q_4,  0,  0, R, q_4
q_4,  1,  1, R, q_4
q_4, 0', 0', R, q_4
q_4, 1', 1', R, q_4
q_4,  =,  =, R, q_4
q_4,  _,  1, L, q_B


# q_B |まで戻る

q_B,  0,  0, L, q_B
q_B,  1,  1, L, q_B
q_B, 0', 0', L, q_B
q_B, 1', 1', L, q_B
q_B,  =,  =, L, q_D
q_B,  |,  |, L, q_R


# q_D '= となっているかどうか判定

q_D,  0,  0, L, q_B
q_D,  1,  1, L, q_B
q_D, 0', 0', L, q_F
q_D, 1', 1', L, q_F


# q_R '付きの文字まで戻る

q_R,  0,  0, L, q_R
q_R,  1,  1, L, q_R
q_R, 0', 0', R, q_0
q_R, 1', 1', R, q_0


# q_F 終了した時の戻る＆’を外す役

q_F,  0, 0, L, q_F
q_F,  1, 1, L, q_F
q_F, 0', 0, L, q_F
q_F, 1', 1, L, q_F
q_F,  |, |, L, q_F
q_F,  _, _, R, q_acc
