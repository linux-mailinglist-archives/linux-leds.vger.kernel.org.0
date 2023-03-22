Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FADF6C5025
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 17:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjCVQKC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 12:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbjCVQJt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 12:09:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A453474E7;
        Wed, 22 Mar 2023 09:09:44 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74B5D183F;
        Wed, 22 Mar 2023 17:09:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679501382;
        bh=vd8p6qebXW2YlQuhzH6NusDPMe/bXH029dav7Dn+O0o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vckmTrxqaWU+EpsFTO/p+KCEn8pAAgKcC8879n7Uw+oety7bVXJH6GLXu5yZM4U+v
         /fC2XbbamfIChrgHVLcN7MXCRblnzItX2W8ZKSDoyY057pNCqtVG7Q/N/gL660zTcR
         a+WZ7+7J1KaZurgbBrIYJEcs+2OrAMXO8wf1+ndg=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, hdegoede@redhat.com,
        markgross@kernel.org, sboyd@kernel.org, hpa@redhat.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 1/8] platform/x86: int3472: Add platform data for LEDs
Date:   Wed, 22 Mar 2023 16:09:19 +0000
Message-Id: <20230322160926.948687-2-dan.scally@ideasonboard.com>
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

Some of the LEDs that can be provided by the TPS68470 PMIC come with
various configuration registers that must be set to appropriate values.
Add a platform data struct so that those data can be defined and
passed to the tps68470-led platform device.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c |  2 ++
 drivers/platform/x86/intel/int3472/tps68470.h |  2 ++
 include/linux/platform_data/tps68470.h        | 11 +++++++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index 82ef022f8916..53b0459f278a 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -194,6 +194,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
 		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
 		cells[2].name = "tps68470-led";
+		cells[2].platform_data = (void *)board_data->tps68470_led_pdata;
+		cells[2].pdata_size = sizeof(struct tps68470_led_platform_data);
 		cells[3].name = "tps68470-gpio";
 
 		for (i = 0; i < board_data->n_gpiod_lookups; i++)
diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
index 35915e701593..ce50687db6fb 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.h
+++ b/drivers/platform/x86/intel/int3472/tps68470.h
@@ -13,10 +13,12 @@
 
 struct gpiod_lookup_table;
 struct tps68470_regulator_platform_data;
+struct tps68470_led_platform_data;
 
 struct int3472_tps68470_board_data {
 	const char *dev_name;
 	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
+	const struct tps68470_led_platform_data *tps68470_led_pdata;
 	unsigned int n_gpiod_lookups;
 	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
 };
diff --git a/include/linux/platform_data/tps68470.h b/include/linux/platform_data/tps68470.h
index e605a2cab07f..5d55ad5c17ed 100644
--- a/include/linux/platform_data/tps68470.h
+++ b/include/linux/platform_data/tps68470.h
@@ -37,4 +37,15 @@ struct tps68470_clk_platform_data {
 	struct tps68470_clk_consumer consumers[];
 };
 
+struct tps68470_led_platform_data {
+	u8 iledctl_ctrlb;
+	u8 wledmaxf;
+	u8 wledto;
+	u8 wledc1;
+	u8 wledc2;
+	u8 wledctl_mode;
+	bool wledctl_disled1;
+	bool wledctl_disled2;
+};
+
 #endif
-- 
2.34.1

