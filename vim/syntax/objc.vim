" Vim syntax file 
" Language:	    Objective C 
" Author:	    Xavier Glattard <xavier.glattard(a)online.fr> 
" Last Change:	    2008 Dec 7 

" For version 5.x: Clear all syntax items 
" For version 6.x: Quit when a syntax file was already loaded 
if version < 600 
  syntax clear 
elseif exists("b:current_syntax") 
  finish 
endif 

if &filetype != 'objcpp' 
  " Read the C syntax to start with 
  if version < 600 
    source <sfile>:p:h/c.vim 
  else 
    runtime! syntax/c.vim 
    unlet b:current_syntax 
  endif 
endif 

" Objective C extentions follow below 
" 
" NOTE: Objective C is abbreviated to ObjC/objc 
" and uses *.h, *.m as file extensions! 

if !exists("objc_no_atsign") 
  syn match objcSpecialCharacter display "@" 
endif 

if !exists("c_no_cformat") 
  syn match cFormat	display "%@" contained 
endif 

" ObjC keywords, types, type qualifiers etc. 
syn keyword objcKeyword	 self super _cmd in 
syn keyword objcType	 id Class SEL IMP 

syn keyword objcTypeModifier	bycopy byref in out inout oneway 
syn keyword objcPropertyModifier	copy assign retain readwrite readonly nonatomic getter setter 
syn keyword objcConstant	nil Nil 

syn keyword objcBooltype	BOOL 
syn keyword objcBoolvalues	YES NO 

syn match objcProtocolDecl transparent "@protocol\s+\i+\s*;" 

" Match the ObjC #import directive (like C's #include) 
syn region objcImported display contained start=+"+  skip=+\\\\\|\\"+  end=+"+ 
syn match  objcImported display contained "<[_0-9a-zA-Z.\/]*>" 
syn match  objcImport display "^\s*\%(%:\|#\)\s*import\>\s*["<]" contains=objcImported 

" Match the important ObjC directives 
syn keyword objcScopeDeclKeyword	public private protected contained 
syn keyword objcBlockKeyword    	interface implementation protocol contained 
syn keyword objcExceptionKeyword	try catch finally throw contained 
syn keyword objcDirectiveKeyword	class end defs	contained 
syn keyword objcDirectiveKeyword	encode protocol selector contained 
syn keyword objcDirectiveKeyword	synchronized contained 
syn keyword objcDirectiveKeyword	property synthetize dynamic 
syn cluster objcAtKeywords 
\ contains=objcScopeDeclKeyword,objcBlockKeyword,objcDirectiveKeyword,objcExceptionKeyword 

syn region objcAtKeyword start="@\<" end="\>" display 
\ contains=objcSpecialCharacter,@objcAtKeywords,objcWrongIdentifier 

" Match the ObjC method declaration / definition 

syn match objcMsgBadSelectorPart "[_a-zA-Z][_a-zA-Z0-9]*:"ms=e display contained 
syn cluster cMultiGroup add=objcMsgBadSelectorPart 

syn region objcMsgDeclArgType display contained 
\ matchgroup=cParen start="\>:\s*\%(\n\s*\)*(" end=")" 
\ contains=ALLBUT,@cParenGroup 
\ nextgroup=objcMsgDeclLongSelectorPart 
\ skipwhite skipempty skipnl 

syn region objcMsgDeclArgTypeAndName display contained 
\ matchgroup=cParen start="\>:\s*\%(\n\s*\)*(" end=")\s*\%(\n\s*\)*[_a-zA-Z][_a-zA-Z0-9]*\ze\%([^:]\|$\)" 
\ contains=ALLBUT,@cParenGroup 
\ nextgroup=objcMsgDeclLongSelectorPart 
\ skipwhite skipempty skipnl 
syn cluster cParenGroup add=objcMsgDeclArgTypeAndName 
syn cluster cMultiGroup add=objcMsgDeclArgTypeAndName 

syn match objcMsgDeclShortSelector "[_a-zA-Z][_a-zA-Z0-9]*" display contained 
\ nextgroup=cComment 
\ skipwhite skipempty skipnl 
syn cluster cParenGroup add=objcMsgDeclShortSelector 
syn cluster cMultiGroup add=objcMsgDeclShortSelector 

syn match objcMsgDeclLongSelectorPart "[_a-zA-Z][_a-zA-Z0-9]*:"me=e-1 display contained 
\ nextgroup=objcMsgDeclArgType,objcMsgDeclArgTypeAndName 
\ skipwhite skipempty skipnl 
syn cluster cParenGroup add=objcMsgDeclLongSelectorPart 
syn cluster cMultiGroup add=objcMsgDeclLongSelectorPart 

syn region objcMsgDeclType display contained transparent 
\ matchgroup=cParen start="[+-]\s*\%(\n\s*\)*(" end=")" 
\ contains=ALLBUT,@cParenGroup 
\ nextgroup=objcMsgDeclLongSelectorPart,objcMsgDeclShortSelector 
\ skipwhite skipempty skipnl 

syn cluster objcMsgDeclParts 
\ contains=objcMsgDeclType,objcMsgDeclLongSelectorPart,objcMsgDeclShortSelector,objcMsgDeclArgType,objcMsgDeclArgTypeAndName 

syn region objcMsgDecl display transparent 
\ start="^\s*[+-]" end=";" end="\ze{" 
\ contains=@objcMsgDeclParts,cComment,cCommentL 

" To distinguish from a header inclusion from a protocol list. 
syn match objcProtocol display "<\s*[_a-zA-Z][_a-zA-Z0-9]*\s*>" 
syn match objcCategory display "(\s*[_a-zA-Z][_a-zA-Z0-9]*\s*)" 

" Objective-C Constant Strings 
syn region objcString start=+\%(@"\|"\)+ skip=+\\\\\|\\"+ end=+"+ contains=cFormat,cSpecial,objcSpecial 

" Objective-C Message Expressions 

syn region objcMsgSending display transparent 
\ matchgroup=keyword start="\%(\>\s*\|[)]\s*\)\@<!\[" start="\%(return\s*\)\@<=\[" end="]" 
\ contains=ALLBUT,@cParenGroup,cErrInParen,cCppParen,cBracket,cCppBracket,@cLabelGroup,cUserCont,@objcAtKeywords 

syn region objcLongMsgSendingEnd display transparent contained 
\ start="\%([&+\-|_\\\^@=+*%!:/.,;]\s*\|\i\)\@<![_a-zA-Z][_a-zA-Z0-9]*:" end="]"me=s-1 
\ contains=ALLBUT,cErrInParen,cCppParen,cBracket,cCppBracket,objcShortSelectorPartInExpr,objcMsgDecl.*,@cLabelGroup,cUserCont,@objcAtKeywords 
\ containedin=objcMsgSending 
syn cluster cParenGroup add=objcLongMsgSendingEnd 
syn cluster cMultiGroup add=objcLongMsgSendingEnd 

syn match objcLongSelectorPartInExpr "\%([&+\-|_\\\^@=+*%!:/.,;]\s*\|\i\)\@<![_a-zA-Z][_a-zA-Z0-9]*:"he=e-1 display contained 
\ containedin=objcLongMsgSendingEnd 
syn cluster cParenGroup add=objcLongSelectorPartInExpr 
syn cluster cMultiGroup add=objcLongSelectorPartInExpr 

syn match objcShortSelectorPartInExpr "\%([&+\-|_\\\^@=+*%!:/.,;]\s*\|\i\)\@<![_a-zA-Z][_a-zA-Z0-9]*\ze\s*]" display contained 
\ containedin=objcMsgSending 
syn cluster cParenGroup add=objcShortSelectorPartInExpr 
syn cluster cMultiGroup add=objcShortSelectorPartInExpr 

" Special command @selector 
syn region objcAtSelectorCommand start="@selector\s*(" end=")" display 
\ contains=objcAtKeyword,objcMsgDeclLongSelectorPart,objcMsgDeclShortSelector,cError 

" Special command @property 
syn region objcAtSelectorCommand start="@property\s*(" end=")" display 
\ contains=objcAtKeyword,objcPropertyModifier,objcMsgDeclShortSelector 

syn sync match objcSync groupthere objcMsgDecl "^\s*[-+]" 

" Define the default highlighting. 
" For version 5.7 and earlier: only when not done already 
" For version 5.8 and later: only when an item doesn't have highlighting yet 
if version >= 508 || !exists("did_objc_syntax_inits") 
  if version < 508 
    let did_objc_syntax_inits = 1 
    command -nargs=+ HiLink hi link <args> 
  else 
    command -nargs=+ HiLink hi def link <args> 
  endif 

  HiLink objcSpecialCharacter	cSpecialCharacter 
  HiLink objcFormat	 cFormat 
  HiLink objcBooltype	 objcType 
  HiLink objcBoolvalues	 objcConstant 
  HiLink objcType	 cType 
  HiLink objcConstant	 cConstant 
  HiLink objcKeyword	 Keyword 
  HiLink objcScopeDeclKeyword	Keyword 
  HiLink objcBlockKeyword	Keyword 
  HiLink objcExceptionKeyword	Keyword 
  HiLink objcDirectiveKeyword	Keyword 
  HiLink objcImport	 Include 
  HiLink objcImported	 cString 
  HiLink objcTypeModifier	StorageClass 
  HiLink objcPropertyModifier	StorageClass 
  HiLink objcScopeDecl	 Statement 
  HiLink objcMsgDeclShortSelector	Function 
  HiLink objcMsgDeclLongSelectorPart	Function 
  HiLink objcShortSelectorPartInExpr	Function 
  HiLink objcLongSelectorPartInExpr	Function 
  HiLink objcStatement	 Statement 
  HiLink objcDirective	 Statement 
  HiLink objcException	 Exception 
  HiLink objcString	 cString 
  HiLink objcProtocol	 None 
  HiLink objcMsgBadSelectorPart	cError 

  delcommand HiLink 
endif 

let b:current_syntax = "objc" 

" vim: ts=8

