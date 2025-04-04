Return-Path: <linux-leds+bounces-4406-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BA6A7C34D
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 20:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA5A716A9B1
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 18:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF321E1DE5;
	Fri,  4 Apr 2025 18:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenschwermer.de header.i=@svenschwermer.de header.b="jzvp5MsB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47043D984
	for <linux-leds@vger.kernel.org>; Fri,  4 Apr 2025 18:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.228.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743792531; cv=none; b=GR+WBhqaLu4kEAsCq4/wZJo/AR8QnaGFdAXJJxYjRSPJQhur1jjmiSMkbasWSNLad+JFB1HATdzWKZGCGoFTb+0OloBm/PJt2EadHymqRuOrQkpy08a9wHPJPUmMkiZh6k3umdRFGV5juTOoKJP8IfKygXuyRnf/tSHWHaGsKAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743792531; c=relaxed/simple;
	bh=g00cs3/yzbJ4fREiQg3PMdpxyccx/oxnlHDCz6vPmNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4g+R0O8w3O5T9qo9ZKs1pXE6DQ0bYET2y98oYJMbhAb/SsW1H4TN55YnE2nbRaUFECiFGhWdnCEwFo9Igm7Ug7dg7aeQtW6aRH/euio4m2ekp0DPF43mWdt4n+B2/Aeb/HCGZflIfhL4a8w7weDBNFJcm9a1SSywJa92qzujZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=svenschwermer.de; spf=pass smtp.mailfrom=svenschwermer.de; dkim=pass (2048-bit key) header.d=svenschwermer.de header.i=@svenschwermer.de header.b=jzvp5MsB; arc=none smtp.client-ip=49.12.228.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=svenschwermer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenschwermer.de
X-Virus-Scanned: Yes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
	s=mail; t=1743792085;
	bh=g00cs3/yzbJ4fREiQg3PMdpxyccx/oxnlHDCz6vPmNs=;
	h=From:To:Cc:Subject:In-Reply-To:References;
	b=jzvp5MsBca8jd6XWLZY2Vrl/AORfeSWkalm2y9D1qatDNdp/S1+WVqQAaq1u0/a8d
	 ufxv+OrllvX6u4rjE8y9eMTGeUSt2aUqv8i6j6KVWJkO7vU2vWQ520WjL1k37BIbo8
	 h5VgtIHFmaade6IUL90NrUp9TIONVM2dWa7OVvw8WBocleyaylnZ+jANXf75Uy7lVi
	 JXomP2Z6LuScxdaKdXqm03uqWm9yKsDhRoiT/1qrec1YsFOf3Nt6KFadPpxcxSg9j5
	 m9e9Np543HdQyieHyqKw90vG1cfvkWYsbSGoiHSI8PhbgJc08ZLn6OtJEed0Vmxi/y
	 Fd9rJdUVXcY2Q==
From: Sven Schwermer <sven@svenschwermer.de>
To: linux-leds@vger.kernel.org,
	lee@kernel.org
Cc: Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
	jacek.anaszewski@gmail.com,
	schuchmann@schleissheimer.de,
	pavel@ucw.cz
Subject: [PATCH v3] led: multicolor: Fix intensity setting while SW blinking
Date: Fri,  4 Apr 2025 20:40:36 +0200
Message-ID: <20250404184043.227116-1-sven@svenschwermer.de>
In-Reply-To: <20250404154621.GI372032@google.com>
References: <20250404154621.GI372032@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>

When writing to the multi_intensity file, don't unconditionally call
led_set_brightness. By only doing this if blinking is inactive we
prevent blinking from stopping if the blinking is in its off phase while
the file is written.

Instead, if blinking is active, the changed intensity values are applied
upon the next blink. This is consistent with changing the brightness on
monochrome LEDs with active blinking.

Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Tested-by: Sven Schuchmann <schuchmann@schleissheimer.de>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
---

Notes:
    V1->V2: Change title, add tags
    V2->V3: Add Pavel's ACK

 drivers/leds/led-class-multicolor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
index e317408583df9..5b1479b5d32ca 100644
--- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -59,7 +59,8 @@ static ssize_t multi_intensity_store(struct device *dev,
 	for (i = 0; i < mcled_cdev->num_colors; i++)
 		mcled_cdev->subled_info[i].intensity = intensity_value[i];
 
-	led_set_brightness(led_cdev, led_cdev->brightness);
+	if (!test_bit(LED_BLINK_SW, &led_cdev->work_flags))
+		led_set_brightness(led_cdev, led_cdev->brightness);
 	ret = size;
 err_out:
 	mutex_unlock(&led_cdev->led_access);
-- 
2.49.0


