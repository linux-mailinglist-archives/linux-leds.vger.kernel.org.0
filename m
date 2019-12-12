Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07BA611C403
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2019 04:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbfLLDkE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Dec 2019 22:40:04 -0500
Received: from mx2.suse.de ([195.135.220.15]:58596 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727658AbfLLDkE (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Dec 2019 22:40:04 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 60525AD6F;
        Thu, 12 Dec 2019 03:40:02 +0000 (UTC)
From:   =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        sales@fdhisi.com
Subject: [RFC 12/25] leds: tm1628: Add Fuda Hisi Microelectronics FD628
Date:   Thu, 12 Dec 2019 04:39:39 +0100
Message-Id: <20191212033952.5967-13-afaerber@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191212033952.5967-1-afaerber@suse.de>
References: <20191212033952.5967-1-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add definition for FD628 chipset.

Cc: sales@fdhisi.com
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 drivers/leds/Kconfig       |  4 ++--
 drivers/leds/leds-tm1628.c | 12 ++++++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index f3afb419a9a1..a7695d961d9c 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -842,8 +842,8 @@ config LEDS_TM1628
 	depends on SPI
 	depends on OF || COMPILE_TEST
 	help
-	  Say Y to enable support for Titan Micro Electronics TM1628
-	  LED controllers.
+	  Say Y to enable support for Titan Micro Electronics TM1628 and
+	  Fuda Hisi Microelectronics FD628 LED controllers.
 	  They are 3-wire SPI devices controlling a two-dimensional grid of
 	  LEDs. Dimming is applied to all outputs through an internal PWM.
 
diff --git a/drivers/leds/leds-tm1628.c b/drivers/leds/leds-tm1628.c
index 319bf34ce835..ef85712a84f2 100644
--- a/drivers/leds/leds-tm1628.c
+++ b/drivers/leds/leds-tm1628.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Titan Micro Electronics TM1628 LED controller
+ * Also compatible:
+ * Fuda Hisi Microelectronics FD628
  *
  * Copyright (c) 2019 Andreas Färber
  */
@@ -400,8 +402,18 @@ static const struct tm1628_info tm1628_info = {
 	.default_pwm = 0,
 };
 
+static const struct tm1628_info fd628_info = {
+	.grid_mask = GENMASK(7, 1),
+	.seg_mask = GENMASK(14, 12) | GENMASK(10, 1),
+	.modes = tm1628_modes,
+	.default_mode = 3,
+	.pwm_map = tm1628_pwm_map,
+	.default_pwm = 0,
+};
+
 static const struct of_device_id tm1628_spi_of_matches[] = {
 	{ .compatible = "titanmec,tm1628", .data = &tm1628_info },
+	{ .compatible = "fdhisi,fd628", .data = &fd628_info },
 	{}
 };
 MODULE_DEVICE_TABLE(of, tm1628_spi_of_matches);
-- 
2.16.4

