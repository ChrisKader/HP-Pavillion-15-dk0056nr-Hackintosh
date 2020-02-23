# Dell Inspiron 7591

- This build running on MacOs X
- Currently opencore tested in 10.14.6, 10.15.2

<p>
    <img style="border-radius: 8px" src="Images/Background.jpg">
</p>

# I. Detail

    Version:    7
    Date:       24/02/2020
    Support:    All BIOS
    Changelogs:
        - Combojack now auto select headset without show dialog
        - Clean spoof files in ACPI, optimize power after wake
        - Using WEG 1.3.7 beta for 4k vendor fix
        - Using SMBIOS 15,3 for 15" screen and H series
        - New framebuffer test (Old framebuffer has some bug in blur) - 10.15.X tested
        - Faster boot, better power usage
        - Update all kext to date
        - Update AppleALC with verb dumped from windows
        - No more panic in sleep
        - Update to @n-d-k Opencore 0.5.6:
            - Nice PickerUI for opencore
            - Only inject SSDT and SMBIOS for macos => windows free
        - Add PostInstall Script for bettery sleep
        - Add HPET fix

    Status: Stable

### <strong>Important</strong>:

- Disable auto power up on lid in BIOS, if not you will get black screen on wake up by lid. Thanks @magonzalez112

### <strong>For 4k screen</strong>:

> <del>Testing, dont have to change any value for now</del> > <br> <strong>WORKED on V7</strong>, thanks @kihsu for test this

# II. System specification

    1.Name:           Dell Inspiron 7591
    2.CPU:            Intel Core i5-9300H
    3.Graphic:        Intel UHD630
    4.Wifi/B:         Replaced with DW1820a
    5.Card Reader:    Realtek Memory Card Reader
    6.Camera:         DELL UVC HD
    7.Audio:          ALC295!
    8.Touchpad:       ELAN I2C ( Dell Precision Trackpad )
    9.Bios Version:   1.5.1

# III. Thing will not able to use

    1. DGPU Nvidia 1050 (Disabled through ssdt)
    2. Fingerprint (Disabled through usb inject)
    3. Intel wifi card (Only bluetooth for now)

# IV. Tested hardware

    + Speaker/Headphone work
    + Linein through headset work
    + Type C USB work (Thunderbolt not tested yet)
    + Type C Graphic output work
    + HDMI work (With audio if boot with pluged HDMI)
    + All usb port work
    + SD card reader work
    + Camera work
    + Trackpad smooth as F
    + Battery work
    + All function key expect above numpad work
    + Keyboard and numpad work normal
    + UHD630 work

# V. Benchmark

    + Cinebench R20: MC - 1810
    + Geekbench 5: MC - 4158, SC - 1031

# VI. Know problems

    1. Internal mic (Pls help me if you master of AppleHDA, other linux it dead too)
    2. HDMI audio ( Worked if boot with HDMI pluged and closed LID <Turn off internal screen>)
        > Internal screen will be black when HDMI audio work if you try to use it
    2. Audio sometime not working if mac installed in fast NVME drive, due to AppleALC bug (Testing with some fix...)

# VII. Important thing

    > All kext below should be updated from my git for this laptop:
        + AppleALC.kext ( Verb changed to support ALC295 in 7591, layout 13 modified to work with combojack )
            > Find it here: https://github.com/tctien342/AppleALC
            > Find Combojack here: https://github.com/tctien342/ComboJack
        + CustomPeripheral.kext ( Fake apple device, change it if you have different devices )
        + CPUFriendDataProvider.kext is for my 9300H, maybe it different for you, using https://github.com/stevezhengshiqi/one-key-cpufriend to regenerate it if your cpu is different.

    > After update or install MacOS: Please run rebuilt your kext ( Using Kext Utility or something can handle it ) for stablity.

# VIII. Step to install

    1. Prepair an Mac installer in USB with Opencore added ( Use unibeast to create it )
    2. Replace EFI folder in USB EFI partition with this shipped EFI folder
    3. Boot into USB and select MacOs installer
    4. After install success, run PostInstall/install.sh in terminal
    5. Then you need to mount EFI partition and replace it with shipped EFI
    6. After System EFI replaced by your EFI, Using Opencore Configurator to change SMBIOS, generate your serial and MBL
    7. Change MAC in nullEthernet with your new created one, see below

> Generate your SMBIOS using <a href="https://mackie100projects.altervista.org/opencore-configurator/">OpencoreConfigurator</a>

> Select MacBookPro15,2

<p>
    <img style="border-radius: 8px" src="Images/SMBIOS-select.png">
</p>

> Generate your MAC address in SSDT-RMNE if using NullEthernet

> You can make an MacAddress in <a href="https://www.browserling.com/tools/random-mac">Mac generator online</a>

> Goto EFI -> OC -> ACPI -> Edit SSDT-RMNE.dsl with MaciASL and replace MAC with your generated one

> Save as -> ACPI machine language (replace exited one)

<p>
    <img style="border-radius: 8px" src="Images/UpdateMac.png">
</p>

# IX. WIFI Replacement

> Please disable NullEthernet kext and Intel bluetooth kext if you replace compatiple card

    + Goto Config.plist -> Kernel and set NullEthernet, two Intel kext to NO (Uncheck) in Enabled field
    + Goto Config.plist -> ACPI -> SSDT-RMNE to NO (Uncheck) in Enabled field

## Using new card ( DW1820A tested)

### Using DW1820a

    + Mine is CN-0VW3T3 0x106B:0x0021, not tested in other version yet

<p align="center">
    <img src="Images/DW1820a-bootflag.png">
</p>

    + Delete # in DeviceProperties:
        + From: #PciRoot(0x0)/Pci(0x1d,0x6)/Pci(0x0,0x0)
        + Change to: PciRoot(0x0)/Pci(0x1d,0x6)/Pci(0x0,0x0)

<p align="center">
    <img src="Images/DW1820a-prop.png">
</p>

    + Go to Kernel -> Add and check 4 Brcm kext (Change Enabled to YES)

<p>
    <img style="border-radius: 8px" src="Images/DW1820a-kext.png">
</p>

<p>
    <img style="border-radius: 8px" src="Images/DW1820a-test.png">
</p>

    <> Other support card like DW1560 and DW1830 you can google and test it, much easy than DW1820A

## Using usb wifi

    + Suggest Comfast cf-811ac
    + Using https://github.com/chris1111/USB-Wireless-Utility to make it run in mojave and catalina

# Thanks

    + @bavariancake [https://github.com/bavariancake/XPS9570-macOS]
    + @sicreative [https://github.com/sicreative/VoltageShift]
    + @hackintosh-stuff [https://github.com/hackintosh-stuff/ComboJack]
    + @LuletterSoul [https://github.com/LuletterSoul/Dell-XPS-15-9570-macOS-Mojave]
    + @chris1111 [https://github.com/chris1111/USB-Wireless-Utility]
