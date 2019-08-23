Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C58D39B773
	for <lists+linux-leds@lfdr.de>; Fri, 23 Aug 2019 21:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391184AbfHWTzh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 23 Aug 2019 15:55:37 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:51446 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392200AbfHWTzf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 23 Aug 2019 15:55:35 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7NJtRxr044090;
        Fri, 23 Aug 2019 14:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566590127;
        bh=s0XicrLXuGI/HXmhbkjUlUHssBuuijSTQe3NjyOcpYc=;
        h=From:To:CC:Subject:Date;
        b=Yj9GHaINlCrLeqpl554w/KOYgdyGojesoH0OC4jJaXLz1xIV/29ZxiqNurw1BKwk+
         Bi15b+mYcRCSC18HK3TvzCX7kClgG+vCVvYPenvVu3hYbTQgnCbf3N/pdxzwvF3RdF
         +jW4fAByG5Pfe9cLExhlaOpInKNEQwp4hXmLz/7A=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7NJtRCG069056
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 23 Aug 2019 14:55:27 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 23
 Aug 2019 14:55:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 23 Aug 2019 14:55:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7NJtRZL004700;
        Fri, 23 Aug 2019 14:55:27 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] leds: ti-lmu-common: Fix coccinelle issue in TI LMU
Date:   Fri, 23 Aug 2019 14:55:23 -0500
Message-ID: <20190823195523.20950-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fix the coccinelle issues found in the TI LMU common code

drivers/leds/leds-ti-lmu-common.c:97:20-29: WARNING: Unsigned expression compared with zero: ramp_down < 0
drivers/leds/leds-ti-lmu-common.c:97:5-12: WARNING: Unsigned expression compared with zero: ramp_up < 0

Fixes: f717460ba4d7 ("leds: TI LMU: Add common code for TI LMU devices")
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-ti-lmu-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ti-lmu-common.c b/drivers/leds/leds-ti-lmu-common.c
index adc7293004f1..c9ab40d5a6ba 100644
--- a/drivers/leds/leds-ti-lmu-common.c
+++ b/drivers/leds/leds-ti-lmu-common.c
@@ -84,7 +84,7 @@ static int ti_lmu_common_convert_ramp_to_index(unsigned int usec)
 int ti_lmu_common_set_ramp(struct ti_lmu_bank *lmu_bank)
 {
 	struct regmap *regmap = lmu_bank->regmap;
-	u8 ramp, ramp_up, ramp_down;
+	int ramp, ramp_up, ramp_down;
 
 	if (lmu_bank->ramp_up_usec == 0 && lmu_bank->ramp_down_usec == 0) {
 		ramp_up = 0;
-- 
2.22.0.214.g8dca754b1e

