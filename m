Return-Path: <linux-leds+bounces-1724-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DE28D3F4C
	for <lists+linux-leds@lfdr.de>; Wed, 29 May 2024 22:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F25F2288927
	for <lists+linux-leds@lfdr.de>; Wed, 29 May 2024 20:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935751802A8;
	Wed, 29 May 2024 20:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDqD2Zlp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8E91667D5;
	Wed, 29 May 2024 20:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717013005; cv=none; b=EERHIm6uIvg/pFTKuwbcR/US0NwLHs0uPKigiocVjHA1q5ZFIle1239dMJeR/DKJRwmGBCGtGVF2qUVK5OogsCWrMc03Mm8ZLdnd0AYsnOABViIBTy2aBjAWN85mBu/RYJNvUpe1wKvq/O2A2KQ1D+SRt2YxwGiZOOvs26FvnZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717013005; c=relaxed/simple;
	bh=0e9txGHxOrzqpvlxWGC074n3+ZQ2iC9PvcvIrOrFk68=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gQyfBXUsmmNRRtpXEFzAyRjhVj6vMRqwH7JcnsYCcHaklb1mFTonz/+5lyaG88/1/VvRNhkKxfGwiPQtQ7s5bw4zceEjSUFhClFqVzZknt4SUewYhFQaKt3V19S/zb3/hRGBKl82zzqqfii9+icgYD6aAniNJqvA5E0MBGPM618=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDqD2Zlp; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2c1a99b75d8so77741a91.3;
        Wed, 29 May 2024 13:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717013003; x=1717617803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Yw+tyisOoQIVKsFGGfntBjZv+48Mnl1871MjZUM50o=;
        b=VDqD2ZlptrDQWX69TEbufjHk7oGuqiHAOCmsDz7FYijKmNGe233+0PErghRwRfEqKl
         bsM3zz3H27m8yihxH3cQzU8FBcAXWj5WbiPs8OTlQuUkKOFxZr7e1yJBDp5mbS4rYpZ+
         bVT2abDuafhpYoPKH5ymnyyWcY3iPLsH0AJDln4q3lFDZIVz5ifPuVDkMvMaocdEbe23
         8turRBez51c4Lft3GeGXVJ2EmxyeWR8eXsEtRwU4zGHhGYA0C0WCQ02/nLHWU7+jlx9Q
         45OYax2Io8Zd9R0aVRp/kp6TI335WGD5tp2yodKpjt2p97qrjrdp9vkrRjK91fNhtaQb
         IKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717013003; x=1717617803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Yw+tyisOoQIVKsFGGfntBjZv+48Mnl1871MjZUM50o=;
        b=w7noD0vARNPVloc+CsDZxcuxaeXreiPybtvLlUDvK9muyDAngcr90XyNp876linw78
         yqlZtXiojmX3FRbGr2CF6tqZnilUcS4Wrp0ztESh0Db8G/uPRV0GGHQomSeSm4SwCEE/
         txM569VCBEBx45AvxTglhSH87SpTjbC7Tch9h4PwCfCeqDUW493EFCZxMH5Y+vd0WUfB
         vABFS8NfNtkb7clNOnXhv7j11yhnctkP1yqji/rmHqWYIpflyOw4uH2FnHcVW1oUelIv
         rER5GDKinWhZ246DUgfYWnjtcmdIRpIYSrZlbXN3m4jZsCY8/tk95cxnIWjxR9jedNkS
         3XTg==
X-Forwarded-Encrypted: i=1; AJvYcCXjqV0Px4bLn0j2YaQOeezZ9o0H5P972Lc+ZxGGjKY5kFjU4l5dhng1N9qeyH31MvVMY+jC/c5e9oRQVn8bMRGkhzRjlurmOfzLDpRHNRZmcM+jc93zLguV/pYhs17D2zUeOr4BidufhA==
X-Gm-Message-State: AOJu0Yx6y41zjPomHlGC+DEtGa8SNOj0fY4i8PAlo/AGdkq6imZ2gQ2C
	vQzOz6+UKLVbmXONr4JT4F4kuW2MJC2Eoxo/H/Yckm546zvXlj55
X-Google-Smtp-Source: AGHT+IG7IdKzoHGQCcegnZ5ZEN+4I3xWMqeAiyKe7kepJv5SgpccOmkronM5R/00B3eceGnBZkfXoA==
X-Received: by 2002:a17:90b:1883:b0:2c0:1fe6:b10f with SMTP id 98e67ed59e1d1-2c1ab9d9e45mr170095a91.7.1717013003271;
        Wed, 29 May 2024 13:03:23 -0700 (PDT)
Received: from mari.. ([2804:431:cfd2:68a4:d1e5:41de:6992:6d45])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a779e835sm192127a91.48.2024.05.29.13.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 13:03:22 -0700 (PDT)
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
Subject: [PATCH v2 linux-next] leds: powernv: replace of_node_put to __free
Date: Wed, 29 May 2024 17:02:33 -0300
Message-Id: <20240529200233.1188228-1-marilene.agarcia@gmail.com>
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
Changes v2:
It was missing a blank line.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: MarileneGarcia <marilene.agarcia@gmail.com>
---
 drivers/leds/leds-powernv.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index 4f01acb75727..8f94d2efed9f 100644
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
+	struct device_node *led_node __free(device_node) =
+							of_find_node_by_path("/ibm,opal/leds");
 
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


