Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E03422AFC2
	for <lists+linux-leds@lfdr.de>; Thu, 23 Jul 2020 14:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgGWM5y (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Jul 2020 08:57:54 -0400
Received: from lists.nic.cz ([217.31.204.67]:51770 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726521AbgGWM5y (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 23 Jul 2020 08:57:54 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 5D48514082C;
        Thu, 23 Jul 2020 14:57:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1595509072; bh=jWfEplKWTQ1CURpa79zyUZZwjlwz9DrAahqdWtsQU3k=;
        h=From:To:Date;
        b=HNsy8UGrjdqem1oQ9tZ2XJsVr9DLlSZgSEnf+Q1EB8rqs6EOa2mC8YClm1c5RVcTL
         07bvsrAW8M/7cvEdWcrE5QH819faPFubZurF1xtWUFCB06IwZk7zOxfZo9GbrBwzC+
         ufS68gHcBo942051Ne7B7Di7/E6ZxzyWgc1UAhrQ=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, jacek.anaszewski@gmail.com,
        Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH] leds: add orange color
Date:   Thu, 23 Jul 2020 14:57:51 +0200
Message-Id: <20200723125751.4045-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Many network devices have LEDs with green and orange color, instead of
green and yellow.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
---
 drivers/leds/led-core.c           | 1 +
 include/dt-bindings/leds/common.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 846248a0693d..6503d0d66fc6 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -35,6 +35,7 @@ const char * const led_colors[LED_COLOR_ID_MAX] = {
 	[LED_COLOR_ID_YELLOW] = "yellow",
 	[LED_COLOR_ID_IR] = "ir",
 	[LED_COLOR_ID_MULTI] = "multicolor",
+	[LED_COLOR_ID_ORANGE] = "orange",
 };
 EXPORT_SYMBOL_GPL(led_colors);
 
diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index a463ce6a8794..28b00ecc4645 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -31,7 +31,8 @@
 #define LED_COLOR_ID_YELLOW	6
 #define LED_COLOR_ID_IR		7
 #define LED_COLOR_ID_MULTI	8
-#define LED_COLOR_ID_MAX	9
+#define LED_COLOR_ID_ORANGE	9
+#define LED_COLOR_ID_MAX	10
 
 /* Standard LED functions */
 /* Keyboard LEDs, usually it would be input4::capslock etc. */
-- 
2.26.2

