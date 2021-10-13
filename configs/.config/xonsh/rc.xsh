# init starship prompt

aliases['g'] = 'git'
aliases['..'] = 'cd ./..'

aliases['l'] = 'ls -l --color'
aliases['la'] = 'ls -la --color'

#execx($(/usr/local/bin/starship init xonsh --print-full-init)))
xontrib load prompt_starship
