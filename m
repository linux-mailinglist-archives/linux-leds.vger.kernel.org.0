Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D074438AB5
	for <lists+linux-leds@lfdr.de>; Sun, 24 Oct 2021 18:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbhJXQxT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 24 Oct 2021 12:53:19 -0400
Received: from mail-40131.protonmail.ch ([185.70.40.131]:18011 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbhJXQxT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 24 Oct 2021 12:53:19 -0400
Date:   Sun, 24 Oct 2021 16:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1635094251;
        bh=Bqy8QtekRH8aXxWWyX2Ua3j6/uIH5Afx6g5TBfkWnn0=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=BRVts1WihotsgpDa8A2NPviXBKYMx/idlwf5uRu2pvTqIjzPv2uhhes7pWwpjUqY2
         mzeUER2JItdeDiVm+lGzhDOZ3D6AO9tzlhVAcxO9IC+44Zp732yQFabpHcKJ29zG1D
         eoPVLx3U707E1hJel9UHze6eY4QgOtaQ24WLFv+c=
To:     Enver Balalic <balalic.enver@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     hdegoede@redhat.com, mgross@linux.intel.com, pavel@ucw.cz,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: add support for hp fourzone lighting
Message-ID: <-beJEK1G1H0OjntnmAkk16TlRylvhrHnS5CoJ3QVsPUDLlPuObskKTCR5eE5O-OqylRxXET5hA1f1WVaOJXNgdOCY3eEUHdhg5jempoWQdQ=@protonmail.com>
In-Reply-To: <20211024155817.5kvosvx5u5ok453p@omen.localdomain>
References: <20211024155817.5kvosvx5u5ok453p@omen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi


2021. okt=C3=B3ber 24., vas=C3=A1rnap 17:58 keltez=C3=A9ssel, Enver Balalic=
 =C3=ADrta:

> This patch adds support for HP Fourzone lighting.
> It exposes 2 things:
>  - General keyboard backlight On/Off control
>  - 4 RGB keyboard backlight zones as multicolor LED's
>
> This patch has been tested on a 2020 HP Omen 15 (AMD) 15-en0023dx.
>
> Signed-off-by: Enver Balalic <balalic.enver@gmail.com>
> ---
> There are a couple of things I'm unsure about with this patch:
>  - I exposed the 4 RGB keyboard backlight zones with names
>   "platform::kbd_backlight-1" up to 4, and the one general toggle
>   is "platform::kbd_backlight" is this the proper naming
>   scheme ?
>
>  - If the general keyboard backlight toggle is set to off, then
>   no matter what values are written into any of the zones, the
>   lights will be off, should we override the general backlight
>   toggle to On if you write a value into one of the zones ?
>
>  - If the general keyboard backlight toggle is set to On,
>   i set the zones brightness to 255, since it doesn't make sense
>   for that to be 0 while the backlight is on. I didn't find
>   an example of a multicolor led device having a brightness_get
>   function registered, so I don't know if this is the proper way
>   or if I should register a brightness_get function for each
>   of the zones and somehow figure out the brightness based on
>   the rgb value that the firmware reports ?
>
>  - The windows omen command center detects if you write zeros
>   to all 4 of the zones (black) but you set the general keyboard
>   backlight to On (as that might confuse someone into thinking
>   that their backlight is not working when in fact it's just
>   set to black) and overrides the black values to default values
>   where each of the zones is set to a different color. Should we
>   do the same in the kernel or leave that to some userspace tool ?
>
>
>  drivers/platform/x86/Kconfig  |   3 +
>  drivers/platform/x86/hp-wmi.c | 342 ++++++++++++++++++++++++++++++++++
>  2 files changed, 345 insertions(+)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 1ebce7b775f2..07411fcd0d4b 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -427,6 +427,9 @@ config HP_WMI
>  =09select INPUT_SPARSEKMAP
>  =09select ACPI_PLATFORM_PROFILE
>  =09select HWMON
> +=09select LEDS_CLASS
> +=09select NEW_LEDS
> +=09select LEDS_CLASS_MULTICOLOR
>  =09help
>  =09 Say Y here if you want to support WMI-based hotkeys on HP laptops an=
d
>  =09 to read data from WMI such as docking or ambient light sensor state.
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.=
c
> index 9c4c9f5095ae..87b4724d6b9f 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -27,6 +27,8 @@
>  #include <linux/rfkill.h>
>  #include <linux/string.h>
>  #include <linux/dmi.h>
> +#include <linux/leds.h>
> +#include <linux/led-class-multicolor.h>
>
>  MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
>  MODULE_DESCRIPTION("HP laptop WMI hotkeys driver");
> @@ -43,6 +45,14 @@ MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TAB=
LET_MODE reporting (-1=3Daut
>  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
>  #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
>
> +#define HP_FOURZONE_N_ZONES 4
> +#define HP_FOURZONE_LED_NUM_CHANNELS 3
> +#define HP_FOURZONE_OFFSET_COLORS 25
> +#define HP_FOURZONE_BUF_LEN 37
> +#define HP_FOURZONE_OFFSET_BRIGHTNESS 0
> +#define HP_FOURZONE_KBD_BL_ON 128
> +#define HP_FOURZONE_KBD_BL_OFF 0
> +
>  /* DMI board names of devices that should use the omen specific path for
>   * thermal profiles.
>   * This was obtained by taking a look in the windows omen command center
> @@ -61,6 +71,19 @@ static const char * const omen_thermal_profile_boards[=
] =3D {
>  =09"8917", "8918", "8949", "894A", "89EB"
>  };
>
> +/* DMI Board names of devices that have fourzone support.
> + * A device supports fourzone if the "Feature" array in the json file
> + * in windows omen command center contains "FourZone".
> + */
> +static const char * const fourzone_boards[] =3D {
> +=09"8466", "8467", "8468", "8469", "846A", "846B", "84DA", "84DB", "84DC=
",
> +=09"8574", "8575", "860A", "87B5", "8600", "8601", "8602", "8605", "8606=
",
> +=09"8607", "8746", "8747", "8749", "874A", "8603", "8604", "8748", "878A=
",
> +=09"878B", "878C", "88C8", "88CB", "8786", "8787", "8788", "88D1", "88D2=
",
> +=09"88F4", "88FD", "88F5", "88F6", "88F7", "88FE", "88FF", "8900", "8901=
",
> +=09"8902", "8912"
> +};
> +
>  enum hp_wmi_radio {
>  =09HPWMI_WIFI=09=3D 0x0,
>  =09HPWMI_BLUETOOTH=09=3D 0x1,
> @@ -117,11 +140,19 @@ enum hp_wmi_gm_commandtype {
>  =09HPWMI_FAN_SPEED_MAX_SET_QUERY =3D 0x27,
>  };
>
> +enum hp_wmi_lm_commandtype {
> +=09HPWMI_FOURZONE_ZONES_GET=09=3D 0x02,
> +=09HPWMI_FOURZONE_ZONES_SET=09=3D 0x03,
> +=09HPWMI_FOURZONE_KB_BACKLIGHT_GET=09=3D 0x04,
> +=09HPWMI_FOURZONE_KB_BACKLIGHT_SET=09=3D 0x05,
> +};
> +
>  enum hp_wmi_command {
>  =09HPWMI_READ=09=3D 0x01,
>  =09HPWMI_WRITE=09=3D 0x02,
>  =09HPWMI_ODM=09=3D 0x03,
>  =09HPWMI_GM=09=3D 0x20008,
> +=09HPWMI_LM=09=3D 0x20009,
>  };
>
>  enum hp_wmi_hardware_mask {
> @@ -200,6 +231,32 @@ static const struct key_entry hp_wmi_keymap[] =3D {
>  =09{ KE_END, 0 }
>  };
>
> +struct hp_wmi_fourzone_data {
> +=09struct {
> +=09=09unsigned int r;
> +=09=09unsigned int g;
> +=09=09unsigned int b;
> +=09} zone[HP_FOURZONE_N_ZONES];
> +};
> +
> +struct hp_fourzone_zone {
> +=09bool initialized;
> +=09struct led_classdev_mc mc_cdev;
> +=09struct mc_subled subled_info[HP_FOURZONE_LED_NUM_CHANNELS];
> +};
> +
> +struct hp_wmi_leds {
> +=09struct {
> +=09=09bool initialized;
> +=09=09struct led_classdev led;
> +=09=09unsigned int last_brightness;
> +=09} fourzone_kbd_bl;
> +
> +=09struct {
> +=09=09struct hp_fourzone_zone zones[HP_FOURZONE_N_ZONES];
> +=09} fourzone;
> +};
> +
>  static struct input_dev *hp_wmi_input_dev;
>  static struct platform_device *hp_wmi_platform_dev;
>  static struct platform_profile_handler platform_profile_handler;
> @@ -208,6 +265,7 @@ static bool platform_profile_support;
>  static struct rfkill *wifi_rfkill;
>  static struct rfkill *bluetooth_rfkill;
>  static struct rfkill *wwan_rfkill;
> +static struct hp_wmi_leds *hp_leds;
>
>  struct rfkill2_device {
>  =09u8 id;
> @@ -373,6 +431,18 @@ static int omen_thermal_profile_set(int mode)
>  =09return mode;
>  }
>
> +static bool is_fourzone_supported(void)
> +{
> +=09const char *board_name =3D dmi_get_system_info(DMI_BOARD_NAME);
> +
> +=09if (!board_name)
> +=09=09return false;
> +
> +=09return match_string(fourzone_boards,
> +=09=09=09    ARRAY_SIZE(fourzone_boards),
> +=09=09=09    board_name) >=3D 0;
> +}
> +
>  static bool is_omen_thermal_profile(void)
>  {
>  =09const char *board_name =3D dmi_get_system_info(DMI_BOARD_NAME);
> @@ -653,6 +723,8 @@ static struct attribute *hp_wmi_attrs[] =3D {
>  };
>  ATTRIBUTE_GROUPS(hp_wmi);
>
> +static void hp_wmi_fourzone_kbd_bl_notify(void);
> +
>  static void hp_wmi_notify(u32 value, void *context)
>  {
>  =09struct acpi_buffer response =3D { ACPI_ALLOCATE_BUFFER, NULL };
> @@ -754,6 +826,7 @@ static void hp_wmi_notify(u32 value, void *context)
>  =09case HPWMI_PROXIMITY_SENSOR:
>  =09=09break;
>  =09case HPWMI_BACKLIT_KB_BRIGHTNESS:
> +=09=09hp_wmi_fourzone_kbd_bl_notify();
>  =09=09break;
>  =09case HPWMI_PEAKSHIFT_PERIOD:
>  =09=09break;
> @@ -1114,6 +1187,269 @@ static int platform_profile_set(struct platform_p=
rofile_handler *pprof,
>  =09return 0;
>  }
>
> +static int hp_wmi_fourzone_get_zones_data(struct hp_wmi_fourzone_data *d=
ata)
> +{
> +=09int ret, i, zone;
> +=09unsigned char buf[HP_FOURZONE_BUF_LEN];
> +
> +=09ret =3D hp_wmi_perform_query(HPWMI_FOURZONE_ZONES_GET, HPWMI_LM,
> +=09=09=09=09   &buf, sizeof(buf),
> +=09=09=09=09   sizeof(buf));
> +
> +=09if (ret < 0)
> +=09=09return ret;

Only a return value of 0 means success. See the comment above `hp_wmi_perfo=
rm_query()`.


> +
> +=09for (i =3D 0; i < HP_FOURZONE_N_ZONES; i++) {
> +=09=09zone =3D HP_FOURZONE_OFFSET_COLORS + (i * 3);
> +
> +=09=09data->zone[i].r =3D buf[zone];
> +=09=09data->zone[i].g =3D buf[zone + 1];
> +=09=09data->zone[i].b =3D buf[zone + 2];
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int hp_wmi_fourzone_set_zones_data(struct hp_wmi_fourzone_data *d=
ata)
> +{
> +=09int i, zone;
> +=09unsigned char buf[HP_FOURZONE_BUF_LEN];
> +
> +=09for (i =3D 0; i < HP_FOURZONE_N_ZONES; i++) {
> +=09=09zone =3D HP_FOURZONE_OFFSET_COLORS + (i * 3);

Isn't it a problem that the first 25 bytes potentially contain random value=
s?
I think it would be better to explicitly clear them:

  unsigned char buf[HP_FOURZONE_BUF_LEN] =3D {0};

Maybe even in `hp_wmi_fourzone_get_zones_data()` as well.


> +
> +=09=09buf[zone] =3D data->zone[i].r;
> +=09=09buf[zone + 1] =3D data->zone[i].g;
> +=09=09buf[zone + 2] =3D data->zone[i].b;
> +=09}
> +
> +=09return hp_wmi_perform_query(HPWMI_FOURZONE_ZONES_SET, HPWMI_LM,
> +=09=09=09=09       &buf, sizeof(buf),
> +=09=09=09=09       sizeof(buf));
> +}
> +
> +static int hp_wmi_fourzone_set_zone_rgb(int zone, unsigned int r,
> +=09=09=09=09=09unsigned int g, unsigned int b)
> +{
> +=09int err;
> +=09struct hp_wmi_fourzone_data data;
> +
> +=09err =3D hp_wmi_fourzone_get_zones_data(&data);
> +=09if (err < 0)
> +=09=09return err;
> +
> +=09data.zone[zone].r =3D r;
> +=09data.zone[zone].g =3D g;
> +=09data.zone[zone].b =3D b;
> +
> +=09return hp_wmi_fourzone_set_zones_data(&data);
> +}
> +
> +static int hp_wmi_fourzone_cdev_set_zone(int zone, struct led_classdev *=
cdev,
> +=09=09=09=09=09 enum led_brightness brightness)
> +{
> +=09struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(cdev);
> +
> +=09led_mc_calc_color_components(mc_cdev, brightness);
> +
> +=09return hp_wmi_fourzone_set_zone_rgb(zone,
> +=09=09mc_cdev->subled_info[0].brightness,
> +=09=09mc_cdev->subled_info[1].brightness,
> +=09=09mc_cdev->subled_info[2].brightness);
> +}
> +
> +static int hp_wmi_cdev_fourzone_led_set_brightness_zone0(struct led_clas=
sdev *cdev,
> +=09=09=09=09=09=09=09 enum led_brightness brightness)
> +{
> +=09return hp_wmi_fourzone_cdev_set_zone(0, cdev, brightness);
> +}
> +
> +static int hp_wmi_cdev_fourzone_led_set_brightness_zone1(struct led_clas=
sdev *cdev,
> +=09=09=09=09=09=09=09 enum led_brightness brightness)
> +{
> +=09return hp_wmi_fourzone_cdev_set_zone(1, cdev, brightness);
> +}
> +
> +static int hp_wmi_cdev_fourzone_led_set_brightness_zone2(struct led_clas=
sdev *cdev,
> +=09=09=09=09=09=09=09 enum led_brightness brightness)
> +{
> +=09return hp_wmi_fourzone_cdev_set_zone(2, cdev, brightness);
> +}
> +
> +static int hp_wmi_cdev_fourzone_led_set_brightness_zone3(struct led_clas=
sdev *cdev,
> +=09=09=09=09=09=09=09 enum led_brightness brightness)
> +{
> +=09return hp_wmi_fourzone_cdev_set_zone(3, cdev, brightness);
> +}
> +
> +static int hp_wmi_fourzone_kbd_bl_get(void)
> +{
> +=09int val =3D 0, ret;
> +
> +=09ret =3D hp_wmi_perform_query(HPWMI_FOURZONE_KB_BACKLIGHT_GET, HPWMI_L=
M,
> +=09=09=09=09   &val, sizeof(val), sizeof(val));
> +
> +=09if (ret)
> +=09=09return ret < 0 ? ret : -EINVAL;
> +
> +=09return val =3D=3D HP_FOURZONE_KBD_BL_ON ? 1 : 0;
> +}
> +
> +static int hp_wmi_fourzone_kbd_bl_set(unsigned int brightness)
> +{
> +=09char kbd_bl_data[1] =3D { brightness ? HP_FOURZONE_KBD_BL_ON : HP_FOU=
RZONE_KBD_BL_OFF };
> +
> +=09int ret =3D hp_wmi_perform_query(HPWMI_FOURZONE_KB_BACKLIGHT_SET, HPW=
MI_LM,
> +=09=09=09=09       &kbd_bl_data, sizeof(kbd_bl_data),
> +=09=09=09=09       sizeof(kbd_bl_data));
> +
> +=09if (ret !=3D 0)
> +=09=09return -EINVAL;

The comment above `hp_wmi_perform_query()` says

   * returns zero on success
   *         an HP WMI query specific error code (which is positive)
   *         -EINVAL if the query was not successful at all
   *         -EINVAL if the output buffer size exceeds buffersize

So I think you should return `ret` as is if it's negative, and return e.g. =
-EIO
if it's positive. I am not sure `-EINVAL` is the best error code here.


> +
> +=09hp_leds->fourzone_kbd_bl.last_brightness =3D brightness;
> +
> +=09return brightness;
> +}
> +
> +static enum led_brightness hp_wmi_cdev_fourzone_kbd_bl_get(struct led_cl=
assdev *led_cdev)
> +{
> +=09return hp_wmi_fourzone_kbd_bl_get();
> +}
> +
> +static int hp_wmi_cdev_fourzone_kbd_bl_set(struct led_classdev *led_cdev=
,
> +=09=09=09=09=09   enum led_brightness brightness)
> +{
> +=09return hp_wmi_fourzone_kbd_bl_set(brightness);
> +}
> +
> +static int (*fourzone_cdev_zone_set[HP_FOURZONE_N_ZONES])(struct led_cla=
ssdev*,
> +=09=09=09=09=09=09  enum led_brightness) =3D {
> +=09&hp_wmi_cdev_fourzone_led_set_brightness_zone0,
> +=09&hp_wmi_cdev_fourzone_led_set_brightness_zone1,
> +=09&hp_wmi_cdev_fourzone_led_set_brightness_zone2,
> +=09&hp_wmi_cdev_fourzone_led_set_brightness_zone3,
> +};

I think you can use `mc_led =3D lcdev_to_mccdev(...)` to get the multicolor=
 LED,
then use `zone =3D container_of(mc_led, struct hp_fourzone_zone, mc_cdev)`
to get the `hp_fourzone_zone` struct, then `zone - hp_leds->fourzone.zones`
to get the index. There is no need for these four functions as far as I can=
 see.


> +
> +static void hp_wmi_fourzone_kbd_bl_notify(void)
> +{
> +=09int brightness;
> +

If the keyboard backlight is not supported, then `hp_leds` remains NULL, ri=
ght?
Can this function be called in that case?


> +=09if (!hp_leds->fourzone_kbd_bl.initialized)
> +=09=09return;
> +
> +=09brightness =3D hp_wmi_fourzone_kbd_bl_get();
> +=09if (brightness < 0)
> +=09=09return;
> +
> +=09if (brightness =3D=3D hp_leds->fourzone_kbd_bl.last_brightness)
> +=09=09return;
> +
> +=09hp_leds->fourzone_kbd_bl.last_brightness =3D brightness;
> +
> +=09led_classdev_notify_brightness_hw_changed(&hp_leds->fourzone_kbd_bl.l=
ed, brightness);
> +}
> +
> +static void fourzone_leds_exit(struct platform_device *device)
> +{
> +=09int i;
> +=09struct hp_fourzone_zone *zone;
> +
> +=09if (hp_leds->fourzone_kbd_bl.initialized) {
> +=09=09hp_leds->fourzone_kbd_bl.initialized =3D false;
> +=09=09led_classdev_unregister(&hp_leds->fourzone_kbd_bl.led);
> +=09}
> +
> +=09for (i =3D 0; i < HP_FOURZONE_N_ZONES; i++) {
> +=09=09zone =3D &hp_leds->fourzone.zones[i];
> +=09=09if (zone->initialized)
> +=09=09=09devm_led_classdev_multicolor_unregister(&device->dev,
> +=09=09=09=09=09=09=09=09&zone->mc_cdev);
> +=09}
> +}
> +
> +static int fourzone_leds_setup(struct platform_device *device)
> +{
> +=09int err, brightness, i, zones_brightness;
> +=09struct led_classdev *cdev;
> +=09struct hp_wmi_fourzone_data data;
> +=09struct hp_fourzone_zone *zone;
> +=09char name[64];
> +
> +=09hp_leds =3D devm_kzalloc(&device->dev, sizeof(*hp_leds), GFP_KERNEL);
> +=09if (!hp_leds)
> +=09=09return -ENOMEM;

Have you considered not dynamically allocating this struct?


> +
> +=09brightness =3D hp_wmi_fourzone_kbd_bl_get();
> +=09if (brightness < 0)
> +=09=09return brightness;
> +
> +=09hp_leds->fourzone_kbd_bl.last_brightness =3D brightness;
> +
> +=09hp_leds->fourzone_kbd_bl.led.name =3D "platform::" LED_FUNCTION_KBD_B=
ACKLIGHT;
> +=09hp_leds->fourzone_kbd_bl.led.brightness =3D brightness;
> +=09hp_leds->fourzone_kbd_bl.led.max_brightness =3D 1;
> +=09hp_leds->fourzone_kbd_bl.led.brightness_get =3D hp_wmi_cdev_fourzone_=
kbd_bl_get;
> +=09hp_leds->fourzone_kbd_bl.led.brightness_set_blocking =3D hp_wmi_cdev_=
fourzone_kbd_bl_set;
> +=09hp_leds->fourzone_kbd_bl.led.flags =3D LED_BRIGHT_HW_CHANGED | LED_RE=
TAIN_AT_SHUTDOWN;
> +
> +=09err =3D led_classdev_register(&device->dev, &hp_leds->fourzone_kbd_bl=
.led);
> +=09if (err)
> +=09=09return err;
> +
> +=09hp_leds->fourzone_kbd_bl.initialized =3D true;
> +
> +=09err =3D hp_wmi_fourzone_get_zones_data(&data);
> +=09if (err)
> +=09=09goto fail_fourzone;
> +
> +=09zones_brightness =3D brightness =3D=3D 1 ? 255 : 0;
> +
> +=09for (i =3D 0; i < HP_FOURZONE_N_ZONES; i++) {
> +=09=09zone =3D &hp_leds->fourzone.zones[i];
> +
> +=09=09zone->subled_info[0].color_index =3D LED_COLOR_ID_RED;
> +=09=09zone->subled_info[0].channel =3D 0;
> +=09=09zone->subled_info[0].intensity =3D data.zone[i].r;
> +
> +=09=09zone->subled_info[1].color_index =3D LED_COLOR_ID_GREEN;
> +=09=09zone->subled_info[1].channel =3D 1;
> +=09=09zone->subled_info[1].intensity =3D data.zone[i].g;
> +
> +=09=09zone->subled_info[2].color_index =3D LED_COLOR_ID_BLUE;
> +=09=09zone->subled_info[2].channel =3D 2;
> +=09=09zone->subled_info[2].intensity =3D data.zone[i].b;
> +
> +=09=09zone->mc_cdev.subled_info =3D zone->subled_info;
> +=09=09zone->mc_cdev.num_colors =3D HP_FOURZONE_LED_NUM_CHANNELS;
> +
> +=09=09cdev =3D &zone->mc_cdev.led_cdev;
> +=09=09cdev->flags =3D LED_RETAIN_AT_SHUTDOWN;
> +=09=09cdev->brightness =3D zones_brightness;
> +=09=09cdev->max_brightness =3D 255;
> +=09=09zone->mc_cdev.led_cdev.brightness_set_blocking =3D fourzone_cdev_z=
one_set[i];
> +=09=09snprintf(name, sizeof(name), "platform::%s-%i", LED_FUNCTION_KBD_B=
ACKLIGHT, i + 1);
> +=09=09cdev->name =3D name;
> +
> +=09=09err =3D devm_led_classdev_multicolor_register_ext(&device->dev,
> +=09=09=09=09=09=09=09=09&zone->mc_cdev,
> +=09=09=09=09=09=09=09=09NULL);
> +
> +=09=09if (err) {
> +=09=09=09dev_err(&device->dev, "Cannot register fourzone zone %i LED: %i=
\n", i, err);
> +=09=09=09goto fail_fourzone;
> +=09=09}
> +
> +=09=09zone->initialized =3D true;
> +=09}
> +
> +=09return 0;
> +
> +fail_fourzone:
> +=09fourzone_leds_exit(device);
> +
> +=09return err;
> +}
> +
>  static int thermal_profile_setup(void)
>  {
>  =09int err, tp;
> @@ -1186,6 +1522,9 @@ static int __init hp_wmi_bios_setup(struct platform=
_device *device)
>
>  =09thermal_profile_setup();
>
> +=09if (is_fourzone_supported())
> +=09=09fourzone_leds_setup(device);
> +
>  =09return 0;
>  }
>
> @@ -1211,6 +1550,9 @@ static int __exit hp_wmi_bios_remove(struct platfor=
m_device *device)
>  =09=09rfkill_destroy(wwan_rfkill);
>  =09}
>
> +=09if (hp_leds)
> +=09=09fourzone_leds_exit(device);
> +
>  =09if (platform_profile_support)
>  =09=09platform_profile_remove();
>
> --
> 2.33.1
>


Regards,
Barnab=C3=A1s P=C5=91cze
