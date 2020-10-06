Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 384A828505B
	for <lists+linux-leds@lfdr.de>; Tue,  6 Oct 2020 18:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgJFQ7K (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Oct 2020 12:59:10 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:52253 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725946AbgJFQ7K (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Oct 2020 12:59:10 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 6 Oct 2020 19:59:08 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 096Gx7eB004442;
        Tue, 6 Oct 2020 19:59:07 +0300
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     jacek.anaszewski@gmail.com
Cc:     linux-leds@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of same name LED for modular systems
Date:   Tue,  6 Oct 2020 19:58:50 +0300
Message-Id: <20201006165850.17790-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

It could be more than one instance of LED with the same name in the
modular systems. For example, "status" or "uid" LED can be located
on chassis and on each line card of modular system.
In order to avoid conflicts with duplicated names, append platform
device Id, which is unquie, to LED name after driver name.
Thus, for example, "status" LED on chassis is to be called, like it is
called now on non modular systems, on which platform device Id is not
specified: "mlxreg:status:green". While for the line cards LEDs it will
be called like: "mlxreg48:status:green", "mlxreg66:status:green",
etcetera.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/leds/leds-mlxreg.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-mlxreg.c b/drivers/leds/leds-mlxreg.c
index 82aea1cd0c12..53130a8656b1 100644
--- a/drivers/leds/leds-mlxreg.c
+++ b/drivers/leds/leds-mlxreg.c
@@ -228,8 +228,12 @@ static int mlxreg_led_config(struct mlxreg_led_priv_data *priv)
 			brightness = LED_OFF;
 			led_data->base_color = MLXREG_LED_GREEN_SOLID;
 		}
-		snprintf(led_data->led_cdev_name, sizeof(led_data->led_cdev_name),
-			 "mlxreg:%s", data->label);
+		if (priv->pdev->id > 0)
+			sprintf(led_data->led_cdev_name, "%s%d:%s", "mlxreg",
+				priv->pdev->id, data->label);
+		else
+			sprintf(led_data->led_cdev_name, "%s:%s", "mlxreg",
+				data->label);
 		led_cdev->name = led_data->led_cdev_name;
 		led_cdev->brightness = brightness;
 		led_cdev->max_brightness = LED_ON;
-- 
2.11.0

