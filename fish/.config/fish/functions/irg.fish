set RG_PREFIX "rg --column --line-number --no-heading --color=always --smart-case "

if test (count $argv) -eq 0
    set INITIAL_QUERY ""
else
    set INITIAL_QUERY $argv
end
fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --bind "start:reload:$RG_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
    --delimiter : \
    --preview 'bat --color=always {1} --highlight-line {2}' \
    --bind 'enter:become(vi {1} +{2})'
