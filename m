Return-Path: <linux-leds+bounces-2835-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B85987BBB
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 01:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22547286938
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2024 23:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979411B2ED0;
	Thu, 26 Sep 2024 23:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1rrjzic"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93001B2EFD;
	Thu, 26 Sep 2024 23:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392909; cv=none; b=qXwpQndlK8N2/TqT0XHlAkb41dv1mOszyORGPPW8ghIVNeZNjNJ7ofYcoAOeVhucirwSBUNtLXhp7g+YUTVDLvrkbrYSeLtQQdUQ8KTXy0mfcQuV6I8tCKwOR2i6JmYEEMTpw1RQaeNtrPb9wbnLYJsxeNclQB4rAwl7r0a8P6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392909; c=relaxed/simple;
	bh=Pv0inpasEwKB4z2yQMzZWyX6wkHoCypZJXtRjmgK+mU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M9rM8D1lCc8RPRdYJON12KMhy/xI4nF6hamuYsZ5mBJtciEIf65GcknDr5CsAllu6l+sccBHaiuzcXqf/4GbsSwJujtMakxXOFlLD9ZZJ5QHQQxfL+FgPQzOAFZma+fTB4o6VsIKL+eCixF2acV4WwN9/3XnE9lUWrJzlZY7+qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1rrjzic; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c87ab540b3so1725333a12.1;
        Thu, 26 Sep 2024 16:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392906; x=1727997706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TyRYSLB4FUMG7ZQozSGEenWyDF3XZ2iz0mCpEEN+5z4=;
        b=l1rrjzicrN/g+TOD/i9h2UJo496dGFW2cKYHgoCWwZhTgeoT3cmP/Cd2HYUfHgrjXQ
         PXCIZjTmVvpzb2jRubm7NIu+0dCZ1Se/HQpEqD6HsVM2lL5efKocpK1VxMmTnYoD1s+v
         /44fQr8JDJOAltYes7hI0bWO9nNGokkYHvusbRlQibBHzutDvn33dk4PVGd+a1xV5usr
         habGImawYyzLVF8aXDbqGLQXJMJeNs21yiTJlvSrVES3Ncg1bB8M86WrJKjkv0D+DETZ
         cnoVfHcNUUGEbl2XVeW0EXPkKkjejp/azWYPfiH8BaFa1YFmSiGw+bHQGPEf564CyanR
         FnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392906; x=1727997706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TyRYSLB4FUMG7ZQozSGEenWyDF3XZ2iz0mCpEEN+5z4=;
        b=awRcb7BfANLJVkjexEzqqtLubxOmjmhocUx7sEquqShPXxByClbGGhhRAczN08F71l
         RA9AQ7M5JvAQFQ3MZVShU1hj8Hg0KfCI71xyQSeyJabYrIlzUFwvxLXkJ6HP4eYne4bY
         mR9nrkYldDCGk/iaxao5vXV/9lHFovJHrSs0t4e1ttcbI6ud+lX/CvKssaX7/lQQxWlR
         EpVaeIN5rNA3IjR27WgoSAbOV8nOJIW2WFZHcrzmzB4Lem6DkL8yYYA1blbzebYfDGUP
         Vdlb/eQtEyAN4Gqcvn2nqcgZwvT2bul1IhuhvEzF2B80/yAAuNvdCr5k0HCRGdcq9AlA
         zXAA==
X-Forwarded-Encrypted: i=1; AJvYcCUuMQ8Q9IJEfNiJrGKhaviu2a5v1jvSJQKiYe+rFwI/0xoJRvF64gT7XOrq5KQOjUpPDYvqB596nNqW4K8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgbrkiKLbRwHrOeKQxrnAWgXcEWO8xO3XMGh9c1u554BwJGJx1
	JyQB0ZJhJnK7dICZ+9JfMVilYjq9raGAzdEWxL1iT61YYnVJh0asVW6n7dSL
X-Google-Smtp-Source: AGHT+IF2h6rfpoYNPcv3IJUyf/0VxJB+Tzg7enQ3X9qTLHoriZAfUF5SXe05FRA9//n3nOpoi2FKjQ==
X-Received: by 2002:a17:907:36cd:b0:a7a:acae:340b with SMTP id a640c23a62f3a-a93c32119afmr152457166b.31.1727392906224;
        Thu, 26 Sep 2024 16:21:46 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:44 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:04 +0200
Subject: [PATCH 13/18] leds: pca963x: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-13-95c0614b38c8@gmail.com>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Gene Chen <gene_chen@richtek.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1968;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Pv0inpasEwKB4z2yQMzZWyX6wkHoCypZJXtRjmgK+mU=;
 b=4OyN2lOQijDJ7XTOSToVZf5Jm5nLKGku+MN88b0WkN8LPNF8MQ75n8vIksJCldHP70NcDZrab
 N/kVJn2HWk2DcMaBUelGlqT9fiv7ll/wbB/w8wUBdi5v4GKnZbdtw3R
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

After switching to the scoped variant, there is no longer need for a
jump to 'err', as an immediate return is possible.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-pca963x.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index b53905da3592..050e93b04884 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -306,7 +306,6 @@ static int pca963x_register_leds(struct i2c_client *client,
 	struct pca963x_chipdef *chipdef = chip->chipdef;
 	struct pca963x_led *led = chip->leds;
 	struct device *dev = &client->dev;
-	struct fwnode_handle *child;
 	bool hw_blink;
 	s32 mode2;
 	u32 reg;
@@ -338,7 +337,7 @@ static int pca963x_register_leds(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct led_init_data init_data = {};
 		char default_label[32];
 
@@ -346,8 +345,7 @@ static int pca963x_register_leds(struct i2c_client *client,
 		if (ret || reg >= chipdef->n_leds) {
 			dev_err(dev, "Invalid 'reg' property for node %pfw\n",
 				child);
-			ret = -EINVAL;
-			goto err;
+			return -EINVAL;
 		}
 
 		led->led_num = reg;
@@ -369,16 +367,13 @@ static int pca963x_register_leds(struct i2c_client *client,
 		if (ret) {
 			dev_err(dev, "Failed to register LED for node %pfw\n",
 				child);
-			goto err;
+			return ret;
 		}
 
 		++led;
 	}
 
 	return 0;
-err:
-	fwnode_handle_put(child);
-	return ret;
 }
 
 static int pca963x_suspend(struct device *dev)

-- 
2.43.0


