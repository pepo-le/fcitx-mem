scriptencoding utf-8

if exists('g:loaded_fcitxmem')
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

if has("unix")
    if has("gui_running")
        function! ImActivate(active)
          if a:active
            call system('fcitx-remote -o')
          else
            call system('fcitx-remote -c')
          endif
        endfunction

        function! ImStatus()
          return system('fcitx-remote')[0] is# '2'
        endfunction

        set imactivatefunc=ImActivate
        set imstatusfunc=ImStatus
    else
        function! InsLeave()
            let s:input_status = system("fcitx-remote")
            if s:input_status == 2
                let l:a = system("fcitx-remote -c")
                let b:input_toggle = 1
            endif
        endfunction

        function! InsEnter()
            let s:input_status = system("fcitx-remote")
            if s:input_status != 2 && b:input_toggle == 1
                let l:a = system("fcitx-remote -o")
                let b:input_toggle = 0
            endif
        endfunction

        autocmd BufWinEnter * let b:input_toggle = 0

        autocmd InsertEnter * call InsEnter()
        autocmd InsertLeave * call InsLeave()
    endif
endif

let &cpo = s:save_cpo
unlet s:save_cpo

let g:leaded_fcitxmem = 1
