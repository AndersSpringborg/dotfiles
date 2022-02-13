
sshFILE=~/.ssh/id_ed25519

if test -f "$sshFILE"; then
    logInfo "The ssh key:$sshFILE exists.";
else
    logInfo "Generating ssh key";
    ssh-keygen -t ed25519 -C "aaspringborg@gmail.com"; # change to read for opensource
    eval "$(ssh-agent -s)" ;# start the ssh agent in the background
    ssh-add ~/.ssh/id_ed25519;
    xclip -selection clipboard < ~/.ssh/id_ed25519.pub; #copy the public tag
    logStatus "Your public ssh key is now added to your clipboard. Go to your host(fx. Github) and paste it";
    read -p "Press enter to continue";
fi;

unset $sshFile