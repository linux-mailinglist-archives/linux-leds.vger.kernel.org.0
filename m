Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58DD331B3AE
	for <lists+linux-leds@lfdr.de>; Mon, 15 Feb 2021 01:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhBOAqq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 14 Feb 2021 19:46:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbhBOAqn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 14 Feb 2021 19:46:43 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 269F9C061788
        for <linux-leds@vger.kernel.org>; Sun, 14 Feb 2021 16:46:03 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id u11so2771893plg.13
        for <linux-leds@vger.kernel.org>; Sun, 14 Feb 2021 16:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Etz2J9pmlf+SykinxfpX+1GU6HYDag0pYFAujUJqgBs=;
        b=jrH2pdx5iyCgnxZE83jrb3MCfraOtI7qW/kMtnJB3h65fXmmfheUGyxk4gg2Q5W/9e
         2LWq3nxcT6P2TKuj1C1MS/cqBsXoj7qeiZex9OUN1RZ0f49Ev8c5WLdGElPM1Jet45sj
         NuN2eyGF6FZF8D3ht+qBsHYW/+e5EfdnO6Z0Tm6g1JSUA2j32lPMIQH7bul1gQCRPEsn
         F490jWLCaydKNWw6pLzxmmoCtwLQVPHugC1ZxoirDPF5KXMiqUbuUMqRJ08QGAC1LViI
         CPCgKARtqRxb+mMhDHBAEBTPq+VIi0v5zfqrhC8DZjIv3QgmO5Yzeq2M1oje91MVuJBf
         r96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Etz2J9pmlf+SykinxfpX+1GU6HYDag0pYFAujUJqgBs=;
        b=OD+7JLPHGO4HA57Qyb/+0Jrfik/b8LfjK+9JkeOY8L8FI+kS/zHF4e0uJwMcqAEum6
         LEF3dPFZB80FmVoU6A9EwgNGUD5GxIk4HrmyCLBFCZBeZJ9fv79CdhTRfecJ/H/2RKLr
         1uGB7dAG7T/bPVdljKUjnjFzFI/wpl0nfeBqLdbOPH6yulnZnnnZRjyuSL+70I61zpi9
         ycPuFspcePifx1AxTaha3cKiGFiejjldlJOUESnX+yCqfKLC+sLqE6X2nEzmFYhbgvUS
         idrsUYP/VMaWlfVoFCV71FRrOmVf9p/jgoIqv6MawvCZXNtp6ujBnFQHoZuSi0L/i7Es
         Jc5w==
X-Gm-Message-State: AOAM531gnaPORKgOjQvk2l0gkBZFMH/m8comESEomP6LFHQYSzca+n6O
        iYa8vEwGaT5pYU6g62tn+xgQyw==
X-Google-Smtp-Source: ABdhPJwmSIGc/SjYilCiIDdO8rKue74S6WoVt8zJEP7a/Y5PL71PwZj/FsJltTdRd0oH0AtCA6c+1w==
X-Received: by 2002:a17:90a:cb13:: with SMTP id z19mr7849648pjt.52.1613349962746;
        Sun, 14 Feb 2021 16:46:02 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id q188sm16127746pfb.8.2021.02.14.16.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 16:46:02 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        dmitry.torokhov@gmail.com, pobm@protonmail.com
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v6 2/4] HID: playstation: add microphone mute support for DualSense.
Date:   Sun, 14 Feb 2021 16:45:47 -0800
Message-Id: <20210215004549.135251-3-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210215004549.135251-1-roderick@gaikai.com>
References: <20210215004549.135251-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

The DualSense controller has a built-in microphone exposed as an
audio device over USB (or HID using Bluetooth). A dedicated
button on the controller handles mute, but software has to configure
the device to mute the audio stream.

This patch captures the mute button and schedules an output report
to mute/unmute the audio stream as well as toggle the mute LED.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/Kconfig           |  2 +
 drivers/hid/hid-playstation.c | 99 +++++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index cfa29dc17064..446a4d579908 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -857,6 +857,8 @@ config HID_PLAYSTATION
 	tristate "PlayStation HID Driver"
 	depends on HID
 	select CRC32
+	select NEW_LEDS
+	select LEDS_CLASS
 	select LEDS_CLASS_MULTICOLOR
 	select POWER_SUPPLY
 	help
diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 97c1118ba78f..c436ac8f7a6f 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/input/mt.h>
+#include <linux/leds.h>
 #include <linux/led-class-multicolor.h>
 #include <linux/module.h>
 
@@ -47,6 +48,12 @@ struct ps_calibration_data {
 	int sens_denom;
 };
 
+struct ps_led_info {
+	const char *name;
+	enum led_brightness (*brightness_get)(struct led_classdev *cdev);
+	void (*brightness_set)(struct led_classdev *cdev, enum led_brightness);
+};
+
 /* Seed values for DualShock4 / DualSense CRC32 for different report types. */
 #define PS_INPUT_CRC32_SEED	0xA1
 #define PS_OUTPUT_CRC32_SEED	0xA2
@@ -82,6 +89,7 @@ struct ps_calibration_data {
 #define DS_BUTTONS1_R3		BIT(7)
 #define DS_BUTTONS2_PS_HOME	BIT(0)
 #define DS_BUTTONS2_TOUCHPAD	BIT(1)
+#define DS_BUTTONS2_MIC_MUTE	BIT(2)
 
 /* Status field of DualSense input report. */
 #define DS_STATUS_BATTERY_CAPACITY	GENMASK(3, 0)
@@ -100,9 +108,12 @@ struct ps_calibration_data {
 /* Flags for DualSense output report. */
 #define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION BIT(0)
 #define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT BIT(1)
+#define DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE BIT(0)
+#define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE BIT(1)
 #define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE BIT(2)
 #define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
 #define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
+#define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE BIT(4)
 #define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT BIT(1)
 
 /* DualSense hardware limits */
@@ -140,6 +151,12 @@ struct dualsense {
 	uint8_t lightbar_green;
 	uint8_t lightbar_blue;
 
+	/* Microphone */
+	bool update_mic_mute;
+	bool mic_muted;
+	bool last_btn_mic_state;
+	struct led_classdev mute_led;
+
 	struct work_struct output_worker;
 	void *output_report_dmabuf;
 	uint8_t output_seq; /* Sequence number for output report. */
@@ -485,6 +502,32 @@ static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *bu
 	return 0;
 }
 
+static int ps_led_register(struct ps_device *ps_dev, struct led_classdev *led,
+		const struct ps_led_info *led_info)
+{
+	int ret;
+
+	led->name = devm_kasprintf(&ps_dev->hdev->dev, GFP_KERNEL,
+			"playstation::%pMR::%s", ps_dev->mac_address, led_info->name);
+
+	if (!led->name)
+		return -ENOMEM;
+
+	led->brightness = 0;
+	led->max_brightness = 1;
+	led->flags = LED_CORE_SUSPENDRESUME;
+	led->brightness_get = led_info->brightness_get;
+	led->brightness_set = led_info->brightness_set;
+
+	ret = devm_led_classdev_register(&ps_dev->hdev->dev, led);
+	if (ret) {
+		hid_err(ps_dev->hdev, "Failed to register LED %s: %d\n", led_info->name, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /* Register a DualSense/DualShock4 RGB lightbar represented by a multicolor LED. */
 static int ps_lightbar_register(struct ps_device *ps_dev, struct led_classdev_mc *lightbar_mc_dev,
 	int (*brightness_set)(struct led_classdev *, enum led_brightness))
@@ -722,6 +765,19 @@ static int dualsense_lightbar_set_brightness(struct led_classdev *cdev,
 	return 0;
 }
 
+static enum led_brightness dualsense_mute_led_get_brightness(struct led_classdev *led)
+{
+	struct dualsense *ds = container_of(led, struct dualsense, mute_led);
+
+	return ds->mic_muted;
+}
+
+/* The mute LED is treated as read-only. This set call prevents ENOTSUP errors e.g. on unload. */
+static void dualsense_mute_led_set_brightness(struct led_classdev *led, enum led_brightness value)
+{
+
+}
+
 static void dualsense_init_output_report(struct dualsense *ds, struct dualsense_output_report *rp,
 		void *buf)
 {
@@ -814,6 +870,23 @@ static void dualsense_output_worker(struct work_struct *work)
 		ds->update_lightbar = false;
 	}
 
+	if (ds->update_mic_mute) {
+		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE;
+		common->mute_button_led = ds->mic_muted;
+
+		if (ds->mic_muted) {
+			/* Disable microphone */
+			common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE;
+			common->power_save_control |= DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE;
+		} else {
+			/* Enable microphone */
+			common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE;
+			common->power_save_control &= ~DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE;
+		}
+
+		ds->update_mic_mute = false;
+	}
+
 	spin_unlock_irqrestore(&ds->base.lock, flags);
 
 	dualsense_send_output_report(ds, &report);
@@ -828,6 +901,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	uint8_t battery_data, battery_capacity, charging_status, value;
 	int battery_status;
 	uint32_t sensor_timestamp;
+	bool btn_mic_state;
 	unsigned long flags;
 	int i;
 
@@ -883,6 +957,23 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2] & DS_BUTTONS2_PS_HOME);
 	input_sync(ds->gamepad);
 
+	/*
+	 * The DualSense has an internal microphone, which can be muted through a mute button
+	 * on the device. The driver is expected to read the button state and program the device
+	 * to mute/unmute audio at the hardware level.
+	 */
+	btn_mic_state = !!(ds_report->buttons[2] & DS_BUTTONS2_MIC_MUTE);
+	if (btn_mic_state && !ds->last_btn_mic_state) {
+		spin_lock_irqsave(&ps_dev->lock, flags);
+		ds->update_mic_mute = true;
+		ds->mic_muted = !ds->mic_muted; /* toggle */
+		spin_unlock_irqrestore(&ps_dev->lock, flags);
+
+		/* Schedule updating of microphone state at hardware level. */
+		schedule_work(&ds->output_worker);
+	}
+	ds->last_btn_mic_state = btn_mic_state;
+
 	/* Parse and calibrate gyroscope data. */
 	for (i = 0; i < ARRAY_SIZE(ds_report->gyro); i++) {
 		int raw_data = (short)le16_to_cpu(ds_report->gyro[i]);
@@ -1030,6 +1121,10 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	uint8_t max_output_report_size;
 	int ret;
 
+	static const struct ps_led_info mute_led_info = {
+		"micmute", dualsense_mute_led_get_brightness, dualsense_mute_led_set_brightness
+	};
+
 	ds = devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
 	if (!ds)
 		return ERR_PTR(-ENOMEM);
@@ -1107,6 +1202,10 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	if (ret)
 		goto err;
 
+	ret = ps_led_register(ps_dev, &ds->mute_led, &mute_led_info);
+	if (ret)
+		goto err;
+
 	return &ds->base;
 
 err:
-- 
2.26.2

