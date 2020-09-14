Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A74B22686E6
	for <lists+linux-leds@lfdr.de>; Mon, 14 Sep 2020 10:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbgINIME (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Sep 2020 04:12:04 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53717 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbgINIHQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Sep 2020 04:07:16 -0400
Received: from [125.35.49.90] (helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <hui.wang@canonical.com>)
        id 1kHjW4-0002qc-TM; Mon, 14 Sep 2020 08:07:13 +0000
From:   Hui Wang <hui.wang@canonical.com>
To:     alsa-devel@alsa-project.org, tiwai@suse.de, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, kai.heng.feng@canonical.com
Subject: [PATCH 2/2] ALSA: hda/realtek - enable jack plugging indicator led on LENOVO P520
Date:   Mon, 14 Sep 2020 16:06:55 +0800
Message-Id: <20200914080655.14576-2-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914080655.14576-1-hui.wang@canonical.com>
References: <20200914080655.14576-1-hui.wang@canonical.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

There is a headset jack plugging indicator led on the LENOVO P520
front panel, we expect this led to be on if we plug a headphone or
headset in that jack, and expect this led to be off if there is
nothing plugged in that jack.

After adding the JACKPLUG led in the ledtrig_audio.c, we could add
led control in the hda audio driver via ledtrig API.

On the LENOVO P520, the jack indicator led connects to the alc233
gpio2, we hook a callback in the unsol event handler to update this
led.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/hda_generic.c   | 26 ++++++++++++++++++++++
 sound/pci/hda/hda_generic.h   |  3 +++
 sound/pci/hda/patch_realtek.c | 42 +++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index bbb17481159e..6b4b06583e98 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -3888,6 +3888,32 @@ static int parse_mic_boost(struct hda_codec *codec)
 }
 
 #ifdef CONFIG_SND_HDA_GENERIC_LEDS
+/**
+ * snd_dha_gen_add_jackplug_led_cdev - Create a LED classdev and enable as jack plugging LED
+ * @codec: the HDA codec
+ * @callback: the callback for LED classdev brightness_set_blocking
+ */
+int snd_hda_gen_add_jackplug_led_cdev(struct hda_codec *codec,
+				      int (*callback)(struct led_classdev *,
+						      enum led_brightness))
+{
+	struct led_classdev *cdev;
+
+	cdev = devm_kzalloc(&codec->core.dev, sizeof(*cdev), GFP_KERNEL);
+	if (!cdev)
+		return -ENOMEM;
+
+	cdev->name = "hda::jackplug";
+	cdev->max_brightness = 1;
+	cdev->default_trigger = "audio-jackplug";
+	cdev->brightness_set_blocking = callback;
+	cdev->brightness = ledtrig_audio_get(LED_AUDIO_JACKPLUG);
+	cdev->flags = LED_CORE_SUSPENDRESUME;
+
+	return devm_led_classdev_register(&codec->core.dev, cdev);
+}
+EXPORT_SYMBOL_GPL(snd_hda_gen_add_jackplug_led_cdev);
+
 /*
  * vmaster mute LED hook helpers
  */
diff --git a/sound/pci/hda/hda_generic.h b/sound/pci/hda/hda_generic.h
index a43f0bb77dae..8d363d14d0c3 100644
--- a/sound/pci/hda/hda_generic.h
+++ b/sound/pci/hda/hda_generic.h
@@ -360,5 +360,8 @@ int snd_hda_gen_add_mute_led_cdev(struct hda_codec *codec,
 int snd_hda_gen_add_micmute_led_cdev(struct hda_codec *codec,
 				     int (*callback)(struct led_classdev *,
 						     enum led_brightness));
+int snd_hda_gen_add_jackplug_led_cdev(struct hda_codec *codec,
+				      int (*callback)(struct led_classdev *,
+						      enum led_brightness));
 
 #endif /* __SOUND_HDA_GENERIC_H */
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b6dc47da1d7b..8dbc7ef76206 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -90,11 +90,13 @@ struct alc_spec {
 	/* mute LED for HP laptops, see vref_mute_led_set() */
 	int mute_led_polarity;
 	int micmute_led_polarity;
+	int jackplug_led_polarity;
 	hda_nid_t mute_led_nid;
 	hda_nid_t cap_mute_led_nid;
 
 	unsigned int gpio_mute_led_mask;
 	unsigned int gpio_mic_led_mask;
+	unsigned int gpio_jackplug_led_mask;
 	struct alc_coef_led mute_led_coef;
 	struct alc_coef_led mic_led_coef;
 
@@ -5905,15 +5907,50 @@ static void alc285_fixup_thinkpad_x1_gen7(struct hda_codec *codec,
 	}
 }
 
+/* turn on/off jackplugging indicator LED via GPIO per unsol event callback */
+static int gpio_jackplug_led_set(struct led_classdev *led_cdev,
+				 enum led_brightness brightness)
+{
+	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
+	struct alc_spec *spec = codec->spec;
+
+	alc_update_gpio_led(codec, spec->gpio_jackplug_led_mask,
+			    spec->jackplug_led_polarity, !brightness);
+	return 0;
+}
+
+static void alc_update_hp_jack_stat_led(struct hda_codec *codec,
+					struct hda_jack_callback *cb)
+{
+	u32 pin_sense;
+
+	pin_sense = snd_hda_jack_pin_sense(codec, 0x21, 0);
+	ledtrig_audio_set(LED_AUDIO_JACKPLUG,
+			  (pin_sense & AC_PINSENSE_PRESENCE) ? LED_ON : LED_OFF);
+}
+
 static void alc233_alc662_fixup_lenovo_dual_codecs(struct hda_codec *codec,
 					 const struct hda_fixup *fix,
 					 int action)
 {
+	struct alc_spec *spec = codec->spec;
 	alc_fixup_dual_codecs(codec, fix, action);
 	switch (action) {
 	case HDA_FIXUP_ACT_PRE_PROBE:
 		/* override card longname to provide a unique UCM profile */
 		strcpy(codec->card->longname, "HDAudio-Lenovo-DualCodecs");
+
+		/* the jack plug indicator led connects to gpio2 of alc233 */
+		if (codec->core.vendor_id == 0x10ec0662)
+			break;
+		/* enable gpio2 and set it to output */
+		spec->gpio_mask |= 0x2;
+		spec->gpio_dir |= 0x2;
+		alc_write_gpio(codec);
+		spec->gpio_jackplug_led_mask = 0x2;
+		spec->jackplug_led_polarity = 0x0;
+		snd_hda_gen_add_jackplug_led_cdev(codec, gpio_jackplug_led_set);
+
 		break;
 	case HDA_FIXUP_ACT_BUILD:
 		/* rename Capture controls depending on the codec */
@@ -5925,6 +5962,11 @@ static void alc233_alc662_fixup_lenovo_dual_codecs(struct hda_codec *codec,
 			   codec->addr == 0 ?
 			   "Rear-Panel Capture Switch" :
 			   "Front-Panel Capture Switch");
+
+		if (codec->core.vendor_id == 0x10ec0662)
+			break;
+		alc_update_hp_jack_stat_led(codec, NULL);
+		snd_hda_jack_detect_enable_callback(codec, 0x21, alc_update_hp_jack_stat_led);
 		break;
 	}
 }
-- 
2.17.1

