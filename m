Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF1513152B
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jan 2020 16:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbgAFPtM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Jan 2020 10:49:12 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:41192 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726825AbgAFPtJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 6 Jan 2020 10:49:09 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 197EDFB02;
        Mon,  6 Jan 2020 16:49:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id UrIqahHrEVJn; Mon,  6 Jan 2020 16:49:05 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 3842B49D41; Mon,  6 Jan 2020 16:48:56 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/6] leds: lm3692x: Make sure we don't exceed the maximum led current
Date:   Mon,  6 Jan 2020 16:48:50 +0100
Message-Id: <b00fc4fc813483e126cf078e38774a87256828af.1578324703.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1578324703.git.agx@sigxcpu.org>
References: <cover.1578324703.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The current is given by the formular from page 12 of
https://www.ti.com/lit/ds/symlink/lm36922.pdf. We use this to limit the
led's max_brightness using the led-max-microamp DT property.

The formula for the lm36923 is identical according to the data sheet.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-lm3692x.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 28973cc5a6cc..1b056af60bd6 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -6,6 +6,7 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/leds.h>
+#include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
@@ -321,11 +322,24 @@ static int lm3692x_init(struct lm3692x_led *led)
 	return ret;
 }
 
+static enum led_brightness lm3692x_max_brightness(struct lm3692x_led *led,
+						  u32 max_cur)
+{
+	u32 max_code;
+
+	/* see p.12 of LM36922 data sheet for brightness formula */
+	max_code = ((max_cur * 1000) - 37806) / 12195;
+	if (max_code > 0x7FF)
+		max_code = 0x7FF;
+
+	return max_code >> 3;
+}
+
 static int lm3692x_probe_dt(struct lm3692x_led *led)
 {
 	struct fwnode_handle *child = NULL;
 	struct led_init_data init_data = {};
-	u32 ovp;
+	u32 ovp, max_cur;
 	int ret;
 
 	led->enable_gpio = devm_gpiod_get_optional(&led->client->dev,
@@ -391,6 +405,10 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
 		return ret;
 	}
 
+	ret = fwnode_property_read_u32(child, "led-max-microamp", &max_cur);
+	led->led_dev.max_brightness = ret ? LED_FULL :
+		lm3692x_max_brightness(led, max_cur);
+
 	init_data.fwnode = child;
 	init_data.devicename = led->client->name;
 	init_data.default_label = ":";
-- 
2.23.0

