Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7871F21DAA3
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 17:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730144AbgGMPqL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Jul 2020 11:46:11 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55500 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730029AbgGMPqI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Jul 2020 11:46:08 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06DFjv4Y018935;
        Mon, 13 Jul 2020 10:45:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594655157;
        bh=jp9ffwGIzggvhdM7MTkwmVu/nsd5UU/IJirKmGdhbhs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=c1hdcddx58PnO/JoNNBDKdwAgJxIXZrmpNm+Td5W3kEySZkLexWM0VQ2IjJVR2OEn
         vqms885fexhR6KeNuPE9ok6OTiEZAV4cYwtvTNkx0zdg9NN2tBe/RHfHhFlydQq+sG
         CKqHQFf1H2Yzia6lnfr7C78gHXlmkQ2Cik8Ngl/o=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06DFjv1T018791;
        Mon, 13 Jul 2020 10:45:57 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 13
 Jul 2020 10:45:56 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 13 Jul 2020 10:45:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06DFjudu033627;
        Mon, 13 Jul 2020 10:45:56 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <marek.behun@nic.cz>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v30 04/16] leds: Add multicolor ID to the color ID list
Date:   Mon, 13 Jul 2020 10:45:32 -0500
Message-ID: <20200713154544.1683-5-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713154544.1683-1-dmurphy@ti.com>
References: <20200713154544.1683-1-dmurphy@ti.com>
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
2.27.0

