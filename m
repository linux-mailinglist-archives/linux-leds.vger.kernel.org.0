Return-Path: <linux-leds+bounces-4426-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7226FA7DA5A
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 11:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 247F316F4E3
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 09:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362FE230996;
	Mon,  7 Apr 2025 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBZc9oIk"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5DE225412;
	Mon,  7 Apr 2025 09:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019640; cv=none; b=Z6hMHySrS8AAJKvVAvhcA6LV4zSX0cfD4W5go060rJSTlhm6rpKjq6bKchpbCDO6vftRO3oDR0Mbx9lfiv/Z7iRejrnF2g+hI8hu7G8lClIuWrILthyON/3RPwRUSQxoBqdTTqetCQuSAl05d7xVAAniyib5eOYFCsn2d6NzSXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019640; c=relaxed/simple;
	bh=X2dSJBfeAfgLO86sKTLc1abIYOdaHiNbuzLhh0gWuSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AnH2jT8xUC8rJa9Cg4BxO8XVU3IeMgbnVcNzee1qnyTCtXY/MTkpx/Z0R3kFA4E6JnXDAoZWv+pLN1T1Bflz8xtdgVeOCAuSQk9hYJF19tj9Zm/TiswpEGFU4eDgT509vfXQpllDSKuAXU0oLCkWU7RgqONEG5qzYbvAqFYh6Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBZc9oIk; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227a8cdd241so46369195ad.3;
        Mon, 07 Apr 2025 02:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744019638; x=1744624438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqsxLQYznUT9RsPhQAq/Ha4vcZ/fvmuGVrYbn4a8PBA=;
        b=UBZc9oIkrTzLaHNXM9zkay9HKqBxu3gESy45mxBuHeJ/WaZvh2b16YJy/XWW7VS5vf
         X3SNkxnZWTd3yurQCE2eWyoaBtRGp3Ge59+LH0ZYV1hoBc/rCwwd2/ewG4LyVigWGaJY
         HnVc+JRdo8OIzkFCoRpFgF++j64NJbASBMV+vdH02qI4/DW5kT5d7K+DvKZTA48hzcsW
         Ng4ckq9wytXUeWaC76BM5TjiGb/FL3N++q7DnF9PVzqVW8aeSNC32gXyGWWpvqHCpjnQ
         RDwUiGj53drRUbMr1C8ChVYEWGgrqXa/LuWk6fJfR5rg4YP5WThIfUs+TEAbaanNkhrY
         quBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019638; x=1744624438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqsxLQYznUT9RsPhQAq/Ha4vcZ/fvmuGVrYbn4a8PBA=;
        b=MxZ738XTecehvWPTKZwOvaeKx/mGpz8LeAs1rWCXcYPVtT34V9DsPUC0cSfHpL1X76
         pxFJe/9ZosQaix5SUzqqSvccaUWfM6rUUJNTc5J2mCXosIKtC20ub0c5nxn/GtA8ExVX
         0T3RCgl341gOfiJw+JroTEHYK9Sa52SvYOubgYlfxVD2UB0B5LRRH8KBc+ZLsAu2dSbw
         R4R79nUumdgI/NHR53++EWP/08radZMuKmmvjpgMDYuzMck5YPVPEHr/bpMNNUo5aqEQ
         5nuf6iXy7Ppz6kP5MGZ2lqjtw789if+kkcHbRvIDWQNH0RZYDucNsvvqfXnTG0P4L/kC
         7o9w==
X-Forwarded-Encrypted: i=1; AJvYcCW9dRUeLpUMv6UnOgwBfbIvzf5Z3FTXPjuZGM+3yxKp5LtOE2V7pcaWKzrmMkT4ZDYy7Iq8S5YjlOyXaaI=@vger.kernel.org, AJvYcCWJWoOogmiw9TzB0mGz1wYctKMjYoCcLMm+zSqf3Qs+F3oZv9cBbCT7YwzbNQcmraA9RvElSMLd8oly@vger.kernel.org, AJvYcCWfYJ3rN9CKw88KWxHfV2BDdBfpOtD17XRJKTIj4k8dbmv6AvW7/9r3vmmfK9rK8R7l//Mdpj05+mncyy7X@vger.kernel.org, AJvYcCXMTSV4i61GgK3bGchYyRvdeswrcCu+zQiDOtjxNId3Q4qqtYJtGP5bID91cuVO9nn1Bb6d94TdvVEGoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfcw2LcPNMXUzGla//zeDlZPVA7ZqJxuEilTjgFTkJLMetYvG2
	61aIpTfrLXfkuxjcrnZ7vgla4O5r/HuhhmETNWZG8ba/12jIwcOt
X-Gm-Gg: ASbGncv6XdwqAX8/0iM1hQSmXpOYBTcIARwjyxNyJkJ/akSpPIXLZ+aAi9vQ+MiWxyv
	0PTOlgRcNVS5NZYumo1mNPw84Pyyj238r6IrDVa/n+yG5liNQqSesziF1unYZ4ezGXcjjippwdI
	YOiBYI1ymg9t/oWcJFxy8ShdKoprKW6m64Eho7F6RzFAHWzCHukTcIvHxYL02ylp4J9s0LZ/5+a
	Kxn26oyejf1KrQ3JCYGnZtqRvLkzyky7dcvhmjTmRvBKvDiAouz5bysrR1pFluOAQko+4E5rBLP
	cpTpTI167nud7lWl414fWOox7h8BFLMS5RFf0oggIKA=
X-Google-Smtp-Source: AGHT+IEuCKwpckL0Z9qXyRFKR/AGg8nN7XQo8YQhcxfUUoLSqUZ0cLSWOWcAvb+fY4I/YHLsAll3+Q==
X-Received: by 2002:a17:902:ebc7:b0:21f:dbb:20a6 with SMTP id d9443c01a7336-22a95573892mr114847295ad.33.1744019637847;
        Mon, 07 Apr 2025 02:53:57 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bfddfsm77213805ad.66.2025.04.07.02.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:53:57 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Jianhua Lu <lujianhua000@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 2/4] backlight: ktz8866: add slave handler
Date: Mon,  7 Apr 2025 17:51:17 +0800
Message-ID: <20250407095119.588920-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407095119.588920-1-mitltlatltl@gmail.com>
References: <20250407095119.588920-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kinetic ktz8866, found in many android devices, nowadays, some oem use
dual ktz8866 to support a larger panel and  higher brightness, original
driver would only handle half backlight region on these devices,
registering it twice is unreasonable, so adding the slave handler to
support it.

Note that, none of the devices supported by upstream require this, the
devices using this is porting.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/video/backlight/ktz8866.c | 68 +++++++++++++++++++++++++++----
 1 file changed, 59 insertions(+), 9 deletions(-)

diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
index 351c2b4d6..017ad80dd 100644
--- a/drivers/video/backlight/ktz8866.c
+++ b/drivers/video/backlight/ktz8866.c
@@ -3,6 +3,9 @@
  * Backlight driver for the Kinetic KTZ8866
  *
  * Copyright (C) 2022, 2023 Jianhua Lu <lujianhua000@gmail.com>
+ *
+ * Apr 2025 - Pengyu Luo <mitltlatltl@gmail.com>
+ *	Added handling for dual KTZ8866(master and slave)
  */
 
 #include <linux/backlight.h>
@@ -43,11 +46,17 @@
 #define LCD_BIAS_EN 0x9F
 #define PWM_HYST 0x5
 
+struct ktz8866_slave {
+	struct i2c_client *client;
+	struct regmap *regmap;
+};
+
 struct ktz8866 {
 	struct i2c_client *client;
 	struct regmap *regmap;
-	bool led_on;
 	struct gpio_desc *enable_gpio;
+	struct ktz8866_slave *slave;
+	bool led_on;
 };
 
 static const struct regmap_config ktz8866_regmap_config = {
@@ -56,16 +65,22 @@ static const struct regmap_config ktz8866_regmap_config = {
 	.max_register = REG_MAX,
 };
 
-static int ktz8866_write(struct ktz8866 *ktz, unsigned int reg,
-			 unsigned int val)
+static void ktz8866_write(struct ktz8866 *ktz, unsigned int reg,
+			  unsigned int val)
 {
-	return regmap_write(ktz->regmap, reg, val);
+	regmap_write(ktz->regmap, reg, val);
+
+	if (ktz->slave)
+		regmap_write(ktz->slave->regmap, reg, val);
 }
 
-static int ktz8866_update_bits(struct ktz8866 *ktz, unsigned int reg,
-			       unsigned int mask, unsigned int val)
+static void ktz8866_update_bits(struct ktz8866 *ktz, unsigned int reg,
+				unsigned int mask, unsigned int val)
 {
-	return regmap_update_bits(ktz->regmap, reg, mask, val);
+	regmap_update_bits(ktz->regmap, reg, mask, val);
+
+	if (ktz->slave)
+		regmap_update_bits(ktz->slave->regmap, reg, mask, val);
 }
 
 static int ktz8866_backlight_update_status(struct backlight_device *backlight_dev)
@@ -124,10 +139,41 @@ static void ktz8866_init(struct ktz8866 *ktz)
 		ktz8866_write(ktz, LCD_BIAS_CFG1, LCD_BIAS_EN);
 }
 
+static int ktz8866_slave_register(struct ktz8866 *ktz)
+{
+	struct device *dev = &ktz->client->dev;
+	struct ktz8866_slave *slave;
+	struct i2c_client *client;
+	struct device_node *np;
+
+	np = of_find_compatible_node(NULL, NULL, "kinetic,ktz8866-slave");
+	if (!np)
+		return 0;
+
+	client = of_find_i2c_device_by_node(np);
+	of_node_put(np);
+	if (!client)
+		return 0;
+
+	slave = devm_kzalloc(dev, sizeof(*slave), GFP_KERNEL);
+	if (!slave)
+		return -ENOMEM;
+
+	slave->client = client;
+	slave->regmap = devm_regmap_init_i2c(client, &ktz8866_regmap_config);
+	if (IS_ERR(slave->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(slave->regmap),
+				     "failed to init regmap\n");
+
+	ktz->slave = slave;
+
+	return 0;
+}
+
 static int ktz8866_probe(struct i2c_client *client)
 {
 	struct backlight_device *backlight_dev;
-	struct backlight_properties props;
+	struct backlight_properties props = {};
 	struct ktz8866 *ktz;
 	int ret = 0;
 
@@ -151,7 +197,6 @@ static int ktz8866_probe(struct i2c_client *client)
 	if (IS_ERR(ktz->enable_gpio))
 		return PTR_ERR(ktz->enable_gpio);
 
-	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;
 	props.max_brightness = MAX_BRIGHTNESS;
 	props.brightness = DEFAULT_BRIGHTNESS;
@@ -163,6 +208,11 @@ static int ktz8866_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, PTR_ERR(backlight_dev),
 				"failed to register backlight device\n");
 
+	ret = ktz8866_slave_register(ktz);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to register slave\n");
+
 	ktz8866_init(ktz);
 
 	i2c_set_clientdata(client, backlight_dev);
-- 
2.49.0


