function! PlayBack(reg)
    execute("nmap j j")
    execute("nmap k k")
    execute("normal! @".a:reg)
	execute("nmap j <Plug>(accelerated_jk_j)")
	execute("nmap k <Plug>(accelerated_jk_k)")
endfunction

nmap @a :call PlayBack("a")<CR>
nmap @b :call PlayBack("b")<CR>
nmap @c :call PlayBack("c")<CR>
nmap @d :call PlayBack("d")<CR>
nmap @e :call PlayBack("e")<CR>
nmap @f :call PlayBack("f")<CR>
nmap @g :call PlayBack("g")<CR>
nmap @h :call PlayBack("h")<CR>
nmap @i :call PlayBack("i")<CR>
nmap @j :call PlayBack("j")<CR>
nmap @k :call PlayBack("k")<CR>
nmap @l :call PlayBack("p")<CR>
nmap @m :call PlayBack("m")<CR>
nmap @n :call PlayBack("n")<CR>
nmap @o :call PlayBack("o")<CR>
nmap @p :call PlayBack("p")<CR>
nmap @q :call PlayBack("q")<CR>
nmap @r :call PlayBack("r")<CR>
nmap @s :call PlayBack("s")<CR>
nmap @t :call PlayBack("t")<CR>
nmap @u :call PlayBack("u")<CR>
nmap @v :call PlayBack("v")<CR>
nmap @w :call PlayBack("w")<CR>
nmap @x :call PlayBack("p")<CR>
nmap @y :call PlayBack("y")<CR>
nmap @z :call PlayBack("z")<CR>

nmap @A :call PlayBack("A")<CR>
nmap @B :call PlayBack("B")<CR>
nmap @C :call PlayBack("C")<CR>
nmap @D :call PlayBack("D")<CR>
nmap @E :call PlayBack("E")<CR>
nmap @F :call PlayBack("F")<CR>
nmap @G :call PlayBack("G")<CR>
nmap @H :call PlayBack("H")<CR>
nmap @I :call PlayBack("I")<CR>
nmap @J :call PlayBack("J")<CR>
nmap @K :call PlayBack("K")<CR>
nmap @L :call PlayBack("L")<CR>
nmap @M :call PlayBack("M")<CR>
nmap @N :call PlayBack("N")<CR>
nmap @O :call PlayBack("O")<CR>
nmap @P :call PlayBack("P")<CR>
nmap @Q :call PlayBack("Q")<CR>
nmap @R :call PlayBack("R")<CR>
nmap @S :call PlayBack("S")<CR>
nmap @T :call PlayBack("T")<CR>
nmap @U :call PlayBack("U")<CR>
nmap @V :call PlayBack("V")<CR>
nmap @W :call PlayBack("W")<CR>
nmap @X :call PlayBack("X")<CR>
nmap @Y :call PlayBack("Y")<CR>
nmap @Z :call PlayBack("Z")<CR>

nmap @" :call PlayBack('"')<CR>


