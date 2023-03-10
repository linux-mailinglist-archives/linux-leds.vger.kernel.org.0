Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA8FB6B3B7C
	for <lists+linux-leds@lfdr.de>; Fri, 10 Mar 2023 10:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbjCJJ6U (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Mar 2023 04:58:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbjCJJ6T (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 10 Mar 2023 04:58:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E229D1086B7
        for <linux-leds@vger.kernel.org>; Fri, 10 Mar 2023 01:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678442251;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CdvZdG0Wy23BadZemNj9PmvPi0/p33iaAuq+4IsShCI=;
        b=jNDRYDtpjwhkQlxGsHDpqD8udJd1U+xHIGXxm4cVh2BQXbsJ0En2DCId3UYlSemtyfymBo
        7WfBcNAJJPneib85D5GYJ23qCVzdpYV/bzluCK/WLaxPvTMfJPpoP6pZrVVYoML6V83U8w
        fCTrv7RDOmt29uVUSaNOU6HzBKF2jQ0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-zd5eytUKNYaE9CrFE2AP-Q-1; Fri, 10 Mar 2023 04:57:25 -0500
X-MC-Unique: zd5eytUKNYaE9CrFE2AP-Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 105BD85D063;
        Fri, 10 Mar 2023 09:57:25 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.100])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D683F2166B26;
        Fri, 10 Mar 2023 09:57:21 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Subject: [PATCH v2 4/4] platform: x86: int3472: Register a LED lookup table entry for the privacy LED
Date:   Fri, 10 Mar 2023 17:56:35 +0800
Message-Id: <20230310095635.813262-5-hpa@redhat.com>
In-Reply-To: <20230310095635.813262-1-hpa@redhat.com>
References: <20230310095635.813262-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

All currently known models using the tps68470 PMIC have a privacy LED for
the back sensor (first ACPI consumer dev of the PMIC) connected to the
ileda output of the PMIC.

Add a LED lookup table entry for this, so that the v4l2-core code turns on
the LED when streaming from the sensor.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 30 +++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index 82ef022f8916..a53de9cd0540 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -140,11 +140,18 @@ skl_int3472_fill_clk_pdata(struct device *dev, struct tps68470_clk_platform_data
 	return n_consumers;
 }
 
+static void skl_int3472_tps68470_unregister_led_lookup(void *led_lookup)
+{
+	led_remove_lookup(led_lookup);
+}
+
 static int skl_int3472_tps68470_probe(struct i2c_client *client)
 {
-	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
+	struct device *dev = &client->dev;
+	struct acpi_device *adev = ACPI_COMPANION(dev);
 	const struct int3472_tps68470_board_data *board_data;
 	struct tps68470_clk_platform_data *clk_pdata;
+	struct led_lookup_data *led_lookup;
 	struct mfd_cell *cells;
 	struct regmap *regmap;
 	int n_consumers;
@@ -177,6 +184,25 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 		if (!board_data)
 			return dev_err_probe(&client->dev, -ENODEV, "No board-data found for this model\n");
 
+		/* Add a LED lookup table entry for the privacy LED */
+		led_lookup = devm_kzalloc(&client->dev, sizeof(*led_lookup), GFP_KERNEL);
+		if (!led_lookup)
+			return -ENOMEM;
+
+		ret = skl_int3472_get_sensor_adev_and_name(&client->dev, NULL, &led_lookup->dev_id);
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
2.37.3

