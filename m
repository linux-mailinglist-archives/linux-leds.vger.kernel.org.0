Return-Path: <linux-leds+bounces-4427-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F12EA7DA6B
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 11:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99FF016882B
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 09:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A68234964;
	Mon,  7 Apr 2025 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWW1g7qZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529DE23372D;
	Mon,  7 Apr 2025 09:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019649; cv=none; b=N5fNbyLeGrIUBtDvDPmLk7DcZtW0plQKbFw6urYJGzH4Yq9xAgdOfxyRTg8590ktneYuNnwM67TMpSFnXwVlmYPsP/xYhRs9S32PsHHt8XJRkIpL/KN0KJdNWhjxJiUNF+Jj6xeYlQaje8xJwMpRTL8JK/JzitTWheX4sNfRgPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019649; c=relaxed/simple;
	bh=/62GKGmmu3E9YZWHOM6Xl3Z0iVTLdRYw5PPueeHH5Dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NP4O+FjyrCU5WkembweZO05p0zwU40IcOyp5tJ3H0u26/KSEc1dxtEysItnFtZNDI7TJFOkHwW/zhVQB/gM6NGQ3mxS7zMfPrTgWqJVxSnkHPYkNQySD769PFBgM3SYi0AEQhwit1ll3Vr6iTgX61Q1OBcdQk5UKXYaJr0h4QgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWW1g7qZ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227d6b530d8so33591965ad.3;
        Mon, 07 Apr 2025 02:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744019647; x=1744624447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8diRuAQehXi7R+D5qp01L9GbmQB2F98eyfpHLigrsU=;
        b=jWW1g7qZi8bAlcPd31sLQt6Ib7Ve4MRbkCbN+3CmqOdrbNKGT64XITBS/MdgX3oD08
         sExi1nvxknXBLtGovey/rcZ8imvQZEQc/iXL5w+afyIB2nhNdIosG3tSVKjW8YvTnrHE
         OlNEfZT+89qzolyM0jApTMEXyDzQsLmX06aIfo8rKYHHY8F9zvqoC8WREOlPdTM9bOiE
         oVQgJYFVMJLHTxpNrHsAHUW/WO9LIs8WAKtDbQcyO3AHHh1nWsJ4Iz01IS1qkx4HZuU6
         NyyAmhfYZWGZUOVHwfe4X1RIuQ6n/JyjR7n/AWZ6tDn/dB8pnJ8QkpZvi9Y1evWMYl8j
         hg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019647; x=1744624447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8diRuAQehXi7R+D5qp01L9GbmQB2F98eyfpHLigrsU=;
        b=v9A0iYT1Vc9ZVt+8jDvYfHsI8X30P+mPifi72rwL0/EJeG1iKXevnLl01FIrXvkMhi
         IGvmmIn5v3Prj7nPujE0I9eSHXJ+bjdP2HCeHRGo/Zn0F6TetiMQTC/QX9zEnFhQ3fwo
         KG7ioOwLBMFNmdf1q+L47rESwOYB+lHy0hmmm3Ha9WpRqtXV/3Hr3hD0Ta4I1sqFtX7H
         nTygRk2nctB5sOIxOYIfbzr7AJbDkHqGBQiRVT33Tiz+2Iq+FmIrNSJPYC/ID9MEuxje
         csnt4IscO72MjYH6vc9HVOkz3V9MP7xLc1QNM48JzXlZ9DQnGFXHh1Fsj6iIGnmWx0aR
         CiUg==
X-Forwarded-Encrypted: i=1; AJvYcCVnB5277Rg5MzH9czlwj4q8c6OIdcNhuoTRnKouJmklUeTk32RS+okVJjBW0AxVV3rBN9d1Mp9PpTRPHQ==@vger.kernel.org, AJvYcCXHRb0uK6XvUo+yBuur3fu8KO4dANKIHjLOe0SpvyuKULt1BtfCSYY0J2mR/UYGc8CNdigM3qNzWqPHXslO@vger.kernel.org, AJvYcCXZmgv0e2C++sbzFnny5qnfZWGiXMze9eMhmOjezeD2m6vusAaQxaiYEg04I8MUIRJ1f4POV4/pajd4qSc=@vger.kernel.org, AJvYcCXdP/oGt69JMH4ZoWWExyAtQG+Czn+ZD2PjfXElYMYyo0HJnBxUUcq/yMwZhcGvDo6EbRNN5BNZ0mwF@vger.kernel.org
X-Gm-Message-State: AOJu0YyECW4TMR7koTRjh7qZs4DTR7kLr23l5dTY0sQOMwSPik22RSmc
	71lVz4j4gX4w0I4ZhJzak2LjlcALoGkuB8YkQCIvfKMaTSYrEfJetlpB/HWNxbI=
X-Gm-Gg: ASbGncvByYk0DLR9/I/QF6YUJPSf1lUv1lFQWDO4dZmc7XetmQ/EPT8Cde5Py/4uzRQ
	kHMmpB1yGrY13RRbuqOpYN7Ut8ayt5FsPLCPYuRTWBrHpZ8iIUAyWm5NYv8MMmuwSL3hS3rMiEN
	LKzXSj98d8kwpA1HDEcEc/YVJlfLqg876IYU2ATH2KToZb6PElh+WYpim8lCuQyJKcAUxkwWUHZ
	+ccqy2V1u/FNJq8Xj/GSKDfRbqci1jdbSEagDn7k2hYg7Yc1vKn17VqTfYdxJsDFNtixw4nQ9wE
	a/H+8cxPivGvlRISkbC4wT9rMtMP/8X1cXlyLO63sIs=
X-Google-Smtp-Source: AGHT+IEZza3sL31uGEXE9GqOZmRwDZovRtw/5y2xgKCiRmfb48lzBMArT3fRLQbnoTwMSm5KJMfMfw==
X-Received: by 2002:a17:903:18d:b0:225:abd2:5e4b with SMTP id d9443c01a7336-22a8a05e84fmr162795925ad.16.1744019647625;
        Mon, 07 Apr 2025 02:54:07 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bfddfsm77213805ad.66.2025.04.07.02.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:54:07 -0700 (PDT)
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
Subject: [PATCH 3/4] backlight: ktz8866: improve current sinks setting
Date: Mon,  7 Apr 2025 17:51:18 +0800
Message-ID: <20250407095119.588920-4-mitltlatltl@gmail.com>
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

I polled all registers when the module was loading, found that
current sinks have already been configured. Bootloader would set
when booting. So checking it before setting the all channels.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/video/backlight/ktz8866.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
index 017ad80dd..b67ca136d 100644
--- a/drivers/video/backlight/ktz8866.c
+++ b/drivers/video/backlight/ktz8866.c
@@ -46,6 +46,8 @@
 #define LCD_BIAS_EN 0x9F
 #define PWM_HYST 0x5
 
+#define CURRENT_SINKS_MASK GENMASK(5, 0)
+
 struct ktz8866_slave {
 	struct i2c_client *client;
 	struct regmap *regmap;
@@ -65,6 +67,12 @@ static const struct regmap_config ktz8866_regmap_config = {
 	.max_register = REG_MAX,
 };
 
+static inline void ktz8866_read(struct ktz8866 *ktz, unsigned int reg,
+				unsigned int *val)
+{
+	regmap_read(ktz->regmap, reg, &val);
+}
+
 static void ktz8866_write(struct ktz8866 *ktz, unsigned int reg,
 			  unsigned int val)
 {
@@ -112,11 +120,18 @@ static void ktz8866_init(struct ktz8866 *ktz)
 {
 	unsigned int val = 0;
 
-	if (!of_property_read_u32(ktz->client->dev.of_node, "current-num-sinks", &val))
+	if (!of_property_read_u32(ktz->client->dev.of_node, "current-num-sinks", &val)) {
 		ktz8866_write(ktz, BL_EN, BIT(val) - 1);
-	else
-		/* Enable all 6 current sinks if the number of current sinks isn't specified. */
-		ktz8866_write(ktz, BL_EN, BIT(6) - 1);
+	} else {
+		/*
+		 * Enable all 6 current sinks if the number of current
+		 * sinks isn't specified and the bootloader didn't set
+		 * the value.
+		 */
+		ktz8866_read(ktz, BL_EN, &val);
+		if (!(val && CURRENT_SINKS_MASK))
+			ktz8866_write(ktz, BL_EN, CURRENT_SINKS_MASK);
+	}
 
 	if (!of_property_read_u32(ktz->client->dev.of_node, "kinetic,current-ramp-delay-ms", &val)) {
 		if (val <= 128)
-- 
2.49.0


