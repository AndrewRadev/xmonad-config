if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <S-Tab> =BackwardsSnippet()
nmap  :NERDTreeClose | FF
nmap  gT
snoremap <silent> 	 i<Right>=TriggerSnippet()
nmap 	 >>
nmap  gt
nmap o <Plug>ZoomWin
snoremap  b<BS>
snoremap % b<BS>%
snoremap ' b<BS>'
nmap <silent> ,, :call LineCommenter()
nmap J 4j
nmap K 4k
xmap S <Plug>VSurround
snoremap U b<BS>U
vmap [% [%m'gv``
snoremap \ b<BS>\
nmap <silent> \dcp <Plug>DiffChangesPatchToggle
nmap <silent> \dcd <Plug>DiffChangesDiffToggle
nmap <silent> \slr :DBListVar
xmap <silent> \sa :DBVarRangeAssign
nmap <silent> \sap :'<,'>DBVarRangeAssign
nmap <silent> \sal :.,.DBVarRangeAssign
nmap <silent> \sas :1,$DBVarRangeAssign
nmap \so <Plug>DBOrientationToggle
nmap \sh <Plug>DBHistory
nmap \slv <Plug>DBListView
nmap \slp <Plug>DBListProcedure
nmap \slt <Plug>DBListTable
xmap <silent> \slc :exec 'DBListColumn "'.DB_getVisualBlock().'"'
nmap \slc <Plug>DBListColumn
nmap \sbp <Plug>DBPromptForBufferParameters
nmap \sdpa <Plug>DBDescribeProcedureAskName
xmap <silent> \sdp :exec 'DBDescribeProcedure "'.DB_getVisualBlock().'"'
nmap \sdp <Plug>DBDescribeProcedure
nmap \sdta <Plug>DBDescribeTableAskName
xmap <silent> \sdt :exec 'DBDescribeTable "'.DB_getVisualBlock().'"'
nmap \sdt <Plug>DBDescribeTable
xmap <silent> \sT :exec 'DBSelectFromTableTopX "'.DB_getVisualBlock().'"'
nmap \sT <Plug>DBSelectFromTopXTable
nmap \sta <Plug>DBSelectFromTableAskName
nmap \stw <Plug>DBSelectFromTableWithWhere
xmap <silent> \st :exec 'DBSelectFromTable "'.DB_getVisualBlock().'"'
nmap \st <Plug>DBSelectFromTable
nmap <silent> \sep :'<,'>DBExecRangeSQL
nmap <silent> \sel :.,.DBExecRangeSQL
nmap <silent> \sea :1,$DBExecRangeSQL
nmap \sE <Plug>DBExecSQLUnderTopXCursor
nmap \se <Plug>DBExecSQLUnderCursor
xmap \sE <Plug>DBExecVisualTopXSQL
xmap \se <Plug>DBExecVisualSQL
map \rwp <Plug>RestoreWinPosn
map \swp <Plug>SaveWinPosn
nmap \caL <Plug>CalendarH
nmap \cal <Plug>CalendarV
vmap <silent> \vR <Plug>EgMapReplaceSelection_R
nmap <silent> \vR <Plug>EgMapReplaceCurrentWord_R
omap <silent> \vR <Plug>EgMapReplaceCurrentWord_R
vmap <silent> \vr <Plug>EgMapReplaceSelection_r
nmap <silent> \vr <Plug>EgMapReplaceCurrentWord_r
omap <silent> \vr <Plug>EgMapReplaceCurrentWord_r
vmap <silent> \vA <Plug>EgMapGrepSelection_A
nmap <silent> \vA <Plug>EgMapGrepCurrentWord_A
omap <silent> \vA <Plug>EgMapGrepCurrentWord_A
vmap <silent> \va <Plug>EgMapGrepSelection_a
nmap <silent> \va <Plug>EgMapGrepCurrentWord_a
omap <silent> \va <Plug>EgMapGrepCurrentWord_a
vmap <silent> \vV <Plug>EgMapGrepSelection_V
nmap <silent> \vV <Plug>EgMapGrepCurrentWord_V
omap <silent> \vV <Plug>EgMapGrepCurrentWord_V
vmap <silent> \vv <Plug>EgMapGrepSelection_v
nmap <silent> \vv <Plug>EgMapGrepCurrentWord_v
omap <silent> \vv <Plug>EgMapGrepCurrentWord_v
map <silent> \vo <Plug>EgMapGrepOptions
map \tt <Plug>AM_tt
map \tsq <Plug>AM_tsq
map \tsp <Plug>AM_tsp
map \tml <Plug>AM_tml
map \tab <Plug>AM_tab
map \m= <Plug>AM_m=
map \t@ <Plug>AM_t@
map \t~ <Plug>AM_t~
map \t? <Plug>AM_t?
map \w= <Plug>AM_w=
map \ts= <Plug>AM_ts=
map \ts< <Plug>AM_ts<
map \ts; <Plug>AM_ts;
map \ts: <Plug>AM_ts:
map \ts, <Plug>AM_ts,
map \t= <Plug>AM_t=
map \t< <Plug>AM_t<
map \t; <Plug>AM_t;
map \t: <Plug>AM_t:
map \t, <Plug>AM_t,
map \t# <Plug>AM_t#
map \t| <Plug>AM_t|
map \T~ <Plug>AM_T~
map \Tsp <Plug>AM_Tsp
map \Tab <Plug>AM_Tab
map \T@ <Plug>AM_T@
map \T? <Plug>AM_T?
map \T= <Plug>AM_T=
map \T< <Plug>AM_T<
map \T; <Plug>AM_T;
map \T: <Plug>AM_T:
map \Ts, <Plug>AM_Ts,
map \T, <Plug>AM_T,o
map \T# <Plug>AM_T#
map \T| <Plug>AM_T|
map \Htd <Plug>AM_Htd
map \anum <Plug>AM_aunum
map \aunum <Plug>AM_aenum
map \afnc <Plug>AM_afnc
map \adef <Plug>AM_adef
map \adec <Plug>AM_adec
map \ascom <Plug>AM_ascom
map \aocom <Plug>AM_aocom
map \adcom <Plug>AM_adcom
map \acom <Plug>AM_acom
map \abox <Plug>AM_abox
map \a( <Plug>AM_a(
map \a= <Plug>AM_a=
map \a< <Plug>AM_a<
map \a, <Plug>AM_a,
map \a? <Plug>AM_a?
vmap ]% ]%m'gv``
snoremap ^ b<BS>^
map _lang :emenu ]LANGUAGES_GHC.
map _opt :emenu ]OPTIONS_GHC.
map _ie :call GHC_MkImportsExplicit()
map _ct :call GHC_CreateTagfile()
map _si :call GHC_ShowInfo()
map _t :call GHC_ShowType(0)
map _T :call GHC_ShowType(1)
map _iqm :call Import(1,1)
map _iq :call Import(0,1)
map _im :call Import(1,0)
map _i :call Import(0,0)
map _. :call Qualify()
map _?2 :call HaskellSearchEngine('hayoo!')
map _?1 :call HaskellSearchEngine('hoogle')
map _?? :let es=g:haskell_search_engines |echo "g:haskell_search_engines" |for e in keys(es) |echo e.' : '.es[e] |endfor
map _? :call Haddock()
snoremap ` b<BS>`
vmap a% [%v]%
nmap cs <Plug>Csurround
nmap ds <Plug>Dsurround
nmap gx <Plug>NetrwBrowseX
nmap gl l
nmap gk k
nmap gj j
nmap gh h
nmap gu :Utl
nmap gn :NERDTreeToggle
nnoremap j gj
nnoremap k gk
xmap s <Plug>Vsurround
nnoremap sw :set wrap! | set wrap?
nnoremap sh :set hlsearch! | set hlsearch?
nnoremap sl :set list! | set list?
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
snoremap <Left> bi
snoremap <Right> a
snoremap <BS> b<BS>
snoremap <silent> <S-Tab> i<Right>=BackwardsSnippet()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nnoremap <SNR>26_DiffChangesPatchToggle :DiffChangesPatchToggle
nnoremap <SNR>26_DiffChangesDiffToggle :DiffChangesDiffToggle
nmap <silent> <Plug>RestoreWinPosn :call RestoreWinPosn()
nmap <silent> <Plug>SaveWinPosn :call SaveWinPosn()
nmap <silent> <Plug>CalendarH :cal Calendar(1)
nmap <silent> <Plug>CalendarV :cal Calendar(0)
nmap <SNR>13_WE <Plug>AlignMapsWrapperEnd
map <SNR>13_WS <Plug>AlignMapsWrapperStart
nmap <S-Tab> <<
nnoremap <BS> 
imap  :NERDTreeClose | FF
imap S <Plug>ISurround
imap s <Plug>Isurround
inoremap <silent> 	 =TriggerSnippet()
inoremap <NL> 
inoremap  
inoremap <silent> 	 =ShowAvailableSnips()
imap  <Plug>Isurround
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set background=dark
set backspace=indent,eol,start
set backupdir=~/.backup/
set balloonexpr=GHC_TypeBalloon()
set clipboard=unnamed
set completeopt=longest,menuone
set diffopt=filler,vertical
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set guifont=Andale\ Mono\ 14
set guioptions=crb
set helplang=en
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set omnifunc=GHC_CompleteImports
set path=./**
set ruler
set shellpipe=2>
set shiftround
set shiftwidth=2
set shortmess=aTI
set showbreak=+>
set showcmd
set sidescroll=4
set smartcase
set smarttab
set softtabstop=2
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set noswapfile
set tabstop=2
set wildmenu
" vim: set ft=vim :
