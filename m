Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C77828DAA7
	for <lists+linux-leds@lfdr.de>; Wed, 14 Oct 2020 09:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbgJNHtw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Oct 2020 03:49:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:58056 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726348AbgJNHtw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 14 Oct 2020 03:49:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 4389AAD46;
        Wed, 14 Oct 2020 07:49:50 +0000 (UTC)
Date:   Wed, 14 Oct 2020 09:49:49 +0200
Message-ID: <s5hblh5mele.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Udo van den Heuvel <udovdh@xs4all.nl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Pavel Machek <pavel@ucw.cz>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>
Subject: Re: disabling CONFIG_LED_CLASS (SND_HDA_CODEC_REALTEK)
In-Reply-To: <d7774b58-caf5-5bd8-845d-a5d45aaef4c6@infradead.org>
References: <2835d02a-380b-6a3a-0e4d-abf07aee18bc@xs4all.nl>
        <53e698c1-86e4-8b1f-afb0-b8471349e701@xs4all.nl>
        <43b79598-1592-683f-46df-9e5489110780@infradead.org>
        <6fd1e91e-19d0-6682-dfc6-49f1cd60408b@infradead.org>
        <3c6d174c-30db-3d03-3d16-42df405f38d9@xs4all.nl>
        <58e774c5-fc80-2060-2091-9a6398582cc5@infradead.org>
        <9fc679e9-e9a9-ad80-b24c-f04489b98aa7@xs4all.nl>
        <27e159be-4376-e87b-5e60-803bc3749ec2@infradead.org>
        <eadc23e7-b383-e2fc-6e20-ed22745d0bfc@xs4all.nl>
        <2739e1fd-75c6-4e43-cd79-9028479f91bf@infradead.org>
        <1e6b1961-9e9b-5f82-86a1-bf838cb68f55@xs4all.nl>
        <d7774b58-caf5-5bd8-845d-a5d45aaef4c6@infradead.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 14 Oct 2020 07:54:15 +0200,
Randy Dunlap wrote:
> 
> On 10/13/20 10:16 PM, Udo van den Heuvel wrote:
> > On 14-10-2020 07:07, Randy Dunlap wrote:
> >> On 10/13/20 9:56 PM, Udo van den Heuvel wrote:
> > 
> >>> I.e.: it looks like I will lose some funcionality when I disable
> >>> SND_HDA_CODEC_REALTEK.
> >>
> >> OK. At present you can't have it both ways, i.e., SND_HDA_CODEC_REALTEK
> >> with no LEDS. That driver apparently wants LEDS.
> > 
> > Thanks but why have I gone for years without LEDS?
> > I do not need LEDS, I do not want LEDS, I do not have LEDS (that are
> > visible, usable, etc).
> > 
> > Please make this selectable instead of forcing more bulk into my kernel.
> > 
> > Kind regards,
> > Udo
> 
> Hi Takashi,
> 
> Regarding
> commit 7cdf8c49b1df0a385db06c4f9a5ba1b16510fdcc
> Author: Takashi Iwai <tiwai@suse.de>
> Date:   Thu Jun 18 13:08:31 2020 +0200
>     ALSA: hda: generic: Add a helper for mic-mute LED with LED classdev
> 
> and this Kconfig entry:
> 
> config SND_HDA_CODEC_REALTEK
> 	tristate "Build Realtek HD-audio codec support"
> 	select SND_HDA_GENERIC
> 	select SND_HDA_GENERIC_LEDS
> 
> it seems that LED support is not always wanted (please see above).
> I.e., user(s) would like to build a kernel without LED support at all.
> 
> Can you make it a build option?

Something like this?


Takashi

---
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1390,6 +1390,11 @@ menuconfig EXPERT
 	  environments which can tolerate a "non-standard" kernel.
 	  Only use this if you really know what you are doing.
 
+config SUPERHACKER
+	bool "Rule the world" if EXPERT
+	help
+	  You are allowed to break things at your own risk.
+
 config UID16
 	bool "Enable 16-bit UID system calls" if EXPERT
 	depends on HAVE_UID16 && MULTIUSER
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -94,7 +94,7 @@ config SND_HDA_PATCH_LOADER
 config SND_HDA_CODEC_REALTEK
 	tristate "Build Realtek HD-audio codec support"
 	select SND_HDA_GENERIC
-	select SND_HDA_GENERIC_LEDS
+	select SND_HDA_GENERIC_LEDS if !SUPERHACKER
 	help
 	  Say Y or M here to include Realtek HD-audio codec support in
 	  snd-hda-intel driver, such as ALC880.
@@ -115,7 +115,7 @@ comment "Set to Y if you want auto-loading the codec driver"
 config SND_HDA_CODEC_SIGMATEL
 	tristate "Build IDT/Sigmatel HD-audio codec support"
 	select SND_HDA_GENERIC
-	select SND_HDA_GENERIC_LEDS
+	select SND_HDA_GENERIC_LEDS if !SUPERHACKER
 	help
 	  Say Y or M here to include IDT (Sigmatel) HD-audio codec support in
 	  snd-hda-intel driver, such as STAC9200.
@@ -160,7 +160,7 @@ comment "Set to Y if you want auto-loading the codec driver"
 config SND_HDA_CODEC_CONEXANT
 	tristate "Build Conexant HD-audio codec support"
 	select SND_HDA_GENERIC
-	select SND_HDA_GENERIC_LEDS
+	select SND_HDA_GENERIC_LEDS if !SUPERHACKER
 	help
 	  Say Y or M here to include Conexant HD-audio codec support in
 	  snd-hda-intel driver, such as CX20549.
--- a/sound/pci/hda/hda_generic.h
+++ b/sound/pci/hda/hda_generic.h
@@ -354,11 +354,29 @@ unsigned int snd_hda_gen_path_power_filter(struct hda_codec *codec,
 void snd_hda_gen_stream_pm(struct hda_codec *codec, hda_nid_t nid, bool on);
 int snd_hda_gen_fix_pin_power(struct hda_codec *codec, hda_nid_t pin);
 
+#ifdef CONFIG_SND_HDA_GENERIC_LEDS
 int snd_hda_gen_add_mute_led_cdev(struct hda_codec *codec,
 				  int (*callback)(struct led_classdev *,
 						  enum led_brightness));
 int snd_hda_gen_add_micmute_led_cdev(struct hda_codec *codec,
 				     int (*callback)(struct led_classdev *,
 						     enum led_brightness));
+#else /* CONFIG_SND_HDA_GENERIC_LEDS */
+static inline int
+snd_hda_gen_add_mute_led_cdev(struct hda_codec *codec,
+			      int (*callback)(struct led_classdev *,
+					      enum led_brightness))
+{
+	return -ENODEV;
+}
+
+static inline int
+snd_hda_gen_add_micmute_led_cdev(struct hda_codec *codec,
+				 int (*callback)(struct led_classdev *,
+						 enum led_brightness))
+{
+	return -ENODEV;
+}
+#endif /* CONFIG_SND_HDA_GENERIC_LEDS */
 
 #endif /* __SOUND_HDA_GENERIC_H */
