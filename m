Return-Path: <linux-leds+bounces-7047-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gILFAOfroWlDxQQAu9opvQ
	(envelope-from <linux-leds+bounces-7047-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:09:27 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8012F1BC78C
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E86230E8A3A
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 19:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A4D3ACEE6;
	Fri, 27 Feb 2026 19:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="iMVRizpU"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D459E3ACA75;
	Fri, 27 Feb 2026 19:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219249; cv=pass; b=NT8byINMMGUmkgJO/AV9uc3EyelT3MeNAD+KAFIHBJmpCjV+7Rqsc6KbEo70L0LLBYlyQ0uHFW++Gg1XCQNDTLB5KKphgW11H8iGJm40IwJfT5e694NpD82dG0B+jmKpRv7/PJEDklyI3VgLfLgc5RqapaLcQ2l/2Lybr6bEyCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219249; c=relaxed/simple;
	bh=LHdlgbZdlT4nP6fQoLCZOUarUM7jZ8R1s47iOhbszmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mdMkNRmfhMLdFpxZ9T7AZFR9coD/0C8qjPVYBFGiF3L147tcIMuIecuhCM4tHu700WcZKxQJttkytXriKJ6H4WahZghjHrDA3LbazkFa1oj4q3ueccamto4Cd+dbok8HIskA/T0dDmirmUFu7GnBT6pfWiTgrrfi5y4eu+4ix8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=iMVRizpU; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1772219229; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bypRroFizliXTlL+3DwxNDvTi+uaA/T627nGOVuWCEXjaV6DLS7E9xdHXEgfuoskeBgLtRV1aAJhrk1dHAJwWAVYZPvkU/uLAsi8tVd4fCsG0ZAlQKug9opc0cg0GfSAOrVQjqoXsVwyiwsxbE9LUtwN+ZNptu7wBqrEumdQK4E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772219229; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8wOh/AymQVXYTDItmjH7CdiSiuTr2WE8bT2ZCK9KUvk=; 
	b=fjNdjaow6ZQVAbBJOPVtRR8krApYC693HnPV4p8Uf//fhR92qID/UOv72yMdv5IBoLVw3KcZeqXMEykft+GPj/6p73f+5sODllZ13jji637f3Z47RVdRdjoXGpxbYlSOTLlbCgn251h4alLOb9AOL52woFcA5Cevjg40OVnJJIU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772219229;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8wOh/AymQVXYTDItmjH7CdiSiuTr2WE8bT2ZCK9KUvk=;
	b=iMVRizpURyijzScdidaH3jeC5uqhkd6dDRb8NDDZf9M3zmLvMEvc5IgzD0GZpKgt
	nJv4f1jGI/u6n17pCb/6umcf9/FfcW5pwghoVt2vmBJVWWUwYKWMUesMcROdRrMLSuU
	0lWABWXOyKR0+Zh64d72F38zFlk8KNKllMQPZUvoP/6bCfxmNJRYq7o7gtCc9PvGL6Y
	v+HDXTVJbEFjAdb1vjbYicHngaw8fZxFRWZy2H+jVnbcXVrEPAqCTVXQV+PiP8NOtA0
	ETTriz5gWKTn6xyOR9bQkBeUeJ/ww/aH0wT/m/EFocY4LrOg+Uvk36p0q4TWWtYjLOr
	Q3vy2BUykw==
Received: by mx.zohomail.com with SMTPS id 1772219227158191.8325362377376;
	Fri, 27 Feb 2026 11:07:07 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>
Cc: Rong Zhang <i@rong.moe>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	vsankar@lenovo.com,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 9/9] platform/x86: ideapad-laptop: Fully support auto kbd backlight
Date: Sat, 28 Feb 2026 03:06:06 +0800
Message-ID: <20260227190617.271388-10-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227190617.271388-1-i@rong.moe>
References: <20260227190617.271388-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7047-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[rong.moe:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[rong.moe,gmail.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rong.moe:mid,rong.moe:dkim,rong.moe:email]
X-Rspamd-Queue-Id: 8012F1BC78C
X-Rspamd-Action: no action

Currently, the auto brightness mode of keyboard backlight maps to
brightness=0 in LED classdev. The only method to switch to such a mode
is by pressing the manufacturer-defined shortcut (Fn+Space). However, 0
is a multiplexed brightness value; writing 0 simply results in the
backlight being turned off.

With brightness processing code decoupled from LED classdev, we can now
fully support the auto brightness mode. In this mode, the keyboard
backlight is controlled by the EC according to the ambient light sensor
(ALS).

To utilize this, a private hw control trigger "ideapad-auto" is added,
with the event handling procedure calling the
led_trigger_notify_hw_control_changed() interface to activate/deactivate
the private trigger according to the current LED trigger state.

Meanwhile, block brightness changes on exit to prevent the side effect
of LED device unregistration when the private trigger is active from
resetting the brightness to zero, so that we can retain the state of
auto mode among boots.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/Kconfig          |  1 +
 drivers/platform/x86/lenovo/ideapad-laptop.c | 86 ++++++++++++++++++--
 2 files changed, 79 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index f885127b007f1..626180370add4 100644
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
index b9af0294fc933..99cdd18cc1a5d 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -26,6 +26,7 @@
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
 #include <linux/power_supply.h>
@@ -166,6 +167,8 @@ enum {
 	KBD_BL_TRISTATE_AUTO = 3,
 };
 
+#define KBD_BL_AUTO_MODE_HW_BRIGHTNESS	3
+
 #define KBD_BL_QUERY_TYPE		0x1
 #define KBD_BL_TRISTATE_TYPE		0x5
 #define KBD_BL_TRISTATE_AUTO_TYPE	0x7
@@ -1620,8 +1623,9 @@ static int ideapad_kbd_bl_brightness_parse(struct ideapad_private *priv,
 	if (hw_brightness <= priv->kbd_bl.led.max_brightness)
 		return hw_brightness;
 
-	/* Auto, report as off */
-	if (hw_brightness == priv->kbd_bl.led.max_brightness + 1)
+	/* Auto (controlled by EC according to ALS), report as off */
+	if (priv->kbd_bl.type == KBD_BL_TRISTATE_AUTO &&
+	    hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS)
 		return 0;
 
 	/* Unknown value */
@@ -1709,9 +1713,39 @@ static int ideapad_kbd_bl_led_cdev_brightness_set(struct led_classdev *led_cdev,
 {
 	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
 
+	/*
+	 * When deinitializing: It must be the side effect of led_cdev
+	 * unregistration when our private trigger is active. We've set
+	 * LED_RETAIN_AT_SHUTDOWN to retain led_cdev brightness level. To do the
+	 * same for auto mode, gate changes and return early.
+	 */
+	if (unlikely(!priv->kbd_bl.initialized))
+		return 0;
+
 	return ideapad_kbd_bl_brightness_set(priv, brightness);
 }
 
+static int ideapad_kbd_bl_auto_trigger_activate(struct led_classdev *led_cdev)
+{
+	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
+
+	return ideapad_kbd_bl_hw_brightness_set(priv, KBD_BL_AUTO_MODE_HW_BRIGHTNESS);
+}
+
+static bool ideapad_kbd_bl_auto_trigger_offloaded(struct led_classdev *led_cdev)
+{
+	return true;
+}
+
+static struct led_hw_trigger_type ideapad_kbd_bl_auto_trigger_type;
+
+static struct led_trigger ideapad_kbd_bl_auto_trigger = {
+	.name = "ideapad-auto",
+	.trigger_type = &ideapad_kbd_bl_auto_trigger_type,
+	.activate = ideapad_kbd_bl_auto_trigger_activate,
+	.offloaded = ideapad_kbd_bl_auto_trigger_offloaded,
+};
+
 static void ideapad_kbd_bl_notify_known(struct ideapad_private *priv, unsigned int brightness)
 {
 	if (brightness == priv->kbd_bl.last_brightness)
@@ -1724,12 +1758,23 @@ static void ideapad_kbd_bl_notify_known(struct ideapad_private *priv, unsigned i
 
 static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 {
-	int brightness;
+	int hw_brightness, brightness;
 
 	if (!priv->kbd_bl.initialized)
 		return;
 
-	brightness = ideapad_kbd_bl_brightness_get(priv);
+	hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
+	if (hw_brightness < 0)
+		return;
+
+	if (priv->kbd_bl.type == KBD_BL_TRISTATE_AUTO) {
+		bool activate = hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS;
+
+		led_trigger_notify_hw_control_changed(&priv->kbd_bl.led, activate,
+						      &ideapad_kbd_bl_auto_trigger);
+	}
+
+	brightness = ideapad_kbd_bl_brightness_parse(priv, hw_brightness);
 	if (brightness < 0)
 		return;
 
@@ -1738,7 +1783,7 @@ static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 
 static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 {
-	int brightness, err;
+	int hw_brightness, brightness, err;
 
 	if (!priv->features.kbd_bl)
 		return -ENODEV;
@@ -1746,12 +1791,37 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 	if (WARN_ON(priv->kbd_bl.initialized))
 		return -EEXIST;
 
-	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type))
+	hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
+	if (hw_brightness < 0)
+		return hw_brightness;
+
+	switch (priv->kbd_bl.type) {
+	case KBD_BL_TRISTATE_AUTO:
+		err = devm_led_trigger_register(&priv->platform_device->dev,
+						&ideapad_kbd_bl_auto_trigger);
+		if (err)
+			return err;
+
+		priv->kbd_bl.led.trigger_type       = &ideapad_kbd_bl_auto_trigger_type;
+		priv->kbd_bl.led.hw_control_trigger = ideapad_kbd_bl_auto_trigger.name;
+
+		/* HW remembers the last brightness level, including auto mode. */
+		if (hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS)
+			priv->kbd_bl.led.default_trigger = ideapad_kbd_bl_auto_trigger.name;
+
+		fallthrough;
+	case KBD_BL_TRISTATE:
 		priv->kbd_bl.led.max_brightness = 2;
-	else
+		break;
+	case KBD_BL_STANDARD:
 		priv->kbd_bl.led.max_brightness = 1;
+		break;
+	default:
+		/* This has already been validated by ideapad_check_features(). */
+		unreachable();
+	}
 
-	brightness = ideapad_kbd_bl_brightness_get(priv);
+	brightness = ideapad_kbd_bl_brightness_parse(priv, hw_brightness);
 	if (brightness < 0)
 		return brightness;
 
-- 
2.51.0


