Return-Path: <linux-leds+bounces-2182-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED2C926D3C
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 03:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F9181C21117
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 01:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46C9D2FF;
	Thu,  4 Jul 2024 01:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fo63H/SI"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AF4C2FD;
	Thu,  4 Jul 2024 01:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720058156; cv=none; b=aN8VkWkmrilBFvP1Sf+zipYIorhOygPDyA2hXEqAAFobO4SGn6SlG18rAu+g2AXiKv4+foZ3FNQLPCDfAE2baYKbfD5OxJo3nxddXY3y/GhBMPFIEvFiAWXXgWI+yatuoE9ry4ND95AqWXTBy5Ste4iw3LVobXCM2JHgy4OA2tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720058156; c=relaxed/simple;
	bh=KzZP+IP0/ujONvqdTd3ry8tBG8tlrNCjztBdGudh+ek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KGpwtORu9/0o509vfPL9ILKtXYG4b0Sl4tY46Pa+myKHvcJ+th68gI/C/8VgbuoOh3foZPvEDi5UFQGrw6iI6xhzSqGOmHAm6hUA4zv/9AfwQ9Wd8oGBT7e3CPIGHmYIT/JIWjgqmg1s35Rx15KhLLR4MagEcd7wl7u3rQObh8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fo63H/SI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-36796d2e5a9so97010f8f.3;
        Wed, 03 Jul 2024 18:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720058153; x=1720662953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=srTz3o625QfiqUPJlQXV/25isfnbH1i5B1z3kNATQww=;
        b=fo63H/SIZSqXCXSQ0I0Jq26B//FujwlPGVu1hREv7F5s1o8KGuzSZGl6NsSAjch5Yz
         Ow3ya618W4qT2nLzvcMihz4Ex58Iv+54T8B8eBINF9/fQKCSUtt7M/RXa4gGLtn7TdSO
         cy1pphBOQDhqdvc4MGIPEUrkufQsyqcUvb3AfEi53fOiH5Y+SyGsaIr3KKziXACIHOrs
         g0s3QqB9ul9ep2rTyUzjAGW9ysVs6x1+hvQ08GyaaO5Xp7Zpy13LVoXpXJkEHO9oufIq
         62Nzocmvz2NArZ5xSKUM+PZtEXGysBstwm3QR7jQ2hXw5FXKctdK1LiLNqPS/gfCkhQQ
         8t8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720058153; x=1720662953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srTz3o625QfiqUPJlQXV/25isfnbH1i5B1z3kNATQww=;
        b=W7lhKg6tHr003VOKs3tSak3YrN9hJA10tMB0Ffx2LG6Pgito82Q1vW8u7XSFxmD+VM
         Y3KDkSQmjtIhi7Mr5jnkaurzwTOT7gMvTaWXqjwZTjQ1gfroQHnOqQ5O0n0fGTs9Vgfl
         XtLQCbCzCJFbByx58ltcDR/xrJ4yGEdhgrB0SO4rpDmY2utT2FUfxOhLSkVU2BgqBVIY
         1aieSgvrHp9IwiN0N0aHVdzi2qWjMqqR5gMZodQ19iJfbBCJ4rJm9+TwXX349oCDL081
         W95JT7Pc0SV8Eak6Hkg4sW0LUbnd72uCXaVrskiFCYCCkpUJtwdPp4xpIaireS/a4rID
         m0bA==
X-Forwarded-Encrypted: i=1; AJvYcCVrOtHjKBjgC86suWms2dee/EanW5vdkUTHHT0PbUzTVvKK0sfp5UiEOKc5+Fbwz5Es0IGSoP9cQ3lupRFYD2m1jWlGHF/vjMeR2fflbLzcHG2kMmNZYPRGqeC/qJXpjbqdP5tEgCmbvg==
X-Gm-Message-State: AOJu0Ywtzf14KX81hIJ0eSdu4C67XQJiXPH2PhauWVK/mdugBWgEEMNk
	bL/5Lmv5bRdmxn0oFpD8RuwnqOAn0dFrKNDYTw5wZDrk154/7FMK
X-Google-Smtp-Source: AGHT+IFT7P0G3uGzZ5VNuv4W36ovoyJ0MmwkxGS8IeA/SQVAQGxeDBhvabTbh/FxSsb0w9vhjQjO6w==
X-Received: by 2002:a5d:5712:0:b0:367:94e7:958a with SMTP id ffacd0b85a97d-3679dd17ec1mr247432f8f.6.1720058153130;
        Wed, 03 Jul 2024 18:55:53 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3679744be1fsm1976329f8f.2.2024.07.03.18.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 18:55:52 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/3] leds: leds-lp5569: Fix typo in driver name
Date: Thu,  4 Jul 2024 03:55:40 +0200
Message-ID: <20240704015543.14495-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove extra x from driver name as this was a typo from copy-paste
error.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5569.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp5569.c b/drivers/leds/leds-lp5569.c
index 7ccd8dd6026a..b7a74d6c19ca 100644
--- a/drivers/leds/leds-lp5569.c
+++ b/drivers/leds/leds-lp5569.c
@@ -529,7 +529,7 @@ MODULE_DEVICE_TABLE(of, of_lp5569_leds_match);
 
 static struct i2c_driver lp5569_driver = {
 	.driver = {
-		.name	= "lp5569x",
+		.name	= "lp5569",
 		.of_match_table = of_lp5569_leds_match,
 	},
 	.probe		= lp55xx_probe,
-- 
2.45.2


