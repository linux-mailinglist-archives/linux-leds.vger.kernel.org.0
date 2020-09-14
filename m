Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8442A2686EB
	for <lists+linux-leds@lfdr.de>; Mon, 14 Sep 2020 10:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgINIM2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Sep 2020 04:12:28 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53711 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgINIHP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Sep 2020 04:07:15 -0400
Received: from [125.35.49.90] (helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <hui.wang@canonical.com>)
        id 1kHjW2-0002qc-1N; Mon, 14 Sep 2020 08:07:10 +0000
From:   Hui Wang <hui.wang@canonical.com>
To:     alsa-devel@alsa-project.org, tiwai@suse.de, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, kai.heng.feng@canonical.com
Subject: [PATCH 1/2] leds: trigger: audio: Add audio jack plugging indicator led
Date:   Mon, 14 Sep 2020 16:06:54 +0800
Message-Id: <20200914080655.14576-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On the Lenovo P520 front panel, there is a headset plugging indicator
led. According to LENOVO's requirement, this led should be on if the
front headset audio jack is plugged, otherwise the led should be off.

We tested with windows, if we plugged a headphone/headset in that
jack, the led was on, if we removed the headphone/headset from that
jack, the led was off.

Here we add JACKPLUG led in the ledtrig_audio, then we could call
ledtrig_audio_set() in the alsa driver to control that led.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 drivers/leds/trigger/Kconfig         | 4 ++--
 drivers/leds/trigger/ledtrig-audio.c | 7 +++++--
 include/linux/leds.h                 | 1 +
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index ce9429ca6dde..a61893a6e3e4 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -138,10 +138,10 @@ config LEDS_TRIGGER_PATTERN
 	  If unsure, say N
 
 config LEDS_TRIGGER_AUDIO
-	tristate "Audio Mute LED Trigger"
+	tristate "Audio Mute and Jack Plugging LED Trigger"
 	help
 	  This allows LEDs to be controlled by audio drivers for following
-	  the audio mute and mic-mute changes.
+	  the audio mute, mic-mute and jack plugging changes.
 	  If unsure, say N
 
 endif # LEDS_TRIGGERS
diff --git a/drivers/leds/trigger/ledtrig-audio.c b/drivers/leds/trigger/ledtrig-audio.c
index f76621e88482..fa66bb982400 100644
--- a/drivers/leds/trigger/ledtrig-audio.c
+++ b/drivers/leds/trigger/ledtrig-audio.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 //
-// Audio Mute LED trigger
+// Audio Mute And Jack Plugging LED trigger
 //
 
 #include <linux/kernel.h>
@@ -29,6 +29,8 @@ static int __init ledtrig_audio_init(void)
 				    &ledtrig_audio[LED_AUDIO_MUTE]);
 	led_trigger_register_simple("audio-micmute",
 				    &ledtrig_audio[LED_AUDIO_MICMUTE]);
+	led_trigger_register_simple("audio-jackplug",
+				    &ledtrig_audio[LED_AUDIO_JACKPLUG]);
 	return 0;
 }
 module_init(ledtrig_audio_init);
@@ -37,8 +39,9 @@ static void __exit ledtrig_audio_exit(void)
 {
 	led_trigger_unregister_simple(ledtrig_audio[LED_AUDIO_MUTE]);
 	led_trigger_unregister_simple(ledtrig_audio[LED_AUDIO_MICMUTE]);
+	led_trigger_unregister_simple(ledtrig_audio[LED_AUDIO_JACKPLUG]);
 }
 module_exit(ledtrig_audio_exit);
 
-MODULE_DESCRIPTION("LED trigger for audio mute control");
+MODULE_DESCRIPTION("LED trigger for audio mute and jack plugging control");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 6a8d6409c993..1858c2d30ecd 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -584,6 +584,7 @@ struct led_pattern {
 enum led_audio {
 	LED_AUDIO_MUTE,		/* master mute LED */
 	LED_AUDIO_MICMUTE,	/* mic mute LED */
+	LED_AUDIO_JACKPLUG,	/* audio jack plug indicator LED */
 	NUM_AUDIO_LEDS
 };
 
-- 
2.17.1

