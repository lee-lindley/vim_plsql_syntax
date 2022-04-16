# vim_plsql_syntax

Repository includes

    syntax/plsql.vim
    colors/lee.vim

The syntax file replaces the functionality of the plsql.vim file that ships with vim (it was last updated
for Oracle 9).

The colors file is a black background with shades of bold green for the various oracle keyword types, orangish
for quoted literals and numbers, yellowish green for operators and bright yellow for punctuation. Your program
name values (variables, procedure, function names and calls, etcl...) are cyan.  Comments are white and italic.

You can get a flavor for it from any PL/SQL code sample on [my blog pages](https://lee-lindley.github.io/)
as I also have a *rouge* lexer that follows mostly the same parsing rules along with a syntax.css
file for *rouge*/*jekyll* to display it with the same colors as *lee.vim*.

# Installation

The files are placed under your home directory. Do not put them in the common location under Program Files or /usr/local/share
because those can be clobbered by a reinstall or upgrade of vim.

If you are on Unix, create directories *~/.vim/syntax* and *~/.vim/colors* if they do not already exist. On windows it is your
%USERPROFILE% folder (usually C:\Users\YourLoginName) and below that *vimfiles/syntax*, *vimfiles/colors*.

These configuration files can be used independently. The plsql.vim file works just fine with elflord and other
color schemes that ship with vim. *lee.vim* uses more colors for more syntax distinctions. You may find that distracting
and choose to collapse the various keyword types into a single color

You might want to add the following to your *.vimrc* (or *_vimrc* file on windows):

    syntax enable
    colorschem lee
    au BufNewFile,BufRead *.sql,*.pls,*.tps,*.tpb,*.pks,*.pkb,*.pkg,*.trg syntax on
    au BufNewFile,BufRead *.sql,*.pls,*.tps,*.tpb,*.pks,*.pkb,*.pkg,*.trg set filetype=plsql

