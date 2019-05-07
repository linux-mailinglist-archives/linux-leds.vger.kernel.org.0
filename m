Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3738916BF9
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2019 22:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbfEGUMM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 May 2019 16:12:12 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51582 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbfEGUMM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 May 2019 16:12:12 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x47KBrod027910;
        Tue, 7 May 2019 15:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557259913;
        bh=LjSX35Zd9AAVl0gh4n5sT6SVSu9q2cBivqmA5diC3lY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=UNAxWNf66CSP/KYNQPq7DISHIJU7g7XR7BuzW3HltlV8ed+rDJTWQvP32LncWup5h
         p5sBHs17S8xJ8E9YSOdwJELy1f2WSuiNccb8J/l/Je4G0pycPLK7MxbIYArQ1Fo76x
         ww6KC8YMGI4nzyp9hZS9din79DViLRa5ITVrFNrE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x47KBrJP102925
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 May 2019 15:11:53 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 7 May
 2019 15:11:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 7 May 2019 15:11:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x47KBrhi013903;
        Tue, 7 May 2019 15:11:53 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <lee.jones@linaro.org>, <rdunlap@infradead.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v4 1/6] regulator: lm363x: Make the gpio register enable flexible
Date:   Tue, 7 May 2019 15:11:54 -0500
Message-ID: <20190507201159.13940-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
In-Reply-To: <20190507201159.13940-1-dmurphy@ti.com>
References: <20190507201159.13940-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The use of and enablement of the GPIO can be used across devices.
Use the enable_reg in the regulator descriptor for the register to
write.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/regulator/lm363x-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/lm363x-regulator.c b/drivers/regulator/lm363x-regulator.c
index c876e161052a..382b1cecdd93 100644
--- a/drivers/regulator/lm363x-regulator.c
+++ b/drivers/regulator/lm363x-regulator.c
@@ -263,8 +263,8 @@ static int lm363x_regulator_probe(struct platform_device *pdev)
 
 	if (gpiod) {
 		cfg.ena_gpiod = gpiod;
-
-		ret = regmap_update_bits(regmap, LM3632_REG_BIAS_CONFIG,
+		ret = regmap_update_bits(regmap,
+					 lm363x_regulator_desc[id].enable_reg,
 					 LM3632_EXT_EN_MASK,
 					 LM3632_EXT_EN_MASK);
 		if (ret) {
-- 
2.21.0.5.gaeb582a983

