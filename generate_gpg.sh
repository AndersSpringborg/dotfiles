logInfo "Generating ssh key";
logStatus "At the prompt, specify the kind of key you want, or press Enter to accept the default RSA and RSA";
logStatus "Your key must be at least 4096 bits.";
gpg --full-generate-key
# finds and copys the GPG key ID, in ASCII armor format
gpg --list-secret-keys --keyid-format LONG | grep -Po '(?<=sec\s{3}rsa4096\/)[\w\d]*' | gpg --armor --export | cb
logStatus "Your public gpg key is now added to your clipboard. Go to your host(fx. Github) and paste it";
