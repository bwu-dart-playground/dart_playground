find . -maxdepth 1 -type d -exec echo {} \; -exec sh -c "cd {}; pub upgrade --no-package-symlinks; cd .." \;
