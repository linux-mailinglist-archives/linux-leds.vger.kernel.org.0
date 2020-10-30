Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A782929FB79
	for <lists+linux-leds@lfdr.de>; Fri, 30 Oct 2020 03:39:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgJ3CjR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Oct 2020 22:39:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:38600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbgJ3CjR (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Oct 2020 22:39:17 -0400
Received: from dellmb.labs.office.nic.cz (nat-1.nic.cz [217.31.205.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 869012076E;
        Fri, 30 Oct 2020 02:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604025556;
        bh=HsClZEDGxlq82oxpxV8qrf/vdoS7IOQxuddZOtDDaQM=;
        h=From:To:Cc:Subject:Date:From;
        b=mVm6RrR3jOReLRnmiZa1NgdYfJ9tZT/Brrd0OQxIm7AHkRkJUWRAWILhx2maKSyot
         pukvVZ/dw5p/a5VTZAik/GzanPuyzHN6Urr9sSnYGvHAyQycJJPrSsZaUCMCfBbZm3
         tuE/dGNzFnAqQrFsiOz5hnDqdruc0sXXTDtd6LDo=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-leds@vger.kernel.org
Cc:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds 1/5] leds: turris-omnia: use constants instead of macros for color command
Date:   Fri, 30 Oct 2020 03:39:02 +0100
Message-Id: <20201030023906.24259-1-kabel@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use integer constants directly when building I2C messages for LED color
change command, instead of macros. The command is simple enough to
understand what is going on even without these names.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 34 ++++++++++++--------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 8c5bdc3847ee..80b2d94844f2 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -27,14 +27,6 @@
 #define CMD_LED_SET_BRIGHTNESS		7
 #define CMD_LED_GET_BRIGHTNESS		8
 
-#define OMNIA_CMD			0
-
-#define OMNIA_CMD_LED_COLOR_LED		1
-#define OMNIA_CMD_LED_COLOR_R		2
-#define OMNIA_CMD_LED_COLOR_G		3
-#define OMNIA_CMD_LED_COLOR_B		4
-#define OMNIA_CMD_LED_COLOR_LEN		5
-
 struct omnia_led {
 	struct led_classdev_mc mc_cdev;
 	struct mc_subled subled_info[OMNIA_LED_NUM_CHANNELS];
@@ -55,21 +47,21 @@ static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
 	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
 	struct omnia_leds *leds = dev_get_drvdata(cdev->dev->parent);
 	struct omnia_led *led = to_omnia_led(mc_cdev);
-	u8 buf[OMNIA_CMD_LED_COLOR_LEN], state;
+	u8 buf[5], state;
 	int ret;
 
 	mutex_lock(&leds->lock);
 
 	led_mc_calc_color_components(&led->mc_cdev, brightness);
 
-	buf[OMNIA_CMD] = CMD_LED_COLOR;
-	buf[OMNIA_CMD_LED_COLOR_LED] = led->reg;
-	buf[OMNIA_CMD_LED_COLOR_R] = mc_cdev->subled_info[0].brightness;
-	buf[OMNIA_CMD_LED_COLOR_G] = mc_cdev->subled_info[1].brightness;
-	buf[OMNIA_CMD_LED_COLOR_B] = mc_cdev->subled_info[2].brightness;
+	buf[0] = CMD_LED_COLOR;
+	buf[1] = led->reg;
+	buf[2] = mc_cdev->subled_info[0].brightness;
+	buf[3] = mc_cdev->subled_info[1].brightness;
+	buf[4] = mc_cdev->subled_info[2].brightness;
 
 	state = CMD_LED_STATE_LED(led->reg);
-	if (buf[OMNIA_CMD_LED_COLOR_R] || buf[OMNIA_CMD_LED_COLOR_G] || buf[OMNIA_CMD_LED_COLOR_B])
+	if (buf[2] || buf[3] || buf[4])
 		state |= CMD_LED_STATE_ON;
 
 	ret = i2c_smbus_write_byte_data(leds->client, CMD_LED_STATE, state);
@@ -250,18 +242,18 @@ static int omnia_leds_probe(struct i2c_client *client,
 
 static int omnia_leds_remove(struct i2c_client *client)
 {
-	u8 buf[OMNIA_CMD_LED_COLOR_LEN];
+	u8 buf[5];
 
 	/* put all LEDs into default (HW triggered) mode */
 	i2c_smbus_write_byte_data(client, CMD_LED_MODE,
 				  CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
 
 	/* set all LEDs color to [255, 255, 255] */
-	buf[OMNIA_CMD] = CMD_LED_COLOR;
-	buf[OMNIA_CMD_LED_COLOR_LED] = OMNIA_BOARD_LEDS;
-	buf[OMNIA_CMD_LED_COLOR_R] = 255;
-	buf[OMNIA_CMD_LED_COLOR_G] = 255;
-	buf[OMNIA_CMD_LED_COLOR_B] = 255;
+	buf[0] = CMD_LED_COLOR;
+	buf[1] = OMNIA_BOARD_LEDS;
+	buf[2] = 255;
+	buf[3] = 255;
+	buf[4] = 255;
 
 	i2c_master_send(client, buf, 5);
 

base-commit: 041883d044672852fcb8254cfc7b683fd306c943
-- 
2.26.2

