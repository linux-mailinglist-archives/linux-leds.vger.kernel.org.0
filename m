Return-Path: <linux-leds+bounces-3403-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2199C87F3
	for <lists+linux-leds@lfdr.de>; Thu, 14 Nov 2024 11:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73408B2544D
	for <lists+linux-leds@lfdr.de>; Thu, 14 Nov 2024 10:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BA31DE4DF;
	Thu, 14 Nov 2024 10:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="WrFg+zw1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5101F76C2
	for <linux-leds@vger.kernel.org>; Thu, 14 Nov 2024 10:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731579867; cv=none; b=P1ZPfRL6N6fWTPhX8GbImpIQ+pcI/3Y1zJU1LN8zgwKRbPidpw73JhYp6yTUsmc+AeGNNjOu7dZsdC630OIf0aMz+nZsSX6ZSG1EvXYfrdnVnn17b+wFgugaMrLCvXKAp88TLDzCJbl7zYZdQB0m132lAYM6UY+SNRIyrEAkE5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731579867; c=relaxed/simple;
	bh=687xpeUGJEdLVnXDJDz30jphuzPVzal+qNm2J6rqObk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QRKhT+VBmZP6srKWfySjJw0KryGLqmx2sa3A0hA6uqhsMrZbuNAPAwbF09LvdTef42RVRMo0f/Qf/IrRSWsG3uSNb7JxjpoGkfsgRBe6f8c+BoEOdadvJ7R/XjCVf5MtrG7Qa9PCdxRBdMnHsKoMwq2DQRXeb3NMTI+SnLSdWEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=WrFg+zw1; arc=none smtp.client-ip=185.136.64.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20241114101413c528fd4d0b5b8624e2
        for <linux-leds@vger.kernel.org>;
        Thu, 14 Nov 2024 11:14:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=VE9hYTociBf8ZRiio0kTSwD9q1GDVXYKjidfYnajdcQ=;
 b=WrFg+zw13YIAjDzQ0ei/3KaRAlicoMwHI61Emppa6sd/3iOPAkfb/xjg2DXFKA5x2tyABd
 3w6nLrLvjMr++eyB2KlcVlr7y651jZtQMU4blZA/cGIsdjzFXXyEIYc0PX56nh7o8aAG0tMj
 XNu9bD2CobdCT1akFciX3g3hI/wB3viYUW4TTwaEfflq0TiW27LBcILa5oQ5NSK5Q3uAnIQZ
 kP8IhU1NVf794vWc2afHnSPYlHPZslmXvQ/BGsF3iAbtZW1iNK0LHzJl1a0RzNZdEI63AhFm
 mP9z0Bq6mKmRW5k8X8MOuKVwBBPHmWaLoJ3ExCatDaHK6auixz3vc2AQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-leds@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Dan Murphy <dmurphy@ti.com>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] leds: lp8860: Write full EEPROM, not only half of it
Date: Thu, 14 Nov 2024 11:13:59 +0100
Message-ID: <20241114101402.2562878-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

I struggle to explain dividing an ARRAY_SIZE() by the size of an element
once again. As the latter equals to 2, only the half of EEPROM was ever
written. Drop the unexplainable division and write full ARRAY_SIZE().

Cc: stable@vger.kernel.org
Fixes: 7a8685accb95 ("leds: lp8860: Introduce TI lp8860 4 channel LED driver")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
This is based on code review only, I don't have LP8860 to test.

 drivers/leds/leds-lp8860.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 7a136fd817206..06196d851ade7 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -265,7 +265,7 @@ static int lp8860_init(struct lp8860_led *led)
 		goto out;
 	}
 
-	reg_count = ARRAY_SIZE(lp8860_eeprom_disp_regs) / sizeof(lp8860_eeprom_disp_regs[0]);
+	reg_count = ARRAY_SIZE(lp8860_eeprom_disp_regs);
 	for (i = 0; i < reg_count; i++) {
 		ret = regmap_write(led->eeprom_regmap,
 				lp8860_eeprom_disp_regs[i].reg,
-- 
2.47.0


