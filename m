Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1CDC6A1FCC
	for <lists+linux-leds@lfdr.de>; Fri, 24 Feb 2023 17:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjBXQig (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 Feb 2023 11:38:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbjBXQif (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 Feb 2023 11:38:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7DC6A7B1
        for <linux-leds@vger.kernel.org>; Fri, 24 Feb 2023 08:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677256665;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=NMWwDwdXHAQQD2SBPaL8Jfq12PLLehkkklEDiS9/T+U=;
        b=WTyoFJI8mZGpoALPDPsnr0sH4bpAtwt4cvKlJ5ej72NO6GScOIJYwwsz8cp7LKGF5iPe1+
        UVT3dH4uJy6vMNLUorc/bUoYC6H9kP/HqYov87qKefOZBkPiG6UwNntok041fdEL4LWHL5
        5Q0h6O3obgMmMCcgdIWCADl/VzdaWTc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-Ss7mRTtsMpGUgjpwe4HYVA-1; Fri, 24 Feb 2023 11:37:43 -0500
X-MC-Unique: Ss7mRTtsMpGUgjpwe4HYVA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E50C1C189B7;
        Fri, 24 Feb 2023 16:37:43 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.8])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D06A0404BEC0;
        Fri, 24 Feb 2023 16:37:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, Daniel Scally <djrscally@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        Kate Hsuan <hpa@redhat.com>
Subject: [PATCH] platform: x86: int3472: Register a LED lookup table entry for the privacy LED
Date:   Fri, 24 Feb 2023 17:37:41 +0100
Message-Id: <20230224163741.68656-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

All currently known models using the tps68470 PMIC have a privacy LED for
the back sensor (first ACPI consumer dev of the PMIC) connected to the
ileda output of the PMIC.

Add a LED lookup table entry for this, so that the v4l2-core code turns on
the LED when streaming from the sensor.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Kate, please include this in the v2 series adding the leds-tps68470 driver.
---
 drivers/platform/x86/intel/int3472/tps68470.c | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index 82ef022f8916..4372e2c89837 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -140,11 +140,17 @@ skl_int3472_fill_clk_pdata(struct device *dev, struct tps68470_clk_platform_data
 	return n_consumers;
 }
 
+static void skl_int3472_tps68470_unregister_led_lookup(void *led_lookup)
+{
+	led_remove_lookup(led_lookup);
+}
+
 static int skl_int3472_tps68470_probe(struct i2c_client *client)
 {
 	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
 	const struct int3472_tps68470_board_data *board_data;
 	struct tps68470_clk_platform_data *clk_pdata;
+	struct led_lookup_data *led_lookup;
 	struct mfd_cell *cells;
 	struct regmap *regmap;
 	int n_consumers;
@@ -177,6 +183,26 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 		if (!board_data)
 			return dev_err_probe(&client->dev, -ENODEV, "No board-data found for this model\n");
 
+		/* Add a LED lookup table entry for the privacy LED */
+		led_lookup = devm_kzalloc(&client->dev, sizeof(*led_lookup), GFP_KERNEL);
+		if (!led_lookup)
+			return -ENOMEM;
+
+		ret = skl_int3472_get_sensor_adev_and_name(&client->dev, NULL,
+							   &led_lookup->dev_id);
+		if (ret)
+			return ret;
+
+		led_lookup->provider = "tps68470-ileda";
+		led_lookup->con_id = "privacy-led";
+		led_add_lookup(led_lookup);
+
+		ret = devm_add_action_or_reset(&client->dev,
+					       skl_int3472_tps68470_unregister_led_lookup,
+					       led_lookup);
+		if (ret)
+			return ret;
+
 		cells = kcalloc(TPS68470_WIN_MFD_CELL_COUNT, sizeof(*cells), GFP_KERNEL);
 		if (!cells)
 			return -ENOMEM;
@@ -259,4 +285,4 @@ module_i2c_driver(int3472_tps68470);
 MODULE_DESCRIPTION("Intel SkyLake INT3472 ACPI TPS68470 Device Driver");
 MODULE_AUTHOR("Daniel Scally <djrscally@gmail.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_SOFTDEP("pre: clk-tps68470 tps68470-regulator");
+MODULE_SOFTDEP("pre: clk-tps68470 tps68470-regulator leds-tps68470");
-- 
2.39.1

