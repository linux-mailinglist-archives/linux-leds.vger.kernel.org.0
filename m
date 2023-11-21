Return-Path: <linux-leds+bounces-70-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2B37F3399
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 17:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C09DDB210B1
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 16:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBA55916A;
	Tue, 21 Nov 2023 16:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cnRKQJp9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xaoy7gfZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42CCB112;
	Tue, 21 Nov 2023 08:24:15 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7E67C1F8C0;
	Tue, 21 Nov 2023 16:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1700583853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M6aD2LqNot/ZwhMqOK5TUK0lLS9Vd5khhGJ3ybOVaiQ=;
	b=cnRKQJp9FrLJESaatg94BB1TOfNYhVZjQxtbISN3+pQr+iJWQqzi+oKjAXJD7cVREndo9X
	RJQJiEAYRl7Js/8hJruqtlfrCWbUZ1AHX31wT3LYje0BBspFqGZU1kBGGvKn4YRBFBRNSa
	3p4l1UWr0kmdajpFXHcgYgqUtYs5lL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700583853;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M6aD2LqNot/ZwhMqOK5TUK0lLS9Vd5khhGJ3ybOVaiQ=;
	b=xaoy7gfZMFFtWN4wgBvHyYdLaXu+hS75ty+RrdRUTAdKqq+DLPSvPu979izCeALucIv7Oj
	p5cuQNVnCVVqxjCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 480AD138E3;
	Tue, 21 Nov 2023 16:24:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id C8VPEK3ZXGVsFgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 21 Nov 2023 16:24:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	=?UTF-8?q?Johannes=20Pen=C3=9Fel?= <johannes.penssel@gmail.com>,
	Jeremy Soller <jeremy@system76.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] leds: class: Don't expose color sysfs entry
Date: Tue, 21 Nov 2023 17:23:59 +0100
Message-Id: <20231121162359.9332-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	 RCVD_TLS_ALL(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[ucw.cz,traphandler.com,vger.kernel.org,gmail.com,system76.com,redhat.com];
	 RCVD_COUNT_TWO(0.00)[2];
	 SUSPICIOUS_RECIPS(1.50)[]

The commit c7d80059b086 ("leds: class: Store the color index in struct
led_classdev") introduced a new sysfs entry "color" that is commonly
created for the led classdev.  Unfortunately, this conflicts with the
"color" sysfs entry of already existing drivers such as Logitech HID
or System76 ACPI drivers.  The driver probe fails due to the conflict,
hence it leads to a severe regression with the missing keyboard, for
example.

This patch reverts partially the change in the commit above for
removing the led class color sysfs entries again for addressing the
regressions.  The newly introduced led_classdev.color field is kept as
it's already used by other driver.

Fixes: c7d80059b086 ("leds: class: Store the color index in struct led_classdev")
Reported-by: Johannes Penßel <johannes.penssel@gmail.com>
Closes: https://lore.kernel.org/r/b5646db3-acff-45aa-baef-df3f660486fb@gmail.com
Link: https://bugzilla.kernel.org/show_bug.cgi?id=218045
Link: https://bugzilla.kernel.org/show_bug.cgi?id=218155
Link: https://bugzilla.suse.com/show_bug.cgi?id=1217172
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

This is a sort of v2 patch, as it turned out that the full revert
leads to a build error.

 Documentation/ABI/testing/sysfs-class-led |  9 ---------
 drivers/leds/led-class.c                  | 14 --------------
 2 files changed, 23 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index b2ff0012c0f2..2e24ac3bd7ef 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -59,15 +59,6 @@ Description:
 		brightness. Reading this file when no hw brightness change
 		event has happened will return an ENODATA error.
 
-What:		/sys/class/leds/<led>/color
-Date:		June 2023
-KernelVersion:	6.5
-Description:
-		Color of the LED.
-
-		This is a read-only file. Reading this file returns the color
-		of the LED as a string (e.g: "red", "green", "multicolor").
-
 What:		/sys/class/leds/<led>/trigger
 Date:		March 2006
 KernelVersion:	2.6.17
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 974b84f6bd6a..ba1be15cfd8e 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -75,19 +75,6 @@ static ssize_t max_brightness_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(max_brightness);
 
-static ssize_t color_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
-{
-	const char *color_text = "invalid";
-	struct led_classdev *led_cdev = dev_get_drvdata(dev);
-
-	if (led_cdev->color < LED_COLOR_ID_MAX)
-		color_text = led_colors[led_cdev->color];
-
-	return sysfs_emit(buf, "%s\n", color_text);
-}
-static DEVICE_ATTR_RO(color);
-
 #ifdef CONFIG_LEDS_TRIGGERS
 static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
 static struct bin_attribute *led_trigger_bin_attrs[] = {
@@ -102,7 +89,6 @@ static const struct attribute_group led_trigger_group = {
 static struct attribute *led_class_attrs[] = {
 	&dev_attr_brightness.attr,
 	&dev_attr_max_brightness.attr,
-	&dev_attr_color.attr,
 	NULL,
 };
 
-- 
2.35.3


