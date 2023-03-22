Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60CBF6C5029
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 17:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbjCVQKI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 12:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbjCVQJy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 12:09:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE665072A;
        Wed, 22 Mar 2023 09:09:51 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBF4518A4;
        Wed, 22 Mar 2023 17:09:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679501384;
        bh=3thhCzpSnD7EzFfqxqceXEfOwcXqCz1VjVfiLb1SzZo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a3Lj54PIlJveWDIEdiDL1hOtdFWDbTojaCiz9CK9IMKWBsnSIAKOUEHNXvllQMjgL
         G+NNGfwHUAXKgFly6EO3/HlUDYMtAwLNc3vWXgC07ta97k2Ypo19xO7Fn5kNHH+WBt
         zLHsBrKgS3XpfldL5rFklDfJEy1kDvPqdYH4wcx0=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, hdegoede@redhat.com,
        markgross@kernel.org, sboyd@kernel.org, hpa@redhat.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 3/8] platform/x86: int3472: Add TPS68470 LED Board Data
Date:   Wed, 22 Mar 2023 16:09:21 +0000
Message-Id: <20230322160926.948687-4-dan.scally@ideasonboard.com>
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

Add the board data for the Surface Go platforms to configure the LEDs
provided by the TPS68470 PMIC.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../x86/intel/int3472/tps68470_board_data.c         | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 322237e056f3..0d46a238b630 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -146,9 +146,21 @@ static struct gpiod_lookup_table surface_go_int347e_gpios = {
 	}
 };
 
+static const struct tps68470_led_platform_data surface_go_tps68470_led_pdata = {
+	.iledctl_ctrlb = 0x30,
+	.wledmaxf = 0x1f,
+	.wledto = 0x07,
+	.wledc1 = 0x1f,
+	.wledc2 = 0x1f,
+	.wledctl_mode = 0x00,
+	.wledctl_disled1 = true,
+	.wledctl_disled2 = false,
+};
+
 static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
 	.dev_name = "i2c-INT3472:05",
 	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
+	.tps68470_led_pdata = &surface_go_tps68470_led_pdata,
 	.n_gpiod_lookups = 2,
 	.tps68470_gpio_lookup_tables = {
 		&surface_go_int347a_gpios,
@@ -159,6 +171,7 @@ static const struct int3472_tps68470_board_data surface_go_tps68470_board_data =
 static const struct int3472_tps68470_board_data surface_go3_tps68470_board_data = {
 	.dev_name = "i2c-INT3472:01",
 	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
+	.tps68470_led_pdata = &surface_go_tps68470_led_pdata,
 	.n_gpiod_lookups = 2,
 	.tps68470_gpio_lookup_tables = {
 		&surface_go_int347a_gpios,
-- 
2.34.1

