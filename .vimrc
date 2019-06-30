" Подсветка синтаксиса
syntax on
" Настройка линтера
let g:ale_completion_enabled = 1 " Включить линтер
let g:ale_linters_explicit = 1
let b:ale_linters = {'python': ['flake8', 'pylint']} " Использовать для подсветки ошибок в python
let g:ale_fixers = {'python': ['autopep8','yapf']} " Автоформатирование python кода
let g:ale_fix_on_save = 1
let b:ale_warn_about_trailing_whitespace = 0 " Отключает предупреждение о лишних пробелах
" Настройка тображение ошибок
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Показывает длину строк и их нумерацию
set number " отображать номера строк справа
set relativenumber " Задать строке на которой находится курсор номер '0'
set tw=79 " ширина документа(длинна строки)
set nowrap " не обрезать строки по длине автоматически во время открытия
" не обрезать текст во время печати
set fo-=t
" Подсвечивать символы если строка длиннее 80 символов
highlight OverLength ctermbg=gray ctermfg=white guibg=#592929
match OverLength /\%80v.*/

set autoindent    " Включить автоматические отступы
set copyindent    " Копировать отступы с предыдущей строки

" Настройки пробелов и отступов.
set pastetoggle=<F2>    " по нажатию F2 переходит в режим вставки(нужно стобы не было проблем с отступами)
" 4 пробела вместо табов
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
" Подсвечивать лишние пробелы в конце строки
set listchars=trail:·
set list

" Кодировка по умолчанию 'utf-8'
set encoding=utf-8

" Настройки поиска совпадении
set hlsearch " подсвечивать все совпадения
set incsearch " подсвечивать найденое во время печати
" очищать поисковый запрос после нажатия на 'Пробел'
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Позволяет двигать(на отступ в право или влево) выделенные блоки кода при
" помощи  зажатого 'Shift' + '<' или '>'
vnoremap < <gv
vnoremap > >gv


" Настройки менеджера пакетов
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required

" Установленные плагины
Plugin 'VundleVim/Vundle.vim'
" Темы
Plugin 'Zenburn'
Plugin 'lightline'
" Линтер
Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype on
filetype plugin indent on    " required

" Темы
colorschem zenburn

" Поддержка 256 цветов
set t_Co=256
hi Normal guibg=NONE ctermbg=NONE
