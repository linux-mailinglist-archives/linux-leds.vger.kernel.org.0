Return-Path: <linux-leds+bounces-4463-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ABBA865B6
	for <lists+linux-leds@lfdr.de>; Fri, 11 Apr 2025 20:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDE424C1A34
	for <lists+linux-leds@lfdr.de>; Fri, 11 Apr 2025 18:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A8E258CF9;
	Fri, 11 Apr 2025 18:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lAg4Q++r"
X-Original-To: linux-leds@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279761F8BD6;
	Fri, 11 Apr 2025 18:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744397238; cv=none; b=Adn7fampoXy1qbZghAUchsMxPBdCXkSncIoc0Sc+/KRhpgCbcg+r8Y4cja1223lpiQyBKfktrXLuEbBrW/NuY1I0pMGMcrGEc8TK0rpgmb2AWSz4WCvAIDcRYKNXzPy/Fr0N8AzCBcve38MD/sEq27Sttp7QmFFm8Zlj4d3IJDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744397238; c=relaxed/simple;
	bh=m8+FvkGK8eq6Sm6bej9HXrL0QnHYqpFeZTXlisuMCaY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Lwob4WzpPTuI4r/M6JqzG37s4M+jNsuM8gSKBXH7i6EeqpkjoyBM/U48FTePWXVvb9S3+HTCX36+o1nLlvLIWIEmusqawUMDzUf1AhhrJmQ3IOWYadcHjv786GUiBGHtTYfhXc+h0aaCpP99U82a3Z4pngZvbgdXuMhqFKx46S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lAg4Q++r; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BIlAhM2156301
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 13:47:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744397230;
	bh=tQs6curIUMSHahRCwPQoBo3VpyoTTj4A62smX91vWus=;
	h=From:To:CC:Subject:Date;
	b=lAg4Q++rgTaeLxF/EF3nGx5TtHKF4+fqkfgF0QGZH8zxH48LIKGwZw/Ep9juOSouW
	 MlRSTvnjPRLk5RFm2HQGdsuHvneJr2LfvMcBS/whG1Oyy/+zAbnX3a6fRztoO+sOkw
	 ERo8aTz1VlH9Ct+gt8vqQWOdNhHxZsqK5gzf0Bvw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BIlAV1008206
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 13:47:10 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 13:47:10 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 13:47:10 -0500
Received: from lelvsmtp5.itg.ti.com ([10.250.35.60])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BIl9IQ107961;
	Fri, 11 Apr 2025 13:47:09 -0500
From: Andrew Davis <afd@ti.com>
To: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis
	<afd@ti.com>
Subject: [PATCH] leds: lp8860: Remove struct member enable_gpio description
Date: Fri, 11 Apr 2025 13:47:08 -0500
Message-ID: <20250411184708.990645-1-afd@ti.com>
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

The device local struct gpio_desc was removed, remove the documentation
description for the same.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504112024.AFtTNUuX-lkp@intel.com/
Fixes: 35863236d7b2 ("leds: lp8860: Disable GPIO with devm action")
Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/leds/leds-lp8860.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 86db81675e7dc..52b97c9f2a035 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -90,7 +90,6 @@
  * @led_dev: led class device pointer
  * @regmap: Devices register map
  * @eeprom_regmap: EEPROM register map
- * @enable_gpio: VDDIO/EN gpio to enable communication interface
  */
 struct lp8860_led {
 	struct mutex lock;
-- 
2.39.2


