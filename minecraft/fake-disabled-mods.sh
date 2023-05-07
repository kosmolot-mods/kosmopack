#!/bin/bash -e

exec 3>patch-metadata.sh

echo 1>&3 "#!/bin/bash -e"
echo 1>&3 "sed \\"

for i in mods/*.disabled; do
	mv "$i" "${i%.disabled}"
	echo 1>&3 "-e 's#${i%.disabled}#$i#g' \\"
done

echo 1>&3 '-i "$1"'
