Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C25661E7E6
	for <lists+linux-leds@lfdr.de>; Mon,  7 Nov 2022 01:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbiKGAbv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 6 Nov 2022 19:31:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiKGAbu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 6 Nov 2022 19:31:50 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B50BBAC
        for <linux-leds@vger.kernel.org>; Sun,  6 Nov 2022 16:31:47 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 049F4806F4;
        Mon,  7 Nov 2022 01:31:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1667781105;
        bh=XuhhJEgYkSS8HL3DD9bt8liOemKBwG/SmKUmsT7arbE=;
        h=From:To:Cc:Subject:Date:From;
        b=FAtVrIra3stTQpsQokfrUBiffTpyc4LbpvZqdsXgiqUyNQje/QXJMIEkEU+uTZD/g
         jjMycsk8HjQiVi+w/oyjhWAWD0fKVN/0ryBZBoKOFWee7G1w6N+MGNM2YVgD/dCSy+
         5Tahvf1pkWAN9G08Sdz8VNPVZulE2f1JdxZKEhh93yycH5ViL+0mGNQsNAJZ/R7muC
         1RzDleW5Xc1F6sjCwe8cH0Xau6g876e3lfPT6BHmysWeeD2sC3GrjPmR94GN4C+Jn7
         7WAdhpLSNKxX+5AWlc5JF3BFT2MGD5EX7iDAkGa7pLaMQ9cS5Y0tG3Wmd5jCvSJnP8
         +3vDY26kxBRLQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-leds@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] leds: gpio: Configure per-LED pin control
Date:   Mon,  7 Nov 2022 01:31:33 +0100
Message-Id: <20221107003133.377704-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Each gpio-leds DT node DT subnode can have a pinctrl property assigned
to it, parse the DT subnode pinctrl properties and configure each pin
accordingly.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Pavel Machek <pavel@ucw.cz>
To: linux-leds@vger.kernel.org
---
 drivers/leds/leds-gpio.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 092eb59a7d325..01ca88876f008 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -13,6 +13,7 @@
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
@@ -77,6 +78,7 @@ static int create_gpio_led(const struct gpio_led *template,
 	struct fwnode_handle *fwnode, gpio_blink_set_t blink_set)
 {
 	struct led_init_data init_data = {};
+	struct pinctrl *pinctrl;
 	int ret, state;
 
 	led_dat->cdev.default_trigger = template->default_trigger;
@@ -119,6 +121,22 @@ static int create_gpio_led(const struct gpio_led *template,
 						     &init_data);
 	}
 
+	if (ret)
+		return ret;
+
+	pinctrl = devm_pinctrl_get_select_default(led_dat->cdev.dev);
+	if (IS_ERR(pinctrl)) {
+		ret = PTR_ERR(pinctrl);
+		if (ret != -ENODEV) {
+			dev_warn(led_dat->cdev.dev,
+				 "Failed to select %pOF pinctrl: %d\n",
+				 to_of_node(fwnode), ret);
+		} else {
+			/* pinctrl-%d not present, not an error */
+			ret = 0;
+		}
+	}
+
 	return ret;
 }
 
-- 
2.35.1

