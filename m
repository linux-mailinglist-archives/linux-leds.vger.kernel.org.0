Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15DBE26DFF
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2019 21:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387543AbfEVTqE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 May 2019 15:46:04 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36708 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732406AbfEVT1v (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 May 2019 15:27:51 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4MJRjYE117819;
        Wed, 22 May 2019 14:27:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558553265;
        bh=LjSX35Zd9AAVl0gh4n5sT6SVSu9q2cBivqmA5diC3lY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=IDPA+9a+FSnphel0B7xSOm2LJZ/UEmME3iciTCPvFc7vRF/aC7vqc6pPbn3BopcGN
         5UzaTpZd7uM2qfwcnmkF7E+JWVAIBV8vGFEjPsb6TTeSYc+DHZt8Z02x0vigSjuDaE
         AsA0ct6d8W3BHcqKDzfbBev2izOwO1MTdXQSSj80=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4MJRjMS031997
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 May 2019 14:27:45 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 22
 May 2019 14:27:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 22 May 2019 14:27:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4MJRjJO081593;
        Wed, 22 May 2019 14:27:45 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>
CC:     <lee.jones@linaro.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [RESEND PATCH v4 1/6] regulator: lm363x: Make the gpio register enable flexible
Date:   Wed, 22 May 2019 14:27:28 -0500
Message-ID: <20190522192733.13422-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
In-Reply-To: <20190522192733.13422-1-dmurphy@ti.com>
References: <20190522192733.13422-1-dmurphy@ti.com>
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

