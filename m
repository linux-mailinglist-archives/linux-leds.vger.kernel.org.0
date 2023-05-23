Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4157E70E4BA
	for <lists+linux-leds@lfdr.de>; Tue, 23 May 2023 20:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237420AbjEWScI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 May 2023 14:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbjEWScH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 May 2023 14:32:07 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 917638F
        for <linux-leds@vger.kernel.org>; Tue, 23 May 2023 11:32:05 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 1CA3785723;
        Tue, 23 May 2023 20:32:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1684866723;
        bh=MzDtpJzrkToYeVBVUyTXcAqZcnZVI5/3Hk+liskeBoE=;
        h=From:To:Cc:Subject:Date:From;
        b=wGocq2oxHKztHfPUJl0XN5usNG6XoR9BYSnMyYFTmLAyLxLZFOGLlJaQUj7YkY6At
         gDTvoAUq9CQAA04/DlKdzflx24fA19Ngr2LY/039H+Np8JW6JV214gpF/0M4A9reXN
         cY5tLWzfzSfoFpr4Ge3C5SHYq2YB2pWyTr+2u8FsAHVXxDentJOh+gEafyj07cfra+
         ZRwtTuVTDdJfU+ZnSEUeA6v2SXw/NMcIh1RPDbrViDUFpLvLSgw8Fq2HOeAMunt5+P
         9vrYzuoB41GRMhQtBfLu2Y3kW/9fe0CKK4wsdTsLGDTTTOiD/fsffiKnwY/57yot1d
         KVb1RfyHvmB0w==
From:   Marek Vasut <marex@denx.de>
To:     linux-leds@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v2] leds: gpio: Configure per-LED pin control
Date:   Tue, 23 May 2023 20:31:51 +0200
Message-Id: <20230523183151.5460-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Each gpio-leds DT node DT subnode can have a pinctrl property assigned
to it, parse the DT subnode pinctrl properties and configure each pin
accordingly.

Tested-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>
To: linux-leds@vger.kernel.org
---
V2: Cc Lee
---
 drivers/leds/leds-gpio.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index ce4e79939731d..7bfe40a6bfddf 100644
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
2.39.2

