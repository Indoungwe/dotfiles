" Hello
" ============================================================================
" Базовые настройки редактора
" ============================================================================

" Кодировка по умолчанию 'utf-8'
set encoding=utf-8
" Язык интерфейса
set langmenu=ru_RU
let $LANG = 'ru_RU'

" Проверка орфографии
setlocal spell spelllang=en_us,ru_ru

" Настройки поиска совпадении
" подсвечивать все совпадения
set hlsearch
" очищать поисковый запрос после нажатия на 'Пробел'
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Автоматически перезапускает vimrc после сохранения
" для просмотра изменений без выхода из него
autocmd bufwritepost .vimrc source ~/.vimrc

" Автосохранение перед запуском команд
set autowrite
" Перезагрузка файлов измененных вне Vim
set autoread
" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !

" Позволяет двигать(на отступ в право или влево) выделенные блоки кода при
" помощи  зажатого 'Shift' + '<' или '>'
vnoremap < <gv
vnoremap > >gv

" Переназначить ';' на ':'
nnoremap ; :

" ============================================================================
" Оформление
" ============================================================================
" Поддержка 256 цветов
set t_Co=256
" Тема VIM
colorschem zenburn

" Выбор стандатного шрифта
set guifont=Inconsolata\ for\ Powerline:h24
set cursorline
set visualbell    " stop that ANNOYING beeping

" Подсветка синтаксиса
filetype on
filetype plugin indent on
syntax on

" Строки и нумерация
" Показывает длину строк и их нумерацию
set number " отображать номера строк справа
set relativenumber " Задать строке на которой находится курсор номер '0'
set tw=79 " ширина документа(длинна строки)
" не обрезать строки по длине автоматически во время открытия
set nowrap
" не обрезать текст во время печати
set fo-=t
" Подсвечивать символы если строка длиннее 80 символов
highlight OverLength ctermbg=gray ctermfg=white guibg=#592929
match OverLength /\%80v.*/

" Настройки пробелов и отступов.
" 4 пробела вместо табов
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
" Подсвечивать лишние пробелы в конце строки
set listchars=trail:·
set list

" ============================================================================
" Устанавливаем пакеты
" ============================================================================

" Установить менеджер пакетов:
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
" Вызов менеджера пакетов
call pathogen#infect()
call pathogen#helptags()

" Устанавливаем строку статуса
" cd ~/.vim/bundle
" git clone https://github.com/vim-airline/vim-airline.git
" Всегда показывать строку статуса
set laststatus=2
" Скрывать стандартный индикатор активного режима
set noshowmode
set noshowcmd
set noruler
" Показывать линию с вкладками даже есть существует только одна
set showtabline=2
" Тема строки статуса
" git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
let g:airline_theme='base16_default'
let g:airline_powerline_fonts = 1

" Устанавливаем плагин для быстрого поиска файлов после нажатия Ctrl+p
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" ============================================================================
" Python IDE
" ============================================================================

" Линтер
" cd ~/.vim/bundle
" git clone https://github.com/w0rp/ale.git
" Показывать ошибки в airline
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {'python': ['flake8'], 'javascript': ['eslint'], 'css': ['csslint'], 'html': ['tidy']}
let g:ale_linters_explicit = 1
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fix_on_save = 1

" YouCompleteMe подсказки к коду
" sudo apt-get install build-essential cmake
" sudo apt-get install python-dev python3-dev
" git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
" cd ~/.vim/bundle/YouCompleteMe
" git submodule update --init --recursive
" ./install.py --clang-completer

" Emmet подсказки к html
" cd ~/.vim/bundle
" git clone https://github.com/mattn/emmet-vim.git
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
"Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" TagBar навигация по классам/функциям/переменным
" sudo apt-get install ctags
" git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autoclose = 1

" NERDTree
" Древовидная структура папок
" git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
