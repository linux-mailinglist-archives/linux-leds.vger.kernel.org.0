Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 944A96E10D4
	for <lists+linux-leds@lfdr.de>; Thu, 13 Apr 2023 17:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbjDMPS4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 Apr 2023 11:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbjDMPS4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Apr 2023 11:18:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88FE7D8E
        for <linux-leds@vger.kernel.org>; Thu, 13 Apr 2023 08:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681399097;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nJ47cVJlHnKJwn62y6tFjxdmA7al47zHicuz/WaXQ8o=;
        b=GDE+hGISw25mJuxS8BaM9A4BS7th/j0RL/ieCk9NznjlChflvMIbVgpWfz1d9PMYTJhPwj
        pS6R8asYSN05THABa9ELlwKEJ79uFHbK6eBPCTGriHAPlYVoNtY2/sYzA78AReAu7WgQk+
        wmPoNsCSdwsqEdcgw0kwE/Q6x7sUZTc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-x33vrFJIPIihpLOvwaxW3w-1; Thu, 13 Apr 2023 11:18:14 -0400
X-MC-Unique: x33vrFJIPIihpLOvwaxW3w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D8CD1C00ABD;
        Thu, 13 Apr 2023 15:18:14 +0000 (UTC)
Received: from x1.nl (unknown [10.39.192.251])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EB2FE141511D;
        Thu, 13 Apr 2023 15:18:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-leds@vger.kernel.org
Subject: [PATCH 2/5] leds: cht-wcove: Add suspend/resume handling
Date:   Thu, 13 Apr 2023 17:18:05 +0200
Message-Id: <20230413151808.20900-3-hdegoede@redhat.com>
In-Reply-To: <20230413151808.20900-1-hdegoede@redhat.com>
References: <20230413151808.20900-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

When LED1 is showing the tablet is charging and then the device gets
suspended followed by unplugging the charger, then it will incorrectly
still show it is charging.

To avoid this turn both LEDs off on suspend, just like the PMIC always
turns them off when the tablet is powered off (even if the tablet is
charging). If hw-control is supported for LED1, then restore the
initial hw-control settings to let the hw control LED1 while suspended.

To restore the state the LEDs had before suspending, save it before
turning the LEDs off and restore it on resume.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/leds-cht-wcove.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
index 06447804d050..2d968ddd18c5 100644
--- a/drivers/leds/leds-cht-wcove.c
+++ b/drivers/leds/leds-cht-wcove.c
@@ -15,6 +15,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/suspend.h>
 
 #define CHT_WC_LED1_CTRL		0x5e1f
 #define CHT_WC_LED1_FSM			0x5e20
@@ -69,6 +70,7 @@ struct cht_wc_led {
 	const struct cht_wc_led_regs *regs;
 	struct regmap *regmap;
 	struct mutex mutex;
+	struct cht_wc_led_saved_regs saved_regs;
 };
 
 struct cht_wc_leds {
@@ -352,12 +354,43 @@ static void cht_wc_leds_disable(struct platform_device *pdev)
 		cht_wc_led_restore_regs(&leds->leds[0], &leds->led1_initial_regs);
 }
 
+/* On suspend save current settings and turn LEDs off */
+static int cht_wc_leds_suspend(struct device *dev)
+{
+	struct cht_wc_leds *leds = dev_get_drvdata(dev);
+	int i, ret;
+
+	for (i = 0; i < CHT_WC_LED_COUNT; i++) {
+		ret = cht_wc_led_save_regs(&leds->leds[i], &leds->leds[i].saved_regs);
+		if (ret < 0)
+			return ret;
+	}
+
+	cht_wc_leds_disable(to_platform_device(dev));
+	return 0;
+}
+
+/* On resume restore the saveds settings */
+static int cht_wc_leds_resume(struct device *dev)
+{
+	struct cht_wc_leds *leds = dev_get_drvdata(dev);
+	int i;
+
+	for (i = 0; i < CHT_WC_LED_COUNT; i++)
+		cht_wc_led_restore_regs(&leds->leds[i], &leds->leds[i].saved_regs);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(cht_wc_leds_pm, cht_wc_leds_suspend, cht_wc_leds_resume);
+
 static struct platform_driver cht_wc_leds_driver = {
 	.probe = cht_wc_leds_probe,
 	.remove_new = cht_wc_leds_remove,
 	.shutdown = cht_wc_leds_disable,
 	.driver = {
 		.name = "cht_wcove_leds",
+		.pm = pm_sleep_ptr(&cht_wc_leds_pm),
 	},
 };
 module_platform_driver(cht_wc_leds_driver);
-- 
2.39.1

