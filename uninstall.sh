#!/bin/bash

if [[ $EUID -ne 0 ]];
then
    exec sudo /bin/bash "$0" "$@"
fi

cd "$( dirname "${BASH_SOURCE[0]}" )"

# uninstall
sudo launchctl unload /Library/LaunchDaemons/com.XPS.ComboJack.plist
sudo rm /Library/LaunchDaemons/com.XPS.ComboJack.plist
sudo rm /Library/Apple/usr/share/ComboJack/l10n.json
sudo rm /Library/Apple/usr/share/ComboJack/Headphone.icns
sudo rm -r /Library/Apple/usr/share/ComboJack
sudo rm /Library/Apple/usr/bin/hda-verb
sudo spctl --remove /Library/Apple/usr/bin/ComboJack
sudo rm /Library/Apple/usr/bin/ComboJack
echo
echo "Please reboot! Remember to remove VerbStub.kext as well."
echo
exit 0
