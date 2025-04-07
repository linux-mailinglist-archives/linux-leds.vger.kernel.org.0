Return-Path: <linux-leds+bounces-4443-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFB5A7EC12
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 21:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64C46446046
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 19:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C199425E463;
	Mon,  7 Apr 2025 18:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BmK+KE7V"
X-Original-To: linux-leds@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4461EE032;
	Mon,  7 Apr 2025 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744050965; cv=none; b=iU6L/YGbwcoabMErzk0Ecxsxf4dwRB83FL4EX5Ze2qE9JDW0uKRpe3UOM7JuVV6iW24rhRDe6dVqRLHSPajk7NlapMhSxVaosBD6vdmy7NkBwH1H58TriiUmiTJOrjjkSeOjVr0BxmRV0SJIoyIOJSUNQn1U562GwmbXRMeblqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744050965; c=relaxed/simple;
	bh=bMxXoiE+eJAEt/5PwHru0vdvI38WprYZMOGMUOGOGZU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H7cYyU5nwh1IeA7DikBhlxMgoF9i0gm5JmN8KIJBp/5WCvIWwt9VsDkBQnyTwlIbelWaqvZOAjYqRYBtTytcIx/w4J59d/FUmfIja1RsqdVv3LnePIN7Jx9tKG+JmK2m2V6vMjXkrHqzS59lLByK8+Ln+82d6SMw5Czo9yxXR/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BmK+KE7V; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537IZwW5997340
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 13:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744050958;
	bh=5Wu2AGD7mR1nC5GTLElqyptrWvLPJ9nc+YdXo8Wv1ZQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BmK+KE7VWuo1DTNomYHdVkPlRuRFCHTohO8PX96q7mcr+NrtFIywlvHzAgpCWwn+U
	 WN+Dtnezzh1kE5eIiJc0G6qvzqCtARGue3RQ7pcn2VMkCiWz80aFR52tx+HqTJXQ3C
	 7/yN7rMfkuFIM3STDEgMOeYvrmKjBBa6Z5NH46/U=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537IZwKS048425
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 13:35:58 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 13:35:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 13:35:57 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537IZuQp072942;
	Mon, 7 Apr 2025 13:35:57 -0500
From: Andrew Davis <afd@ti.com>
To: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis
	<afd@ti.com>
Subject: [PATCH 3/6] leds: lp8860: Remove default regs when not caching
Date: Mon, 7 Apr 2025 13:35:52 -0500
Message-ID: <20250407183555.409687-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250407183555.409687-1-afd@ti.com>
References: <20250407183555.409687-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

If we are not using regmap caches, then the value will be read
in every time, having a default value does not change anything in
that case. Remove the unused defaults.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/leds/leds-lp8860.c | 52 --------------------------------------
 1 file changed, 52 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 2d91f476f0b79..4cd1b960d504f 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -292,61 +292,11 @@ static int lp8860_init(struct lp8860_led *led)
 	return ret;
 }
 
-static const struct reg_default lp8860_reg_defs[] = {
-	{ LP8860_DISP_CL1_BRT_MSB, 0x00},
-	{ LP8860_DISP_CL1_BRT_LSB, 0x00},
-	{ LP8860_DISP_CL1_CURR_MSB, 0x00},
-	{ LP8860_DISP_CL1_CURR_LSB, 0x00},
-	{ LP8860_CL2_BRT_MSB, 0x00},
-	{ LP8860_CL2_BRT_LSB, 0x00},
-	{ LP8860_CL2_CURRENT, 0x00},
-	{ LP8860_CL3_BRT_MSB, 0x00},
-	{ LP8860_CL3_BRT_LSB, 0x00},
-	{ LP8860_CL3_CURRENT, 0x00},
-	{ LP8860_CL4_BRT_MSB, 0x00},
-	{ LP8860_CL4_BRT_LSB, 0x00},
-	{ LP8860_CL4_CURRENT, 0x00},
-	{ LP8860_CONFIG, 0x00},
-	{ LP8860_FAULT_CLEAR, 0x00},
-	{ LP8860_EEPROM_CNTRL, 0x80},
-	{ LP8860_EEPROM_UNLOCK, 0x00},
-};
-
 static const struct regmap_config lp8860_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 
 	.max_register = LP8860_EEPROM_UNLOCK,
-	.reg_defaults = lp8860_reg_defs,
-	.num_reg_defaults = ARRAY_SIZE(lp8860_reg_defs),
-};
-
-static const struct reg_default lp8860_eeprom_defs[] = {
-	{ LP8860_EEPROM_REG_0, 0x00 },
-	{ LP8860_EEPROM_REG_1, 0x00 },
-	{ LP8860_EEPROM_REG_2, 0x00 },
-	{ LP8860_EEPROM_REG_3, 0x00 },
-	{ LP8860_EEPROM_REG_4, 0x00 },
-	{ LP8860_EEPROM_REG_5, 0x00 },
-	{ LP8860_EEPROM_REG_6, 0x00 },
-	{ LP8860_EEPROM_REG_7, 0x00 },
-	{ LP8860_EEPROM_REG_8, 0x00 },
-	{ LP8860_EEPROM_REG_9, 0x00 },
-	{ LP8860_EEPROM_REG_10, 0x00 },
-	{ LP8860_EEPROM_REG_11, 0x00 },
-	{ LP8860_EEPROM_REG_12, 0x00 },
-	{ LP8860_EEPROM_REG_13, 0x00 },
-	{ LP8860_EEPROM_REG_14, 0x00 },
-	{ LP8860_EEPROM_REG_15, 0x00 },
-	{ LP8860_EEPROM_REG_16, 0x00 },
-	{ LP8860_EEPROM_REG_17, 0x00 },
-	{ LP8860_EEPROM_REG_18, 0x00 },
-	{ LP8860_EEPROM_REG_19, 0x00 },
-	{ LP8860_EEPROM_REG_20, 0x00 },
-	{ LP8860_EEPROM_REG_21, 0x00 },
-	{ LP8860_EEPROM_REG_22, 0x00 },
-	{ LP8860_EEPROM_REG_23, 0x00 },
-	{ LP8860_EEPROM_REG_24, 0x00 },
 };
 
 static const struct regmap_config lp8860_eeprom_regmap_config = {
@@ -354,8 +304,6 @@ static const struct regmap_config lp8860_eeprom_regmap_config = {
 	.val_bits = 8,
 
 	.max_register = LP8860_EEPROM_REG_24,
-	.reg_defaults = lp8860_eeprom_defs,
-	.num_reg_defaults = ARRAY_SIZE(lp8860_eeprom_defs),
 };
 
 static int lp8860_probe(struct i2c_client *client)
-- 
2.39.2


