
" デフォルトキーマップ 有効/無効
let g:tcomment_maps = 1
let g:tcomment_opleader1 = 'mc'
let g:tcommentMapLeaderOp2 = 'mC'
" コメント解除時に右側スペースを削除
let g:tcomment#rstrip_on_uncmment = 2

call tcomment#type#Define('xonsh', '# %s')

finish


" マッピング
  " let g:tcommentMapLeader1 =
  " let g:tcommentMapLeader2 =
  " let g:tcommentMapLeaderOp1 =
  " let g:tcommentMapLeaderUncommentAnyway = 
  " let g:tcommentMapLeaderCommentAnyway   = 
  " let g:tcommentTextObjectInlineComment  = 

" 挙動設定
  " 空行もコメントアウトするか
  " let g:tcomment#blank_lines = 2
  " コメントアウト次の挙動設定
  " >  コメントアウト時に右端に移動
  " >> 次の行に?
  " #  Insertコメント時，最初の文字に
  " let g:tcommentModeExtra = ''
  " オペレータの挙動設定
  " let g:tcommentOpModeExtra = ''
  " 
  " let g:tcommentOptions = {'col': 1}

" その他，
" コメントフォーマット推定オプション大量
