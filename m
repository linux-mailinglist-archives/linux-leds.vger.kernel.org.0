Return-Path: <linux-leds+bounces-6469-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5C0CE5594
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 19:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C184F3009F89
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 18:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B807223708;
	Sun, 28 Dec 2025 18:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMtNsV5w"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2466DF76
	for <linux-leds@vger.kernel.org>; Sun, 28 Dec 2025 18:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766946209; cv=none; b=MZyyKz1znJzJ9Nwi8MFVK9WYZfACD2U/nc0ZKwBYSyXNXIIKZgb3QcPTvobWxBUivvTVPk4giZBB6xWKKQK/RiuifP4RUynGetDyv06XvXLfDcJNCCe4Ul3NnpqLZdfTCTLKIuHmHpEFCqea+iX7/cFcgSxEuIpHO/re8nUrfb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766946209; c=relaxed/simple;
	bh=K4LQESP6GGf63BCsmF9vMctAumWtsHiuSYGBCsui6YM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kaaND1WjMwfWrVjTDJ9/NcE4JtdIjdOzh3v4GiFC+tVj+XoMrArC38Szpi5x7FtMncCJmLsRcS46+ORxqULibQb6Cd68DXY2ZC0RKSYfLbUnD9J32A6ZSpzI8A0kWnvnDSxXl59yqLYZ80Qb4YCboyNJUEVtS9RWKUuwoVszMR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMtNsV5w; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso9864753b3a.2
        for <linux-leds@vger.kernel.org>; Sun, 28 Dec 2025 10:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766946207; x=1767551007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkdE5l/HUinu6TeEObtdhSK+GF0LhcNAQFzhLXpKZVw=;
        b=mMtNsV5wJA1j4ak5WR0TTb5gkH0TeD/IPtAzaBdOmx4c6iCoXG30KD4MSL/hEe3D6h
         GjRKQ8oD/lvP5fUvAPasUObTBBeCm+pWtJOVNDru/QIvk9MOzrTWwNI/tsEN0b71YWIm
         nh8RpFmVqkdjEJZEG9tsGL1wCZwHwpCtYOM5eAcBOxVhVjm+nChRRlSYzlZAIzZiGJE7
         1kNzQnm0GpdrzFgscGyT9TBgoId7Hgse8ftdtXpQvSGF6CinY4MvC5m6571t905Kalxw
         Wya3DhVO13eL59cxlvXlkarROY9+XsnmVLu61CFklWXDQvwUMTLb1i8EJgW2iYFjucsU
         pXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766946207; x=1767551007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EkdE5l/HUinu6TeEObtdhSK+GF0LhcNAQFzhLXpKZVw=;
        b=Ua5R7FK5rQOY6WXN/Zvwo2tu1pC2sxXTkp0oS/huKSCTAqD0/A8oMmfMAkx5jaQJR4
         dv5i0n0w0nUcAY+Jnky8gTykU5Xm2/cNkpRBNp7ceRiO6J2kNIUNTY3/8HBySAtv6U34
         O4/OzxBBKlofLD8RA1kM5N/hkoQKLMNqmK5IGZy/jzOonvvoDg/jwFoftFwsD3sxrQcm
         E2dvfzZ06ekuIVf4cfYc3ILrKzNtbSizFDpFjJWpiFbqe/ZoHT/px6X/x/Bj+O04VeBf
         DHICDT+AppFzvkdSS9ne0gmIyHhc2LFcmwx7u+UrLHTy2+XHNO2FOqKMiwOytWKuFAuX
         kb1g==
X-Forwarded-Encrypted: i=1; AJvYcCXlCIbzPQorU3KbFFNda+TDvepZzepNnaiq2lzpSK/jFtRBBEgamjPD4QSXBA76hpb8WtmSoCjS8Yfz@vger.kernel.org
X-Gm-Message-State: AOJu0YwVlJ2loPqOlbWVKM3ead5rTb5Lei0ZjktTX0TJdf3Z3J9By/xa
	7dMPD52qWpJuuRwVjS86jMpwtS1qtfKCOKCgs67a5x+X3ipi3qwQf5OFjODoEQ==
X-Gm-Gg: AY/fxX6vO4m38cy/iLUYjaXXIErLs5VPFVzsUY9eQO/+9itQcBPXBKdf/RHnEjQnzUE
	KMmQoOv6tPLhBr/rZ05nkno2QMvErN0blnHMA/7mXPOXvqe5z2qjq701CFByYKl4wrcRoRrRTHj
	EkdFLU2DKWq7oba5hjeExOvLn5lxGYwepiuIdSgORrdW6g/PcKlWnE0aW1iIqZnpyIN1oA4YAm9
	KOuQM/1dLZQ8A2W1M3Nx07xohGLNE+5cp3aSGu9y29sXNi+gs1dMR8+U2q7jH/9GdwqbZ/Il9e9
	Kna4SQgdsF1l5DzKic88VxUjUZogudnQGp8Ugh798fxEAP2oWYJtFAnCSZzdyeJxgLR61evPEOW
	BFR1wjIcWSTOhpuKkybEc4Ba2S+lLlN8dHPxXMYD1M94sQT6d/+el2RID4OupA/fW9JnQjq7h6l
	5FtK54vLFpbOnZdyoDHh3/JDv01Gi8k5DC
X-Google-Smtp-Source: AGHT+IH1ciHaGvga5UKhiYwprGTfm350FqOD5uYTLN+3icVoNs6IyqO3D84jiognK/Gh/JgjaaUdpQ==
X-Received: by 2002:a05:6a00:1ca6:b0:7b9:8142:96f4 with SMTP id d2e1a72fcca58-7ff648e78ecmr23917898b3a.21.1766946207200;
        Sun, 28 Dec 2025 10:23:27 -0800 (PST)
Received: from MRSPARKLE.localdomain ([150.228.155.85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f3d7sm27399695b3a.51.2025.12.28.10.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 10:23:26 -0800 (PST)
From: Jonathan Brophy <professorjonny98@gmail.com>
To: lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Andriy Shevencho <andriy.shevchenko@linux.intel.com>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [RFC PATCH 1/2] leds: core: Add support for led-instance property
Date: Mon, 29 Dec 2025 07:22:44 +1300
Message-ID: <20251228182252.1550173-2-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251228182252.1550173-1-professorjonny98@gmail.com>
References: <20251228182252.1550173-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonathan Brophy <professor_jonny@hotmail.com>

Add support for parsing an optional "led-instance" device tree property
that provides a third component in LED naming for deterministic
identification when multiple LEDs share the same function and color.

The led-instance becomes part of the LED name as:
  color:function:instance

This solves the non-deterministic _1, _2 suffix problem for hardware
with many identical LEDs (e.g., 48-port network switches).

Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
---
 drivers/leds/led-core.c | 43 +++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 59473f286b31..5a72dbe44303 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -475,7 +475,8 @@ EXPORT_SYMBOL_GPL(led_sysfs_enable);

 static void led_parse_fwnode_props(struct device *dev,
 				   struct fwnode_handle *fwnode,
-				   struct led_properties *props)
+				   struct led_properties *props,
+				   const char **instance)
 {
 	int ret;

@@ -501,7 +502,7 @@ static void led_parse_fwnode_props(struct device *dev,


 	if (!fwnode_property_present(fwnode, "function"))
-		return;
+		goto parse_instance;

 	ret = fwnode_property_read_string(fwnode, "function", &props->function);
 	if (ret) {
@@ -511,7 +512,7 @@ static void led_parse_fwnode_props(struct device *dev,
 	}

 	if (!fwnode_property_present(fwnode, "function-enumerator"))
-		return;
+		goto parse_instance;

 	ret = fwnode_property_read_u32(fwnode, "function-enumerator",
 				       &props->func_enum);
@@ -522,6 +523,14 @@ static void led_parse_fwnode_props(struct device *dev,
 	} else {
 		props->func_enum_present = true;
 	}
+
+parse_instance:
+	/* Parse optional instance identifier */
+	if (fwnode_property_present(fwnode, "led-instance")) {
+		ret = fwnode_property_read_string(fwnode, "led-instance", instance);
+		if (ret)
+			dev_err(dev, "Error parsing 'led-instance' property (%d)\n", ret);
+	}
 }

 int led_compose_name(struct device *dev, struct led_init_data *init_data,
@@ -530,12 +539,13 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
 	struct led_properties props = {};
 	struct fwnode_handle *fwnode = init_data->fwnode;
 	const char *devicename = init_data->devicename;
+	const char *instance = NULL;
 	int n;

 	if (!led_classdev_name)
 		return -EINVAL;

-	led_parse_fwnode_props(dev, fwnode, &props);
+	led_parse_fwnode_props(dev, fwnode, &props, &instance);

 	if (props.label) {
 		/*
@@ -554,13 +564,26 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
 		char tmp_buf[LED_MAX_NAME_SIZE];

 		if (props.func_enum_present) {
-			n = snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s-%d",
-				     props.color_present ? led_colors[props.color] : "",
-				     props.function ?: "", props.func_enum);
+			if (instance) {
+				n = snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s-%d:%s",
+					     props.color_present ? led_colors[props.color] : "",
+					     props.function ?: "", props.func_enum,
+					     instance);
+			} else {
+				n = snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s-%d",
+					     props.color_present ? led_colors[props.color] : "",
+					     props.function ?: "", props.func_enum);
+			}
 		} else {
-			n = snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s",
-				     props.color_present ? led_colors[props.color] : "",
-				     props.function ?: "");
+			if (instance) {
+				n = snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s:%s",
+					     props.color_present ? led_colors[props.color] : "",
+					     props.function ?: "", instance);
+			} else {
+				n = snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s",
+					     props.color_present ? led_colors[props.color] : "",
+					     props.function ?: "");
+			}
 		}
 		if (n >= LED_MAX_NAME_SIZE)
 			return -E2BIG;
--
2.43.0

