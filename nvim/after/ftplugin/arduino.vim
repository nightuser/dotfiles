nnoremap <buffer> <localleader>m :ArduinoVerify<CR>
nnoremap <buffer> <localleader>u :ArduinoUpload<CR>
nnoremap <buffer> <localleader>s :ArduinoSerial<CR>
nnoremap <buffer> <localleader>d :ArduinoUploadAndSerial<CR>
nnoremap <buffer> <localleader>b :ArduinoChooseBoard<CR>
nnoremap <buffer> <localleader>p :ArduinoChooseProgrammer<CR>

let g:arduino_dir = '/usr/share/arduino'

function! MyStatusLine()
  let port = arduino#GetPort()
  let line = '%f [' . g:arduino_board . '] [' . g:arduino_programmer . ']'
  if !empty(port)
    let line = line . ' (' . port . ':' . g:arduino_serial_baud . ')'
  endif
  return line
endfunction
setlocal statusline=%!MyStatusLine()
setlocal laststatus=2
