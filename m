Return-Path: <linux-leds+bounces-8128-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLAWHDFVB2oHzAIAu9opvQ
	(envelope-from <linux-leds+bounces-8128-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 15 May 2026 19:17:37 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8932554BD7
	for <lists+linux-leds@lfdr.de>; Fri, 15 May 2026 19:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FE4F34DAAEC
	for <lists+linux-leds@lfdr.de>; Fri, 15 May 2026 16:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579973CFF44;
	Fri, 15 May 2026 16:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="KbRDkBJh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414D53CF663
	for <linux-leds@vger.kernel.org>; Fri, 15 May 2026 16:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778862819; cv=none; b=sadyELsRA2OCT/1iCCiK9vkM14FwGu68MW0XCjcmuBAYGDbyGieiyab4qNnbzgpSvVQeboT4NdHuA/oEHbTKVhQ7uySP8IJldt5/rMfu5HyQ3S7kBCAxWQlOP89oDpd9kb8REfD+4u3dwcxWf4bKz+ZGzwQbY+khesvn/1n/2fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778862819; c=relaxed/simple;
	bh=+hyxAutSr0SZBbYi+DBYCGS9Gw3qJ92Hui0BnwYjR6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JYKRIkFyTvUo2jfa05/W4XnQsYEvn8QKzpGPQMup0vTftwMjGRxt5t6sfThZ8v1xHpNFdBai/Hjl989nxbOtbe77BvB21SdelmRteZCdiaWzIHZQt+P/AIBaIzVqlF8qdmnbd0Q7yPizHBWx5BHJ3abpyKt+CRDgOxCD8s7+P8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=KbRDkBJh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso136745e9.0
        for <linux-leds@vger.kernel.org>; Fri, 15 May 2026 09:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778862814; x=1779467614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p1/7js2cGOXlm9yYCDtds9lH9UcryS1S1vNBZjfcTKc=;
        b=KbRDkBJhtMMYATcm1a5MSv9YW2AF56/tTP8D40OGjDejOlMNKgz2uVP73PpCICtJKV
         diy6I/9bLBGXnotQNhOmDD2XLITUrHekHOnfHLXe61AFYDJO9uoR9Y6TxIa7tmj9FKCs
         bbo8cg5HI99UgJ3C/3j8wYEBigjpMr2HE3RK1ulKe8MexlpLoDrE0MWea2VgX57ASrAc
         RQId43a3ikcJlCblO/2kH8zfQlJu082e/Qwq2SoSFpYBPoMjYPakEek9kgEWw8tPLkT+
         x+UvSYeldgAlKwawWPw+rNXaols6JvDJICtQK4pke8x5CYaVDdXhyPLdv3myvkurl++J
         d8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778862814; x=1779467614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1/7js2cGOXlm9yYCDtds9lH9UcryS1S1vNBZjfcTKc=;
        b=YdSzJ/NkCqLM3cPZjW2XD9eXwjwqAd9mbdLcxkGL5evYuhzTJJrcXrBO2vqxjhhZv/
         jGHg8p2u0mpLl1iUC1LES3gLoyLLFd4HNpH2W6D/FJC/wX7bm49XHB/SqMOwwcKocJV3
         5/hoT/U5ie+6kmjpG+OpNluDZSvJsiC7Oh5hP9yhK04ttry/2ABKHuELf9xMb1d/T5mX
         rAwkbMcvHrsFRpsHggHOSFEirnhAUW1wyrmOpkrDDV19Fh1zNFzCuyUO0b1Pg45HA1u4
         7dqU3dL/OXZfyaGjwOzBeDlxr7f2lxfGQtPtb3o9dyfTfUxVhaNc5DItdt7zJQOkCku9
         ynhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3ssVkY/8FonjZe4cNQRk/xhULtpQizzgP04tTwPQj6tGWRX6yedtP46PXy1yztHwvVGfOJ0x1eM1E@vger.kernel.org
X-Gm-Message-State: AOJu0YxJoYZgn17+7iPERvxdgnEzei4ZC2cCbbnjDgEJcLoBg3b+Wevc
	VvnVHrTUitF1ta6LLgBIy3pI9EcutEEPN5h5G4+I4ExTsa0CVFFNqhkWFSv2fdv/C0jYqM9sHjE
	t7vJ7tFQ=
X-Gm-Gg: Acq92OGp26Q7Dd81lY/+YTCM8xJGHRcp5ySjUkoFXKaV7B3WoZFH4RTuTLWkkHYefwY
	SCYR8aG+q2HpD0FtmPOKHWicexxaCBjgqX8l5HmSnecYhQ7wV5c32pPjdzAdS8arvW3nk2tP6Kv
	zpU/CI5PsgnCAjh2CDvbXK57quTkrVBaHnVs68jpY2nRSthsgT/QASl0mHFRd9dn0Ik0VasVrFd
	rwdMnphj/HIYYVFNCAMB2GsZhh/C7tmBMNemBJbEid/yV6wqR4auXyn4IcUEpZwXAIw8JNnXZzJ
	VfsadzBuI4Wv0tmE07/MEcIeKLkIBvXG/rDbsPVF0zFFykeBdSbHaur05j8IBbcPqk5vVEMglnI
	0QnxX+WQ3qc3/IBlrPjJ04xamDGGVqOBQBVd2BIpWqsLkvnGDVU6GKrkTiosW3+uGpV/P1PX7c3
	9RhHq7qiL+Z/DJFsO1OnKFxTFCc3tlDI6FsFUlWnXeulK1XzT5N4wkd+ScBr4CsuCHWOrrTOU8O
	WUtEyU4iy6KYb4=
X-Received: by 2002:a05:600c:a405:b0:48a:52ce:a4b1 with SMTP id 5b1f17b1804b1-48fe60dd5e8mr68922885e9.15.1778862813557;
        Fri, 15 May 2026 09:33:33 -0700 (PDT)
Received: from localhost (p200300f65f47db047ce9331f6697a627.dip0.t-ipconnect.de. [2003:f6:5f47:db04:7ce9:331f:6697:a627])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fe5e9d5d9sm79035105e9.15.2026.05.15.09.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 09:33:33 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jan-Simon Moeller <jansimon.moeller@gmx.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	=?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: Use named initializers for arrays of i2c_device_data
Date: Fri, 15 May 2026 18:33:24 +0200
Message-ID: <20260515163325.471175-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=23621; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=+hyxAutSr0SZBbYi+DBYCGS9Gw3qJ92Hui0BnwYjR6w=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqB0rVBdQbtQFLY0oBjThzEr3ROJBQwzaYbWhSx cp6XXPTgrGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagdK1QAKCRCPgPtYfRL+ ThWmB/sEPhJhbNib1aZE9OhdYztGhcbqFvE1PBbG4tK3lzgP0weJQcl60K+XZhUkCqvvWvQ4FZo ItcmHxnpFSJUrlHHkQYUQ1TQaNeD5yo286iQoyxc1kG+DzKdPYdB5kCs+qhj963DeMgI5Iriujf +gZqgMVXJ0jO+3KFL3fjJpSxd3VZN3xOfCf+68OyTybxeGWcGkx3gJlNOHHRV0JOj/YExyO4XQg 8JL8FYYx7ZAmCtT1kLCQzfqpqwrnnU1BDaRdRdW8VCyYtVTY+7O5WC9BX8HR/k0uZG5Prv/CEw8 KUV66VnTq0feCcoOcgFP7nPJsIBssH8R+sNW6sGZuEjd/9PZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B8932554BD7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8128-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_CC(0.00)[linux.intel.com,gmx.de,gmail.com,iki.fi,kernel.org,ideasonboard.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,baylibre.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre-com.20251104.gappssmtp.com:dkim]
X-Rspamd-Action: no action

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
i2c_device_id that replaces .driver_data by an anonymous union.

While touching all these arrays, unify usage of whitespace and commas.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

the mentioned change to i2c_device_id is the following:

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	index 23ff24080dfd..aebd3a5e90af 100644
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
	
	 struct i2c_device_id {
	 	char name[I2C_NAME_SIZE];
	-	kernel_ulong_t driver_data;     /* Data private to the driver */
	+	union {
	+		/* Data private to the driver */
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };
	
	 /* pci_epf */

and this requires that .driver_data is assigned via a named initializer
for static data. This requirement isn't a bad one because named
initializers are also much better readable than list initializers.

The union added to struct i2c_device_id enables further cleanups like:

	diff --git a/drivers/regulator/ad5398.c b/drivers/regulator/ad5398.c
	index 0123ca8157a8..dfb0b07500a7 100644
	--- a/drivers/regulator/ad5398.c
	+++ b/drivers/regulator/ad5398.c
	@@ -207,8 +207,8 @@ struct ad5398_current_data_format {
	 static const struct ad5398_current_data_format df_10_4_120 = {10, 4, 0, 120000};
	
	 static const struct i2c_device_id ad5398_id[] = {
	-	{ .name = "ad5398", .driver_data = (kernel_ulong_t)&df_10_4_120 },
	-	{ .name = "ad5821", .driver_data = (kernel_ulong_t)&df_10_4_120 },
	+	{ .name = "ad5398", .driver_data_ptr = &df_10_4_120 },
	+	{ .name = "ad5821", .driver_data_ptr = &df_10_4_120 },
	 	{ }
	 };
	 MODULE_DEVICE_TABLE(i2c, ad5398_id);
	@@ -219,8 +219,7 @@ static int ad5398_probe(struct i2c_client *client)
	 	struct regulator_init_data *init_data = dev_get_platdata(&client->dev);
	 	struct regulator_config config = { };
	 	struct ad5398_chip_info *chip;
	-	const struct ad5398_current_data_format *df =
	-	                (struct ad5398_current_data_format *)id->driver_data;
	+	const struct ad5398_current_data_format *df = id->driver_data;
	
	 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
	 	if (!chip)

that are an improvement for readability (again!) and it keeps some
properties of the pointers (here: being const) without having to pay
attention for that. (I didn't find a nice led driver that benefits, so
this is "only" a regulator driver example.)

My additional motivation for this effort is CHERI[1]. This is a hardware
extension that uses 128 bit pointers but unsigned long is still 64 bit.
So with CHERI you cannot store pointers in unsigned long variables.

Best regards
Uwe

 drivers/leds/flash/leds-as3645a.c |  2 +-
 drivers/leds/flash/leds-lm3601x.c |  4 ++--
 drivers/leds/leds-an30259a.c      |  2 +-
 drivers/leds/leds-aw200xx.c       | 10 +++++-----
 drivers/leds/leds-bd2802.c        |  2 +-
 drivers/leds/leds-blinkm.c        |  4 ++--
 drivers/leds/leds-is31fl319x.c    | 22 +++++++++++-----------
 drivers/leds/leds-is31fl32xx.c    | 18 +++++++++---------
 drivers/leds/leds-lm3530.c        |  4 ++--
 drivers/leds/leds-lm3532.c        |  4 ++--
 drivers/leds/leds-lm355x.c        |  6 +++---
 drivers/leds/leds-lm3642.c        |  4 ++--
 drivers/leds/leds-lm3692x.c       |  4 ++--
 drivers/leds/leds-lm3697.c        |  2 +-
 drivers/leds/leds-lp3944.c        |  4 ++--
 drivers/leds/leds-lp3952.c        |  4 ++--
 drivers/leds/leds-lp50xx.c        | 12 ++++++------
 drivers/leds/leds-lp5521.c        |  2 +-
 drivers/leds/leds-lp5523.c        |  4 ++--
 drivers/leds/leds-lp5562.c        |  2 +-
 drivers/leds/leds-lp5569.c        |  2 +-
 drivers/leds/leds-lp8501.c        |  2 +-
 drivers/leds/leds-lp8860.c        |  2 +-
 drivers/leds/leds-lp8864.c        |  4 ++--
 drivers/leds/leds-pca9532.c       |  8 ++++----
 drivers/leds/leds-pca955x.c       | 12 ++++++------
 drivers/leds/leds-pca963x.c       |  8 ++++----
 drivers/leds/leds-pca995x.c       |  8 ++++----
 drivers/leds/leds-st1202.c        |  2 +-
 drivers/leds/leds-tca6507.c       |  2 +-
 drivers/leds/leds-tlc591xx.c      |  6 +++---
 drivers/leds/leds-turris-omnia.c  |  2 +-
 drivers/leds/rgb/leds-ktd202x.c   |  6 +++---
 33 files changed, 90 insertions(+), 90 deletions(-)

diff --git a/drivers/leds/flash/leds-as3645a.c b/drivers/leds/flash/leds-as3645a.c
index 2f2d783c62c3..5fefcaef3714 100644
--- a/drivers/leds/flash/leds-as3645a.c
+++ b/drivers/leds/flash/leds-as3645a.c
@@ -741,7 +741,7 @@ static void as3645a_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id as3645a_id_table[] = {
-	{ AS_NAME },
+	{ .name = AS_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, as3645a_id_table);
diff --git a/drivers/leds/flash/leds-lm3601x.c b/drivers/leds/flash/leds-lm3601x.c
index abf6b96ade3d..8d00510c8967 100644
--- a/drivers/leds/flash/leds-lm3601x.c
+++ b/drivers/leds/flash/leds-lm3601x.c
@@ -465,8 +465,8 @@ static void lm3601x_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3601x_id[] = {
-	{ "LM36010", CHIP_LM36010 },
-	{ "LM36011", CHIP_LM36011 },
+	{ .name = "LM36010", .driver_data = CHIP_LM36010 },
+	{ .name = "LM36011", .driver_data = CHIP_LM36011 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm3601x_id);
diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
index a42cc4bc6917..4654a732d1b1 100644
--- a/drivers/leds/leds-an30259a.c
+++ b/drivers/leds/leds-an30259a.c
@@ -331,7 +331,7 @@ static const struct of_device_id an30259a_match_table[] = {
 MODULE_DEVICE_TABLE(of, an30259a_match_table);
 
 static const struct i2c_device_id an30259a_id[] = {
-	{ "an30259a" },
+	{ .name = "an30259a" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, an30259a_id);
diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
index fe223d363a5d..0d90eeb6448f 100644
--- a/drivers/leds/leds-aw200xx.c
+++ b/drivers/leds/leds-aw200xx.c
@@ -637,11 +637,11 @@ static const struct aw200xx_chipdef aw20108_cdef = {
 };
 
 static const struct i2c_device_id aw200xx_id[] = {
-	{ "aw20036" },
-	{ "aw20054" },
-	{ "aw20072" },
-	{ "aw20108" },
-	{}
+	{ .name = "aw20036" },
+	{ .name = "aw20054" },
+	{ .name = "aw20072" },
+	{ .name = "aw20108" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aw200xx_id);
 
diff --git a/drivers/leds/leds-bd2802.c b/drivers/leds/leds-bd2802.c
index 2a08c5f27608..9732f41a1143 100644
--- a/drivers/leds/leds-bd2802.c
+++ b/drivers/leds/leds-bd2802.c
@@ -776,7 +776,7 @@ static int bd2802_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(bd2802_pm, bd2802_suspend, bd2802_resume);
 
 static const struct i2c_device_id bd2802_id[] = {
-	{ "BD2802" },
+	{ .name = "BD2802" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, bd2802_id);
diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index 577497b9d426..42188926b2bb 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -805,8 +805,8 @@ static void blinkm_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id blinkm_id[] = {
-	{ "blinkm" },
-	{}
+	{ .name = "blinkm" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, blinkm_id);
diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index e411cee06dab..80f38dba0fba 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -565,17 +565,17 @@ static int is31fl319x_probe(struct i2c_client *client)
  * even though it is not used for DeviceTree based instantiation.
  */
 static const struct i2c_device_id is31fl319x_id[] = {
-	{ "is31fl3190" },
-	{ "is31fl3191" },
-	{ "is31fl3193" },
-	{ "is31fl3196" },
-	{ "is31fl3199" },
-	{ "sn3190" },
-	{ "sn3191" },
-	{ "sn3193" },
-	{ "sn3196" },
-	{ "sn3199" },
-	{},
+	{ .name = "is31fl3190" },
+	{ .name = "is31fl3191" },
+	{ .name = "is31fl3193" },
+	{ .name = "is31fl3196" },
+	{ .name = "is31fl3199" },
+	{ .name = "sn3190" },
+	{ .name = "sn3191" },
+	{ .name = "sn3193" },
+	{ .name = "sn3196" },
+	{ .name = "sn3199" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, is31fl319x_id);
 
diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index fe07acbb103a..6c8d6b833260 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -616,15 +616,15 @@ static void is31fl32xx_remove(struct i2c_client *client)
  * even though it is not used for DeviceTree based instantiation.
  */
 static const struct i2c_device_id is31fl32xx_id[] = {
-	{ "is31fl3293" },
-	{ "is31fl3236" },
-	{ "is31fl3236a" },
-	{ "is31fl3235" },
-	{ "is31fl3218" },
-	{ "sn3218" },
-	{ "is31fl3216" },
-	{ "sn3216" },
-	{},
+	{ .name = "is31fl3293" },
+	{ .name = "is31fl3236" },
+	{ .name = "is31fl3236a" },
+	{ .name = "is31fl3235" },
+	{ .name = "is31fl3218" },
+	{ .name = "sn3218" },
+	{ .name = "is31fl3216" },
+	{ .name = "sn3216" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, is31fl32xx_id);
diff --git a/drivers/leds/leds-lm3530.c b/drivers/leds/leds-lm3530.c
index e44a3db106c3..481e9c0a41e7 100644
--- a/drivers/leds/leds-lm3530.c
+++ b/drivers/leds/leds-lm3530.c
@@ -478,8 +478,8 @@ static void lm3530_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3530_id[] = {
-	{ LM3530_NAME },
-	{}
+	{ .name = LM3530_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm3530_id);
 
diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 24dc8ad27bb3..b51496910b08 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -722,8 +722,8 @@ static const struct of_device_id of_lm3532_leds_match[] = {
 MODULE_DEVICE_TABLE(of, of_lm3532_leds_match);
 
 static const struct i2c_device_id lm3532_id[] = {
-	{ LM3532_NAME },
-	{}
+	{ .name = LM3532_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm3532_id);
 
diff --git a/drivers/leds/leds-lm355x.c b/drivers/leds/leds-lm355x.c
index f68771b9eac6..2b7cf42141e4 100644
--- a/drivers/leds/leds-lm355x.c
+++ b/drivers/leds/leds-lm355x.c
@@ -504,9 +504,9 @@ static void lm355x_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm355x_id[] = {
-	{LM3554_NAME, CHIP_LM3554},
-	{LM3556_NAME, CHIP_LM3556},
-	{}
+	{ .name = LM3554_NAME, .driver_data = CHIP_LM3554 },
+	{ .name = LM3556_NAME, .driver_data = CHIP_LM3556 },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, lm355x_id);
diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
index 36246267b096..2a893399e05f 100644
--- a/drivers/leds/leds-lm3642.c
+++ b/drivers/leds/leds-lm3642.c
@@ -388,8 +388,8 @@ static void lm3642_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3642_id[] = {
-	{ LM3642_NAME },
-	{}
+	{ .name = LM3642_NAME },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, lm3642_id);
diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 1d64ceb5ac85..95b850a3b31c 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -503,8 +503,8 @@ static void lm3692x_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3692x_id[] = {
-	{ "lm36922", LM36922_MODEL },
-	{ "lm36923", LM36923_MODEL },
+	{ .name = "lm36922", .driver_data = LM36922_MODEL },
+	{ .name = "lm36923", .driver_data = LM36923_MODEL },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm3692x_id);
diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 7ad232780a31..933191fb2be0 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -354,7 +354,7 @@ static void lm3697_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3697_id[] = {
-	{ "lm3697" },
+	{ .name = "lm3697" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm3697_id);
diff --git a/drivers/leds/leds-lp3944.c b/drivers/leds/leds-lp3944.c
index ccfeee49ea78..8e95dcedce40 100644
--- a/drivers/leds/leds-lp3944.c
+++ b/drivers/leds/leds-lp3944.c
@@ -417,8 +417,8 @@ static void lp3944_remove(struct i2c_client *client)
 
 /* lp3944 i2c driver struct */
 static const struct i2c_device_id lp3944_id[] = {
-	{ "lp3944" },
-	{}
+	{ .name = "lp3944" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, lp3944_id);
diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
index 17219a582704..0a1af284f52b 100644
--- a/drivers/leds/leds-lp3952.c
+++ b/drivers/leds/leds-lp3952.c
@@ -266,8 +266,8 @@ static int lp3952_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lp3952_id[] = {
-	{ LP3952_NAME },
-	{}
+	{ .name = LP3952_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp3952_id);
 
diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index e2a9c8592953..64303faa1a8a 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -600,12 +600,12 @@ static void lp50xx_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lp50xx_id[] = {
-	{ "lp5009", (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5009] },
-	{ "lp5012", (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5012] },
-	{ "lp5018", (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5018] },
-	{ "lp5024", (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5024] },
-	{ "lp5030", (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5030] },
-	{ "lp5036", (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5036] },
+	{ .name = "lp5009", .driver_data = (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5009] },
+	{ .name = "lp5012", .driver_data = (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5012] },
+	{ .name = "lp5018", .driver_data = (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5018] },
+	{ .name = "lp5024", .driver_data = (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5024] },
+	{ .name = "lp5030", .driver_data = (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5030] },
+	{ .name = "lp5036", .driver_data = (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5036] },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp50xx_id);
diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 7564b9953408..4937fc968011 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -253,7 +253,7 @@ static struct lp55xx_device_config lp5521_cfg = {
 };
 
 static const struct i2c_device_id lp5521_id[] = {
-	{ "lp5521", .driver_data = (kernel_ulong_t)&lp5521_cfg, }, /* Three channel chip */
+	{ .name = "lp5521", .driver_data = (kernel_ulong_t)&lp5521_cfg }, /* Three channel chip */
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp5521_id);
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 4ed3e735260c..39cb26d343c1 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -346,8 +346,8 @@ static struct lp55xx_device_config lp5523_cfg = {
 };
 
 static const struct i2c_device_id lp5523_id[] = {
-	{ "lp5523",  .driver_data = (kernel_ulong_t)&lp5523_cfg, },
-	{ "lp55231", .driver_data = (kernel_ulong_t)&lp5523_cfg, },
+	{ .name = "lp5523",  .driver_data = (kernel_ulong_t)&lp5523_cfg },
+	{ .name = "lp55231", .driver_data = (kernel_ulong_t)&lp5523_cfg },
 	{ }
 };
 
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index 14a4af361b26..9e6056821eb5 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -395,7 +395,7 @@ static struct lp55xx_device_config lp5562_cfg = {
 };
 
 static const struct i2c_device_id lp5562_id[] = {
-	{ "lp5562", .driver_data = (kernel_ulong_t)&lp5562_cfg, },
+	{ .name = "lp5562", .driver_data = (kernel_ulong_t)&lp5562_cfg },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp5562_id);
diff --git a/drivers/leds/leds-lp5569.c b/drivers/leds/leds-lp5569.c
index a252ba6c455d..199db3efca65 100644
--- a/drivers/leds/leds-lp5569.c
+++ b/drivers/leds/leds-lp5569.c
@@ -514,7 +514,7 @@ static struct lp55xx_device_config lp5569_cfg = {
 };
 
 static const struct i2c_device_id lp5569_id[] = {
-	{ "lp5569",  .driver_data = (kernel_ulong_t)&lp5569_cfg, },
+	{ .name = "lp5569", .driver_data = (kernel_ulong_t)&lp5569_cfg },
 	{ }
 };
 
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index ee4ff4586bc0..946c27fd74cc 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -130,7 +130,7 @@ static struct lp55xx_device_config lp8501_cfg = {
 };
 
 static const struct i2c_device_id lp8501_id[] = {
-	{ "lp8501",  .driver_data = (kernel_ulong_t)&lp8501_cfg, },
+	{ .name = "lp8501",  .driver_data = (kernel_ulong_t)&lp8501_cfg },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp8501_id);
diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 7a436861c4b7..69f064781f69 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -333,7 +333,7 @@ static int lp8860_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lp8860_id[] = {
-	{ "lp8860" },
+	{ .name = "lp8860" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp8860_id);
diff --git a/drivers/leds/leds-lp8864.c b/drivers/leds/leds-lp8864.c
index 3afd729d2f8a..204727f2f350 100644
--- a/drivers/leds/leds-lp8864.c
+++ b/drivers/leds/leds-lp8864.c
@@ -270,8 +270,8 @@ static int lp8864_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lp8864_id[] = {
-	{ "lp8864" },
-	{}
+	{ .name = "lp8864" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp8864_id);
 
diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 0344189bb991..54fd344adc74 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -67,10 +67,10 @@ enum {
 };
 
 static const struct i2c_device_id pca9532_id[] = {
-	{ "pca9530", pca9530 },
-	{ "pca9531", pca9531 },
-	{ "pca9532", pca9532 },
-	{ "pca9533", pca9533 },
+	{ .name = "pca9530", .driver_data = pca9530 },
+	{ .name = "pca9531", .driver_data = pca9531 },
+	{ .name = "pca9532", .driver_data = pca9532 },
+	{ .name = "pca9533", .driver_data = pca9533 },
 	{ }
 };
 
diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 2007fe6217ec..273383351ba0 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -764,12 +764,12 @@ static int pca955x_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pca955x_id[] = {
-	{ "pca9550", (kernel_ulong_t)&pca955x_chipdefs[pca9550] },
-	{ "pca9551", (kernel_ulong_t)&pca955x_chipdefs[pca9551] },
-	{ "pca9552", (kernel_ulong_t)&pca955x_chipdefs[pca9552] },
-	{ "ibm-pca9552", (kernel_ulong_t)&pca955x_chipdefs[ibm_pca9552] },
-	{ "pca9553", (kernel_ulong_t)&pca955x_chipdefs[pca9553] },
-	{}
+	{ .name = "pca9550", .driver_data = (kernel_ulong_t)&pca955x_chipdefs[pca9550] },
+	{ .name = "pca9551", .driver_data = (kernel_ulong_t)&pca955x_chipdefs[pca9551] },
+	{ .name = "pca9552", .driver_data = (kernel_ulong_t)&pca955x_chipdefs[pca9552] },
+	{ .name = "ibm-pca9552", .driver_data = (kernel_ulong_t)&pca955x_chipdefs[ibm_pca9552] },
+	{ .name = "pca9553", .driver_data = (kernel_ulong_t)&pca955x_chipdefs[pca9553] },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pca955x_id);
 
diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 050e93b04884..e3a81c60ee27 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -88,10 +88,10 @@ static struct pca963x_chipdef pca963x_chipdefs[] = {
 #define PCA963X_BLINK_PERIOD_MAX	10667
 
 static const struct i2c_device_id pca963x_id[] = {
-	{ "pca9632", pca9633 },
-	{ "pca9633", pca9633 },
-	{ "pca9634", pca9634 },
-	{ "pca9635", pca9635 },
+	{ .name = "pca9632", .driver_data = pca9633 },
+	{ .name = "pca9633", .driver_data = pca9633 },
+	{ .name = "pca9634", .driver_data = pca9634 },
+	{ .name = "pca9635", .driver_data = pca9635 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pca963x_id);
diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index 6ad06ce2bf64..59951207fd04 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -188,10 +188,10 @@ static int pca995x_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pca995x_id[] = {
-	{ "pca9952", .driver_data = (kernel_ulong_t)&pca9952_chipdef },
-	{ "pca9955b", .driver_data = (kernel_ulong_t)&pca9955b_chipdef },
-	{ "pca9956b", .driver_data = (kernel_ulong_t)&pca9956b_chipdef },
-	{}
+	{ .name = "pca9952", .driver_data = (kernel_ulong_t)&pca9952_chipdef },
+	{ .name = "pca9955b", .driver_data = (kernel_ulong_t)&pca9955b_chipdef },
+	{ .name = "pca9956b", .driver_data = (kernel_ulong_t)&pca9956b_chipdef },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pca995x_id);
 
diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 4e5dd76d714d..03518bf60f6c 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -390,7 +390,7 @@ static int st1202_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id st1202_id[] = {
-	{ "st1202-i2c" },
+	{ .name = "st1202-i2c" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, st1202_id);
diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index fd0e8bab9a4b..9afe2722986c 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -182,7 +182,7 @@ struct tca6507_chip {
 };
 
 static const struct i2c_device_id tca6507_id[] = {
-	{ "tca6507" },
+	{ .name = "tca6507" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tca6507_id);
diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index 6605e08a042a..2f272cfd2e91 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -214,9 +214,9 @@ tlc591xx_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tlc591xx_id[] = {
-	{ "tlc59116" },
-	{ "tlc59108" },
-	{},
+	{ .name = "tlc59116" },
+	{ .name = "tlc59108" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tlc591xx_id);
 
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 25ee5c1eb820..ed6a47bbb44f 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -532,7 +532,7 @@ static const struct of_device_id of_omnia_leds_match[] = {
 MODULE_DEVICE_TABLE(of, of_omnia_leds_match);
 
 static const struct i2c_device_id omnia_id[] = {
-	{ "omnia" },
+	{ .name = "omnia" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, omnia_id);
diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index e4f0f25a5e45..143020945e23 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -605,9 +605,9 @@ static void ktd202x_shutdown(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ktd202x_id[] = {
-	{"ktd2026", KTD2026_NUM_LEDS},
-	{"ktd2027", KTD2027_NUM_LEDS},
-	{}
+	{ .name = "ktd2026", .driver_data = KTD2026_NUM_LEDS },
+	{ .name = "ktd2027", .driver_data = KTD2027_NUM_LEDS },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ktd202x_id);
 

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3


