
begin
 player0y = 110: player1y=110:  missile0y=110: score=0 
 COLUPF = 28
 COLUBK = 00
 scorecolor  =  00

 playfield:
 ..XXXX.XX.XX.XXX...XX..XX.XXXX..
 ...XX..XX.XX.XX....XX..XX.XX....
 ...XX..XXXXX.XXX...XX..XX.XX....
 ...XX..XX.XX.XX....XX..XX.XX....
 ...XX..XX.XX.XXX...XXXXXX.XXXX..
 ................................
 ................................
 .....XXXXXX..........XXXXXX.....
 ....XXX..XXXXXXXXXXXXXX..XXX....
 ...XXX.........XX.........XXX...
 ...............XX...............
end

intro
 if joy0fire then goto rules
 if switchreset then goto begin
 drawscreen
 goto intro

rules
 i = 0  : rem intro counter 
 scorecolor  =  126
 COLUP0 = 30

 player0:
 %01100001
 %10010001
 %10001001
 %10000110
 %00000000
 %00000001
 %00000001
 %11111111
 %00000001
 %00000001
 %00000000
 %11111111
 %01000000
 %00110000
 %00001100
 %00000010
 %11111111
 %00000000
 %11111111
 %00000000
 %01111110
 %10000001
 %10000001
 %01111110
 %00000000
 %00000110
 %00001001
 %00001001
 %11111111
 %00000000
 %00000000
 %01111110
 %10000001
 %10000001
 %10000001
 %01111110
 %00000000
 %01111110
 %10000001
 %10000001
 %10000001
 %01111110
 %00000000
 %11111111
 %00000001
 %00000010
 %00000100
 %00000000
 %00000000
 %00000001
 %00000001
 %11111111
 %00000001
 %00000001
 %00000000
 %10001001
 %10001001
 %10001001
 %11111111
 %00000000
 %01110010
 %10010001
 %10000001
 %01111111
end

 player1:
 %00000001
 %00000001
 %11111111
 %00000001
 %00000001
 %00000000
 %11111111
 %00001000
 %00001000
 %11111111
 %00000000
 %01110010
 %10010001
 %10000001
 %01111110
 %00000000
 %11111111
 %00000000
 %11000110
 %00101001
 %00011001
 %11111111
 %00000000
 %00100100
 %00000000
 %01100001
 %10010001
 %10001001
 %10000110
 %00000000
 %01100001
 %10010001
 %10001001
 %10000110
 %00000000
 %10001001
 %10001001
 %10001001
 %11111111
 %00000000
 %11000110
 %00101001
 %00011001
 %11111111
 %00000000
 %00001110
 %00001001
 %00001001
 %11111111
end
 player0x  =  130 :  player0y =  75
 player1x  =  110 :  player1y =  69

Info
 if i = 0 then playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 ................................
 ..................X.............
 ..................XX............
 .XXXXXXXXXXXXXXXXXXXX...........
 ..................XX............
 ..................X.............
 ................................
 ................................
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end

 if i = 25 then playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end

 i = i + 1
 if i = 50 then i = 0

 if joy0right then goto start
 drawscreen
 goto Info


start
 player1x= 0: player1y  =  0
 COLUBK  =  00
 COLUPF  =  12
 s = 1  : rem spped
 b = 0  : rem background counter
 p  =  0  : rem sprite apperance counter
 x  =  20 :  y = 65  : rem starting position
 m = 0 :  n = 0   : rem x and y position of missile
 c = 0  : rem checks if missle is shot
 d = 0  : rem missole flight counter
 v = 0  : rem chechs if there is an enemy
 f = 1 : rem type of enemy
 q=0 : rem score counter cause normal have issues
 k=0 : rem missile delay
 t=0 : rem checks if target where shot

the_loop
 r= rand : rem choice of enemy
 e= rand : rem choice of enemy posiotion
 if b = 0 then playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 ................................
 ................................
 ................................
 .XXXXXX...XXXXXX...XXXXXX...XXXX
 ................................
 ................................
 ................................
 ................................
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end
 if b = 8 then playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 ................................
 ................................
 ................................
 XXXX...XXXXXX...XXXXXX...XXXXXX.
 ................................
 ................................
 ................................
 ................................
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end
 if b = 16 then playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 ................................
 ................................
 ................................
 X...XXXXXX...XXXXXX...XXXXXX...X
 ................................
 ................................
 ................................
 ................................
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end

end
 b = b + s
 if b >= 24 then b = 0

set_player
 COLUP0 = 30
 if p = 0 then player0:
 %01000010
 %10100101
 %01010010
 %00111100
 %00010010
 %00001100
 %00000011
 %00000011
end
 if p = 25 then player0:
 %01000010
 %10100101
 %01001010
 %00111100
 %00010010
 %00001100
 %00000011
 %00000011
end
 p  =  p + 1
 if p = 50 then p  =  0

set_enemy
 if v=0 then goto spawn

enemy_is_set
 if v=1 then goto move_enemy


main
 if q>= 50 then s=2
 if q>=100 then goto winner
 if f=0 then COLUP1 = 242
 if f=1 then COLUP1 = 212

 player0x  =  x :  player0y  =  y
 if joy0up  &&  y > 14 then y = y - 1
 if joy0down  &&  y < 78 then y = y + 1
 if joy0left  &&  x > 15 then x = x - 1
 if joy0right  &&  x < 80 then x = x + 1

 if c=0 then m=x+8:n=y-5 
 if joy0fire && k=0 then c=1
 if c=1 then goto shoot

continue

 if switchreset then goto begin
 drawscreen
 goto the_loop

shoot
 NUSIZ0 = $20
 if t=0 then missile0x = d+m: missile0y = n
 d=d+2
 if d>60 then d=0: c=0: missile0y=110: t=0
 goto continue

spawn
  f=1
 if r < 120 then f=0
 if f=0 then player1:
 %00011100
 %00111110
 %00111110
 %00111110
 %00111110
 %00111111
 %00111110
 %00111110
 %00111110
 %00111110
 %00111110
 %01111110
 %11111110
 %01111100
 %00111100
end
 if f=1 then player1:
 %01000010
 %10100101
 %01010010
 %00110010
 %01101110
 %01100100
 %01100010
 %01111100
 %00110000
 %00001100
 %00001100
end
 player1x=145
 if r<=63 then player1y=r+14
 if r>=64 && r<=123 then player1y=r+14-64
 if r>=124 && r<=187 then player1y=r+14-124
 if r>=188  then player1y=r+14-188
 v=1
 goto enemy_is_set

move_enemy
 if f=0 then player1x=player1x-s-s
 if f=1 then player1x=player1x-s
 if f=1 && player1x<6 && q>2 then v=0: score=score-3: q=q-3
 if f=1 && player1x<6 && q<=2 then v=0: score=0: q=0
 if f=0 && player1x<6 then v=0: score=score+s: q=q+s
 if collision(player0,player1) then goto death
 if collision(player1,missile0) then missile0y=110: t=1
 if f=1 && collision(player1,missile0) then v=0: score=score+5: q=q+5
 goto main

death
 COLUP0  =  66
 if f=0 then COLUP1 = 242
 if f=1 then COLUP1 = 212
 player0:
 %00110000
 %01110011
 %01110111
 %01111110
 %01111110
 %01111111
 %11111111
 %10111001
end
 if switchreset then goto begin
 drawscreen
 goto death

winner
 player0y = 110: player1y=110:  missile0y=110

 playfield:
 ................................
 ......XXXX...........XXXXXXX....
 ......XX.X...........XXX..XX....
 ......XXXX...........XXXXXXX....
 .....................XXXXXXX....
 ................................
 .............XXX................
 ..XX......................XX....
 ...XX....................XX.....
 .....XXXXXXXXXXXXXXXXXXXXX......
 ................................
end



 if switchreset then goto begin
 drawscreen
 goto winner

