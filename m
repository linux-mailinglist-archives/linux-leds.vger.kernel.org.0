Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAD91F200B
	for <lists+linux-leds@lfdr.de>; Mon,  8 Jun 2020 21:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgFHTjm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Jun 2020 15:39:42 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58266 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726602AbgFHTjj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 Jun 2020 15:39:39 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058JdZmS102306;
        Mon, 8 Jun 2020 14:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591645175;
        bh=V2VikCqHW+vjr+5pGiSTht8WRqjdCKy+EM301kkEwzI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=NkiQ6mibjmiyG3toQhkGik93ZZQkLzcvKBBhytlBAdOfdPMCzk5ogNsNWrtR8ScbK
         XbJrRIrZBqsWZOHNqlBUSRgnXzAL0AhwwHMVluYq3TtlXDbDam3B2M4YP7FPmSHGE2
         Fyl3BnUqVyw3XQ9lNdVslGy/b/hLxsiPqlHyTMxw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058JdZBC001721;
        Mon, 8 Jun 2020 14:39:35 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 14:39:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 14:39:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058JdYwM054945;
        Mon, 8 Jun 2020 14:39:34 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v27 02/15] leds: Add multicolor ID to the color ID list
Date:   Mon, 8 Jun 2020 14:39:04 -0500
Message-ID: <20200608193917.13084-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608193917.13084-1-dmurphy@ti.com>
References: <20200608193917.13084-1-dmurphy@ti.com>
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
2.26.2

