ssh-keygen -t ed25519 -C "aaspringborg@gmail.com"
eval "$(ssh-agent -s)" # start the ssh agent in the background
ssh-add ~/.ssh/id_ed25519
xclip -selection clipboard < ~/.ssh/id_ed25519.pub #copy the public tag
echo "Your public ssh key is now added to your clipboard. Go to your host(fx. Github) and paste it"
