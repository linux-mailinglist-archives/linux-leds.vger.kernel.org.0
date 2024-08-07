Return-Path: <linux-leds+bounces-2417-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A59CE94A8B3
	for <lists+linux-leds@lfdr.de>; Wed,  7 Aug 2024 15:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E3261C208DB
	for <lists+linux-leds@lfdr.de>; Wed,  7 Aug 2024 13:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F1C1E7A3B;
	Wed,  7 Aug 2024 13:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASLUBGSf"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6A91E7A4A;
	Wed,  7 Aug 2024 13:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037831; cv=none; b=hm8JrzRg/xiyTMQ6AEs8+1NALnbvssyH4QDb1Wu/MZowiHluhdp+AVNvToDCLaXZvOohdQgPA3gj+sd0GPo8FDKzzp0vVf7TXOmh//gVgLWrTetdnoB5R6HjjNJZq69TifqIGB7jJnW8wKenoGgq0PhTDeREE56X9Grghsuwh2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037831; c=relaxed/simple;
	bh=dCITDVu+ma/sDwxdhmxDkxVcsFqyr3HcxLXF4/8Xj+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hAXn2rHrWC3ZnB094BW+WLvvCvgTXrB/nyNzG+O6aYlQzFGo/alIdOgKnrbIp3eDJeRjJxrapt7RUpA/cMkvp9PqHl8fLU9dxSNaV5MF3YvYW7xuJseWwWRKy45/xeCyOFzrW7oE3XGu3VS4Tti2xrFnfbrLDIkG8vJ9p97+MIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASLUBGSf; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5b9d48d1456so1047711a12.1;
        Wed, 07 Aug 2024 06:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723037828; x=1723642628; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=96dMCeWaUUcq05xNdKVW2u3NImhSxQTfs/zSYg+df90=;
        b=ASLUBGSfsKx2HB4WiwRDzwGE6YP2F+WfEb1S9x9MKhihr/1KsPMxtuFUUvTkgW/TA7
         2uKuWklOVMOkpleB4M6jKBx4V5P8suN0ru0TDv+b/ss8uRTH0kUxJSIYY7p/Kmi7IoJY
         JXbVE6c0o1I+5WChNXK6eXXnQyXFcnWEo5eWV7ENW5NZXAr1l5WjMCyDDk5vMdXC188f
         6QScU1gzVZBuHWFhE33GXeEIo+NGk8Girk85ev0ecXk+wj4dAfBRIoX5VqA+bsNtvk6a
         gRPCC0gTZxIFL109UZILMYSZeDDnsl+gqqAXCbXw2k8JSeX1qTxaAPuvieRjqUzcvSgL
         YwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723037828; x=1723642628;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96dMCeWaUUcq05xNdKVW2u3NImhSxQTfs/zSYg+df90=;
        b=ok2WpzDpfD0rndMpW4r8Y+2ICYeOKzO+e5XsA4ZqfqBanKdFZyithA6ChEdSdyquTT
         NypYrBHF+VBsIE1gmUYbzmG4+FNA8Eg1a5quKDSRMBcOHU3N/JcxvOSK6zoTD7m+D/K+
         qIFoR9zmvtaiIn4tS/sx5xnDR/X1IrKmI5KftYk9s5q+SZLCSd7NWtZwZwLiiYPSEQ3m
         fLpwsKDToh5B3QAPfI8MXzwLhqheLTRyTsCn6H4UzYvdaamUy8vl1XDAK7fDxwsSjSIO
         vWbUHFBYxLvMsudILuM3AUd6CIs4kHT26Q/55U72ms3j0iyDgv5RIhVwUB5ne37CwwcK
         bqPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz/x4Dc8yKk50LFVx8rb5GfDWouwnmbz7xIRUjo1g996jIu1Ki5cnhxerx6BOkn6v48tlVNSCRXWD9fLiMLMxIA/AgkLNY6sGf5dEx
X-Gm-Message-State: AOJu0YzRtHpKj15aump7ApfQweIqBzgN9jVDTr8FepKU9x1r6Fq9Jj2n
	YiIjO56GQrAcL/21o7u6YH/0F8GeQTYNdu3FFFYhuQBAVtdUdqe8i+VhRmfp
X-Google-Smtp-Source: AGHT+IH9EWNnQE5LbWJRJU24BPbS6YGoAFewVE8VoqODppOQPfEG657NHSze5SCIkPZsmsqeHgP7Zg==
X-Received: by 2002:a05:6402:1ecf:b0:582:7394:a83d with SMTP id 4fb4d7f45d1cf-5bba36f16e6mr1846749a12.12.1723037828070;
        Wed, 07 Aug 2024 06:37:08 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bb884cddf4sm3808312a12.66.2024.08.07.06.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 06:37:07 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 07 Aug 2024 15:37:03 +0200
Subject: [PATCH] leds: pca995x: Fix device child node usage in
 pca995x_probe()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-leds-pca995x-fix-fwnode-usage-v1-1-8057c84dc583@gmail.com>
X-B4-Tracking: v=1; b=H4sIAH54s2YC/x2MQQqDMBAAvyJ7diEJNZh+pXiIyaZdKFGyVAXx7
 108zGFgmBOEGpPAszuh0cbCS1WxfQfpE+ubkLM6OOMeZjQev5QF1xRDGA4srOx1yYQ/iRoXH3K
 wNNrZJdDH2kib+/+arusPbI0vKW8AAAA=
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Isai Gaspar <isaiezequiel.gaspar@nxp.com>, Marek Vasut <marex@denx.de>, 
 Jonathan Cameron <jic23@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723037827; l=3654;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=dCITDVu+ma/sDwxdhmxDkxVcsFqyr3HcxLXF4/8Xj+I=;
 b=f0J6K+8ngIczaA/mOyK24bLNv+qX38oK3eX5vUncgMmMlAR1rrI06tRkjI2Y8r94d9DxSEqmJ
 AfSioBSWyFvA/TCywZy+uksCqfJt9eq4eC2JlXugom+KWB0X0/l1Jhu
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The current implementation accesses the `child` fwnode handle outside of
device_for_each_child_node() without incrementing its refcount.

Add the missing call to `fwnode_handle_get(child)`.

The cleanup process where `child` is accessed is not right either
because a single call to `fwnode_handle_put()` is carried out in case of
an error, ignoring unasigned nodes at the point when the error happens.

Keep `child` inside of the first loop, and use the helper pointer that
receives references via `fwnode_handle_get()` to handle the child nodes
within the second loop. Keeping `child` inside the first node has also
the advantage that the scoped version of the loop can be used.

Fixes: ee4e80b2962e ("leds: pca995x: Add support for PCA995X chips")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
This issue has been found while reviewing the recently applied commit
3ec05e5feacd ("leds: pca995x: Use device_for_each_child_node() to access
device child nodes"), which required some conflict resolution to be
applied.

This driver makes use of the variable `child` outside the
_for_each_child_node() loop as it that variable contained the right
address at the point where `fwnode_handle_put(child)` is called, which
is not a valid assumption. `child` is assigned to led_fwnodes[reg]
without incrementing its refcount, and the cleanup is off as well
because even if that was correct, a single child node would be
de-allocated.

A similar fix was provided in the series where forementioned commit
was included for leds-bd2606mvv.c [1].

Link: https://lore.kernel.org/all/20240721-device_for_each_child_node-available-v2-3-f33748fd8b2d@gmail.com/ [1]
---
 drivers/leds/leds-pca995x.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index 83bc9669544c..11c7bb69573e 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -120,12 +120,11 @@ static const struct regmap_config pca995x_regmap = {
 static int pca995x_probe(struct i2c_client *client)
 {
 	struct fwnode_handle *led_fwnodes[PCA995X_MAX_OUTPUTS] = { 0 };
-	struct fwnode_handle *child;
 	struct device *dev = &client->dev;
 	const struct pca995x_chipdef *chipdef;
 	struct pca995x_chip *chip;
 	struct pca995x_led *led;
-	int i, reg, ret;
+	int i, j, reg, ret;
 
 	chipdef = device_get_match_data(&client->dev);
 
@@ -143,7 +142,7 @@ static int pca995x_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, chip);
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		ret = fwnode_property_read_u32(child, "reg", &reg);
 		if (ret)
 			return ret;
@@ -152,7 +151,7 @@ static int pca995x_probe(struct i2c_client *client)
 			return -EINVAL;
 
 		led = &chip->leds[reg];
-		led_fwnodes[reg] = child;
+		led_fwnodes[reg] = fwnode_handle_get(child);
 		led->chip = chip;
 		led->led_no = reg;
 		led->ldev.brightness_set_blocking = pca995x_brightness_set;
@@ -171,7 +170,8 @@ static int pca995x_probe(struct i2c_client *client)
 						     &chip->leds[i].ldev,
 						     &init_data);
 		if (ret < 0) {
-			fwnode_handle_put(child);
+			for (j = i; j < PCA995X_MAX_OUTPUTS; j++)
+				fwnode_handle_put(led_fwnodes[j]);
 			return dev_err_probe(dev, ret,
 					     "Could not register LED %s\n",
 					     chip->leds[i].ldev.name);

---
base-commit: 1e391b34f6aa043c7afa40a2103163a0ef06d179
change-id: 20240806-leds-pca995x-fix-fwnode-usage-f69d91e81b2c

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


