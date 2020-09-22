Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 583492748C5
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 21:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgIVTG5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Sep 2020 15:06:57 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60138 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbgIVTG4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Sep 2020 15:06:56 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08MJ6iV5104639;
        Tue, 22 Sep 2020 14:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1600801604;
        bh=hHCft0Z7puAqxwACe5iL+aqiPFUH5k+ZEto93fiGLwg=;
        h=From:To:CC:Subject:Date;
        b=rGSDZyLWVw37cF15v9EWtO9uC1tqSBZFlPDO0buB5ADKwX50MisIYsRfNt8SiaZvB
         RFeXCwPeCNnF3U4gmc0FBWsgNR2Ux2CZojfORB1GUnXK62stcOVRlgoOp5k5nOYQfH
         kvuU283JkwEnsZokdlND+D72kq30ZU05cqfSFYrE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08MJ6iM9093174
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Sep 2020 14:06:44 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 22
 Sep 2020 14:06:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 22 Sep 2020 14:06:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08MJ6i8e026124;
        Tue, 22 Sep 2020 14:06:44 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <marek.behun@nic.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 1/2] leds: lm3552: Fix warnings for undefined parameters
Date:   Tue, 22 Sep 2020 14:06:37 -0500
Message-ID: <20200922190638.5323-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fix warnings for undefined parameters when W=1 is used.

Fixes: bc1b8492c764f ("leds: lm3532: Introduce the lm3532 LED driver")
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm3532.c | 50 +++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 9b6973217cc0..95221d1e3861 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -96,15 +96,15 @@
 
 /*
  * struct lm3532_als_data
- * @config - value of ALS configuration register
- * @als1_imp_sel - value of ALS1 resistor select register
- * @als2_imp_sel - value of ALS2 resistor select register
- * @als_avrg_time - ALS averaging time
- * @als_input_mode - ALS input mode for brightness control
- * @als_vmin - Minimum ALS voltage
- * @als_vmax - Maximum ALS voltage
- * @zone_lo - values of ALS lo ZB(Zone Boundary) registers
- * @zone_hi - values of ALS hi ZB(Zone Boundary) registers
+ * @config: value of ALS configuration register
+ * @als1_imp_sel: value of ALS1 resistor select register
+ * @als2_imp_sel: value of ALS2 resistor select register
+ * @als_avrg_time: ALS averaging time
+ * @als_input_mode: ALS input mode for brightness control
+ * @als_vmin: Minimum ALS voltage
+ * @als_vmax: Maximum ALS voltage
+ * @zone_lo: values of ALS lo ZB(Zone Boundary) registers
+ * @zone_hi: values of ALS hi ZB(Zone Boundary) registers
  */
 struct lm3532_als_data {
 	u8 config;
@@ -121,14 +121,14 @@ struct lm3532_als_data {
 /**
  * struct lm3532_led
  * @led_dev: led class device
- * @priv - Pointer the device data structure
- * @control_bank - Control bank the LED is associated to
- * @mode - Mode of the LED string
- * @ctrl_brt_pointer - Zone target register that controls the sink
- * @num_leds - Number of LED strings are supported in this array
- * @full_scale_current - The full-scale current setting for the current sink.
- * @led_strings - The LED strings supported in this array
- * @enabled - Enabled status
+ * @priv: Pointer the device data structure
+ * @control_bank: Control bank the LED is associated to
+ * @mode: Mode of the LED string
+ * @ctrl_brt_pointer: Zone target register that controls the sink
+ * @num_leds: Number of LED strings are supported in this array
+ * @full_scale_current: The full-scale current setting for the current sink.
+ * @led_strings: The LED strings supported in this array
+ * @enabled: Enabled status
  */
 struct lm3532_led {
 	struct led_classdev led_dev;
@@ -145,16 +145,16 @@ struct lm3532_led {
 
 /**
  * struct lm3532_data
- * @enable_gpio - Hardware enable gpio
+ * @enable_gpio: Hardware enable gpio
  * @regulator: regulator
  * @client: i2c client
- * @regmap - Devices register map
- * @dev - Pointer to the devices device struct
- * @lock - Lock for reading/writing the device
- * @als_data - Pointer to the als data struct
- * @runtime_ramp_up - Runtime ramp up setting
- * @runtime_ramp_down - Runtime ramp down setting
- * @leds - Array of LED strings
+ * @regmap: Devices register map
+ * @dev: Pointer to the devices device struct
+ * @lock: Lock for reading/writing the device
+ * @als_data: Pointer to the als data struct
+ * @runtime_ramp_up: Runtime ramp up setting
+ * @runtime_ramp_down: Runtime ramp down setting
+ * @leds: Array of LED strings
  */
 struct lm3532_data {
 	struct gpio_desc *enable_gpio;
-- 
2.28.0

