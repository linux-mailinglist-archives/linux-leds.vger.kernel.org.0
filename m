Return-Path: <linux-leds+bounces-7046-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOEdGzPtoWmJxQQAu9opvQ
	(envelope-from <linux-leds+bounces-7046-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:14:59 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2F11BC8B9
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFDAA30DC927
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 19:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DBE3ACA5D;
	Fri, 27 Feb 2026 19:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Qm2Va7gO"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81483ACA73;
	Fri, 27 Feb 2026 19:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219245; cv=pass; b=Dcc52LaUsd8bEonxnrCBfoamEAu6+Df83lYsdGX3YIBBDZpjXeGmJWnktwg0n6AIDZj2/xWhYBs4TEdoThCL0YkrIGdBzEs6KZ+CNz5pSzPRhCAXWrye/fl+IqJp+ES/V2/SBWqEhNiLqzZB6GSl2d2zYVzYQ2ePAfP7bN5LODo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219245; c=relaxed/simple;
	bh=HwNejliywsHlXhuGsV4JjiX3+KM2IljuRgrnHkLZ7J0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAuC0V+nGR5haIls3aGMaBGNI+Iws4a5lCt9wWSQbsCk8p5jLrgfZILL8A3Wdgo4OB1zYqSObYxFgaWIzHOWIbEQRzoiyW+FHKjFpwi3jmXcgCXRWlZssiRwSPvq4y5ZcLnJmrkluhN0KHsxDPEncJYpD+EjjlaGAwHWr939C74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Qm2Va7gO; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1772219219; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aZNzVU6ywwly+ZPDD+ljyX2DpC6U9BlUeTu++unjibm2gCsp3Cl/g/KR9bh55CYi7+UrUX9BWFR3+iP5G4uGd/UZLmWfR6LhMitf+Ej8b6JhnB3DtSBBxd4bD6HZg4npwx9RD7XMx/VI3OnNnK5FJjx8uEoAPg06c26tIOjyHI8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772219219; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=h2BOgFH2gPijir1j9omklUnXSHfedWRVRfcdDkPTnMA=; 
	b=Q4LiH+3HmhhM0gcMlqbDAJrTgldhCDr4R0wU7IrT8MmY+7x7JRlF5whIit2sV4F4HvhabHBs6UrlsB3OmE9ppMLU7l0GfdLpHuKGu4QPU47u4XCFSX5x6VTXrxjGL/ZVDLBzwM4BGEQP9N0qS8p/JBRPf2jjnJG+abBVi8TcW+8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772219219;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=h2BOgFH2gPijir1j9omklUnXSHfedWRVRfcdDkPTnMA=;
	b=Qm2Va7gOGqKjUw2uSseeOfbEVMZ9KP/9M9uI8gpfHrboA6JuqMvfTm0ElScCiwP1
	/BpoijLrJ3m8Mvx6Uo76pxtwAXy343Xv5PBYrnMJe86SJ26tdIfk2aEmqBgP72XCAgm
	vDveCrx7F+2DBeiHRQ/XZWUn25ZiD5j8YQbc1UkCuRxEGu7lw1/iFoNIqUzy7q55eib
	/2HDAnK7QiwCA7/jZrXWeiuBMWv/Ali900LGWGX0s+KW9kZi9g7EFioBG710LyLm76L
	SeZYVt5iS9CfSdKo1ck0nm3GjO/NqGoaZXqPJ1kvuyZoAe0l0jH32E7xh5ebwtuEITY
	gO0yJ60uIg==
Received: by mx.zohomail.com with SMTPS id 1772219217707786.9061803165303;
	Fri, 27 Feb 2026 11:06:57 -0800 (PST)
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
Subject: [RFC PATCH 7/9] leds: trigger: Add led_trigger_notify_hw_control_changed() interface
Date: Sat, 28 Feb 2026 03:06:04 +0800
Message-ID: <20260227190617.271388-8-i@rong.moe>
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
X-Spamd-Result: default: False [10.34 / 15.00];
	URIBL_BLACK(7.50)[openedhand.com:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[rong.moe:s=zmail2048];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7046-lists,linux-leds=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[rong.moe,gmail.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	TAGGED_RCPT(0.00)[linux-leds];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_SPAM(0.00)[0.997];
	DKIM_TRACE(0.00)[rong.moe:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[rong.moe,none];
	DBL_BLOCKED_OPENRESOLVER(0.00)[openedhand.com:email,rong.moe:mid,rong.moe:dkim,rong.moe:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DC2F11BC8B9
X-Rspamd-Action: add header
X-Spam: Yes

Some LED devices can autonomously activate/deactivate hw control mode.
Currently, we have no mechanism for LED drivers to notify the LED core
about such events and initiate a trigger transition to reflect the
hardware state.

Add a new interface called led_trigger_notify_hw_control_changed(), so
that LED drivers can call it to notify the LED core about the
transition.

The interface only allows two transitions:

1. "none" => hw control trigger (offloaded)
2. hw control trigger (offloaded) => "none"

If the current trigger is neither hw control trigger nor "none", or if
hw control trigger is not offloaded, no trigger transition will be made.
This protects selected sw triggers.

Note that LED_OFF won't be emitted during the #2 transition, as some
hardware may have selected a new brightness level during its hardware
state transition (e.g., laptop keyboards with a shortcut cycling through
different backlight brightnesses and auto mode).

The interface is designed as a void function as any failure should be
non-fatal and the result of transition should not have any impact on the
LED drivers' event handling procedures.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 Documentation/leds/leds-class.rst |  63 +++++++++++++++++++
 drivers/leds/led-triggers.c       | 101 +++++++++++++++++++++++++++++-
 include/linux/leds.h              |   5 ++
 3 files changed, 166 insertions(+), 3 deletions(-)

diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
index cf7733e30bace..4d84db1067b43 100644
--- a/Documentation/leds/leds-class.rst
+++ b/Documentation/leds/leds-class.rst
@@ -255,9 +255,72 @@ the end use hw_control_set to activate hw control.
 A trigger can use hw_control_get to check if a LED is already in hw control
 and init their flags.
 
+Alternatively, a private trigger can be implemented along with the LED driver
+if the hw control mode of the LED doesn't fit any generic trigger. To associate
+the private trigger with the LED classdev, their `trigger_type` must be the same.
+The name of the private trigger must be the same as `hw_control_trigger`. Since
+both the LED classdev and the private trigger are in the same LED driver, it's not
+necessary for them to coordinate via `hw_control_*` callbacks.
+
 When the LED is in hw control, no software blink is possible and doing so
 will effectively disable hw control.
 
+Hardware initiated hw control mode transition
+==========================================
+
+Some hardware can autonomously activate/deactivate hw control mode. After the
+mode transition, the LED hardware notifies the LED driver. To update the current
+trigger accordingly, call `led_trigger_notify_hw_control_changed` on the
+classdev. The driver must set `hw_control_trigger` before registering, or else
+calling this is a bug and will trigger a WARN_ON. An LED driver that implements
+a private trigger can pass a pointer to the private trigger as the last
+parameter, otherwise NULL should be passed. The private trigger must have been
+properly registered (see above) and named after `hw_control_trigger`, or else a
+WARN_ON will be triggered.
+
+For convenience, `hw_control_trigger` refers to a trigger name defined in LED
+classdev, while "hw control trigger" refers to a unique trigger with the
+same name as the former.
+
+Only two transitions are defined:
+
+- "none" => hw control trigger (offloaded):
+        This happens when the hardware autonomously activates hw control mode
+        and when "none" (i.e., no trigger) is currently active. If the hw
+        control trigger is already active and offloaded during the hw control
+        mode transition, this is essentially a no-op.
+
+        The activation sequence for the hw control trigger will be executed as
+        normal. After switching to the hw control trigger, its offloaded status
+        is checked and must be true. Failing to set the offloaded status
+        appropriately will trigger a WARN_ON.
+
+        The LED driver must be able to handle the activation sequence even if
+        the hardware is currently under hw control mode. If the hardware can
+        handle hw control mode transition idempotently, the LED driver probably
+        already has this capability. Otherwise, the LED driver should take extra
+        care to handle the transition.
+
+        If error occurs in the activation sequence, the LED Trigger core reverts
+        the effective trigger to "none".
+
+- hw control trigger (offloaded) => "none"
+        This happens when the hardware autonomously deactivates hw control mode
+        and when the hw control trigger is currently active and offloaded. If
+        "none" (i.e., no trigger) is active during the hw control mode
+        transition, this is essentially a no-op.
+
+        The deactivation sequence for the hw control trigger will be executed as
+        normal, except that the current LED brightness is retained. The reason
+        for keeping the brightness unchanged is that some hardware may choose a
+        specific brightness instead of simply turning off the LED during its hw
+        control mode transition.
+
+        The idempotence rule also applies.
+
+If the current trigger is neither hw control trigger nor "none", or if hw
+control trigger is not offloaded, no transition will be made.
+
 Known Issues
 ============
 
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index f8100381fc684..0d0279ac8291b 100644
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
@@ -194,7 +195,15 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 		led_cdev->trigger_data = NULL;
 		led_cdev->activated = false;
 		led_cdev->flags &= ~LED_INIT_DEFAULT_TRIGGER;
-		led_set_brightness(led_cdev, LED_OFF);
+
+		/*
+		 * Hardware may have select a new brightness level during its
+		 * hw control mode transition, so only reset brightness if we
+		 * are switching to another trigger or if the switching is not
+		 * hardware triggered.
+		 */
+		if (trig || !hw_triggered)
+			led_set_brightness(led_cdev, LED_OFF);
 	}
 	if (trig) {
 		spin_lock(&trig->leddev_list_lock);
@@ -258,6 +267,12 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 
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
@@ -478,6 +493,86 @@ int devm_led_trigger_register(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_led_trigger_register);
 
+static void led_trigger_do_hw_control_transition(struct led_classdev *led_cdev, bool activate,
+						 struct led_trigger *hc_trig)
+{
+	int err = 0;
+
+	if (!led_cdev->trigger) {
+		/* "none" => hw control trigger (offloaded). */
+		if (activate) {
+			err = __led_trigger_set(led_cdev, hc_trig, true);
+
+			/*
+			 * hw control trigger must recognize the current hw state during
+			 * its activation and mark itself as offloaded.
+			 */
+			WARN_ON(!err && !led_trigger_get_offloaded(led_cdev));
+		}
+	} else if (led_cdev->trigger == hc_trig && led_trigger_get_offloaded(led_cdev)) {
+		/* hw control trigger (offloaded) => "none". */
+		if (!activate)
+			err = __led_trigger_set(led_cdev, NULL, true);
+	} else {
+		/* Other trigger is active, or hw control trigger is not offloaded. */
+		dev_dbg(led_cdev->dev,
+			"Do not %s hw control trigger %s while %s is active",
+			activate ? "activate" : "deactivate", hc_trig->name,
+			led_cdev->trigger->name);
+
+		return;
+	}
+
+	if (err)
+		dev_warn(led_cdev->dev, "Failed to %s hw control trigger %s: %d",
+			 activate ? "activate" : "deactivate", hc_trig->name, err);
+}
+
+/* Caller must ensure led_cdev->led_access held */
+void led_trigger_notify_hw_control_changed(struct led_classdev *led_cdev, bool activate,
+					   struct led_trigger *priv_trig)
+{
+	struct led_trigger *trig;
+
+	down_write(&led_cdev->trigger_lock);
+
+	if (WARN_ON(!led_cdev->hw_control_trigger))
+		goto out;
+
+	/* Fast path: hw control trigger is a private trigger. */
+	if (priv_trig) {
+		if (WARN_ON(!led_match_hw_control_trigger(led_cdev, priv_trig)))
+			goto out;
+
+		led_trigger_do_hw_control_transition(led_cdev, activate, priv_trig);
+		goto out;
+	}
+
+	/* Fast path: hw control trigger is the current trigger. */
+	if (led_cdev->trigger && led_match_hw_control_trigger(led_cdev, led_cdev->trigger)) {
+		led_trigger_do_hw_control_transition(led_cdev, activate, led_cdev->trigger);
+		goto out;
+	}
+
+	down_read(&triggers_list_lock);
+	list_for_each_entry(trig, &trigger_list, next_trig) {
+		if (led_match_hw_control_trigger(led_cdev, trig)) {
+			led_trigger_do_hw_control_transition(led_cdev, activate, trig);
+
+			up_read(&triggers_list_lock);
+			goto out;
+		}
+	}
+	up_read(&triggers_list_lock);
+
+	dev_dbg(led_cdev->dev, "hw control trigger not found: %s",
+		led_cdev->hw_control_trigger);
+
+out:
+	up_write(&led_cdev->trigger_lock);
+}
+EXPORT_SYMBOL_GPL(led_trigger_notify_hw_control_changed);
+
 /* Simple LED Trigger Interface */
 
 void led_trigger_event(struct led_trigger *trig,
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 7332034a43c85..82578724fd60c 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -533,6 +533,8 @@ void led_trigger_blink_oneshot(struct led_trigger *trigger,
 			       int invert);
 void led_trigger_set_default(struct led_classdev *led_cdev);
 int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trigger);
+void led_trigger_notify_hw_control_changed(struct led_classdev *led_cdev, bool activate,
+					   struct led_trigger *priv_trig);
 void led_trigger_remove(struct led_classdev *led_cdev);
 
 static inline void led_set_trigger_data(struct led_classdev *led_cdev,
@@ -583,6 +585,9 @@ static inline int led_trigger_set(struct led_classdev *led_cdev,
 {
 	return 0;
 }
+static inline void led_trigger_notify_hw_control_changed(struct led_classdev *led_cdev,
+							 bool activate,
+							 struct led_trigger *priv_trig) {}
 
 static inline void led_trigger_remove(struct led_classdev *led_cdev) {}
 static inline void led_set_trigger_data(struct led_classdev *led_cdev) {}
-- 
2.51.0


