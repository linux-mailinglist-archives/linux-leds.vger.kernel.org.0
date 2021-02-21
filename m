Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E87E320A1A
	for <lists+linux-leds@lfdr.de>; Sun, 21 Feb 2021 12:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbhBULxm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 21 Feb 2021 06:53:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33094 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229634AbhBULxl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sun, 21 Feb 2021 06:53:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613908334;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=7C2omwN5VQmVbpdzH4Ea2JXD7AoAsNvgIvp5ufYmtjQ=;
        b=evheYJ7rdeiWm2o5R/Xe9VOlbPQNYB7Lwej6f7t91ig5KYeNX/uuPW0fk2r91dWzMiJO6O
        /AlkTfnB1eECORDImlEorbfJVfzyGL/oGSVyp0gfI01vaVC+oItgxx3suyhtL2Qa20EpTC
        oLqWXE61c75Cm0HEcPgQatX3GZIZsmw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-wkApXp0tOx6T1bO4S7zrMg-1; Sun, 21 Feb 2021 06:52:12 -0500
X-MC-Unique: wkApXp0tOx6T1bO4S7zrMg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BD5310066EF;
        Sun, 21 Feb 2021 11:52:11 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-87.ams2.redhat.com [10.36.112.87])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 97E6E1346F;
        Sun, 21 Feb 2021 11:52:09 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        linux-leds@vger.kernel.org, alsa-devel@alsa-project.org,
        Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2] leds: trigger: audio: Add an activate callback to ensure the initial brightness is set
Date:   Sun, 21 Feb 2021 12:52:08 +0100
Message-Id: <20210221115208.105203-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Some 2-in-1s with a detachable (USB) keyboard(dock) have mute-LEDs in
the speaker- and/or mic-mute keys on the keyboard.

Examples of this are the Lenovo Thinkpad10 tablet (with its USB kbd-dock)
and the HP x2 10 series.

The detachable nature of these keyboards means that the keyboard and
thus the mute LEDs may show up after the user (or userspace restoring
old mixer settings) has muted the speaker and/or mic.

Current LED-class devices with a default_trigger of "audio-mute" or
"audio-micmute" initialize the brightness member of led_classdev with
ledtrig_audio_get() before registering the LED.

This makes the software state after attaching the keyboard match the
actual audio mute state, e.g. cat /sys/class/leds/foo/brightness will
show the right value.

But before this commit nothing was actually calling the led_classdev's
brightness_set[_blocking] callback so the value returned by
ledtrig_audio_get() was never actually being sent to the hw, leading
to the mute LEDs staying in their default power-on state, after
attaching the keyboard, even if ledtrig_audio_get() returned a different
state.

This could be fixed by having the individual LED drivers call
brightness_set[_blocking] themselves after registering the LED,
but this really is something which should be done by a led-trigger
activate callback.

Add an activate callback for this, fixing the issue of the
mute LEDs being out of sync after (re)attaching the keyboard.

Cc: Takashi Iwai <tiwai@suse.de>
Fixes: faa2541f5b1a ("leds: trigger: Introduce audio mute LED trigger")
Reviewed-by: Marek Behún <kabel@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Fix a couple of grammar errors in the commit-message
- Add Marek's Reviewed-by (thank you)
---
 drivers/leds/trigger/ledtrig-audio.c | 37 ++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-audio.c b/drivers/leds/trigger/ledtrig-audio.c
index f76621e88482..c6b437e6369b 100644
--- a/drivers/leds/trigger/ledtrig-audio.c
+++ b/drivers/leds/trigger/ledtrig-audio.c
@@ -6,10 +6,33 @@
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include "../leds.h"
 
-static struct led_trigger *ledtrig_audio[NUM_AUDIO_LEDS];
 static enum led_brightness audio_state[NUM_AUDIO_LEDS];
 
+static int ledtrig_audio_mute_activate(struct led_classdev *led_cdev)
+{
+	led_set_brightness_nosleep(led_cdev, audio_state[LED_AUDIO_MUTE]);
+	return 0;
+}
+
+static int ledtrig_audio_micmute_activate(struct led_classdev *led_cdev)
+{
+	led_set_brightness_nosleep(led_cdev, audio_state[LED_AUDIO_MICMUTE]);
+	return 0;
+}
+
+static struct led_trigger ledtrig_audio[NUM_AUDIO_LEDS] = {
+	[LED_AUDIO_MUTE] = {
+		.name     = "audio-mute",
+		.activate = ledtrig_audio_mute_activate,
+	},
+	[LED_AUDIO_MICMUTE] = {
+		.name     = "audio-micmute",
+		.activate = ledtrig_audio_micmute_activate,
+	},
+};
+
 enum led_brightness ledtrig_audio_get(enum led_audio type)
 {
 	return audio_state[type];
@@ -19,24 +42,22 @@ EXPORT_SYMBOL_GPL(ledtrig_audio_get);
 void ledtrig_audio_set(enum led_audio type, enum led_brightness state)
 {
 	audio_state[type] = state;
-	led_trigger_event(ledtrig_audio[type], state);
+	led_trigger_event(&ledtrig_audio[type], state);
 }
 EXPORT_SYMBOL_GPL(ledtrig_audio_set);
 
 static int __init ledtrig_audio_init(void)
 {
-	led_trigger_register_simple("audio-mute",
-				    &ledtrig_audio[LED_AUDIO_MUTE]);
-	led_trigger_register_simple("audio-micmute",
-				    &ledtrig_audio[LED_AUDIO_MICMUTE]);
+	led_trigger_register(&ledtrig_audio[LED_AUDIO_MUTE]);
+	led_trigger_register(&ledtrig_audio[LED_AUDIO_MICMUTE]);
 	return 0;
 }
 module_init(ledtrig_audio_init);
 
 static void __exit ledtrig_audio_exit(void)
 {
-	led_trigger_unregister_simple(ledtrig_audio[LED_AUDIO_MUTE]);
-	led_trigger_unregister_simple(ledtrig_audio[LED_AUDIO_MICMUTE]);
+	led_trigger_unregister(&ledtrig_audio[LED_AUDIO_MUTE]);
+	led_trigger_unregister(&ledtrig_audio[LED_AUDIO_MICMUTE]);
 }
 module_exit(ledtrig_audio_exit);
 
-- 
2.30.1

