Return-Path: <linux-leds+bounces-4462-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EDAA8635C
	for <lists+linux-leds@lfdr.de>; Fri, 11 Apr 2025 18:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5E101BA7449
	for <lists+linux-leds@lfdr.de>; Fri, 11 Apr 2025 16:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC98921D5AE;
	Fri, 11 Apr 2025 16:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LPuy27Sd"
X-Original-To: linux-leds@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C57E2367D9;
	Fri, 11 Apr 2025 16:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744389278; cv=none; b=WWwhtsSTwteNDKiT4fmKW9xW+qO/DHuAmAQgyIe8MdUY0K4EQr7LxtPXvub3aMm6ug1QOtTml0Mr8H+G6N2LW1ni3Z+EVqWcq83XxGnU74I7wLrn8ZX8B0no/fkRe2C0a1/6DasYfCLX+tse9WNe+dgZ0r97C4o7QHoU95xLJ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744389278; c=relaxed/simple;
	bh=bOd1S6WkB3HWgKwH+/dZwxloPfCnqa0DEn4j+PlR4es=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MUmzzSV6lGEzY3amFJvrlvWW6BOF2Xrdc6showvQuxlSa5fYUGgpFXT+v6IePn+xcc76jzufQymPFuAIqpfh7QwTeuWoH2ik2guHmhZJIh4X1cKNlfxXWMxmSyjtml/Ys9O+SVIpth4PhvhP8WobqyN/kXX/VO/lu+Qfp+dV8DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LPuy27Sd; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BGYUaR2131385
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 11:34:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744389270;
	bh=gueCorUWNnifGsIBAt1Z9xNc0USB9Zc2kP2+96PYWPg=;
	h=From:To:CC:Subject:Date;
	b=LPuy27SdMlWwA9HAnyTnokUxGJgnA9GQii2t8rx3N1kHeVtWNaGwUNaJFn1NWcRck
	 OIw7f26s5M90Ykcvv/UTagjzBCvgKkn6piojrhUCTaZSRrLhHmtvqcrUrxB34z0bDR
	 gvo3BTz7VWh4cXituCdYumtiQTj56yXrKL7VzDEg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BGYUMI012553
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 11:34:30 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 11:34:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 11:34:29 -0500
Received: from lelvsmtp6.itg.ti.com ([10.250.35.60])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BGYTYP063143;
	Fri, 11 Apr 2025 11:34:29 -0500
From: Andrew Davis <afd@ti.com>
To: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis
	<afd@ti.com>
Subject: [PATCH] leds: lp8860: Remove struct member regulator description
Date: Fri, 11 Apr 2025 11:34:28 -0500
Message-ID: <20250411163428.897582-1-afd@ti.com>
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

The device local struct regulator was removed, remove the documentation
description for the same.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504111959.7WtsLney-lkp@intel.com/
Fixes: fa604baf13ce ("leds: lp8860: Enable regulator using enable_optional helper")
Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/leds/leds-lp8860.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 7a9eb9a247ae7..86db81675e7dc 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -91,7 +91,6 @@
  * @regmap: Devices register map
  * @eeprom_regmap: EEPROM register map
  * @enable_gpio: VDDIO/EN gpio to enable communication interface
- * @regulator: LED supply regulator pointer
  */
 struct lp8860_led {
 	struct mutex lock;
-- 
2.39.2


