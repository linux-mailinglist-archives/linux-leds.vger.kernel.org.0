Return-Path: <linux-leds+bounces-7755-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iC2nG5kd4mlX1wAAu9opvQ
	(envelope-from <linux-leds+bounces-7755-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 13:46:33 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 127AA41AE8D
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 13:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72B3F301F313
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 11:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B4E3988FE;
	Fri, 17 Apr 2026 11:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3Q+OsQr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40AF396B7F
	for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 11:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776426169; cv=none; b=gKifVD84XZ20l9xB6atyzrJVoqti3jUOBkUHQUfZceRh0IFOyv+9BYmw/egSxuQWcBfmXEYzbu3HqD7g5YJDD5RccHTANllWVt3rXiGMbsWXXy/20fsAm5SoCNznX8v/cHwtpoJQsUIQHHd5A03fZQZegqJd0sXdR6LP9IZoZfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776426169; c=relaxed/simple;
	bh=2SoN076WkKPP9dslU6jI1ybrIMLHSTNOhkvnyADFEu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j7CN+YoX+YO9XS/x+/RBuBkiBcVszlFlE5WbaAlYrJX/vFA3VwT/a/L5t5xRKxL74sCSpZ6FCVZ0/EGxja+MYvkebTa1PATye2RuVifE96zT5nr6IeB7gOyc1e7U82bH6S+gQqSGM4b2h4Q20q+/icZelNKfFdHACdT2Nk+eG8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3Q+OsQr; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so675362e87.1
        for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 04:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776426166; x=1777030966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIsBkEhxNk5zSXNzbm4OjEaayYLvWVn1IlfYzqWmAY8=;
        b=U3Q+OsQrqFj9zxxhBl6l+pnWu2fXBHRpsTivXAo2KmD6I6Fsl+1zwSkXerpJ3ipzoQ
         kuTU0/5BJ1Mbwxao5kHb+iisUffH5NlLjfUHdryWZMTZ69QDqvGRTyfFrEEUkNs9Thax
         pdwKThk8niYPRacMEtYiJVd4+/vKzs+MWoUnM8EgjHGEYQQozJUzu7V9Uby1I0hiwxcV
         BS+q9cNcIBMGxg0euq7sSZQzSqnucIJMyD4ML5NqpyLoQYOLfsMXGTcbxFjYJGtXcmBE
         NjfTjohpTdpUuWHXBxPcJqtBezN6Oa9nYT/XJ5I8EaTvigflklhEO4ukE8nuQX3INvCj
         MDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776426166; x=1777030966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aIsBkEhxNk5zSXNzbm4OjEaayYLvWVn1IlfYzqWmAY8=;
        b=LxOQZM/6Ihz0oBLhizqaCBBvN8EAoTRmoBqoJbn+aYu0tigvnyTMIANw4lpEeezbzX
         a2dIl4x4uS3qq1pVSWEXhipBWeZz4XseIN82JpvDTy8E7J+W5dzsMkTuepORZE5Z0Y1B
         zeKeHVMNVZN1sSDfD1twmvFfuuG5ej09B5ejj2Ot/vS0+cVhEijP9q9NcubqNnASr41j
         pBWNsUHm6smsN71q0juN1lSPuwpesvnClvP/w2EO466jCGc/rGDHHSxnVv9T0/WiWw+k
         9pHUoQF140YttwdcnboStogJwmOJVY/E07/i1KFUgLpEXjIXYNKMhGviKle8+8LmCvvF
         3Ypg==
X-Gm-Message-State: AOJu0YwSWAT+b9cTXoYW+TgY6YW/kIU9LV1bjMpZnUDqghvDKQvHZFKe
	E6BvXIldZOfPXu5AM/4zFE3EcMtQouGUftvzmW2BgwUTFCLaxJXeZANb
X-Gm-Gg: AeBDievaMomgMxeS0JjiKmDYVCXsm5OuJDBTnzAnDIUHCfV/4GK7VW+3aFGDvxVVwbQ
	i/Wqaf5iX+oC+/fEqVmhYR9PigndmgYjn3YweyR80mHqMQvAJCjhEY++HbB5exUbQbBpHJ2Thus
	24FUFqw2higfJs97bv1HftuAEjbprb8rim/+i1B02Zc/bKlJ5e7OWkEH/Aj4NKeknxrq2ukyUho
	ohJBmeplDkz1fslXJdmFPSUB4HDVvGWjVveBa/QFNmholsGPA1ZT36OlMyUr+WBq8YzlRqTimbs
	55QXOvhWoaroUQehhFPZ2IaXpArlZrXeh65r1/tO78c9YyVBS0zJMfzBHTIb7ZvVCPXU+GVCSIi
	/zzRsgcfYhMQrM0C8iuEtwRtKL23O9IxJ7pVoxCynoMhkEEUkCkbEcSAJGlf6rDUMhbVR0QKufZ
	3SKV5enqKQNepElGx1NzYfDrA=
X-Received: by 2002:a05:6512:3b8e:b0:5a3:ff73:29d6 with SMTP id 2adb3069b0e04-5a4172bb921mr657348e87.7.1776426165787;
        Fri, 17 Apr 2026 04:42:45 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc672sm338636e87.34.2026.04.17.04.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:42:45 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 1/5] media: lm3560: Add HWEN pin support
Date: Fri, 17 Apr 2026 14:42:22 +0300
Message-ID: <20260417114226.100033-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417114226.100033-1-clamor95@gmail.com>
References: <20260417114226.100033-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7755-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 127AA41AE8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add HWEN - logic high hardware enable input found in LM3560 to ensure its
proper operation.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index f4cc844f4e3c..e6af61415821 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -11,6 +11,7 @@
 
 #include <linux/delay.h>
 #include <linux/module.h>
+#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/mutex.h>
@@ -45,6 +46,7 @@ enum led_enable {
  * @dev: pointer to &struct device
  * @pdata: platform data
  * @regmap: reg. map for i2c
+ * @hwen_gpio: line connected to hwen pin
  * @lock: muxtex for serial access.
  * @led_mode: V4L2 LED mode
  * @ctrls_led: V4L2 controls
@@ -54,6 +56,7 @@ struct lm3560_flash {
 	struct device *dev;
 	struct lm3560_platform_data *pdata;
 	struct regmap *regmap;
+	struct gpio_desc *hwen_gpio;
 	struct mutex lock;
 
 	enum v4l2_flash_led_mode led_mode;
@@ -425,6 +428,12 @@ static int lm3560_probe(struct i2c_client *client)
 	flash->dev = &client->dev;
 	mutex_init(&flash->lock);
 
+	flash->hwen_gpio = devm_gpiod_get_optional(&client->dev, "enable",
+						   GPIOD_OUT_HIGH);
+	if (IS_ERR(flash->hwen_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(flash->hwen_gpio),
+				     "failed to get hwen gpio\n");
+
 	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
 	if (rval < 0)
 		return rval;
@@ -452,6 +461,8 @@ static void lm3560_remove(struct i2c_client *client)
 		v4l2_ctrl_handler_free(&flash->ctrls_led[i]);
 		media_entity_cleanup(&flash->subdev_led[i].entity);
 	}
+
+	gpiod_set_value_cansleep(flash->hwen_gpio, 0);
 }
 
 static const struct i2c_device_id lm3560_id_table[] = {
-- 
2.51.0


