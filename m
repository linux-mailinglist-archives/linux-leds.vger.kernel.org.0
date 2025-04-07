Return-Path: <linux-leds+bounces-4438-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 937F6A7EC0F
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 21:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C5DC17D7F4
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 19:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE93725DD10;
	Mon,  7 Apr 2025 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kxCEMxmT"
X-Original-To: linux-leds@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5DE21B9E5;
	Mon,  7 Apr 2025 18:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744050963; cv=none; b=r6AWSRyNoB+d4F1TbsgZR297Y7NrZ+r3FkH76OPR7tRrFXAxiSjufPuzPUmTTSmH9b+3uFkuMqVFZlnZs606HmEr3C6+OnHmeNdvUFeDcV6jRBNLttsdeLgk7Cop8fnPHERo9kQG9Jtj4epQhnDDpcydawoQ/U97Ibxhcp3BxRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744050963; c=relaxed/simple;
	bh=FAngIXAfAwypXmVFLK8q6zc9p67d9ME54sZbS/9rGGA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pyqXRzTNnZXz9bl02anUzTuysRptEsrIJ3lmrWTlAS2+s7HShbVarM4lJVd1OhsSjF2oN3EH7Jb0FE0jsMcOjG3U5rAoY0oiI7JRHDBsdHY9d34+MZ14qG+dba//RyfbsIZ3iNuRH0Ez4Gd76kBbgndRdtndwbrxSobC5AMIKUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kxCEMxmT; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537IZvjl953482
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 13:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744050957;
	bh=6NrD7pxPpm9iiKfFH1QAdQ/4I9hvw0T4+kT3T1ctvYE=;
	h=From:To:CC:Subject:Date;
	b=kxCEMxmTzAuVee11tkjG8vHVgUfInpG1b6XZqwnf5oyrSx3Cax4SELnfvhtvMaPTS
	 6hjPWfoatUfzmf7zyiaLrsjUm6n60VfBP3BADaHvZi4i7YNErc+lJaErN8rF4bGgkk
	 pFNK+8EGhA2BYYfR59Bwt0cYIX2wbi4HbUxNBglI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537IZv68001094
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 13:35:57 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 13:35:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 13:35:57 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537IZuQn072942;
	Mon, 7 Apr 2025 13:35:56 -0500
From: Andrew Davis <afd@ti.com>
To: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis
	<afd@ti.com>
Subject: [PATCH 1/6] leds: lp8860: Use regmap_multi_reg_write for EEPROM writes
Date: Mon, 7 Apr 2025 13:35:50 -0500
Message-ID: <20250407183555.409687-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This helper does the same thing as manual looping, use it instead.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/leds/leds-lp8860.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 995f2adf85696..2b1c68e609495 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -103,12 +103,7 @@ struct lp8860_led {
 	struct regulator *regulator;
 };
 
-struct lp8860_eeprom_reg {
-	uint8_t reg;
-	uint8_t value;
-};
-
-static struct lp8860_eeprom_reg lp8860_eeprom_disp_regs[] = {
+static const struct reg_sequence lp8860_eeprom_disp_regs[] = {
 	{ LP8860_EEPROM_REG_0, 0xed },
 	{ LP8860_EEPROM_REG_1, 0xdf },
 	{ LP8860_EEPROM_REG_2, 0xdc },
@@ -238,7 +233,7 @@ static int lp8860_brightness_set(struct led_classdev *led_cdev,
 static int lp8860_init(struct lp8860_led *led)
 {
 	unsigned int read_buf;
-	int ret, i, reg_count;
+	int ret, reg_count;
 
 	if (led->regulator) {
 		ret = regulator_enable(led->regulator);
@@ -266,14 +261,10 @@ static int lp8860_init(struct lp8860_led *led)
 	}
 
 	reg_count = ARRAY_SIZE(lp8860_eeprom_disp_regs);
-	for (i = 0; i < reg_count; i++) {
-		ret = regmap_write(led->eeprom_regmap,
-				lp8860_eeprom_disp_regs[i].reg,
-				lp8860_eeprom_disp_regs[i].value);
-		if (ret) {
-			dev_err(&led->client->dev, "Failed writing EEPROM\n");
-			goto out;
-		}
+	ret = regmap_multi_reg_write(led->eeprom_regmap, lp8860_eeprom_disp_regs, reg_count);
+	if (ret) {
+		dev_err(&led->client->dev, "Failed writing EEPROM\n");
+		goto out;
 	}
 
 	ret = lp8860_unlock_eeprom(led, LP8860_LOCK_EEPROM);
-- 
2.39.2


