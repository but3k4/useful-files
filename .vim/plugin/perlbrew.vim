" File: perlbrew.vim
" Author: Peter Aronoff <telemachus@arpinum.org>
" Version: 0.0.1
" Description: Show active Perlbrew-installed Perl version in Vim's statusline
" Last Change: 2011-02-13
" Note: Christopher Sexton's rvm.vim (https://github.com/csexton/rvm.vim) gave
" me the idea to write this. I also copied a lot of the code from there.  Any
" errors here are my own, but credit where credit is due.

" Exit quickly when:
" - this plugin was already loaded (or disabled)
" - when 'compatible' is set
if exists('g:loaded_perlbrew') || &cp
  finish
endif
let g:loaded_perlbrew = 1

let s:cpo_save = &cpo
set cpo&vim

" Code {{{1
function! perlbrew#statusline()
  let status = ''

  if !empty($PERLBREW_PERL)
    let status = $PERLBREW_PERL
    let status = substitute(status, 'perl-', '', '')
    let status = '['.status.']'
  endif

  if !empty(status)
    return status
  else
    return ''
  endif
endfunction

" Only display the ruby version if the filetype is ruby.
function! perlbrew#statusline_ft_perl()
  if &filetype=='perl'
    return perlbrew#statusline()
  else
    return ''
  endif
endfunction
" }}}1

let &cpo = s:cpo_save

" vim:set ft=vim ts=8 sw=2 sts=2:
