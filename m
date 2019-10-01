Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17D61C3F4A
	for <lists+linux-leds@lfdr.de>; Tue,  1 Oct 2019 20:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731030AbfJASEY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Oct 2019 14:04:24 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34464 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727176AbfJASEX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Oct 2019 14:04:23 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91I4Jkq062621;
        Tue, 1 Oct 2019 13:04:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569953059;
        bh=G5dE59ax181azOisHSqvm9h6ieZKUV+zX+MgaCfGHj8=;
        h=From:To:CC:Subject:Date;
        b=X1HMrt9OTxUASF5Eq5yoPjn/G0KYc+DRpOtRUiPAQ3ubsafzXgbrAs1kADn37a94A
         Y2YAna15WGq6j4VpCmEyzJ0T+Uh0sq9xxYUoNM8JB1J+byGxzjV+El5fT4JNKCGnQc
         y2wnEYU0cySaXwMFPokhcl68ZbpClrWjW5BPG9FY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91I4JMW036201
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Oct 2019 13:04:19 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 13:04:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 13:04:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91I4IBK061630;
        Tue, 1 Oct 2019 13:04:18 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 1/5] leds: Kconfig: Be consistent with the usage of "LED"
Date:   Tue, 1 Oct 2019 13:04:35 -0500
Message-ID: <20191001180439.8312-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Update the Kconfig to be consistent in the case of using
"LED" in the Kconfig.  LED is an acronym and should be
capitalized.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 6e7703fd03d0..4b68520ac251 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -17,7 +17,7 @@ if NEW_LEDS
 config LEDS_CLASS
 	tristate "LED Class Support"
 	help
-	  This option enables the led sysfs class in /sys/class/leds.  You'll
+	  This option enables the LED sysfs class in /sys/class/leds.  You'll
 	  need this to do anything useful with LEDs.  If unsure, say N.
 
 config LEDS_CLASS_FLASH
@@ -35,7 +35,7 @@ config LEDS_BRIGHTNESS_HW_CHANGED
 	depends on LEDS_CLASS
 	help
 	  This option enables support for the brightness_hw_changed attribute
-	  for led sysfs class devices under /sys/class/leds.
+	  for LED sysfs class devices under /sys/class/leds.
 
 	  See Documentation/ABI/testing/sysfs-class-led for details.
 
-- 
2.22.0.214.g8dca754b1e

