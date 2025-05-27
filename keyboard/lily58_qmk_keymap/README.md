# QMK Keymap for Lily58 with TPS43 Touchpad

## Prerequisites

1. Install the QMK CLI:

```console
brew install qmk/qmk/qmk
```

2. Clone Holykeebs' fork of the QMK firmware repository. This fork includes
additional logic for the touchpad:

```console
qmk setup holykeebs/qmk_firmware
```

3. Go to the QMK firmware directory:

```console
cd ~/qmk_firmware
```

4. Switch to holykeebs' working branch:

```console
git checkout hk-master
```

5. Create a directory for the keymap and related configs:

```console
mkdir -p ~/qmk_firmware/keyboards/lily58/keymaps/lily58_qmk_keymap/
```

6. Copy these config files in this directory into the newly created directory above:

* `config.h`
* `keymap.c`
* `rules.mk`

> [!NOTE]
> For the baseline version of these files, refer to `~/qmk_firmware/keyboards/lily58/keymaps/hk/`.

## Updating Lily58's Keymap

1. Upload the current config `lily58_qmk_keymap.json` to the [QMK Configurator](https://config.qmk.fm).
2. Make any desired changes to the keymap using the configurator.
3. Download the updated keymap as a `.json` file.
4. Output the `.json` file to `keymap.c` format using the QMK CLI:

```console
qmk json2c ~/Downloads/lily58_qmk_keymap.json
```

5. In the output, copy the `keymaps` array and replace the existing one in
`keymap.c` in (1) this directory and (2) `keymaps/lily58_qmk_keymap/`.
6. Remove the main microcontroller (on the right side) from Lily58 with the
touchpad still connected, plug it into the computer, then put it into
bootloader mode by pressing the RESET button twice.
7. Compile and flash the firmware onto the microcontroller:

```console
make \
  lily58/rev1:lily58_qmk_keymap:flash \
  -e USER_NAME=holykeebs \
  -e POINTING_DEVICE=tps43 \
  -e POINTING_DEVICE_POSITION=right \
  -e TRACKBALL_RGB_RAINBOW=no \
  -e OLED=no \
  -j8
```

8. Repeat the last 2 steps with the other microcontroller.

## Resources

- [Holykeebs docs](https://docs.holykeebs.com/firmware)
- [QMK docs](https://docs.qmk.fm/#/)
