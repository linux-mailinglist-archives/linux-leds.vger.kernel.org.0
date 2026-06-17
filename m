Return-Path: <linux-leds+bounces-8650-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FlbWBjXSMmp85wUAu9opvQ
	(envelope-from <linux-leds+bounces-8650-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 18:58:29 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B6C69B881
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 18:58:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rong.moe header.s=zmail2048 header.b=cB5C88mI;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8650-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8650-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=rong.moe;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0886731BC06D
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 16:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6624C8FE5;
	Wed, 17 Jun 2026 16:50:07 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3704C041B;
	Wed, 17 Jun 2026 16:50:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781715007; cv=pass; b=ZLhqnFvpAJFK5n1pJApSn/zXsg56ZiTjk4C4GmEsVelgMi8XwRUzAjkLLWRge1bo4xky01DxJhBgC6KPzY779NayEWz6dYkq8z/pJsnXRYIB0Kk1pCR1hoBbkynf44b5uI6sE/mlGzAImzas4WcGw+ohd0TD2HmRG2GLQ9LruSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781715007; c=relaxed/simple;
	bh=qcV+ghn9bXTx0q01Ru55nJGFnkb5b4Ve4WfMLVwbrNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KmItrBzYX2TTkfPfXX+Z8U9sYRBqI7nj5VdBd0JR388t+VEqWbjsKObuTEn5b/NUF+ukLa9X8UXr5qUkttCIj2wm/z2b2M4VzsZFK14aYwy3r1FJvL+jBAK2ko2V11W69GTLbIEZpS3ge31tXsJu8qPzr7T0fkXwxOJt7ZU3U/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=cB5C88mI; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal: i=1; a=rsa-sha256; t=1781714981; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dSFQ+PZecON+WEOiTSP9cmMcEr9KCEDU0wqlNQRws5cq7SlMSRI0SSsUPUBa3zjrk6GaKHgzpdOrUZWiINOoZDb+kqV71xC/jrsDoih6q+WWBpQ4dgYihQYKMmEF+fIzhXaLr+AGlXyshAGRt5ucqgWfSOzLZ77GLExEh5DzONo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781714981; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lZ4EusPRR2hYiSCuHaS3ddpu16Mp1+fECmtSsXal90Q=; 
	b=X/UkL6Xap//6frPtB4yHIBdpKSvIzn3fPnq4m1oHFpjLKFikPJE7bx5tkbCY37niFW9D77B2ugf0g7J16ujjmWAWn+9s7CidyvoJ1+7dfQePDaA2dP7TF8Y6EnaLACNBKv2L0oQY9wLEWbEB9F0qqQ5hK7n+PFZrnXta3o3IELA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781714981;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=lZ4EusPRR2hYiSCuHaS3ddpu16Mp1+fECmtSsXal90Q=;
	b=cB5C88mIXb+MzNa3G/edEqHcjkO3rZpe01U305wAl4gF6b+P3Ae2iGR3V6SY8aSc
	NpiGKFtOl8JaZfqDbN4K7CHYi3XusJp6YNfpia/AJ3AoBD6Z7robdA8jH2dJ74lLBpB
	LlfpbErhNkKKrh7tHy53awj7+WSj9p/fHxcf7HcFd3itUCFhPtEVWrXC2TFa+62XPpf
	CznN1CC1W+vSSJ9Rcy36DrfcepCqpgxng8IKc3xXSrhCIkJCcJGi9Na/QxNxBLLGmh+
	DrGvbgGpWfMN6N0gYVRudpictuc4+qPqMRFZyViOMaCo07Edjasx2lXb7CSCQmHU/K1
	HCbnjRqMDA==
Received: by mx.zohomail.com with SMTPS id 1781714980482428.43349823305573;
	Wed, 17 Jun 2026 09:49:40 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Thu, 18 Jun 2026 00:48:00 +0800
Subject: [PATCH RFC v2 6/9] leds: trigger: Add
 led_trigger_notify_hw_control_changed() interface
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-leds-trigger-hw-changed-v2-6-c28c44053cf3@rong.moe>
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
	TAGGED_FROM(0.00)[bounces-8650-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:dkim,rong.moe:email,rong.moe:mid,rong.moe:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,openedhand.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88B6C69B881

Some hardware can autonomously activate/deactivate hardware control.
After that, the LED hardware notifies the LED driver. Currently, there
is no mechanism for LED drivers to notify the LED core about such events
and initiate a trigger transition to reflect the hardware state.

Add a new interface called led_trigger_notify_hw_control_changed(), so
that LED drivers can call it to notify the LED core about the
transition.

The interface only allows two transitions:

1. "none" => private trigger
2. private trigger => "none"

If the current trigger is neither the private trigger nor "none", no
transition will be made. This protects the currently selected software
trigger.

Note that LED_OFF won't be emitted during the #2 transition, as some
hardware may have selected a new brightness level during its hardware
state transition (e.g., laptop keyboards with a shortcut cycling through
different backlight brightnesses and auto mode).

The interface is designed as a void function as any failure should be
non-fatal and the result of transition should not have any impact on the
LED drivers' event handling procedures.

To use the interface, LEDS_TRIGGERS_HW_CHANGED must be enabled in
Kconfig, and the LED driver must set the LED_TRIG_HW_CHANGED flag for
the classdev.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 Documentation/leds/leds-class.rst | 61 +++++++++++++++++++++++++++
 drivers/leds/led-triggers.c       | 86 +++++++++++++++++++++++++++++++++++++--
 drivers/leds/trigger/Kconfig      |  9 ++++
 include/linux/leds.h              |  8 ++++
 4 files changed, 161 insertions(+), 3 deletions(-)

diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
index 41342ecb5f6b..f250dc938e1f 100644
--- a/Documentation/leds/leds-class.rst
+++ b/Documentation/leds/leds-class.rst
@@ -261,9 +261,70 @@ the end use hw_control_set to activate hw control.
 A trigger can use hw_control_get to check if a LED is already in hw control
 and init their flags.
 
+Alternatively, a private trigger can be implemented along with the LED driver if
+the LED's hw control doesn't fit any generic trigger. To associate the private
+trigger with the LED classdev, their `trigger_type` must be the same. The name
+of the private trigger must be the same as `hw_control_trigger`. Since both the
+LED classdev and the private trigger are in the same LED driver, it's not
+necessary for them to coordinate via `hw_control_*` callbacks.
+
 When the LED is in hw control, no software blink is possible and doing so
 will effectively disable hw control.
 
+Hardware-initiated trigger transition
+=====================================
+
+Some hardware can autonomously activate/deactivate hardware control. After that,
+the LED hardware notifies the LED driver.
+
+If the driver can detect such transitions and thus wants to notify the LED core
+to update the current trigger then the `LED_TRIG_HW_CHANGED` flag must be set in
+flags before registering. To update the current trigger accordingly, call
+`led_trigger_notify_hw_control_changed` on the LED classdev. Calling the method
+on a classdev not registered with the `LED_TRIG_HW_CHANGED` flag or an
+appropriate `hw_control_trigger` string is a bug and will trigger a WARN_ON.
+
+This capability is restricted to the LED device's private trigger. The private
+trigger must have been properly registered (see above) and named after
+`hw_control_trigger`, or else a dev_err() will be triggered.
+
+Only two transitions are defined:
+
+- "none" => private trigger:
+        This happens when the hardware autonomously activates hardware control
+        and when "none" (i.e., no trigger) is currently active. If the private
+        trigger is already active when the method is called, this is essentially
+        a no-op.
+
+        The activation sequence for the private trigger will be executed as
+        normal.
+
+        The LED driver and its private trigger must be able to handle the
+        activation sequence even if the hardware is currently in hardware
+        control.
+
+        If error occurs in the activation sequence, the LED Trigger core reverts
+        the effective trigger to "none".
+
+- private trigger => "none"
+        This happens when the hardware autonomously deactivates hardware control
+        and when the private trigger is currently active. If "none" (i.e., no
+        trigger) is active when the method is called, this is essentially a
+        no-op.
+
+        The deactivation sequence for the private trigger will be executed as
+        normal, except that the current LED brightness is retained. The reason
+        for keeping the brightness unchanged is that some hardware may choose a
+        specific brightness instead of simply turning off the LED after
+        autonomously deactivating hardware control.
+
+        The LED driver and its private trigger must be able to handle the
+        deactivation sequence even if the hardware is not currently in hardware
+        control.
+
+If the current trigger is neither the private trigger nor "none", no transition
+will be made.
+
 Known Issues
 ============
 
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index c43229d9c4c1..73e9ce376d02 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -7,6 +7,7 @@
  * Author: Richard Purdie <rpurdie@openedhand.com>
  */
 
+#include <linux/bug.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
@@ -162,8 +163,8 @@ ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
 }
 EXPORT_SYMBOL_GPL(led_trigger_read);
 
-/* Caller must ensure led_cdev->trigger_lock held */
-int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
+static int __led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig,
+			     bool hw_triggered)
 {
 	char *event = NULL;
 	char *envp[2];
@@ -194,7 +195,21 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 		led_cdev->trigger_data = NULL;
 		led_cdev->activated = false;
 		led_cdev->flags &= ~LED_INIT_DEFAULT_TRIGGER;
-		led_set_brightness(led_cdev, LED_OFF);
+
+		/*
+		 * Hardware may have selected a new brightness level during its
+		 * hardware control transition, so only reset brightness if we
+		 * are switching to another trigger or if the switching is not
+		 * hardware triggered.
+		 *
+		 * Note that this does not apply to the error path, as running
+		 * into the error path implies a none => private trigger
+		 * transition. This hints that the LED driver and its private
+		 * trigger must have some fundamental bugs, so don't bother
+		 * leaving the LED in an undefined state.
+		 */
+		if (trig || !hw_triggered)
+			led_set_brightness(led_cdev, LED_OFF);
 	}
 	if (trig) {
 		spin_lock(&trig->leddev_list_lock);
@@ -258,6 +273,12 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 
 	return ret;
 }
+
+/* Caller must ensure led_cdev->trigger_lock held */
+int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
+{
+	return __led_trigger_set(led_cdev, trig, false);
+}
 EXPORT_SYMBOL_GPL(led_trigger_set);
 
 void led_trigger_remove(struct led_classdev *led_cdev)
@@ -448,6 +469,65 @@ int devm_led_trigger_register(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_led_trigger_register);
 
+#ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
+static void led_trigger_do_hw_control_transition(struct led_classdev *led_cdev, bool activate,
+						 struct led_trigger *hc_trig)
+{
+	int err = 0;
+
+	if (!led_cdev->trigger) {
+		/* "none" => private trigger. */
+		if (activate)
+			err = __led_trigger_set(led_cdev, hc_trig, true);
+	} else if (led_cdev->trigger == hc_trig) {
+		/* private trigger => "none". */
+		if (!activate)
+			err = __led_trigger_set(led_cdev, NULL, true);
+	} else {
+		/* Other trigger is active. */
+		dev_dbg(led_cdev->dev,
+			"Ignoring hw control transition (%s %s) while %s is active",
+			activate ? "activate" : "deactivate", hc_trig->name,
+			led_cdev->trigger->name);
+
+		return;
+	}
+
+	if (err)
+		dev_warn(led_cdev->dev, "Failed to %s %s in hw control transition: %d",
+			 activate ? "activate" : "deactivate", hc_trig->name, err);
+}
+
+void led_trigger_notify_hw_control_changed(struct led_classdev *led_cdev, bool activate)
+{
+	struct led_trigger *trig;
+
+	/* Restricted to private triggers. */
+	if (WARN_ON(!(led_cdev->flags & LED_TRIG_HW_CHANGED) ||
+		    !led_cdev->hw_control_trigger || !led_cdev->trigger_type))
+		return;
+
+	down_read(&triggers_list_lock);
+	list_for_each_entry(trig, &trigger_list, next_trig) {
+		if (trig->trigger_type == led_cdev->trigger_type &&
+		    !strcmp(trig->name, led_cdev->hw_control_trigger)) {
+			down_write(&led_cdev->trigger_lock);
+			led_trigger_do_hw_control_transition(led_cdev, activate, trig);
+			up_write(&led_cdev->trigger_lock);
+
+			up_read(&triggers_list_lock);
+			return;
+		}
+	}
+	up_read(&triggers_list_lock);
+
+	dev_err(led_cdev->dev,
+		"%s() is called, but the private trigger (%s) is never registered\n",
+		__func__, led_cdev->hw_control_trigger);
+}
+EXPORT_SYMBOL_GPL(led_trigger_notify_hw_control_changed);
+#endif /* CONFIG_LEDS_TRIGGERS_HW_CHANGED */
+
 /* Simple LED Trigger Interface */
 
 void led_trigger_event(struct led_trigger *trig,
diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index c11282a74b5a..798122154049 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -9,6 +9,15 @@ menuconfig LEDS_TRIGGERS
 
 if LEDS_TRIGGERS
 
+config LEDS_TRIGGERS_HW_CHANGED
+	bool "LED hardware-initiated trigger transition support"
+	help
+	  This option enables support for hardware initiated hardware control
+	  transitions, where the LED hardware autonomously switches between
+	  "none" (i.e., no trigger) and its private trigger.
+
+	  See Documentation/leds/leds-class.rst for details.
+
 config LEDS_TRIGGER_TIMER
 	tristate "LED Timer Trigger"
 	help
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 7332034a43c8..479391ddf5e5 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -109,6 +109,7 @@ struct led_classdev {
 #define LED_INIT_DEFAULT_TRIGGER BIT(23)
 #define LED_REJECT_NAME_CONFLICT BIT(24)
 #define LED_MULTI_COLOR		BIT(25)
+#define LED_TRIG_HW_CHANGED	BIT(26)
 
 	/* set_brightness_work / blink_timer flags, atomic, private. */
 	unsigned long		work_flags;
@@ -599,6 +600,13 @@ led_trigger_get_brightness(const struct led_trigger *trigger)
 
 #endif /* CONFIG_LEDS_TRIGGERS */
 
+#ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
+void led_trigger_notify_hw_control_changed(struct led_classdev *led_cdev, bool activate);
+#else
+static inline void led_trigger_notify_hw_control_changed(struct led_classdev *led_cdev,
+							 bool activate) {}
+#endif
+
 /* Trigger specific enum */
 enum led_trigger_netdev_modes {
 	TRIGGER_NETDEV_LINK = 0,

-- 
2.53.0


