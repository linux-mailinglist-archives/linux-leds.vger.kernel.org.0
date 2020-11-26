Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 062412C52D1
	for <lists+linux-leds@lfdr.de>; Thu, 26 Nov 2020 12:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729148AbgKZLTp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Nov 2020 06:19:45 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:36341 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729001AbgKZLTp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Nov 2020 06:19:45 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 26 Nov 2020 13:19:40 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 0AQBJeWZ030857;
        Thu, 26 Nov 2020 13:19:40 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH led-next v2 1/1] leds: mlxreg: Allow multi-instantiation of same name LED for modular systems
Date:   Thu, 26 Nov 2020 13:19:37 +0200
Message-Id: <20201126111937.88139-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

It could be more than one instance of LED with the same name in the
modular systems. For example, "status" or "uid" LED can be located
on chassis and on each line card of modular system.
In order to avoid conflicts with duplicated names, append platform
device Id, which is unique, to LED name after driver name.
Thus, for example, "status" LED on chassis is to be called, like it is
called now on non-modular systems, on which platform device Id is not
specified: "mlxreg:status:green". While for the line cards LEDs it will
be called like: "card48:status:green", "card66:status:green",
etcetera.

LED driver works on top of register space of the programmable devices
(CPLD or FPGA), providing the logic for LED control. The programmable
devices on the line cards are connected through I2C bus and LED driver
will work over I2C. On main board programmable device is connected
through LPC, and LED driver works over LPC.

The motivation it to provide support for new modular systems which
could be equipped with the different types of replaceable line cards
and management board.

Line cards are connected to the chassis through I2C interface for the
chassis management operations and through PCIe for the networking
operations. Future line cards could be connected to the chassis through
InfiniBand fabric, instead of PCIe.

The first type of line card supports 16x100GbE QSFP28 Ethernet ports.
Those line cards equipped with the programmable devices aimed for
system control of Nvidia Ethernet switch ASIC control, Nvidia FPGA,
Nvidia gearboxes (PHYs).
The next coming  card generations are supposed to support:
- Line cards with 8x200Gbe QSFP28 Ethernet ports.
- Line cards with 4x400Gbe QSFP-DD Ethernet ports.
- Smart cards equipped with Nvidia ARM CPU for offloading and for fast
  access to the storage (EBoF).
- Fabric cards for inter-connection.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v1->v2:
 Changes added after discussion with Pavel and Marek.
 - Change device name for line cards from "mlxreg" to "card".
 - Extend commit text - add more explanations.
---
 drivers/leds/leds-mlxreg.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-mlxreg.c b/drivers/leds/leds-mlxreg.c
index 82aea1cd0c12..2eb1d4198b51 100644
--- a/drivers/leds/leds-mlxreg.c
+++ b/drivers/leds/leds-mlxreg.c
@@ -228,8 +228,18 @@ static int mlxreg_led_config(struct mlxreg_led_priv_data *priv)
 			brightness = LED_OFF;
 			led_data->base_color = MLXREG_LED_GREEN_SOLID;
 		}
-		snprintf(led_data->led_cdev_name, sizeof(led_data->led_cdev_name),
-			 "mlxreg:%s", data->label);
+
+		/*
+		 * Id greater than zero is used for LEDs located on replaceable unit,
+		 * like line card or fabric card. In this case Id is set to I2C bus
+		 * number. Otherwise LEDs located on the main board.
+		 */
+		if (priv->pdev->id > 0)
+			sprintf(led_data->led_cdev_name, "%s%d:%s", "card",
+				priv->pdev->id, data->label);
+		else
+			sprintf(led_data->led_cdev_name, "%s:%s", "mlxreg",
+				data->label);
 		led_cdev->name = led_data->led_cdev_name;
 		led_cdev->brightness = brightness;
 		led_cdev->max_brightness = LED_ON;
-- 
2.11.0

