Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 294E1EB0A
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 21:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729163AbfD2Tof (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 15:44:35 -0400
Received: from mail.nic.cz ([217.31.204.67]:50466 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729054AbfD2Tof (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 29 Apr 2019 15:44:35 -0400
Received: from dellmb.labs.office.nic.cz (unknown [172.20.6.125])
        by mail.nic.cz (Postfix) with ESMTP id 5446B63449;
        Mon, 29 Apr 2019 21:44:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1556567073; bh=zBFg9gnWml2WPY2mQOX1MJXvfN0nvuDXF336y/qvrFs=;
        h=From:To:Date;
        b=RDOD3K2as9YtEyueKWkdBmdSSS4vjK9UASE0gDyq/AnA8GPfZddLrZLFDOcvmfusj
         xKYxWjJ8AuSioUz651L2GBVJYYsY2jR099gReI27+97i3n0bc1XrKIgy06YgEFAZxe
         1oV1LzHp2mBCfYZRJhOWaP4RV+z8tYVzttd/PfMM=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds/for-next v1 1/2] leds: turris_omnia: build if CONFIG_COMPILE_TEST=y
Date:   Mon, 29 Apr 2019 21:44:32 +0200
Message-Id: <20190429194433.29760-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.99.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

As Pavel pointed out, this driver should build if COMPILE_TEST is
enabled.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
---
 drivers/leds/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 6b555d31c1be..a11a79bad973 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -132,7 +132,7 @@ config LEDS_TURRIS_OMNIA
 	tristate "LED support for CZ.NIC's Turris Omnia"
 	depends on LEDS_CLASS
 	depends on I2C
-	depends on MACH_ARMADA_38X
+	depends on MACH_ARMADA_38X || COMPILE_TEST
 	depends on OF
 	help
 	  This option enables basic support for the LEDs found on the front
-- 
2.21.0

