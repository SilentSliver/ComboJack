# Hackintosh combojack support for alc256/alc255/alc298 on macOS 11 BigSur.
Confirmed to work on DELL XPS 15 9560(alc298)
1. Delete CodecCommander.kext，put ComboJack_Installer/VerbStub.kext in `kexts` folder;
2. Run ComboJack_Installer/install.sh in terminal and reboot;
3. Done. When you attach a headphone there will be a popup asking about headphone type.

# 黑苹果macOS 11 BigSur中alc256/alc255/alc298的耳麦支持
在XPS 15 9560（alc298）上测试可用
1. 删除 CodecCommander.kext，把ComboJack_Installer文件夹的VerbStub.kext放入Kexts文件夹中;
2. 终端运行 ComboJack_Installer/install.sh，重启;
3. 插入耳机的时候，会弹出对话框询问你插入的是耳机还是耳塞.
