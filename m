Return-Path: <linux-leds+bounces-1799-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 424078D6DA8
	for <lists+linux-leds@lfdr.de>; Sat,  1 Jun 2024 05:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF1931F2369C
	for <lists+linux-leds@lfdr.de>; Sat,  1 Jun 2024 03:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BB53C3C;
	Sat,  1 Jun 2024 03:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAGATq3+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9DFE545;
	Sat,  1 Jun 2024 03:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717211880; cv=none; b=lsWzG/OQ6zHEEvc7PCLLvU5POFtZt2w38ucEIr/KqcQHro30GLLPdhZlLSUzmKGNSGYmx8PoftRacpNGfEw2x87EfxBrX6cLFz+83ZORGZVNwB8Qd1luh0jYdj2mt5u+m3PKOmlw4g3Vi4f77mc/nE1hh8j3T4saiusKed05KU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717211880; c=relaxed/simple;
	bh=f7UienCm53Hpa9ZLxEj8dSMCv3Z3599mtPNWhvbU5jk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nsWHrT4CD/sD2Kkb4ReYzwALANBn+aaDrFb+SkQxqQbi7oypVrfhumj6gkhQBgZF7UzoVcXTZV8GGvQk0ljPlBulFb6DcgnCf8Gh4jjmS9S9c9k5G/RKaTl8ELBaxW7wa00PzVlGluMW6Z30WEmG3S9+yW5/ChH79r45rh/MfWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAGATq3+; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f4a0050b9aso14015235ad.2;
        Fri, 31 May 2024 20:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717211878; x=1717816678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dJ7GhnPCcc9gG/fPcfKm9hLymSev1LXbQ1e2VPy6a/o=;
        b=JAGATq3+yuF+GtEOPa0BMxiN0LxcPhwNUN+GDyv6JEfhUjRuIfhcwClbazER8SiDbi
         knkdKMq5Tdgy0fhyZkBrjiEzHNaPRl0ocqga1G4IJHf5/y/IWZlom+9i4CI2A6CQ7oxs
         P/DJjOtahGG8yaKPenm78St+cmtmRbEqSsXQu2EXUgfW3MN4huWB7/AjZNKhgyd1aG7Q
         AmE57yifleyHlgI6LR6xXN1z8e1XXsh4kMN7SXYSUg/DV+Bmb1DlI2l5MYcCKyW6tNnB
         EAFkPNkNCWMr0G8EZvv/3SdiEPJ7X4WByiJmaRS0r6VUqbCzJKYbPXF1ZkMxVxLZyvab
         px9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717211878; x=1717816678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJ7GhnPCcc9gG/fPcfKm9hLymSev1LXbQ1e2VPy6a/o=;
        b=hpJ6RavG2vNHgNrrYMU3kBbEpulPKg57GgxmsQjuj60HFt0UerneWzfN0b7dm+66w/
         bw/dh8qGAvkinDItCO7ljBjDUFK/Rw6QOqX6p04ziJL+yltZk717lhuHvth7KE23SDvm
         tbhc8waWt2B3UZjAjoEBxipERgB9kG/fwsweFakrPMy+w7TUDQrCCvF0AeR1cPjN5HLU
         K8jy+xZ6yy5/I71mHPX4H6j6p+Fz5I9s7TLswRTIcQCFYvtluUDqFvhW3/trQ3l9mue5
         7WthLIu6rxS6kv1y0qX3A6R4GOQvy0pARBi7ebr99afGv7Zzs9Wv91XhOx/gYWpriC+3
         +veg==
X-Forwarded-Encrypted: i=1; AJvYcCXc/rXdrn9m5kdzoX6246VzFMUfzLEm8q4h0wpVo0flBMZXpg4qnPYq2MYP1FOGT4x6adqEDhDAhT/DCuoSggHZQa75U67qneRe2B1daM47Qo6fb3g/LlD3VMSoD66FWoqALpwS8d4pRw==
X-Gm-Message-State: AOJu0YxN+e0OGC+9QVPuxlEsrDp9MM6qhI9JlJHTO2QLltOYZ+lF3HHQ
	ZDj1Ag8FRm9I5BchmD7vW6t9kDBsL+0R8lZextmObu9RDPMAZixE
X-Google-Smtp-Source: AGHT+IG5jigN++TXRW2Q8TJE0q8aUmrnSUVxfazFZCGbU4Se+asZ6b1Uehd1zrHky24bXUiclsr+ZA==
X-Received: by 2002:a17:902:cec4:b0:1f3:1ca5:9166 with SMTP id d9443c01a7336-1f6370ad6aamr39927445ad.61.1717211877781;
        Fri, 31 May 2024 20:17:57 -0700 (PDT)
Received: from mari.. ([2804:431:cfd2:68a4:85cb:da60:5688:b292])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323e18c7sm23531825ad.177.2024.05.31.20.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 20:17:57 -0700 (PDT)
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
Subject: [PATCH v3 linux-next] leds: powernv: replace of_node_put to __free
Date: Sat,  1 Jun 2024 00:17:13 -0300
Message-Id: <20240601031713.1307859-1-marilene.agarcia@gmail.com>
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
Hello, 
Thank you for the feedback.

The line-break strategy was fixed, and now it is according to
the top one suggested.

The __free is a wrapper to __attribute__((__cleanup__())) so 
the variavel definition is needed. And according to Julia, it 
is preferred to combine the declaration and the allocation to 
ensure that there is no return that can occur after the declaration, 
but before the allocation (or more precisely the initialization).  
If there is no other option for the initialization of the variable, 
then it should be NULL.

 drivers/leds/leds-powernv.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index 4f01acb75727..49ab8c9a3f29 100644
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
 
@@ -278,12 +274,11 @@ static int powernv_led_classdev(struct platform_device *pdev,
 /* Platform driver probe */
 static int powernv_led_probe(struct platform_device *pdev)
 {
-	struct device_node *led_node;
 	struct powernv_led_common *powernv_led_common;
 	struct device *dev = &pdev->dev;
-	int rc;
+	struct device_node *led_node
+		__free(device_node) = of_find_node_by_path("/ibm,opal/leds");
 
-	led_node = of_find_node_by_path("/ibm,opal/leds");
 	if (!led_node) {
 		dev_err(dev, "%s: LED parent device node not found\n",
 			__func__);
@@ -292,20 +287,15 @@ static int powernv_led_probe(struct platform_device *pdev)
 
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


