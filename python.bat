@bash.exe -c "echo '%*' | sed 's_\\\\_/_g' | sed -r 's_^(.)(:)_/mnt/\\L\\1_g' | xargs python3"
