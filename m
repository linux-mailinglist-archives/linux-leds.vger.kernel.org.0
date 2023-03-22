Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC0596C5035
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 17:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbjCVQKP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 12:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjCVQKE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 12:10:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A4D1ACD5;
        Wed, 22 Mar 2023 09:10:02 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 007FA32EC;
        Wed, 22 Mar 2023 17:09:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679501387;
        bh=97wvt0y0TEfMp4ScZwkJFAKsZ9bT3v1tLRviaXe7EsM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O7h23+/m8bKJVmSix0sEvBZZQURkvQ5yzWnto11+juplKRmyfN9AbJylVJ/29tK0F
         PI4kTdsXARBq7HXedOZgHbMFVINMjWRGRN8XRY7n1uX3YqPVE/DKTXt4tAUMG4W2bv
         VTNxvr7ferRivtiYXgEj0QOeMqHimrEr2HbVu3ys=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, hdegoede@redhat.com,
        markgross@kernel.org, sboyd@kernel.org, hpa@redhat.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 8/8] platform/x86: int3472: Define LED lookup data for MS Surface Go
Date:   Wed, 22 Mar 2023 16:09:26 +0000
Message-Id: <20230322160926.948687-9-dan.scally@ideasonboard.com>
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

Add LED lookup data to tps68470_board_data.c for the Microsoft
Surface Go line of devices.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../x86/intel/int3472/tps68470_board_data.c    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 0d46a238b630..e2c53319e112 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -157,10 +157,27 @@ static const struct tps68470_led_platform_data surface_go_tps68470_led_pdata = {
 	.wledctl_disled2 = false,
 };
 
+static struct tps68470_led_lookups surface_go_tps68470_led_lookups = {
+	.n_lookups = 2,
+	.lookup_table = {
+		{
+			.provider = "tps68470-iled_a::indicator",
+			.dev_id = "i2c-INT347A:00",
+			.con_id = "privacy-led",
+		},
+		{
+			.provider = "tps68470-wled::indicator",
+			.dev_id = "i2c-INT347E:00",
+			.con_id = "privacy-led",
+		},
+	},
+};
+
 static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
 	.dev_name = "i2c-INT3472:05",
 	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
 	.tps68470_led_pdata = &surface_go_tps68470_led_pdata,
+	.led_lookups = &surface_go_tps68470_led_lookups,
 	.n_gpiod_lookups = 2,
 	.tps68470_gpio_lookup_tables = {
 		&surface_go_int347a_gpios,
@@ -172,6 +189,7 @@ static const struct int3472_tps68470_board_data surface_go3_tps68470_board_data
 	.dev_name = "i2c-INT3472:01",
 	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
 	.tps68470_led_pdata = &surface_go_tps68470_led_pdata,
+	.led_lookups = &surface_go_tps68470_led_lookups,
 	.n_gpiod_lookups = 2,
 	.tps68470_gpio_lookup_tables = {
 		&surface_go_int347a_gpios,
-- 
2.34.1

