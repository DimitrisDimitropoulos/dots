function ll
  if command -q eza
    eza -laho --no-filesize --no-user --color-scale --no-git --time-style iso --color=always $argv
  else
    ls -l $argv
  end
end
