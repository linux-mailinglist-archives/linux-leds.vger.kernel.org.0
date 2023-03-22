Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5686C5033
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 17:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbjCVQKO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 12:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbjCVQKB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 12:10:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68045166C3;
        Wed, 22 Mar 2023 09:10:00 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5618B2A7C;
        Wed, 22 Mar 2023 17:09:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679501386;
        bh=qC00Wvd7JQTpf/phl9rkMjcm/jtZyTBCOWYWZNrACuM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nHESJunAZZqHSNbY6qIujhf+6O5cVJVq4PhNJEn+TNTb0+PuvgnFRcBoMOvXnIUpy
         lO49V+75EDtac0XA+QwIt53kjLNAR32mSBxhjj/3S/maRJuZdKqQwfANhdMxVN28lu
         O6F+ZlqRhjbL1zHXTMqqQhHccZJz1CwD3pSjqdbk=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, hdegoede@redhat.com,
        markgross@kernel.org, sboyd@kernel.org, hpa@redhat.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 7/8] platform/x86: int3472: Support LED lookups in board data
Date:   Wed, 22 Mar 2023 16:09:25 +0000
Message-Id: <20230322160926.948687-8-dan.scally@ideasonboard.com>
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

On platforms with the TPS68470 PMIC, we need to be able to define
which of the LEDs powered by the PMIC should be used by each of
the sensors that consume its resources. Add the ability to define
tables of LED lookup data to the board data file.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 8 ++++++++
 drivers/platform/x86/intel/int3472/tps68470.h | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index 818f2fc5bf2a..07ac7b5b9082 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -206,6 +206,10 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 		for (i = 0; i < board_data->n_gpiod_lookups; i++)
 			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
 
+		if (board_data->led_lookups)
+			for (i = 0; i < board_data->led_lookups->n_lookups; i++)
+				led_add_lookup(&board_data->led_lookups->lookup_table[i]);
+
 		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
 					   cells, TPS68470_WIN_MFD_CELL_COUNT,
 					   NULL, 0, NULL);
@@ -214,6 +218,10 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 		if (ret) {
 			for (i = 0; i < board_data->n_gpiod_lookups; i++)
 				gpiod_remove_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
+
+			if (board_data->led_lookups)
+				for (i = 0; i < board_data->led_lookups->n_lookups; i++)
+					led_remove_lookup(&board_data->led_lookups->lookup_table[i]);
 		}
 
 		break;
diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
index ce50687db6fb..c03884654898 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.h
+++ b/drivers/platform/x86/intel/int3472/tps68470.h
@@ -11,14 +11,22 @@
 #ifndef _INTEL_SKL_INT3472_TPS68470_H
 #define _INTEL_SKL_INT3472_TPS68470_H
 
+#include <linux/leds.h>
+
 struct gpiod_lookup_table;
 struct tps68470_regulator_platform_data;
 struct tps68470_led_platform_data;
 
+struct tps68470_led_lookups {
+	unsigned int n_lookups;
+	struct led_lookup_data lookup_table[];
+};
+
 struct int3472_tps68470_board_data {
 	const char *dev_name;
 	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
 	const struct tps68470_led_platform_data *tps68470_led_pdata;
+	struct tps68470_led_lookups *led_lookups;
 	unsigned int n_gpiod_lookups;
 	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
 };
-- 
2.34.1

