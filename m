Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D54A6F2A8A
	for <lists+linux-leds@lfdr.de>; Sun, 30 Apr 2023 22:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjD3UA6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 30 Apr 2023 16:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231131AbjD3UA5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 30 Apr 2023 16:00:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F3BE45
        for <linux-leds@vger.kernel.org>; Sun, 30 Apr 2023 13:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682884808;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hr2PHum63fe/9khUa+j7FghLfPpLZRFIPFxlmdxODG0=;
        b=B8Ii1mBIbSfe4rz13NkVmNTqMaSV3iiKTMyYlffh2Emzojfypaww7mraBXDOck8BRSvh2Q
        0IeWSzgyyY0dDtnsuvK2sZ2/jzQChVZY9hr4x7roKLYpsjHlVCC3cRtd2OtA8JDCvS9lOc
        8QrQvR/WEYa8WmREsHzVhe7elDVT7wY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-MAB0eVSYNb-Suk_AnQx8jQ-1; Sun, 30 Apr 2023 16:00:04 -0400
X-MC-Unique: MAB0eVSYNb-Suk_AnQx8jQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EAF93C0DDB2;
        Sun, 30 Apr 2023 20:00:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 29272C15BA0;
        Sun, 30 Apr 2023 20:00:03 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Yauhen Kharuzhy <jekhor@gmail.com>, linux-leds@vger.kernel.org
Subject: [PATCH v3 2/5] leds: cht-wcove: Add suspend/resume handling
Date:   Sun, 30 Apr 2023 21:59:49 +0200
Message-Id: <20230430195952.862527-3-hdegoede@redhat.com>
In-Reply-To: <20230430195952.862527-1-hdegoede@redhat.com>
References: <20230430195952.862527-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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

Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/leds-cht-wcove.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
index 9fe76a0c62c8..166b140e132a 100644
--- a/drivers/leds/leds-cht-wcove.c
+++ b/drivers/leds/leds-cht-wcove.c
@@ -17,6 +17,7 @@
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
@@ -364,12 +366,43 @@ static void cht_wc_leds_disable(struct platform_device *pdev)
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
+/* On resume restore the saved settings */
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
2.39.2

