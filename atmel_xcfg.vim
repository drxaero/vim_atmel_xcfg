" Vim syntax file
"
" This file is a syntax file in order to support
" Atmel XCFG format
"
" Author: Janus Cheng (janus.cheng@atmel.com)
" Date  : Jun. 29, 2014 
"

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

"highlight keywords
syntax keyword xcfgKeyword OBJECT_ADDRESS OBJECT_SIZE INSTANCE
syntax keyword xcfgTodo    contained TODO FIXME XXX

syntax keyword xcfgSect COMMENTS APPLICATION_INFO_HEADER VERSION_INFO_HEADER
syntax match   xcfgObjType "\[UNKNOWN_T\d\+"
syntax keyword xcfgObjType GEN_POWERCONFIG_T7
syntax keyword xcfgObjType GEN_ACQUISITIONCONFIG_T8
syntax keyword xcfgObjType SPT_COMMSCONFIG_T18
syntax keyword xcfgObjType SPT_GPIOPWM_T19
syntax keyword xcfgObjType SPT_SELFTEST_T25
syntax keyword xcfgObjType DEBUG_DIAGNOSTIC_T37
syntax keyword xcfgObjType SPT_USERDATA_T38
syntax keyword xcfgObjType PROCI_GRIPSUPPRESSION_T40
syntax keyword xcfgObjType PROCI_TOUCHSUPPRESSION_T42
syntax keyword xcfgObjType SPT_DIGITIZER_T43
syntax keyword xcfgObjType SPT_CTECONFIG_T46
syntax keyword xcfgObjType PROCI_STYLUS_T47
syntax keyword xcfgObjType PROCI_SHIELDLESS_T56
syntax keyword xcfgObjType SPT_TIMER_T61
syntax keyword xcfgObjType PROCI_LENSBENDING_T65
syntax keyword xcfgObjType SPT_SERIALDATACOMMAND_T68
syntax keyword xcfgObjType SPT_DYNAMICCONFIGURATIONCONTROLLER_T70
syntax keyword xcfgObjType SPT_DYNAMICCONFIGURATIONCONTAINER_T71
syntax keyword xcfgObjType PROCG_NOISESUPPRESSION_T72
syntax keyword xcfgObjType SPT_CTESCANCONFIG_T77
syntax keyword xcfgObjType PROCI_GLOVEDETECTION_T78
syntax keyword xcfgObjType SPT_TOUCHEVENTTRIGGER_T79
syntax keyword xcfgObjType PROCI_RETRANSMISSIONCOMPENSATION_T80
syntax keyword xcfgObjType PROCI_SYMBOLGESTUREPROCESSOR_T92
syntax keyword xcfgObjType TOUCH_MULTITOUCHSCREEN_T100
syntax keyword xcfgObjType SPT_TOUCHSCREENHOVER_T101
syntax keyword xcfgObjType SPT_AUXTOUCHCONFIG_T104
syntax keyword xcfgObjType PROCG_NOISESUPSELFCAP_T108
syntax keyword xcfgObjType SPT_SELFCAPGLOBALCONFIG_T109
syntax keyword xcfgObjType SPT_SELFCAPTUNINGPARAMS_T110
syntax keyword xcfgObjType SPT_SELFCAPCONFIG_T111
syntax keyword xcfgObjType SPT_SELFCAPMEASURECONFIG_T113

"syntax region  xcfgObjDescBlock start=/\v\[/ end=/\v\[/ fold transparent
"syntax match xcfgComment "\[COMMENTS\]\_.\{-}\["
syntax match  xcfgCommentSkip contained "^\s*"
syntax match  xcfgNumber      "\(\d\+\)\|\(0x[a-fA-F\d]\+\)" contained
"syntax region xcfgComment contained start="^\[COMMENTS\]"hs=s+2,ms=s+2 skip="^\s*$" end="^\["he=s-1,me=s-1 contains=xcfgTodo
syntax region xcfgComment   start="^\[COMMENTS\]\n"ms=s,hs=s end="\n^\[VERSION_INFO_HEADER\]"he=s contains=xcfgTodo contained 
syntax region xcfgObjDef    start="^\["ms=s-1 end="^\["me=e-1 contains=xcfgComment,xcfgObjType,xcfgSect, xcfgNumber,xcfgKeyword,xcfgStatementBlock fold 
"syntax region xcfgStatementBlock start="^\(\d\+\(\s\d\)\+\s\)\=\p\+=" end="$" contained contains=xcfgBitFieldAddrAndSize,xcfgStatement
syntax match  xcfgStatementBlock      "^\d.*$" contained contains=xcfgBitFieldAddr
syntax match  xcfgBitFieldAddr        "^\d\+" contained nextgroup=xcfgBitFieldSize skipwhite
syntax match  xcfgBitFieldSize        "\d\+" contained nextgroup=xcfgStatement skipwhite
syntax match  xcfgStatement           "\u\h.\{-}$" contained contains=xcfgVariable,xcfgOperator,xcfgNumber 
syntax match  xcfgVariable            "\u\h*" contained nextgroup=xcfgOperator skipwhite
syntax match  xcfgOperator            "=" contained nextgroup=xcfgNumber skipwhite



highlight link xcfgKeyword   Keyword
highlight link xcfgSect      Function
highlight link xcfgObjType   Function
highlight link xcfgVariable  Variable
highlight link xcfgComment   Comment
highlight link xcfgTodo      Todo
highlight link xcfgOperator  Operator
highlight link xcfgStatement Statement
highlight link xcfgNumber    Number
highlight link xcfgBitFieldAddr Identifier
highlight link xcfgBitFieldSize Number

let b:current_syntax = "atmel_xcfg"
