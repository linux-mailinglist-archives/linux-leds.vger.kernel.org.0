Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5221731B3B0
	for <lists+linux-leds@lfdr.de>; Mon, 15 Feb 2021 01:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhBOArW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 14 Feb 2021 19:47:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbhBOArV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 14 Feb 2021 19:47:21 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8268AC06178C
        for <linux-leds@vger.kernel.org>; Sun, 14 Feb 2021 16:46:04 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id t2so2903559pjq.2
        for <linux-leds@vger.kernel.org>; Sun, 14 Feb 2021 16:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BS7DivJFl5AT7V+WqM5Kz27qKRGDnECZ9lanj9m1Rjc=;
        b=J7I2+hAmZyI2mTzpmyULZ5YsGUxeG1OKnMwGuoVR6PGbWgx4ti200A83q9m7ShHRvF
         t2UeqeCEzZ9XzHsxk2Ju426GTdqsn+jJEqbqipImqvWM8/CYc4NINaXvdtQ2x/aIoWf/
         q98ZxskWK44Ij2JNs0OgcPcmmSJbDfJCmxycarbNU15uXUzsmYuCzXRbPf/28o61qQ8F
         9FPrIJ2D0P2ngKKNR1oG7vnB6BwiSsz71Uzr5oB5hZqMd4cTxFpX+pvw37NWEV8vqX67
         IL34Ut5aVSY63S6w77v0k4Fop1xN0Bge9L5A0zslVdCjpQ6dl800qt/nYj7FujKF2CDV
         b5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BS7DivJFl5AT7V+WqM5Kz27qKRGDnECZ9lanj9m1Rjc=;
        b=IAcd/ClacQEblFIaopPOBDXQY0l2XcYDlatrM/UEh2VI4BltUwOeYzXjzztgCq7gTo
         Pcr4aG8jBsmv9HfK5CHgYeHGmN1wCG4gy+rFunrFmJKPkmENSFStkZD4E9ccMiS18xTk
         phCUqTILIupMb4N0U6VypJntjAR1nMkI4l8xckzOy/i8nt4Z6LsYzjvzZQshzF16kgrz
         Z0aAA4RakFAifUnF7nxZ4lHkFVOdWWWBXHxcOpKdENu7OlK0eqaIH9iJvr3yd4Ow+ZrG
         B/QfM9J0BUamORyhVZP5qHXDlplq3GnYwmaj0pDyuwI+qKAyMnfyDpurhUKQe2Y5YGpI
         xicw==
X-Gm-Message-State: AOAM530fABy/3Sr3aVBm7fShbmVzCin7s+CV9EPBYRPhYRwUQGPJHvoL
        lU8R8osPkp3pCkY5WSom/ybDuw==
X-Google-Smtp-Source: ABdhPJyYywoyi/Q7cnk+ojLDE3GHMvQf9JyUc249OoQZGhHs9fjSRSIBE9anElkmklW9BdBmvn/ASg==
X-Received: by 2002:a17:90a:6385:: with SMTP id f5mr13583174pjj.91.1613349964069;
        Sun, 14 Feb 2021 16:46:04 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id q188sm16127746pfb.8.2021.02.14.16.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 16:46:03 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        dmitry.torokhov@gmail.com, pobm@protonmail.com
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v6 3/4] HID: playstation: add DualSense player LEDs support.
Date:   Sun, 14 Feb 2021 16:45:48 -0800
Message-Id: <20210215004549.135251-4-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210215004549.135251-1-roderick@gaikai.com>
References: <20210215004549.135251-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

The DualSense features 5 player LEDs below its touchpad, which are
meant as player id indications. This patch exposes the player LEDs
as individual LEDs.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 60 ++++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index c436ac8f7a6f..2d96785c397d 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -112,6 +112,7 @@ struct ps_led_info {
 #define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE BIT(1)
 #define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE BIT(2)
 #define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
+#define DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE BIT(4)
 #define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
 #define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE BIT(4)
 #define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT BIT(1)
@@ -157,6 +158,11 @@ struct dualsense {
 	bool last_btn_mic_state;
 	struct led_classdev mute_led;
 
+	/* Player leds */
+	bool update_player_leds;
+	uint8_t player_leds_state;
+	struct led_classdev player_leds[5];
+
 	struct work_struct output_worker;
 	void *output_report_dmabuf;
 	uint8_t output_seq; /* Sequence number for output report. */
@@ -778,6 +784,35 @@ static void dualsense_mute_led_set_brightness(struct led_classdev *led, enum led
 
 }
 
+static enum led_brightness dualsense_player_led_get_brightness(struct led_classdev *led)
+{
+	struct hid_device *hdev = to_hid_device(led->dev->parent);
+	struct dualsense *ds = hid_get_drvdata(hdev);
+
+	return !!(ds->player_leds_state & BIT(led - ds->player_leds));
+}
+
+static void dualsense_player_led_set_brightness(struct led_classdev *led, enum led_brightness value)
+{
+	struct hid_device *hdev = to_hid_device(led->dev->parent);
+	struct dualsense *ds = hid_get_drvdata(hdev);
+	unsigned long flags;
+	unsigned int led_index;
+
+	spin_lock_irqsave(&ds->base.lock, flags);
+
+	led_index = led - ds->player_leds;
+	if (value == LED_OFF)
+		ds->player_leds_state &= ~BIT(led_index);
+	else
+		ds->player_leds_state |= BIT(led_index);
+
+	ds->update_player_leds = true;
+	spin_unlock_irqrestore(&ds->base.lock, flags);
+
+	schedule_work(&ds->output_worker);
+}
+
 static void dualsense_init_output_report(struct dualsense *ds, struct dualsense_output_report *rp,
 		void *buf)
 {
@@ -870,6 +905,13 @@ static void dualsense_output_worker(struct work_struct *work)
 		ds->update_lightbar = false;
 	}
 
+	if (ds->update_player_leds) {
+		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE;
+		common->player_leds = ds->player_leds_state;
+
+		ds->update_player_leds = false;
+	}
+
 	if (ds->update_mic_mute) {
 		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE;
 		common->mute_button_led = ds->mic_muted;
@@ -1119,12 +1161,20 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	struct dualsense *ds;
 	struct ps_device *ps_dev;
 	uint8_t max_output_report_size;
-	int ret;
+	int i, ret;
 
 	static const struct ps_led_info mute_led_info = {
 		"micmute", dualsense_mute_led_get_brightness, dualsense_mute_led_set_brightness
 	};
 
+	static const struct ps_led_info player_leds_info[] = {
+		{ "led1", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness },
+		{ "led2", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness },
+		{ "led3", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness },
+		{ "led4", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness },
+		{ "led5", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness }
+	};
+
 	ds = devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
 	if (!ds)
 		return ERR_PTR(-ENOMEM);
@@ -1206,6 +1256,14 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	if (ret)
 		goto err;
 
+	for (i = 0; i < ARRAY_SIZE(player_leds_info); i++) {
+		const struct ps_led_info *led_info = &player_leds_info[i];
+
+		ret = ps_led_register(ps_dev, &ds->player_leds[i], led_info);
+		if (ret < 0)
+			goto err;
+	}
+
 	return &ds->base;
 
 err:
-- 
2.26.2

