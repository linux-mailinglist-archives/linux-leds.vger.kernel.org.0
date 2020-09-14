Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B95C82699DC
	for <lists+linux-leds@lfdr.de>; Tue, 15 Sep 2020 01:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgINXmB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Sep 2020 19:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbgINXl4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Sep 2020 19:41:56 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9236C06178A;
        Mon, 14 Sep 2020 16:41:55 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 1E690140AAB;
        Tue, 15 Sep 2020 01:41:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600126909; bh=RGwHFtnPqsz9dYjQRQ8Hck/hiD/YUNSzQaG9K/s+tJ0=;
        h=From:To:Date;
        b=xjNxACHxEHKgbhe53ygc1MpNEwqj0txgGAuUi7l7DwbtZXlE91yMIX/CqYn++2VDR
         Y6TwHwrPUYfsFyFM8IRP62V3K9ewjag7wxqidIJ5iQaG/pVSQCrMdHbTiucchTxlQc
         lbXfM5AwdVyXAYtkFsDzb5KkD8nzidZ/Fo4N69AQ=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH leds + devicetree v1 1/2] leds: trigger: add DT `trigger-sources` validating method
Date:   Tue, 15 Sep 2020 01:41:47 +0200
Message-Id: <20200914234148.19837-2-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200914234148.19837-1-marek.behun@nic.cz>
References: <20200914234148.19837-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Currently we use the `linux,default-trigger` device tree property of a
LED to define the default trigger which should be activated for a LED.

But the LED device tree binding also documents the `trigger-sources`
property, which specifies the source device which should be triggering
the LED.

The `trigger-sources` property is currently implemented only in
drivers/usb/core/ledtrig-usbport.c.

Lets add a method to struct led_trigger which, if implemented, can check
whether this trigger should be enabled as default. This check shall be
done by checking whether the specified `trigger-sources` refers to a
device compatible with the trigger.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 drivers/leds/led-triggers.c | 26 ++++++++++++++++++--------
 include/linux/leds.h        |  6 ++++++
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 91da90cfb11d9..c96577f0bfe97 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -243,18 +243,30 @@ void led_trigger_remove(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_trigger_remove);
 
+static bool trigger_is_default(struct led_classdev *led_cdev,
+			       struct led_trigger *trig)
+{
+	if (!trigger_relevant(led_cdev, trig))
+		return false;
+
+	if (led_cdev->default_trigger &&
+	    !strcmp(led_cdev->default_trigger, trig->name))
+		return true;
+
+	if (trig->has_valid_source && trig->has_valid_source(led_cdev))
+		return true;
+
+	return false;
+}
+
 void led_trigger_set_default(struct led_classdev *led_cdev)
 {
 	struct led_trigger *trig;
 
-	if (!led_cdev->default_trigger)
-		return;
-
 	down_read(&triggers_list_lock);
 	down_write(&led_cdev->trigger_lock);
 	list_for_each_entry(trig, &trigger_list, next_trig) {
-		if (!strcmp(led_cdev->default_trigger, trig->name) &&
-		    trigger_relevant(led_cdev, trig)) {
+		if (trigger_is_default(led_cdev, trig)) {
 			led_cdev->flags |= LED_INIT_DEFAULT_TRIGGER;
 			led_trigger_set(led_cdev, trig);
 			break;
@@ -306,9 +318,7 @@ int led_trigger_register(struct led_trigger *trig)
 	down_read(&leds_list_lock);
 	list_for_each_entry(led_cdev, &leds_list, node) {
 		down_write(&led_cdev->trigger_lock);
-		if (!led_cdev->trigger && led_cdev->default_trigger &&
-		    !strcmp(led_cdev->default_trigger, trig->name) &&
-		    trigger_relevant(led_cdev, trig)) {
+		if (!led_cdev->trigger && trigger_is_default(led_cdev, trig)) {
 			led_cdev->flags |= LED_INIT_DEFAULT_TRIGGER;
 			led_trigger_set(led_cdev, trig);
 		}
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 6a8d6409c993e..4cbb826e4bec4 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -352,6 +352,12 @@ struct led_trigger {
 	int		(*activate)(struct led_classdev *led_cdev);
 	void		(*deactivate)(struct led_classdev *led_cdev);
 
+	/*
+	 * Check whether LED has defined valid source for this trigger.
+	 * If yes, this trigger should be set as default trigger for LED.
+	 */
+	bool		(*has_valid_source)(struct led_classdev *led_cdev);
+
 	/* LED-private triggers have this set */
 	struct led_hw_trigger_type *trigger_type;
 
-- 
2.26.2

