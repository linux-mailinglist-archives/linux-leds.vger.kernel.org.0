Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB5634F34
	for <lists+linux-leds@lfdr.de>; Tue,  4 Jun 2019 19:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbfFDRny (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 4 Jun 2019 13:43:54 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57096 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbfFDRny (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 4 Jun 2019 13:43:54 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x54HhmQB093923;
        Tue, 4 Jun 2019 12:43:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559670228;
        bh=NMQ81banQ+yLIzO7vLSBo9E1X//dRsl0FgC88w6UiEo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=PxtExU0i2Oxb8BBWlShtkFgo7Mcsn2W4c8Bs6zdHph5MjZh2KYRvNSxOvhHGKNOpR
         ck9/AwcPMyNsM8wEnDBW0aWyjhGhVkH0ddnIyLUN52NIictzNSpfTT4ksJKLSSYg7s
         ApTmSOPWgQhAGShINjZBTtUroEzJDA7Tgj1rop8E=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x54HhmEf057662
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 4 Jun 2019 12:43:48 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 4 Jun
 2019 12:43:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 4 Jun 2019 12:43:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x54Hhl75123657;
        Tue, 4 Jun 2019 12:43:47 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>
CC:     <lee.jones@linaro.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v5 1/6] regulator: lm363x: Make the gpio register enable flexible
Date:   Tue, 4 Jun 2019 12:43:40 -0500
Message-ID: <20190604174345.14841-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
In-Reply-To: <20190604174345.14841-1-dmurphy@ti.com>
References: <20190604174345.14841-1-dmurphy@ti.com>
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
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---

v5 - No changes to the patch changes requested in this patch were done in
patch 4 of this series - https://lore.kernel.org/patchwork/patch/1077408/

 drivers/regulator/lm363x-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/lm363x-regulator.c b/drivers/regulator/lm363x-regulator.c
index e02fdd1dd092..1b5d7d2f26b8 100644
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

