Return-Path: <linux-leds+bounces-6525-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E67CF288E
	for <lists+linux-leds@lfdr.de>; Mon, 05 Jan 2026 09:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 721F8302E17A
	for <lists+linux-leds@lfdr.de>; Mon,  5 Jan 2026 08:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51925328626;
	Mon,  5 Jan 2026 08:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVKa/TFv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E83F328622
	for <linux-leds@vger.kernel.org>; Mon,  5 Jan 2026 08:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603111; cv=none; b=RNNzmwE/xOhV3Fr+OwSRB1dur/BX6AMNdX2eA3tWDhNEzzUPbQP1DjR+sTh5ehAk2F4w5LtmoKVsuIBslgDI3cg6wX46+fQJT+mNB4scEN4MobPEho5VqND8kYfJUnqabn4EHt+vtAL70fPHdu++L1Cb+/JxLsLfgN4msfnmOFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603111; c=relaxed/simple;
	bh=ZQ6Y7IFZTaEd6ktsVoxdPOs72CPIs+7PsUG1QLPNjHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V6ppMc15cQL9r1Su66r1WLCJ2wDfIbjs8gdtzVsloE9nle7DWO07tOqNkvmsFWj8LTjqsl//n+O0y6tnmQdiCeY2oAVbvsGxCWdQgh07ClVsCxatlHp4OHesdERKZtJkW1JUVNpGfBC2ui15wx2dtEcM78bNWRr7v5UHksWObWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVKa/TFv; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34c2f52585fso12463487a91.1
        for <linux-leds@vger.kernel.org>; Mon, 05 Jan 2026 00:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767603104; x=1768207904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFt+oA/6TnGUcf1mQLhvyTPCz7K2SXMiNJhoCpH+0PQ=;
        b=fVKa/TFvf8XIfjlirfLhfwDttkkYRLbl0EB2WfX0NiEgjrgaMKeUci0BORuosejzsW
         v4AXvruwrwxC5Bi1VpHCv/B2VswHBLIa4YYYvVDXUYqcADYjqUkLvtrVM73RLhh9WygU
         CgBNmGEjTF2R4Zs+VnjT17r/4Ho6gWCukz3bbOPmtio0Vkqp1sE34w8ElpkagVKeKKkX
         cqfJ+kMW0hwzDViK0RNQVHGOADhuHeZve/cDTzI3zSYgvxDs+2EwSbBGONCRqnpONzj1
         x/ceBlTCPwdtjxVGhbwg1sso0UNuLevOceR9akSqgLBScHnAMVjI74ywOxCEjQsl8kUD
         U3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603104; x=1768207904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bFt+oA/6TnGUcf1mQLhvyTPCz7K2SXMiNJhoCpH+0PQ=;
        b=NAlRs81C9dRViDUkoI+hqB16miyAHqHE/17+FtotKDzeJXYu0rCPEO3l5ngI/a9pXM
         yl1XffrqqGkbUqbgYNlVCxZz37zy061aauPGP6iJWnSgCpg86kTW8hBpPnzaITBBBout
         q1dTKTUTGThemodOaVAdpAaJrMhcUa8alhYKBoawjbg8AzobULO3FQuI0rf5bFpAocsK
         cKUnbChK6EHMP+JBueVm8H/ngssgr4gyknL5EJbu5l2H1Hr8Un4U+mpQ6l25X/UDT+bU
         8jCMIy3sm/F4C1MRDTUKgcaaOULY9drDLGvntOtdQMHp/GYZIGqjpRlYoSxW+0BnJtR4
         hLEg==
X-Forwarded-Encrypted: i=1; AJvYcCWA6Xo8B5ngLnHyICCDqngYRvXjqUS/RR68/3xjmINVZLdk7KFQnipS0xNpkakwROaAfq98ePDSZDaF@vger.kernel.org
X-Gm-Message-State: AOJu0YynpvpeyB8C2OV5aAHRvgWxW1zeGXqYqOGK8yPNkprjSN9oFQV/
	PiItJoWQymYDfJ5fTq7oTpIbvJop7R8po1lNMIkIAPRf75PA8E7YeNhD
X-Gm-Gg: AY/fxX6xVt1yNlbaWgEjiM0NbRilwxE5e9FM85t4rk1YLoxG8Jhn9pCR5m5bn1KO7oU
	4B2JbkNXtXThb1iBuHaYyeq0NX0Et0L5gvMzr8D8yxiL+ojPOcwfcxO2E4qlFVNd5aO7jQbYFue
	nU+ybYyD+SjJoa8EaKCnPdQM3phpPsalPNlEBFbxU6xvB/hOCb+xdQFcbyBEBMaw/fYVh8XWGz5
	NBAB+q4e4J20XEGZe0gUfiK2gIbOyxat+pdcpFO6UWe0+wuWdpm9Q3/PNgYbm9JJVviJtDkW7uo
	ToS/Mq7t74iztouZKZafBNxQKH/j0Qve67WxuC4ucwySZ0M/cJXx4b0Av+poI+W5SUHhLfq5Qln
	9PKAMUHC469O0XH4bp3RMfElMitzreFffJzibL0fCBJwK7pd5+W7w15Ud4rkY+ZhrVHw6ni5wIW
	Xou5xncXUwhFZvP+0FOcHXrwbsgPf/1RueiuuL
X-Google-Smtp-Source: AGHT+IE9h/a5pga/RcO3GaC9CZMJm/hBktjxAoM256+iS35FTfAipE1WuhDdgjBTuxYdSkDNtweQhg==
X-Received: by 2002:a17:90a:d60c:b0:34c:4c6d:ad0f with SMTP id 98e67ed59e1d1-34e921f0e35mr38658346a91.37.1767603103621;
        Mon, 05 Jan 2026 00:51:43 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f476fab12sm5631951a91.5.2026.01.05.00.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 00:51:43 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com
Cc: deller@gmx.de,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v1 2/2] backlight: gpio: add support for multiple GPIOs for backlight control
Date: Mon,  5 Jan 2026 14:21:20 +0530
Message-Id: <20260105085120.230862-3-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105085120.230862-1-tessolveupstream@gmail.com>
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the gpio-backlight driver to handle multiple GPIOs instead of a
single one. This allows panels that require driving several enable pins
to be controlled by the backlight framework.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 drivers/video/backlight/gpio_backlight.c | 61 +++++++++++++++++-------
 1 file changed, 45 insertions(+), 16 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 728a546904b0..037e1c111e48 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -17,14 +17,18 @@
 
 struct gpio_backlight {
 	struct device *dev;
-	struct gpio_desc *gpiod;
+	struct gpio_desc **gpiods;
+	unsigned int num_gpios;
 };
 
 static int gpio_backlight_update_status(struct backlight_device *bl)
 {
 	struct gpio_backlight *gbl = bl_get_data(bl);
+	unsigned int i;
+	int br = backlight_get_brightness(bl);
 
-	gpiod_set_value_cansleep(gbl->gpiod, backlight_get_brightness(bl));
+	for (i = 0; i < gbl->num_gpios; i++)
+		gpiod_set_value_cansleep(gbl->gpiods[i], br);
 
 	return 0;
 }
@@ -52,6 +56,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
 	int ret, init_brightness, def_value;
+	unsigned int i;
 
 	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
 	if (gbl == NULL)
@@ -62,10 +67,22 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 
 	def_value = device_property_read_bool(dev, "default-on");
 
-	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
-	if (IS_ERR(gbl->gpiod))
-		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
-				     "The gpios parameter is missing or invalid\n");
+	gbl->num_gpios = gpiod_count(dev, NULL);
+	if (gbl->num_gpios == 0)
+		return dev_err_probe(dev, -EINVAL,
+			"The gpios parameter is missing or invalid\n");
+	gbl->gpiods = devm_kcalloc(dev, gbl->num_gpios, sizeof(*gbl->gpiods),
+				   GFP_KERNEL);
+	if (!gbl->gpiods)
+		return -ENOMEM;
+
+	for (i = 0; i < gbl->num_gpios; i++) {
+		gbl->gpiods[i] =
+			devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
+		if (IS_ERR(gbl->gpiods[i]))
+			return dev_err_probe(dev, PTR_ERR(gbl->gpiods[i]),
+					"Failed to get GPIO at index %u\n", i);
+	}
 
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;
@@ -78,22 +95,34 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	}
 
 	/* Set the initial power state */
-	if (!of_node || !of_node->phandle)
+	if (!of_node || !of_node->phandle) {
 		/* Not booted with device tree or no phandle link to the node */
 		bl->props.power = def_value ? BACKLIGHT_POWER_ON
-					    : BACKLIGHT_POWER_OFF;
-	else if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
-		bl->props.power = BACKLIGHT_POWER_OFF;
-	else
-		bl->props.power = BACKLIGHT_POWER_ON;
+						    : BACKLIGHT_POWER_OFF;
+	} else {
+		bool all_high = true;
+
+		for (i = 0; i < gbl->num_gpios; i++) {
+			if (gpiod_get_value_cansleep(gbl->gpiods[i]) != 0) {
+				all_high = false;
+				break;
+			}
+		}
+
+		bl->props.power =
+			all_high ? BACKLIGHT_POWER_ON :  BACKLIGHT_POWER_OFF;
+	}
 
 	bl->props.brightness = 1;
 
 	init_brightness = backlight_get_brightness(bl);
-	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
-	if (ret) {
-		dev_err(dev, "failed to set initial brightness\n");
-		return ret;
+
+	for (i = 0; i < gbl->num_gpios; i++) {
+		ret = gpiod_direction_output(gbl->gpiods[i], init_brightness);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					"failed to set gpio %u direction\n",
+					i);
 	}
 
 	platform_set_drvdata(pdev, bl);
-- 
2.34.1


