Return-Path: <linux-leds+bounces-2270-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9372892F328
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jul 2024 02:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C29D1F22DFE
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jul 2024 00:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E11E10E3;
	Fri, 12 Jul 2024 00:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIY0bga0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D954623;
	Fri, 12 Jul 2024 00:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720745168; cv=none; b=MMOIhe0riD2WVZDvPBThJeJM3izOKQFBDsl6NM1BVghjSVH8Lse+qS5uJuRmZrMMorWtZ/YiRtevdZ7GaLc0JMfgxKjawUytU2YFqBDRyAHHH32AZIdZeS+5H/dAcl2p6munadfIXUpZQFi1bWytfDAGaZO1CCXo+2t8a2xS+yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720745168; c=relaxed/simple;
	bh=KzZP+IP0/ujONvqdTd3ry8tBG8tlrNCjztBdGudh+ek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aC2927L7wiQn1xxYJsvPvIytdmQenNlVRg20HrtHU7dnfNIYnY62OC+4M/UkOamyZTX6+4QurRrZU4/qu2oQJsD3exFCmYm10yHOQPxXsbVsjcMh83z+ApcgXSas66n3C+ZdZvv9P2v/u2en+2CKl0aGFZF/U9oBKgl0UpJrVsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIY0bga0; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3679f806223so1524669f8f.0;
        Thu, 11 Jul 2024 17:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720745165; x=1721349965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=srTz3o625QfiqUPJlQXV/25isfnbH1i5B1z3kNATQww=;
        b=CIY0bga0ykvxXVHyZ5dYKRtNvdlSAxn08SHxBA7ORnya+LsP8uQ/1M7q4ZY0Tghpjy
         TAiMneoLeJ0YE8BCbLPxFAsg3VnvImEhdhVuGtWq3QuijzNGe20eC1ihfTHGcmvp2EJH
         plWucliDLVH3RqKQskCOGUP7NXnqdjGBjjO92ufaoFe0MX/GW08XTHb92PiIujYkGUVj
         dwNyrBfbKDAQYyNuleyWNk93nG5AEnwZaCGriSAxYY6PtKmHidkUHnt24+1nLTyBD2Z7
         q+o599OhlgkB47q/+51geNVnmR3oX8Dr+fcAoSPFVOCMvbc/VBwAiq6jYfrcsjhzorQv
         0pAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720745165; x=1721349965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srTz3o625QfiqUPJlQXV/25isfnbH1i5B1z3kNATQww=;
        b=BQ6/jPCLVJOv1qEoYYdKGJzMGKrtxzuvXorf1Luflt1doQQzOVG7mDlooNDqgYDZdy
         ubGJrPtR4F6yFMGlLE0nQc+uOOvjkDG95VM+J7j+R2g8Xbs+zSdakogkEwE9DOBzZ/fQ
         puDOImSKYF+L9Ec2cwxEYQrU+SHOT9UF8jwPcPPZHAqpKgdMENz8aoon9s/fS41DRoOC
         JfUXzJOsm8RXYsLKhPk6CGaugFg1PsQgSMydy0qz3XB8+lg04HbAXlMXhyHu/V6DNSG+
         od1n+DneJ+Wnj7Uz2bAEi40M543unYmZRBX+iwx5KUaH6baL25hUa7fxAN8SbwkHB8mu
         N1mA==
X-Forwarded-Encrypted: i=1; AJvYcCUhrATQ9Xqv08YvxEpBHrWPV4M8FKIDtDXiLoxBDZmFvGtgu8uaenohu3XVBzhkS/97/tvFG1ZD7JEqXVycaoeW6k6bWJWETKGoKUSn6LkJFb34Hmkic1QnO31m9xvoG7CdaCCqIPz0wQ==
X-Gm-Message-State: AOJu0YzWLMnunI3PmmU5/xm4+XDF6icUv28eQX9/UzYrEEyFGBwtISN0
	zK6BSqNpdc5Cone9gSHKLUQLgjcZnxIBpwnhCvnudHIZZ5dLZ63i
X-Google-Smtp-Source: AGHT+IEK5eRid0sMjyu6PA+Zoi61j3HSdyS8dCIpEB3PJZ9Plc2EqHC/oQkdIkgsn3Pk+SF4YLkzyA==
X-Received: by 2002:a5d:64a7:0:b0:363:ac4d:c44f with SMTP id ffacd0b85a97d-36804ec285cmr176503f8f.17.1720745164654;
        Thu, 11 Jul 2024 17:46:04 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-367f1990dd5sm3118803f8f.105.2024.07.11.17.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 17:46:04 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 1/3] leds: leds-lp5569: Fix typo in driver name
Date: Fri, 12 Jul 2024 02:45:52 +0200
Message-ID: <20240712004556.15601-1-ansuelsmth@gmail.com>
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


