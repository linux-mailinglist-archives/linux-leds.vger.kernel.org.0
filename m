Return-Path: <linux-leds+bounces-1723-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4078D3F22
	for <lists+linux-leds@lfdr.de>; Wed, 29 May 2024 21:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22BFAB21972
	for <lists+linux-leds@lfdr.de>; Wed, 29 May 2024 19:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B331C2333;
	Wed, 29 May 2024 19:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0xZvn+S"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D702522A;
	Wed, 29 May 2024 19:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717012518; cv=none; b=X2dpG0e323ywms2c2KlEBl8TJRa1UDsqw0ffrscnFVDgcGLnZD2dZ4YNr1abBEw1lsAkcijqR0IwVzelFlipNM6B0K+WE6SIvHDJKgSqNjQkH1L0jeTWx7fZP38tJH0K/iI2JhcXyQMTsv7HqJOb2cG8dCY7C7RuKvJXPIBhLvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717012518; c=relaxed/simple;
	bh=TzClWeB0xIsFlkX+WZ+EHq2q//G+bBcNAWNro8D7QKs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tWTBS+oMxjKpfLq2p/YA67zrU2rg/7iB8b27tNTQFvdKdIvdi7kkqpddvjeYSaF9DJtpl6Rt3rwolE1qXQEE2jjS1FEsLQdJkcA/zNH74VJTEwrQl7GAPAqx91XM+Kds3z3hC8L+N0fLMQ8e1tL5Xem1DTjoGMzIK3QcYA5SMJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0xZvn+S; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f47784a2adso1156625ad.1;
        Wed, 29 May 2024 12:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717012516; x=1717617316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SeUDyLz07Yf4A3ibn/qcJdcShL7dSWLOCdG8yEpv21E=;
        b=K0xZvn+SWNSFRiOXzV98+W2euSJmOXMuCgeo/NM25b7XJdjIINcq+8H2MLtkw6fVHF
         fkj2jpDShrtEQcDxVLDyNEQRGdw3WbsSJsb/fLNojVIkYR2yCCG9Z45HC/wYwtFgIM//
         62EnGxmIAjXHN8sHPbztIXfMDR5TKGDsNJ3QQMKnGP++PSYoMcWMCBH84Z/RxFv5ftW8
         gbn4aXD4hoyEMfuiWrE+O2wwH7Rprcmn2MpeOhKefAKSmj746zWPL20oxP3lwfgIwCRs
         Y33LHdW0Gyo85OTZmDpXRtPon5O9dKLQIjqBmcOZJMfF4r03ZMoY8lyV+MCa0HXkVXGq
         TJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717012516; x=1717617316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SeUDyLz07Yf4A3ibn/qcJdcShL7dSWLOCdG8yEpv21E=;
        b=BwwAS+A7PWNHm7TUyaRbB1Ao81oZcD3i6sO31I55M2euvYfVMxnVWprYEqk0CjUR3T
         uDJyF1QVRGMfecv+WADe4e9YEXaH7IQxX0sY3KjDRwjxUdTvBbS2KCdzldM9jNw/sBed
         zs+Heo3vyvO0spaA11RkSx7pKckbOtw/X+aqxdux9UL6EWW6AJl9A0VH9KPusYQqQlKL
         BTIaETHeKMLJc9za3fwMZJf2tpqx30e6QdCm90p3GahtBOmMxvo0nzXUVYXQWFk/oX5V
         gRjhH9TAIMrtaMRriVmcyIYR6KXopSDJHOp9orSZxT4T8TP0eKTUAtKg/A+nv3ye/NEz
         eU4w==
X-Forwarded-Encrypted: i=1; AJvYcCX2F/UUIHcnvoR/MP9RadBI9hOVzQ5Wrf5c9lLpZI9ksKjtbgQvKxjwC0/apCsqp1IVw5dQ+yY1rfCTHVe3S4Z0SCs3KbQMEfZn9q9lCBAkNFAphilp1FJh6Fjcig9EetBId3OOpKuzww==
X-Gm-Message-State: AOJu0YyOFvdhm0pZQtXzSgf39FXVjyFEaDj0PGz0y7I2Ev3xOcIvLVli
	I/6D48uUrOckFkcmE5a6v6b1NU5kJYlPP4cf7N+V5mDr4VG/xdlY
X-Google-Smtp-Source: AGHT+IHhMDqWPEjxt7r+Lc3nVAdOtTDOEBn2i6vof9omWzEupAsWiqDbTT3kDVtrCqWogGRWHq5S4A==
X-Received: by 2002:a17:903:184:b0:1f4:8bb7:6842 with SMTP id d9443c01a7336-1f6193faa4bmr422435ad.8.1717012516258;
        Wed, 29 May 2024 12:55:16 -0700 (PDT)
Received: from mari.. ([2804:431:cfd2:68a4:d1e5:41de:6992:6d45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9684bfsm103990195ad.140.2024.05.29.12.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 12:55:15 -0700 (PDT)
From: MarileneGarcia <marilene.agarcia@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Julia Lawall <julia.lawall@inria.fr>
Cc: MarileneGarcia <marilene.agarcia@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-leds@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: powernv: replace of_node_put to __free
Date: Wed, 29 May 2024 16:53:54 -0300
Message-Id: <20240529195354.1187882-1-marilene.agarcia@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use __free for device_node values, and thus drop calls to
of_node_put.

The variable attribute __free adds a scope based cleanup to
the device node. The goal is to reduce memory management issues
in the kernel code.

The of_node_put calls were removed, and the
for_each_available_child_of_node was replaced to the equivalent
for_each_available_child_of_node_scoped which use the __free.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: MarileneGarcia <marilene.agarcia@gmail.com>
---
Changes:
These changes intend to add the new __free cleanup handler 
to device_node initialisations, which ensures that the resource is 
freed as soon as the variable goes out of scope. Thus removing the 
need to manually free up the resource using of_node_put

Thank you.

 drivers/leds/leds-powernv.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index 4f01acb75727..68fe47cd1a4f 100644
--- a/drivers/leds/leds-powernv.c
+++ b/drivers/leds/leds-powernv.c
@@ -246,29 +246,25 @@ static int powernv_led_classdev(struct platform_device *pdev,
 	const char *cur = NULL;
 	int rc = -1;
 	struct property *p;
-	struct device_node *np;
 	struct powernv_led_data *powernv_led;
 	struct device *dev = &pdev->dev;
 
-	for_each_available_child_of_node(led_node, np) {
+	for_each_available_child_of_node_scoped(led_node, np) {
 		p = of_find_property(np, "led-types", NULL);
 
 		while ((cur = of_prop_next_string(p, cur)) != NULL) {
 			powernv_led = devm_kzalloc(dev, sizeof(*powernv_led),
 						   GFP_KERNEL);
-			if (!powernv_led) {
-				of_node_put(np);
+			if (!powernv_led)
 				return -ENOMEM;
-			}
 
 			powernv_led->common = powernv_led_common;
 			powernv_led->loc_code = (char *)np->name;
 
 			rc = powernv_led_create(dev, powernv_led, cur);
-			if (rc) {
-				of_node_put(np);
+			if (rc)
 				return rc;
-			}
+
 		} /* while end */
 	}
 
@@ -278,12 +274,10 @@ static int powernv_led_classdev(struct platform_device *pdev,
 /* Platform driver probe */
 static int powernv_led_probe(struct platform_device *pdev)
 {
-	struct device_node *led_node;
 	struct powernv_led_common *powernv_led_common;
 	struct device *dev = &pdev->dev;
-	int rc;
-
-	led_node = of_find_node_by_path("/ibm,opal/leds");
+	struct device_node *led_node __free(device_node) =
+							of_find_node_by_path("/ibm,opal/leds");
 	if (!led_node) {
 		dev_err(dev, "%s: LED parent device node not found\n",
 			__func__);
@@ -292,20 +286,15 @@ static int powernv_led_probe(struct platform_device *pdev)
 
 	powernv_led_common = devm_kzalloc(dev, sizeof(*powernv_led_common),
 					  GFP_KERNEL);
-	if (!powernv_led_common) {
-		rc = -ENOMEM;
-		goto out;
-	}
+	if (!powernv_led_common)
+		return -ENOMEM;
 
 	mutex_init(&powernv_led_common->lock);
 	powernv_led_common->max_led_type = cpu_to_be64(OPAL_SLOT_LED_TYPE_MAX);
 
 	platform_set_drvdata(pdev, powernv_led_common);
 
-	rc = powernv_led_classdev(pdev, led_node, powernv_led_common);
-out:
-	of_node_put(led_node);
-	return rc;
+	return powernv_led_classdev(pdev, led_node, powernv_led_common);
 }
 
 /* Platform driver remove */
-- 
2.34.1


