Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDAEFC789
	for <lists+linux-leds@lfdr.de>; Thu, 14 Nov 2019 14:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbfKNNbq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 14 Nov 2019 08:31:46 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:48876 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727133AbfKNNbp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Nov 2019 08:31:45 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAEDVfeJ067280;
        Thu, 14 Nov 2019 07:31:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573738301;
        bh=vNLixCA7rV3r89geVpDyZT2afzJln66pkNhtKdigswM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=J8NHe/GderBJpX75pRrbmtNIf/q7g55FnGLwv4QC91iLdnC8E459NvQO4JS6IH6hj
         7ITiFgR4TBPnB6im7tVDyKhcprYsOf+F3MiPJdsOrtjed8jTw3FkwD712p/Na3nJs+
         A7MbsK04euwXWx2ZdLJOW9NryIc+3Pm9FWEuWJLA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAEDVfD9019490
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 14 Nov 2019 07:31:41 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 07:31:41 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 07:31:41 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAEDVfJr079550;
        Thu, 14 Nov 2019 07:31:41 -0600
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v17 03/19] leds: Add multicolor ID to the color ID list
Date:   Thu, 14 Nov 2019 07:30:07 -0600
Message-ID: <20191114133023.32185-4-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191114133023.32185-1-dmurphy@ti.com>
References: <20191114133023.32185-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a new color ID that is declared as MULTICOLOR as with the
multicolor framework declaring a definitive color is not accurate
as the node can contain multiple colors.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/led-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index f1f718dbe0f8..846248a0693d 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -34,6 +34,7 @@ const char * const led_colors[LED_COLOR_ID_MAX] = {
 	[LED_COLOR_ID_VIOLET] = "violet",
 	[LED_COLOR_ID_YELLOW] = "yellow",
 	[LED_COLOR_ID_IR] = "ir",
+	[LED_COLOR_ID_MULTI] = "multicolor",
 };
 EXPORT_SYMBOL_GPL(led_colors);
 
-- 
2.22.0.214.g8dca754b1e

