Return-Path: <linux-leds+bounces-1869-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2AA902D7A
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2024 02:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EA85283C64
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2024 00:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215E764C;
	Tue, 11 Jun 2024 00:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFY/djF6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35C5816;
	Tue, 11 Jun 2024 00:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718065109; cv=none; b=PDkL6gYph2la4IG/gM+N8T/qjdRTxVU4f/JeMEI9YmbDwe3h3gYMW4ROZ81QrG07L+/djsszCU8zq8oTdXVrN6R/Pc6BqpyaTlefM8wTOK906FsaiCJe+EsPHTRA//06kAysd1Lisf/jsR8GfsY7zXRlzp+opAtGdmWY4er3Od4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718065109; c=relaxed/simple;
	bh=nMrmdxH2krB9TNtdBkPh3f0n33LvkwFYa6vLckHWB6g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DoAHpU9xABVdG9/advCF80VZNUT153Yd17escALdZjdInaUmwq5jWgcvMAghU12evf5CRrX20OTRRgOuc6/3afiFxBtpVX9PvJEYwGTvrxqJBwuCT++wbT6JxBok8qDi0Ikndn5/3mmRXPBChOL63y04GtSvIeDE1aouAJs/AxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFY/djF6; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2c2c9199568so2749315a91.0;
        Mon, 10 Jun 2024 17:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718065107; x=1718669907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7fSYaAf9r3FBONbZVYpTG+GGCmR1/EAf+YALJ9whtTk=;
        b=HFY/djF69zWZmKEPs877Gzh2aPa1g/nBLVr/dXPKsN6jRUnHB3LMTBF0h5Iwodhr7c
         PLWWVToS3lLJ/l1ZH2bu1q6gaTNABP6OPM08L6eZxu0Ki0fzIblKUJROT3GqsCoPuB10
         iapKjEPgQpys3WpBXaVLO2FR43iZrT+OM8NHEtyv+gojQuzDfINYWsRx/m+BHqoZqgOw
         SFHz80dxkzsocqddR5vWOTw7mV8THru2Lc9uufEUU8H0LYfksnjqi545VF56qlgrAgAQ
         MIRypYYFtwzjp3eSDQp+X8fb0p/mUzVx0PTi5yAHRbcl2yY3TWxtJaDQDafBqtPF7YNa
         yJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718065107; x=1718669907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fSYaAf9r3FBONbZVYpTG+GGCmR1/EAf+YALJ9whtTk=;
        b=Fulhr+QXef75D3LBt6G16B3RnfVD0YIAM+kQGB1sUi8CFQBWtnrHQOeOQ0vjXV3PKV
         LQI6e2sNPoHikquYp/CFA8zDIyZ0PcZFyTLBAPGAXslHWOXMASuiVSBfQdSvrdUjinlO
         RVZRf8jT+4oT9UdJaQEZijtHqOSx45SOcYvKf5pJU9G1k3tPo82H3HIC3c5ldblmc0d0
         Fig7VJUeHwWh6uehe2wnEshWjNEsjrdgPTRVxvv4vwn7WQXuEcHBYVMb1o2axJxavg3k
         K2mJyQFaqEDwRyf+ihJFKk2rA1EDBd71LgQAmFIH3GAj5A5fkWugEXvj6vpG8YB0e6A8
         lVHg==
X-Forwarded-Encrypted: i=1; AJvYcCVUIJGwP6XpbE4R66n99N/MsenQ5Y+hnqZ1ZFtEn15wDuDT6vkjC2x/Xz5qheE2PbI7a442/8gWfaiq07UnuAlzNclQLktaAEvfZ7gapAe0pZSwb9Hq9mCK3/ePadSiqji8QssRq9Lnuw==
X-Gm-Message-State: AOJu0YxoFOQNByEFbKkbdl7e+gAQtxBWzIzFvTGyxRRE66UvduXZkJBE
	cqRp1RLknHogbN/7iAiS38BEOHRF9fUGCkGHtfh46PdAs5ygJXBT
X-Google-Smtp-Source: AGHT+IFrBqNcje/3jAquFBaQ9JR15hWOcJpeEYREpF3zM173bx+0pTRw68iouNl4w0H0l0uNQC3leg==
X-Received: by 2002:a17:90a:688d:b0:2c3:725:a376 with SMTP id 98e67ed59e1d1-2c30725a46emr3950743a91.11.1718065106725;
        Mon, 10 Jun 2024 17:18:26 -0700 (PDT)
Received: from mari.. ([2804:431:cfd3:42f5:c7f2:2bf:5df8:1d46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2e638edfesm5141526a91.26.2024.06.10.17.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 17:18:26 -0700 (PDT)
From: Marilene A Garcia <marilene.agarcia@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Julia Lawall <julia.lawall@inria.fr>
Cc: Marilene A Garcia <marilene.agarcia@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH linux-next] leds: tlc591xx: Replace of_node_put to __free
Date: Mon, 10 Jun 2024 21:17:40 -0300
Message-Id: <20240611001740.10490-1-marilene.agarcia@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use __free() for device_node values, and thus drop calls to
of_node_put().

The variable attribute __free() adds a scope based cleanup to
the device node. The goal is to reduce memory management issues
in the kernel code.

The for_each_available_child_of_node() was replaced to the equivalent 
for_each_available_child_of_node_scoped() which uses the __free().

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Marilene A Garcia <marilene.agarcia@gmail.com>
---
Hello,
These are the changes related to adding the new __free cleanup 
in the tlc591xx led driver.

Thank you.

 drivers/leds/leds-tlc591xx.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index 945e831ef4ac..6605e08a042a 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -146,7 +146,7 @@ MODULE_DEVICE_TABLE(of, of_tlc591xx_leds_match);
 static int
 tlc591xx_probe(struct i2c_client *client)
 {
-	struct device_node *np, *child;
+	struct device_node *np;
 	struct device *dev = &client->dev;
 	const struct tlc591xx *tlc591xx;
 	struct tlc591xx_priv *priv;
@@ -182,22 +182,20 @@ tlc591xx_probe(struct i2c_client *client)
 	if (err < 0)
 		return err;
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		struct tlc591xx_led *led;
 		struct led_init_data init_data = {};
 
 		init_data.fwnode = of_fwnode_handle(child);
 
 		err = of_property_read_u32(child, "reg", &reg);
-		if (err) {
-			of_node_put(child);
+		if (err)
 			return err;
-		}
+
 		if (reg < 0 || reg >= tlc591xx->max_leds ||
-		    priv->leds[reg].active) {
-			of_node_put(child);
+		    priv->leds[reg].active)
 			return -EINVAL;
-		}
+
 		led = &priv->leds[reg];
 
 		led->active = true;
@@ -207,12 +205,10 @@ tlc591xx_probe(struct i2c_client *client)
 		led->ldev.max_brightness = TLC591XX_MAX_BRIGHTNESS;
 		err = devm_led_classdev_register_ext(dev, &led->ldev,
 						     &init_data);
-		if (err < 0) {
-			of_node_put(child);
+		if (err < 0)
 			return dev_err_probe(dev, err,
 					     "couldn't register LED %s\n",
 					     led->ldev.name);
-		}
 	}
 	return 0;
 }
-- 
2.34.1


