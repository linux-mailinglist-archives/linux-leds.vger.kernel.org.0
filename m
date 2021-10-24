Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6FE3438A7C
	for <lists+linux-leds@lfdr.de>; Sun, 24 Oct 2021 17:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhJXQAo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 24 Oct 2021 12:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbhJXQAo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 24 Oct 2021 12:00:44 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0EC7C061745;
        Sun, 24 Oct 2021 08:58:22 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id u18so4602587wrg.5;
        Sun, 24 Oct 2021 08:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=rojV3OCD0BPmNvdF7ipYU4AkguBgm6KTuDyCwpFxiEM=;
        b=ggqOcJpBOZ4eJU41GA7nCSaXDexCLP2i/JHnS5yzOD25Z6MbTsfFFuJBZ4coqkeI0M
         Yk3MzOic36CMJ4uAU5HyPb0Ljvp0aF+7gOf7GQRZ2/T9EdqwUy6lKUMkLKZwviD67AJh
         WG3L8HiPiOJsjG45knmewzF4yZRlE2WgEhz8GFklgYj9AmNKdQrWSbR/tSzCu2UWKcqz
         SdzvpGuKE/jgvh+sAdDW0cFAex3FVgpP3mhBZoCYD3OE0P7raIOaSqV+BHlzRV9K3ZOc
         KWZwSvqqcBOQMSW6RshTPwV1jWqOCVkN+SUucjgeQd4q4kWU+2NYnjvAuADrU9LUhVWy
         pv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=rojV3OCD0BPmNvdF7ipYU4AkguBgm6KTuDyCwpFxiEM=;
        b=N3N6oFDaV8tQM6rRkY/X3JpswhwTkhGz2vQ+2WJe7M9Gqkbf7PW0JgTVBHlQQnYdnK
         o8oAP1aJpkHB7ipKkQOPR62DLqjZFih7DhlpCeheFCOKqmykf/sevFB59nhPkf0hRuAy
         kOR+CmiC6qx5PhI+Y4o0KxeXBrapdcOrit+hkMId+lvf6ZZBtEkd+e8Zn/frJKpJ3fps
         5zCbkXB9Ln8iieXSqO/tfFggkaCdzEREeg96HqhOrSrl0zRP9oUX3j+oI6YqhkN/zRSb
         0mOY8LlDVCje+h19XmhgDO/R2bv5dL45gvGkxiFEWwuVsNQCeN7LhgeEFSRLyqycCcM6
         +cRg==
X-Gm-Message-State: AOAM531qXe8a7xEaSivyVskBDqmCZa+JUiwfAZPYEW6psIleNw+5k/pW
        3IDX5qZeOrm4do68DXrgXoK+iSP4SLo=
X-Google-Smtp-Source: ABdhPJxykxADDZZZr5rr8vfwLiBaPcjsDzToGUDEpzcXUNeSHllxqO4mIoXiw0dBc8roT7BPpTzH8Q==
X-Received: by 2002:a5d:6381:: with SMTP id p1mr10816872wru.362.1635091100765;
        Sun, 24 Oct 2021 08:58:20 -0700 (PDT)
Received: from omen.localdomain ([188.127.120.115])
        by smtp.gmail.com with ESMTPSA id a4sm6109421wmb.39.2021.10.24.08.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 08:58:20 -0700 (PDT)
Date:   Sun, 24 Oct 2021 17:58:17 +0200
From:   Enver Balalic <balalic.enver@gmail.com>
To:     hdegoede@redhat.com, mgross@linux.intel.com, pavel@ucw.cz,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: hp-wmi: add support for hp fourzone lighting
Message-ID: <20211024155817.5kvosvx5u5ok453p@omen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch adds support for HP Fourzone lighting.
It exposes 2 things:
 - General keyboard backlight On/Off control
 - 4 RGB keyboard backlight zones as multicolor LED's

This patch has been tested on a 2020 HP Omen 15 (AMD) 15-en0023dx.

Signed-off-by: Enver Balalic <balalic.enver@gmail.com>
---
There are a couple of things I'm unsure about with this patch:
 - I exposed the 4 RGB keyboard backlight zones with names
  "platform::kbd_backlight-1" up to 4, and the one general toggle
  is "platform::kbd_backlight" is this the proper naming
  scheme ?

 - If the general keyboard backlight toggle is set to off, then
  no matter what values are written into any of the zones, the
  lights will be off, should we override the general backlight
  toggle to On if you write a value into one of the zones ?

 - If the general keyboard backlight toggle is set to On,
  i set the zones brightness to 255, since it doesn't make sense
  for that to be 0 while the backlight is on. I didn't find
  an example of a multicolor led device having a brightness_get
  function registered, so I don't know if this is the proper way
  or if I should register a brightness_get function for each
  of the zones and somehow figure out the brightness based on
  the rgb value that the firmware reports ?

 - The windows omen command center detects if you write zeros
  to all 4 of the zones (black) but you set the general keyboard
  backlight to On (as that might confuse someone into thinking
  that their backlight is not working when in fact it's just
  set to black) and overrides the black values to default values
  where each of the zones is set to a different color. Should we
  do the same in the kernel or leave that to some userspace tool ?


 drivers/platform/x86/Kconfig  |   3 +
 drivers/platform/x86/hp-wmi.c | 342 ++++++++++++++++++++++++++++++++++
 2 files changed, 345 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 1ebce7b775f2..07411fcd0d4b 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -427,6 +427,9 @@ config HP_WMI
 	select INPUT_SPARSEKMAP
 	select ACPI_PLATFORM_PROFILE
 	select HWMON
+	select LEDS_CLASS
+	select NEW_LEDS
+	select LEDS_CLASS_MULTICOLOR
 	help
 	 Say Y here if you want to support WMI-based hotkeys on HP laptops and
 	 to read data from WMI such as docking or ambient light sensor state.
diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 9c4c9f5095ae..87b4724d6b9f 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -27,6 +27,8 @@
 #include <linux/rfkill.h>
 #include <linux/string.h>
 #include <linux/dmi.h>
+#include <linux/leds.h>
+#include <linux/led-class-multicolor.h>
 
 MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
 MODULE_DESCRIPTION("HP laptop WMI hotkeys driver");
@@ -43,6 +45,14 @@ MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting (-1=aut
 #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
 #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
 
+#define HP_FOURZONE_N_ZONES 4
+#define HP_FOURZONE_LED_NUM_CHANNELS 3
+#define HP_FOURZONE_OFFSET_COLORS 25
+#define HP_FOURZONE_BUF_LEN 37
+#define HP_FOURZONE_OFFSET_BRIGHTNESS 0
+#define HP_FOURZONE_KBD_BL_ON 128
+#define HP_FOURZONE_KBD_BL_OFF 0
+
 /* DMI board names of devices that should use the omen specific path for
  * thermal profiles.
  * This was obtained by taking a look in the windows omen command center
@@ -61,6 +71,19 @@ static const char * const omen_thermal_profile_boards[] = {
 	"8917", "8918", "8949", "894A", "89EB"
 };
 
+/* DMI Board names of devices that have fourzone support.
+ * A device supports fourzone if the "Feature" array in the json file
+ * in windows omen command center contains "FourZone".
+ */
+static const char * const fourzone_boards[] = {
+	"8466", "8467", "8468", "8469", "846A", "846B", "84DA", "84DB", "84DC",
+	"8574", "8575", "860A", "87B5", "8600", "8601", "8602", "8605", "8606",
+	"8607", "8746", "8747", "8749", "874A", "8603", "8604", "8748", "878A",
+	"878B", "878C", "88C8", "88CB", "8786", "8787", "8788", "88D1", "88D2",
+	"88F4", "88FD", "88F5", "88F6", "88F7", "88FE", "88FF", "8900", "8901",
+	"8902", "8912"
+};
+
 enum hp_wmi_radio {
 	HPWMI_WIFI	= 0x0,
 	HPWMI_BLUETOOTH	= 0x1,
@@ -117,11 +140,19 @@ enum hp_wmi_gm_commandtype {
 	HPWMI_FAN_SPEED_MAX_SET_QUERY = 0x27,
 };
 
+enum hp_wmi_lm_commandtype {
+	HPWMI_FOURZONE_ZONES_GET	= 0x02,
+	HPWMI_FOURZONE_ZONES_SET	= 0x03,
+	HPWMI_FOURZONE_KB_BACKLIGHT_GET	= 0x04,
+	HPWMI_FOURZONE_KB_BACKLIGHT_SET	= 0x05,
+};
+
 enum hp_wmi_command {
 	HPWMI_READ	= 0x01,
 	HPWMI_WRITE	= 0x02,
 	HPWMI_ODM	= 0x03,
 	HPWMI_GM	= 0x20008,
+	HPWMI_LM	= 0x20009,
 };
 
 enum hp_wmi_hardware_mask {
@@ -200,6 +231,32 @@ static const struct key_entry hp_wmi_keymap[] = {
 	{ KE_END, 0 }
 };
 
+struct hp_wmi_fourzone_data {
+	struct {
+		unsigned int r;
+		unsigned int g;
+		unsigned int b;
+	} zone[HP_FOURZONE_N_ZONES];
+};
+
+struct hp_fourzone_zone {
+	bool initialized;
+	struct led_classdev_mc mc_cdev;
+	struct mc_subled subled_info[HP_FOURZONE_LED_NUM_CHANNELS];
+};
+
+struct hp_wmi_leds {
+	struct {
+		bool initialized;
+		struct led_classdev led;
+		unsigned int last_brightness;
+	} fourzone_kbd_bl;
+
+	struct {
+		struct hp_fourzone_zone zones[HP_FOURZONE_N_ZONES];
+	} fourzone;
+};
+
 static struct input_dev *hp_wmi_input_dev;
 static struct platform_device *hp_wmi_platform_dev;
 static struct platform_profile_handler platform_profile_handler;
@@ -208,6 +265,7 @@ static bool platform_profile_support;
 static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
 static struct rfkill *wwan_rfkill;
+static struct hp_wmi_leds *hp_leds;
 
 struct rfkill2_device {
 	u8 id;
@@ -373,6 +431,18 @@ static int omen_thermal_profile_set(int mode)
 	return mode;
 }
 
+static bool is_fourzone_supported(void)
+{
+	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
+
+	if (!board_name)
+		return false;
+
+	return match_string(fourzone_boards,
+			    ARRAY_SIZE(fourzone_boards),
+			    board_name) >= 0;
+}
+
 static bool is_omen_thermal_profile(void)
 {
 	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
@@ -653,6 +723,8 @@ static struct attribute *hp_wmi_attrs[] = {
 };
 ATTRIBUTE_GROUPS(hp_wmi);
 
+static void hp_wmi_fourzone_kbd_bl_notify(void);
+
 static void hp_wmi_notify(u32 value, void *context)
 {
 	struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
@@ -754,6 +826,7 @@ static void hp_wmi_notify(u32 value, void *context)
 	case HPWMI_PROXIMITY_SENSOR:
 		break;
 	case HPWMI_BACKLIT_KB_BRIGHTNESS:
+		hp_wmi_fourzone_kbd_bl_notify();
 		break;
 	case HPWMI_PEAKSHIFT_PERIOD:
 		break;
@@ -1114,6 +1187,269 @@ static int platform_profile_set(struct platform_profile_handler *pprof,
 	return 0;
 }
 
+static int hp_wmi_fourzone_get_zones_data(struct hp_wmi_fourzone_data *data)
+{
+	int ret, i, zone;
+	unsigned char buf[HP_FOURZONE_BUF_LEN];
+
+	ret = hp_wmi_perform_query(HPWMI_FOURZONE_ZONES_GET, HPWMI_LM,
+				   &buf, sizeof(buf),
+				   sizeof(buf));
+
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < HP_FOURZONE_N_ZONES; i++) {
+		zone = HP_FOURZONE_OFFSET_COLORS + (i * 3);
+
+		data->zone[i].r = buf[zone];
+		data->zone[i].g = buf[zone + 1];
+		data->zone[i].b = buf[zone + 2];
+	}
+
+	return 0;
+}
+
+static int hp_wmi_fourzone_set_zones_data(struct hp_wmi_fourzone_data *data)
+{
+	int i, zone;
+	unsigned char buf[HP_FOURZONE_BUF_LEN];
+
+	for (i = 0; i < HP_FOURZONE_N_ZONES; i++) {
+		zone = HP_FOURZONE_OFFSET_COLORS + (i * 3);
+
+		buf[zone] = data->zone[i].r;
+		buf[zone + 1] = data->zone[i].g;
+		buf[zone + 2] = data->zone[i].b;
+	}
+
+	return hp_wmi_perform_query(HPWMI_FOURZONE_ZONES_SET, HPWMI_LM,
+				       &buf, sizeof(buf),
+				       sizeof(buf));
+}
+
+static int hp_wmi_fourzone_set_zone_rgb(int zone, unsigned int r,
+					unsigned int g, unsigned int b)
+{
+	int err;
+	struct hp_wmi_fourzone_data data;
+
+	err = hp_wmi_fourzone_get_zones_data(&data);
+	if (err < 0)
+		return err;
+
+	data.zone[zone].r = r;
+	data.zone[zone].g = g;
+	data.zone[zone].b = b;
+
+	return hp_wmi_fourzone_set_zones_data(&data);
+}
+
+static int hp_wmi_fourzone_cdev_set_zone(int zone, struct led_classdev *cdev,
+					 enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
+
+	led_mc_calc_color_components(mc_cdev, brightness);
+
+	return hp_wmi_fourzone_set_zone_rgb(zone,
+		mc_cdev->subled_info[0].brightness,
+		mc_cdev->subled_info[1].brightness,
+		mc_cdev->subled_info[2].brightness);
+}
+
+static int hp_wmi_cdev_fourzone_led_set_brightness_zone0(struct led_classdev *cdev,
+							 enum led_brightness brightness)
+{
+	return hp_wmi_fourzone_cdev_set_zone(0, cdev, brightness);
+}
+
+static int hp_wmi_cdev_fourzone_led_set_brightness_zone1(struct led_classdev *cdev,
+							 enum led_brightness brightness)
+{
+	return hp_wmi_fourzone_cdev_set_zone(1, cdev, brightness);
+}
+
+static int hp_wmi_cdev_fourzone_led_set_brightness_zone2(struct led_classdev *cdev,
+							 enum led_brightness brightness)
+{
+	return hp_wmi_fourzone_cdev_set_zone(2, cdev, brightness);
+}
+
+static int hp_wmi_cdev_fourzone_led_set_brightness_zone3(struct led_classdev *cdev,
+							 enum led_brightness brightness)
+{
+	return hp_wmi_fourzone_cdev_set_zone(3, cdev, brightness);
+}
+
+static int hp_wmi_fourzone_kbd_bl_get(void)
+{
+	int val = 0, ret;
+
+	ret = hp_wmi_perform_query(HPWMI_FOURZONE_KB_BACKLIGHT_GET, HPWMI_LM,
+				   &val, sizeof(val), sizeof(val));
+
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
+
+	return val == HP_FOURZONE_KBD_BL_ON ? 1 : 0;
+}
+
+static int hp_wmi_fourzone_kbd_bl_set(unsigned int brightness)
+{
+	char kbd_bl_data[1] = { brightness ? HP_FOURZONE_KBD_BL_ON : HP_FOURZONE_KBD_BL_OFF };
+
+	int ret = hp_wmi_perform_query(HPWMI_FOURZONE_KB_BACKLIGHT_SET, HPWMI_LM,
+				       &kbd_bl_data, sizeof(kbd_bl_data),
+				       sizeof(kbd_bl_data));
+
+	if (ret != 0)
+		return -EINVAL;
+
+	hp_leds->fourzone_kbd_bl.last_brightness = brightness;
+
+	return brightness;
+}
+
+static enum led_brightness hp_wmi_cdev_fourzone_kbd_bl_get(struct led_classdev *led_cdev)
+{
+	return hp_wmi_fourzone_kbd_bl_get();
+}
+
+static int hp_wmi_cdev_fourzone_kbd_bl_set(struct led_classdev *led_cdev,
+					   enum led_brightness brightness)
+{
+	return hp_wmi_fourzone_kbd_bl_set(brightness);
+}
+
+static int (*fourzone_cdev_zone_set[HP_FOURZONE_N_ZONES])(struct led_classdev*,
+						  enum led_brightness) = {
+	&hp_wmi_cdev_fourzone_led_set_brightness_zone0,
+	&hp_wmi_cdev_fourzone_led_set_brightness_zone1,
+	&hp_wmi_cdev_fourzone_led_set_brightness_zone2,
+	&hp_wmi_cdev_fourzone_led_set_brightness_zone3,
+};
+
+static void hp_wmi_fourzone_kbd_bl_notify(void)
+{
+	int brightness;
+
+	if (!hp_leds->fourzone_kbd_bl.initialized)
+		return;
+
+	brightness = hp_wmi_fourzone_kbd_bl_get();
+	if (brightness < 0)
+		return;
+
+	if (brightness == hp_leds->fourzone_kbd_bl.last_brightness)
+		return;
+
+	hp_leds->fourzone_kbd_bl.last_brightness = brightness;
+
+	led_classdev_notify_brightness_hw_changed(&hp_leds->fourzone_kbd_bl.led, brightness);
+}
+
+static void fourzone_leds_exit(struct platform_device *device)
+{
+	int i;
+	struct hp_fourzone_zone *zone;
+
+	if (hp_leds->fourzone_kbd_bl.initialized) {
+		hp_leds->fourzone_kbd_bl.initialized = false;
+		led_classdev_unregister(&hp_leds->fourzone_kbd_bl.led);
+	}
+
+	for (i = 0; i < HP_FOURZONE_N_ZONES; i++) {
+		zone = &hp_leds->fourzone.zones[i];
+		if (zone->initialized)
+			devm_led_classdev_multicolor_unregister(&device->dev,
+								&zone->mc_cdev);
+	}
+}
+
+static int fourzone_leds_setup(struct platform_device *device)
+{
+	int err, brightness, i, zones_brightness;
+	struct led_classdev *cdev;
+	struct hp_wmi_fourzone_data data;
+	struct hp_fourzone_zone *zone;
+	char name[64];
+
+	hp_leds = devm_kzalloc(&device->dev, sizeof(*hp_leds), GFP_KERNEL);
+	if (!hp_leds)
+		return -ENOMEM;
+
+	brightness = hp_wmi_fourzone_kbd_bl_get();
+	if (brightness < 0)
+		return brightness;
+
+	hp_leds->fourzone_kbd_bl.last_brightness = brightness;
+
+	hp_leds->fourzone_kbd_bl.led.name = "platform::" LED_FUNCTION_KBD_BACKLIGHT;
+	hp_leds->fourzone_kbd_bl.led.brightness = brightness;
+	hp_leds->fourzone_kbd_bl.led.max_brightness = 1;
+	hp_leds->fourzone_kbd_bl.led.brightness_get = hp_wmi_cdev_fourzone_kbd_bl_get;
+	hp_leds->fourzone_kbd_bl.led.brightness_set_blocking = hp_wmi_cdev_fourzone_kbd_bl_set;
+	hp_leds->fourzone_kbd_bl.led.flags = LED_BRIGHT_HW_CHANGED | LED_RETAIN_AT_SHUTDOWN;
+
+	err = led_classdev_register(&device->dev, &hp_leds->fourzone_kbd_bl.led);
+	if (err)
+		return err;
+
+	hp_leds->fourzone_kbd_bl.initialized = true;
+
+	err = hp_wmi_fourzone_get_zones_data(&data);
+	if (err)
+		goto fail_fourzone;
+
+	zones_brightness = brightness == 1 ? 255 : 0;
+
+	for (i = 0; i < HP_FOURZONE_N_ZONES; i++) {
+		zone = &hp_leds->fourzone.zones[i];
+
+		zone->subled_info[0].color_index = LED_COLOR_ID_RED;
+		zone->subled_info[0].channel = 0;
+		zone->subled_info[0].intensity = data.zone[i].r;
+
+		zone->subled_info[1].color_index = LED_COLOR_ID_GREEN;
+		zone->subled_info[1].channel = 1;
+		zone->subled_info[1].intensity = data.zone[i].g;
+
+		zone->subled_info[2].color_index = LED_COLOR_ID_BLUE;
+		zone->subled_info[2].channel = 2;
+		zone->subled_info[2].intensity = data.zone[i].b;
+
+		zone->mc_cdev.subled_info = zone->subled_info;
+		zone->mc_cdev.num_colors = HP_FOURZONE_LED_NUM_CHANNELS;
+
+		cdev = &zone->mc_cdev.led_cdev;
+		cdev->flags = LED_RETAIN_AT_SHUTDOWN;
+		cdev->brightness = zones_brightness;
+		cdev->max_brightness = 255;
+		zone->mc_cdev.led_cdev.brightness_set_blocking = fourzone_cdev_zone_set[i];
+		snprintf(name, sizeof(name), "platform::%s-%i", LED_FUNCTION_KBD_BACKLIGHT, i + 1);
+		cdev->name = name;
+
+		err = devm_led_classdev_multicolor_register_ext(&device->dev,
+								&zone->mc_cdev,
+								NULL);
+
+		if (err) {
+			dev_err(&device->dev, "Cannot register fourzone zone %i LED: %i\n", i, err);
+			goto fail_fourzone;
+		}
+
+		zone->initialized = true;
+	}
+
+	return 0;
+
+fail_fourzone:
+	fourzone_leds_exit(device);
+
+	return err;
+}
+
 static int thermal_profile_setup(void)
 {
 	int err, tp;
@@ -1186,6 +1522,9 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 
 	thermal_profile_setup();
 
+	if (is_fourzone_supported())
+		fourzone_leds_setup(device);
+
 	return 0;
 }
 
@@ -1211,6 +1550,9 @@ static int __exit hp_wmi_bios_remove(struct platform_device *device)
 		rfkill_destroy(wwan_rfkill);
 	}
 
+	if (hp_leds)
+		fourzone_leds_exit(device);
+
 	if (platform_profile_support)
 		platform_profile_remove();
 
-- 
2.33.1

