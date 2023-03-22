Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 445AB6C502D
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 17:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjCVQKL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 12:10:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbjCVQJ6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 12:09:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBBD2521E8;
        Wed, 22 Mar 2023 09:09:55 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65A8918D7;
        Wed, 22 Mar 2023 17:09:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679501384;
        bh=nVbNpDosvTKOVfBSy3DMDBbSRZ1zjxzz1+TYw+Bz/nk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fBk2X51v5S+PuNyvg50N5Boitxh9maFdyLG6Le3F/Lm3nDsZIndIYdBH8RKxt6Kro
         DzxCiT0zaRwu1EWSQN50ykCb2J/PPRwn9uqUKqFuzCcngIdCCnquPEF64IuyMqn+JH
         T+FALBx42xpjR2IsrWJvdjWUS72SlMcQWrw0O8j4=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, hdegoede@redhat.com,
        markgross@kernel.org, sboyd@kernel.org, hpa@redhat.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 4/8] platform/x86: int3472: Add tps68470-led as clock consumer
Date:   Wed, 22 Mar 2023 16:09:22 +0000
Message-Id: <20230322160926.948687-5-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322160926.948687-1-dan.scally@ideasonboard.com>
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Some of the LEDs provided by the TPS68470 require the clock that it
provides to be active in order to function. Add the platform driver
for the leds as a consumer of the clock so that the led driver can
discover it during .probe()

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index 53b0459f278a..818f2fc5bf2a 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -105,25 +105,30 @@ skl_int3472_fill_clk_pdata(struct device *dev, struct tps68470_clk_platform_data
 {
 	struct acpi_device *adev = ACPI_COMPANION(dev);
 	struct acpi_device *consumer;
-	unsigned int n_consumers = 0;
+	unsigned int n_consumers = 1;
 	const char *sensor_name;
-	unsigned int i = 0;
+	const char *led_name;
+	unsigned int i = 1;
 
 	for_each_acpi_consumer_dev(adev, consumer)
 		n_consumers++;
 
-	if (!n_consumers) {
-		dev_err(dev, "INT3472 seems to have no dependents\n");
-		return -ENODEV;
-	}
-
 	*clk_pdata = devm_kzalloc(dev, struct_size(*clk_pdata, consumers, n_consumers),
 				  GFP_KERNEL);
 	if (!*clk_pdata)
 		return -ENOMEM;
 
 	(*clk_pdata)->n_consumers = n_consumers;
-	i = 0;
+
+	/*
+	 * The TPS68470 includes an LED driver which requires the clock be active
+	 * to function. Add the led platform device as a consumer of the clock.
+	 */
+	led_name = devm_kstrdup(dev, "tps68470-led", GFP_KERNEL);
+	if (!led_name)
+		return -ENOMEM;
+
+	(*clk_pdata)->consumers[0].consumer_dev_name = led_name;
 
 	for_each_acpi_consumer_dev(adev, consumer) {
 		sensor_name = devm_kasprintf(dev, GFP_KERNEL, I2C_DEV_NAME_FORMAT,
-- 
2.34.1

