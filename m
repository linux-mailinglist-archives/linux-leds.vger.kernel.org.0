Return-Path: <linux-leds+bounces-8651-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q3s8KabSMmqY5wUAu9opvQ
	(envelope-from <linux-leds+bounces-8651-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 19:00:22 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 470E269B8B2
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 19:00:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rong.moe header.s=zmail2048 header.b=mW9xcRgE;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8651-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8651-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=rong.moe;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D67E231EF248
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 16:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FC04C9018;
	Wed, 17 Jun 2026 16:50:19 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE204C9009;
	Wed, 17 Jun 2026 16:50:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781715019; cv=pass; b=swqQtRsfkuSkHi4Jh9mCqGstwMfeCFc+4+n5whDFeZTw9vz9nUsrZl7YyDVq1NeEdnyNNxR82dd8KbP1629sRO0tGeUpacQe+unKM9oafalYyRZTBrMKEKsaFFbxE/uRT2kmY6xAOu721PifhiT7JZbWFdFCLBzMboo8VCLX9+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781715019; c=relaxed/simple;
	bh=MTJ4kxF9NbMdUJw1gBwgd8RMq6kZD/vQoFSH3E9E/qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NmZCjgoREKOY27ScNO0yTskqk2ZT/FPw92/eCdfHMSeth8mZK217vr8KERAZ/p2TtOGcO7Ly/BATEFV6sNPsX8R3TBWbHvhfv0koIAEM2hBIYEKoBi4ASN6A4+y3tx65E24sX5MaHQCSSb7P0h3XAv1Pb1uS6QyO+874PKMvkzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=mW9xcRgE; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal: i=1; a=rsa-sha256; t=1781714991; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TrkkIwVI8mZrkQXwGnPfrZviBAZDTmv1DsT340JJQnC3coTyttGXPpFBw1P9QWyyzgkDsdXnpxy8hSuKKWtb6IxW1kaKqIAwhHBaOMmPKL7PlGnDmY0MWG9ZLuK0LJUVzYvRwytW9d1pcA0ThWFBuK4tM/2E543vb4KQmFgLkW4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781714991; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mW++TMywuejOJ6+lHjNgcZ6lhJeANPzXkcvE9h8pTu4=; 
	b=aFUW5z8BK8i754SKiaMaBYn9sH5hrMwF/QlOSQSsEH/zpk3LleSvua3nJi3PuHrM+U4WbYB23eJQ0ryrwj6gV4tbZ6tOSW7t5Z84e3ixAzyS8ciDVpO79R/5FFqrgQI2Qjt0rqipw8b148DNe55swstrTXhURNo6qOy1T38P6Fw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781714991;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=mW++TMywuejOJ6+lHjNgcZ6lhJeANPzXkcvE9h8pTu4=;
	b=mW9xcRgE13jdHho/wedMrQ5R/sr/hcwZ+wF1QCrAGdYJb1QyHJTgmTE/NWOy847S
	WBfID60kG9Ywa/mDq7EpSN6zI1/os4AQf4ThmhBF47NcjjpgdpIsYVWhOHy17fO9ueW
	VCyWgQOG7UlpFerQYtBrTwHThnU12l68vrd/9xCbeCk9qq7EeSQE403eSIOlJ20qQRp
	gnoGVetl0PsGG1zULAiiMNsqniNUTqUtCqefVuD3y1qeeuPy6ipYFvYMIQlQYlbtOTD
	XX2R2kC0RKDJ7BwvkzfdACF5j3IKkOoNCsBKYazGVowbRBI7keLvzxnAOca5V8Sg+CW
	rh4aaj7S4g==
Received: by mx.zohomail.com with SMTPS id 1781714989936315.34851963631866;
	Wed, 17 Jun 2026 09:49:49 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Thu, 18 Jun 2026 00:48:01 +0800
Subject: [PATCH RFC v2 7/9] platform/x86: ideapad-laptop: Decouple hardware
 & classdev brightness for keyboard backlight
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-leds-trigger-hw-changed-v2-7-c28c44053cf3@rong.moe>
References: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
In-Reply-To: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Ike Panhc <ikepanhc@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
 Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
 linux-leds@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@weissschuh.net,m:bleung@chromium.org,m:groeck@chromium.org,m:kabel@kernel.org,m:mpearson-lenovo@squebb.ca,m:derekjohn.clark@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:ikepanhc@gmail.com,m:andrew+netdev@lunn.ch,m:kuba@kernel.org,m:vishnuocv@gmail.com,m:vsankar@lenovo.com,m:linux-leds@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chrome-platform@lists.linux.dev,m:platform-driver-x86@vger.kernel.org,m:i@rong.moe,m:derekjohnclark@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com];
	FORGED_SENDER(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-8651-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rong.moe:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,gmail.com,lenovo.com,vger.kernel.org,lists.linux.dev,rong.moe];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:dkim,rong.moe:email,rong.moe:mid,rong.moe:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 470E269B8B2

Some recent models come with an ambient light sensor (ALS). On these
models, their EC will automatically set the keyboard backlight to an
appropriate brightness when the effective "hardware brightness" is 3.
"Hardware brightness" can't be perfectly mapped to an LED classdev
brightness, but the EC does use this predefined brightness value to
represent auto mode.

Currently, the code processing keyboard backlight is coupled with LED
classdev, making it hard to expose the auto brightness (ALS) mode to the
userspace.

As the first step toward the goal, decouple hardware brightness from LED
classdev brightness, and update comments about corresponding backlight
modes.

Since upcoming changes will heavily rely on kbd_bl.last_hw_brightness,
also convert it into an atomic_t to prevent potential race conditions.

To minimalize the diff set in upcoming changes, a trivial refactor
also converts the initialization path into another equivalent form.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/Kconfig          |   1 +
 drivers/platform/x86/lenovo/ideapad-laptop.c | 148 ++++++++++++++++++---------
 2 files changed, 103 insertions(+), 46 deletions(-)

diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 09b1b055d2e0..76ed1593e2aa 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -16,6 +16,7 @@ config IDEAPAD_LAPTOP
 	select INPUT_SPARSEKMAP
 	select NEW_LEDS
 	select LEDS_CLASS
+	select LEDS_TRIGGERS
 	help
 	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
 	  rfkill switch, hotkey, fan control and backlight control.
diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 4fbc904f1fc3..40153dc9a5f2 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -9,6 +9,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
+#include <linux/atomic.h>
 #include <linux/backlight.h>
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
@@ -134,10 +135,31 @@ enum {
 };
 
 /*
- * These correspond to the number of supported states - 1
- * Future keyboard types may need a new system, if there's a collision
- * KBD_BL_TRISTATE_AUTO has no way to report or set the auto state
- * so it effectively has 3 states, but needs to handle 4
+ * The enumeration has two purposes:
+ *   - as an internal identifier for all known types of keyboard backlight
+ *   - as a mandatory parameter of the KBLC command
+ *
+ * For each type, the hardware brightness values are defined as follows:
+ * +--------------------------+----------+-----+------+------+
+ * |      Hardware brightness |        0 |   1 |    2 |    3 |
+ * | Type                     |          |     |      |      |
+ * +--------------------------+----------+-----+------+------+
+ * | KBD_BL_STANDARD          |      off |  on |  N/A |  N/A |
+ * +--------------------------+----------+-----+------+------+
+ * | KBD_BL_TRISTATE          |      off | low | high |  N/A |
+ * +--------------------------+----------+-----+------+------+
+ * | KBD_BL_TRISTATE_AUTO     |      off | low | high | auto |
+ * +--------------------------+----------+-----+------+------+
+ *
+ * We map LED classdev brightness for KBD_BL_TRISTATE_AUTO as follows:
+ * +--------------------------+----------+-----+------+
+ * |  LED classdev brightness |        0 |   1 |    2 |
+ * | Operation                |          |     |      |
+ * +--------------------------+----------+-----+------+
+ * | Read                     | off/auto | low | high |
+ * +--------------------------+----------+-----+------+
+ * | Write                    |      off | low | high |
+ * +--------------------------+----------+-----+------+
  */
 enum {
 	KBD_BL_STANDARD      = 1,
@@ -145,6 +167,8 @@ enum {
 	KBD_BL_TRISTATE_AUTO = 3,
 };
 
+#define KBD_BL_AUTO_MODE_HW_BRIGHTNESS	3
+
 #define KBD_BL_QUERY_TYPE		0x1
 #define KBD_BL_TRISTATE_TYPE		0x5
 #define KBD_BL_TRISTATE_AUTO_TYPE	0x7
@@ -203,7 +227,7 @@ struct ideapad_private {
 		bool initialized;
 		int type;
 		struct led_classdev led;
-		unsigned int last_brightness;
+		atomic_t last_hw_brightness;
 	} kbd_bl;
 	struct {
 		bool initialized;
@@ -1592,7 +1616,24 @@ static int ideapad_kbd_bl_check_tristate(int type)
 	return (type == KBD_BL_TRISTATE) || (type == KBD_BL_TRISTATE_AUTO);
 }
 
-static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
+static int ideapad_kbd_bl_brightness_parse(struct ideapad_private *priv, int hw_brightness)
+{
+	/* Off, low or high */
+	if (hw_brightness <= priv->kbd_bl.led.max_brightness)
+		return hw_brightness;
+
+	/* Auto (controlled by EC according to ALS), report as off */
+	if (priv->kbd_bl.type == KBD_BL_TRISTATE_AUTO &&
+	    hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS)
+		return 0;
+
+	/* Unknown value */
+	dev_warn(&priv->platform_device->dev,
+		 "Unknown keyboard backlight value: %u", hw_brightness);
+	return -EINVAL;
+}
+
+static int ideapad_kbd_bl_hw_brightness_get(struct ideapad_private *priv)
 {
 	unsigned long value;
 	int err;
@@ -1606,21 +1647,7 @@ static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
 		if (err)
 			return err;
 
-		/* Convert returned value to brightness level */
-		value = FIELD_GET(KBD_BL_GET_BRIGHTNESS, value);
-
-		/* Off, low or high */
-		if (value <= priv->kbd_bl.led.max_brightness)
-			return value;
-
-		/* Auto, report as off */
-		if (value == priv->kbd_bl.led.max_brightness + 1)
-			return 0;
-
-		/* Unknown value */
-		dev_warn(&priv->platform_device->dev,
-			 "Unknown keyboard backlight value: %lu", value);
-		return -EINVAL;
+		return FIELD_GET(KBD_BL_GET_BRIGHTNESS, value);
 	}
 
 	err = eval_hals(priv->adev->handle, &value);
@@ -1630,6 +1657,16 @@ static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
 	return !!test_bit(HALS_KBD_BL_STATE_BIT, &value);
 }
 
+static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
+{
+	int hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
+
+	if (hw_brightness < 0)
+		return hw_brightness;
+
+	return ideapad_kbd_bl_brightness_parse(priv, hw_brightness);
+}
+
 static enum led_brightness ideapad_kbd_bl_led_cdev_brightness_get(struct led_classdev *led_cdev)
 {
 	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
@@ -1637,32 +1674,37 @@ static enum led_brightness ideapad_kbd_bl_led_cdev_brightness_get(struct led_cla
 	return ideapad_kbd_bl_brightness_get(priv);
 }
 
-static int ideapad_kbd_bl_brightness_set(struct ideapad_private *priv, unsigned int brightness)
+static int ideapad_kbd_bl_hw_brightness_set(struct ideapad_private *priv, int hw_brightness)
 {
-	int err;
 	unsigned long value;
 	int type = priv->kbd_bl.type;
+	int err;
 
 	if (ideapad_kbd_bl_check_tristate(type)) {
-		if (brightness > priv->kbd_bl.led.max_brightness)
-			return -EINVAL;
-
-		value = FIELD_PREP(KBD_BL_SET_BRIGHTNESS, brightness) |
+		value = FIELD_PREP(KBD_BL_SET_BRIGHTNESS, hw_brightness) |
 			FIELD_PREP(KBD_BL_COMMAND_TYPE, type) |
 			KBD_BL_COMMAND_SET;
 		err = exec_kblc(priv->adev->handle, value);
 	} else {
-		err = exec_sals(priv->adev->handle, brightness ? SALS_KBD_BL_ON : SALS_KBD_BL_OFF);
+		value = hw_brightness ? SALS_KBD_BL_ON : SALS_KBD_BL_OFF;
+		err = exec_sals(priv->adev->handle, value);
 	}
-
 	if (err)
 		return err;
 
-	priv->kbd_bl.last_brightness = brightness;
+	atomic_set(&priv->kbd_bl.last_hw_brightness, hw_brightness);
 
 	return 0;
 }
 
+static int ideapad_kbd_bl_brightness_set(struct ideapad_private *priv, int brightness)
+{
+	if (brightness > priv->kbd_bl.led.max_brightness)
+		return -EINVAL;
+
+	return ideapad_kbd_bl_hw_brightness_set(priv, brightness);
+}
+
 static int ideapad_kbd_bl_led_cdev_brightness_set(struct led_classdev *led_cdev,
 						  enum led_brightness brightness)
 {
@@ -1673,26 +1715,31 @@ static int ideapad_kbd_bl_led_cdev_brightness_set(struct led_classdev *led_cdev,
 
 static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 {
-	int brightness;
+	int hw_brightness, brightness, last_brightness, last_hw_brightness;
 
 	if (!priv->kbd_bl.initialized)
 		return;
 
-	brightness = ideapad_kbd_bl_brightness_get(priv);
-	if (brightness < 0)
+	hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
+	if (hw_brightness < 0)
 		return;
 
-	if (brightness == priv->kbd_bl.last_brightness)
-		return;
+	brightness = ideapad_kbd_bl_brightness_parse(priv, hw_brightness);
+	if (brightness < 0)
+		return; /* Reject insane values early. */
 
-	priv->kbd_bl.last_brightness = brightness;
+	last_hw_brightness = atomic_xchg(&priv->kbd_bl.last_hw_brightness, hw_brightness);
+	if (hw_brightness == last_hw_brightness)
+		return;
 
-	led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, brightness);
+	last_brightness = ideapad_kbd_bl_brightness_parse(priv, last_hw_brightness);
+	if (last_brightness < 0 || brightness != last_brightness)
+		led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, brightness);
 }
 
 static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 {
-	int brightness, err;
+	int hw_brightness, err;
 
 	if (!priv->features.kbd_bl)
 		return -ENODEV;
@@ -1700,21 +1747,30 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 	if (WARN_ON(priv->kbd_bl.initialized))
 		return -EEXIST;
 
-	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type))
-		priv->kbd_bl.led.max_brightness = 2;
-	else
-		priv->kbd_bl.led.max_brightness = 1;
+	hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
+	if (hw_brightness < 0)
+		return hw_brightness;
 
-	brightness = ideapad_kbd_bl_brightness_get(priv);
-	if (brightness < 0)
-		return brightness;
+	atomic_set(&priv->kbd_bl.last_hw_brightness, hw_brightness);
 
-	priv->kbd_bl.last_brightness = brightness;
 	priv->kbd_bl.led.name                    = "platform::" LED_FUNCTION_KBD_BACKLIGHT;
 	priv->kbd_bl.led.brightness_get          = ideapad_kbd_bl_led_cdev_brightness_get;
 	priv->kbd_bl.led.brightness_set_blocking = ideapad_kbd_bl_led_cdev_brightness_set;
 	priv->kbd_bl.led.flags                   = LED_BRIGHT_HW_CHANGED | LED_RETAIN_AT_SHUTDOWN;
 
+	switch (priv->kbd_bl.type) {
+	case KBD_BL_TRISTATE_AUTO:
+	case KBD_BL_TRISTATE:
+		priv->kbd_bl.led.max_brightness = 2;
+		break;
+	case KBD_BL_STANDARD:
+		priv->kbd_bl.led.max_brightness = 1;
+		break;
+	default:
+		/* This has already been validated by ideapad_check_features(). */
+		unreachable();
+	}
+
 	err = led_classdev_register(&priv->platform_device->dev, &priv->kbd_bl.led);
 	if (err)
 		return err;

-- 
2.53.0


