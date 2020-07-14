#!/bin/bash

if [[ $EUID -ne 0 ]];
then
    exec sudo /bin/bash "$0" "$@"
fi

cd "$( dirname "${BASH_SOURCE[0]}" )"

# Clean legacy stuff
#
sudo launchctl unload /Library/LaunchDaemons/com.XPS.ComboJack.plist 2>/dev/null
sudo rm -rf /Library/Extensions/CodecCommander.kext
sudo rm -f /Library/Apple/usr/bin/ALCPlugFix
sudo rm -f /Library/LaunchAgents/good.win.ALCPlugFix
sudo rm -f /Library/LaunchDaemons/good.win.ALCPlugFix
sudo rm -f /usr/local/sbin/hda-verb
sudo rm -f /Library/Apple/usr/bin/hda-verb
sudo rm -f /usr/local/share/ComboJack/Headphone.icns
sudo rm -f /usr/local/share/ComboJack/l10n.json

# install
sudo cp ComboJack /Library/Apple/usr/bin
sudo chmod 755 /Library/Apple/usr/bin/ComboJack
sudo chown root:wheel /Library/Apple/usr/bin/ComboJack
sudo spctl --add /Library/Apple/usr/bin/ComboJack
sudo cp hda-verb /Library/Apple/usr/bin
#sudo chmod 755 /Library/Apple/usr/bin/hda-verb
#sudo chown root:wheel /Library/Apple/usr/bin/hda-verb
sudo mkdir -p /Library/Apple/usr/share/ComboJack/
sudo cp Headphone.icns /Library/Apple/usr/share/ComboJack/
sudo chmod 644 /Library/Apple/usr/share/ComboJack/Headphone.icns
sudo cp l10n.json /Library/Apple/usr/share/ComboJack/
sudo chmod 644 /Library/Apple/usr/share/ComboJack/l10n.json
sudo cp com.XPS.ComboJack.plist /Library/LaunchDaemons/
sudo chmod 644 /Library/LaunchDaemons/com.XPS.ComboJack.plist
sudo chown root:wheel /Library/LaunchDaemons/com.XPS.ComboJack.plist
sudo launchctl load /Library/LaunchDaemons/com.XPS.ComboJack.plist
echo
echo "Please reboot! Also, it may be a good idea to turn off \"Use"
echo "ambient noise reduction\" when using an input method other than"
echo "the internal mic (meaning line-in, headset mic). As always: YMMV."
echo
echo "You can check to see if the watcher is working in the IORegistry:"
echo "there should be a device named \"VerbStubUserClient\" attached to"
echo "\"com_XPS_SetVerb\" somewhere within the \"HDEF\" entry's hierarchy."
echo
echo "Enjoy!"
echo
exit 0
