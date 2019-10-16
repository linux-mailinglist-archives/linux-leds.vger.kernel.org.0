Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64807D8959
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2019 09:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbfJPHYl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Oct 2019 03:24:41 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:52007 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726545AbfJPHYk (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 16 Oct 2019 03:24:40 -0400
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 951321A23B44;
        Wed, 16 Oct 2019 10:24:38 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     pavel@ucw.cz, linux-leds@vger.kernel.org
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [RESEND PATCH] leds: mlxreg: Fix possible buffer overflow
Date:   Wed, 16 Oct 2019 10:24:30 +0300
Message-Id: <20191016072430.27020-1-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Error was detected by PVS-Studio:
V512 A call of the 'sprintf' function will lead to overflow of
the buffer 'led_data->led_cdev_name'.

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
---
 drivers/leds/leds-mlxreg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-mlxreg.c b/drivers/leds/leds-mlxreg.c
index cabe379071a7..82aea1cd0c12 100644
--- a/drivers/leds/leds-mlxreg.c
+++ b/drivers/leds/leds-mlxreg.c
@@ -228,8 +228,8 @@ static int mlxreg_led_config(struct mlxreg_led_priv_data *priv)
 			brightness = LED_OFF;
 			led_data->base_color = MLXREG_LED_GREEN_SOLID;
 		}
-		sprintf(led_data->led_cdev_name, "%s:%s", "mlxreg",
-			data->label);
+		snprintf(led_data->led_cdev_name, sizeof(led_data->led_cdev_name),
+			 "mlxreg:%s", data->label);
 		led_cdev->name = led_data->led_cdev_name;
 		led_cdev->brightness = brightness;
 		led_cdev->max_brightness = LED_ON;
-- 
2.21.0

