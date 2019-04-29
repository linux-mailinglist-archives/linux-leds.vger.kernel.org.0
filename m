Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9C5FEC16
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 23:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729370AbfD2V3t (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 17:29:49 -0400
Received: from mail.nic.cz ([217.31.204.67]:52786 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729482AbfD2V3r (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 29 Apr 2019 17:29:47 -0400
Received: from dellmb.labs.office.nic.cz (unknown [172.20.6.125])
        by mail.nic.cz (Postfix) with ESMTP id ED42863514;
        Mon, 29 Apr 2019 23:29:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1556573385; bh=LYUgVnj0pJ/JaYnH2vHWN5rDFZzNOY8P3O7oQkcUMlY=;
        h=From:To:Date;
        b=M3f9Do6D/x26AvczWbDMbA7vo8O6cuABbKqZevjpL8UipSleSDaZLys0rS7NzrzAT
         AnlDILalKrMlWKKiyba/oE3Jtf1CMmKg2j8DkIpRWdDOCsbJKv2IzV1fxK/8aSuqiV
         yaCE0of4WiMqZdHNO0Sg1W7LRB/7TmvnHkFhmUBY=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds/for-next v2 1/2] leds: turris_omnia: build if CONFIG_COMPILE_TEST=y
Date:   Mon, 29 Apr 2019 23:29:43 +0200
Message-Id: <20190429212944.15643-2-marek.behun@nic.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190429212944.15643-1-marek.behun@nic.cz>
References: <20190429212944.15643-1-marek.behun@nic.cz>
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
index 52de996e2262..3747cbd0de2c 100644
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

