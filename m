Return-Path: <linux-leds+bounces-2146-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8209186C0
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46C5EB274AF
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CA71922F8;
	Wed, 26 Jun 2024 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyJ5eLiv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015ED18EFE4;
	Wed, 26 Jun 2024 16:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417653; cv=none; b=lqMlQVP4r0waXBYAttC2NYxraEKvCREHLyyRDKFOVnqrEiLw5WbjxQcbLM00q3PVHJVIuTKApy6MWEB7VXDgy0opwvvREZN5Ay4e238rmzgfpmEOCOjCVOtl9wdt7Idy703P3LPibq9h1OLbxPjj5Zx0xfpcFlDHGqAiWcnr9B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417653; c=relaxed/simple;
	bh=nA6S+D3r9en9RPR0VVUrNP1Uukp9Qu5XclTQ7m4h5G0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8XBRYkLlnz0Ph0QRVl8hIfYrSCe8FeZk5GisNynXjZDrv5Ws8yqn3Wx3qRTTY6Xud77X5hBPI46djtxtvAJWIzlFRgNAQBCNHe0YPmzFVs7dDlr2mC9zBgQRunr4rjXTrecmkKzgtCECnLkvGtTbEk4dFokLFcEMhXCm6Coszk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyJ5eLiv; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-365663f51adso5013961f8f.1;
        Wed, 26 Jun 2024 09:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417650; x=1720022450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DddTKLoW+PPYUSvSFIuzDD8SGvM2v8GitD/QPej7SSQ=;
        b=cyJ5eLivCcI6guuZyg2p/VIJXQfIj+/hQ0NYEl7d54+OfgVDKDWE2bIq+S1STN/bFn
         BQuKPhZRmX8pwHW4UeQHz1HoHZCB+X7o9C3Xs+YLj427ARB3hK6DLs8HN2udibeSd6Ip
         1NwiGUYNa4Y1sx8qbuyPk11xn8sFw7m18DjlJh3HAGHcArD11vA1NcGXQWoyrzUs8U3R
         RgqBdu0wb+RPRyUoZZmqvHkjJSCqavhRgWKa/OVWJLzzdH4W6YzCR31nGjjhZ2ujYEQ1
         tEjXWbq8h26s1IYRg2x1u4UmqR1DsCMLFpYTA11yVaDM2VhjpR4Q5oWrM+cobdMy1bjl
         ATSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417650; x=1720022450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DddTKLoW+PPYUSvSFIuzDD8SGvM2v8GitD/QPej7SSQ=;
        b=Zuwt51NskDEovNuVWewo0Gel1Zs47RL3eW5eCY2s1DJCubhew2jFydEv6gLAT6dXDe
         zS2G+QoverrV9tcXr8d2vO//arYOzDbfzMjvcCYkaHQex5ZhqqpcHjodOdqmSR7t+vHD
         8n1BEApg/jJRnlfi+FwhUDShC+jdcjCnr6aQAxZ9i3rR/FJDU1ouw8MvAYarUmc7OUrn
         4rvQk9u+waKTso2VWUj04e9vNK3UxMZB669kux6ITz6GpD5A+8zJc7yxeOzXN2Kg4onL
         EnkvOUzHxQDuDvoFN/hH6EP0Qn2jeKO/HLpQozEtVD6uKm0IsORkW31KDiRGLIXH683G
         X9xQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0JPxehtpmF8VdMAkenD3+TiUk5+JHsTwSQbUjtgdnkb1ojrrQEJM1Z/3BjmXjs/43JyQ0T5KuQ8XcLlBVMuFB7CBeJMEBcFyASS8DhBKI6K7PGBig8t8Wtq2XXJn8TXxzd3K94KGMG/IToEdWcYRQ+jCzHCUP31G/2uLDDrvv4bRo7Jg=
X-Gm-Message-State: AOJu0YxTjJ/wkoWubiXLzp7f+siEYWVQMa/8mbk5AjlCiVb8i+pvQiSI
	IhOC8SwESfuW6ysvb/c6XkVR57iQS4ApMiiEoyqP87wb0N6PNbKc
X-Google-Smtp-Source: AGHT+IFFFFL8mwhqpa87z58xmNPmxmNU7IvC2mkgj44t5JcdkISvcG8WSkXCCBpshu5qh8VrEV3/4g==
X-Received: by 2002:a05:6000:22f:b0:35f:276c:ac5f with SMTP id ffacd0b85a97d-366e4ede0f1mr6036235f8f.40.1719417650226;
        Wed, 26 Jun 2024 09:00:50 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b88easm16180589f8f.39.2024.06.26.09.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:00:49 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v8 19/20] leds: leds-lp55xx: Drop deprecated defines
Date: Wed, 26 Jun 2024 18:00:24 +0200
Message-ID: <20240626160027.19703-20-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240626160027.19703-1-ansuelsmth@gmail.com>
References: <20240626160027.19703-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop deprecated defines not used anymore as the related function got
moved to lp55xx-common.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5521.c | 24 --------------------
 drivers/leds/leds-lp5523.c | 46 --------------------------------------
 drivers/leds/leds-lp5562.c | 15 -------------
 drivers/leds/leds-lp8501.c | 31 -------------------------
 4 files changed, 116 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 519e7627ac22..de0f8ea48eba 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -21,7 +21,6 @@
 
 #include "leds-lp55xx-common.h"
 
-#define LP5521_PROGRAM_LENGTH		32
 #define LP5521_MAX_LEDS			3
 #define LP5521_CMD_DIRECT		0x3F
 
@@ -73,29 +72,6 @@
 /* Reset register value */
 #define LP5521_RESET			0xFF
 
-/* Program Memory Operations */
-#define LP5521_MODE_R_M			0x30	/* Operation Mode Register */
-#define LP5521_MODE_G_M			0x0C
-#define LP5521_MODE_B_M			0x03
-#define LP5521_LOAD_R			0x10
-#define LP5521_LOAD_G			0x04
-#define LP5521_LOAD_B			0x01
-
-#define LP5521_R_IS_LOADING(mode)	\
-	((mode & LP5521_MODE_R_M) == LP5521_LOAD_R)
-#define LP5521_G_IS_LOADING(mode)	\
-	((mode & LP5521_MODE_G_M) == LP5521_LOAD_G)
-#define LP5521_B_IS_LOADING(mode)	\
-	((mode & LP5521_MODE_B_M) == LP5521_LOAD_B)
-
-#define LP5521_EXEC_R_M			0x30	/* Enable Register */
-#define LP5521_EXEC_G_M			0x0C
-#define LP5521_EXEC_B_M			0x03
-#define LP5521_EXEC_M			0x3F
-#define LP5521_RUN_R			0x20
-#define LP5521_RUN_G			0x08
-#define LP5521_RUN_B			0x02
-
 static inline void lp5521_wait_opmode_done(void)
 {
 	/* operation mode change needs to be longer than 153 us */
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 54ead09488a5..57df920192d2 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -73,54 +73,8 @@
 #define LP5523_EXT_CLK_USED		0x08
 #define LP5523_ENG_STATUS_MASK		0x07
 
-#define LP5523_FADER_MAPPING_MASK	0xC0
-#define LP5523_FADER_MAPPING_SHIFT	6
-
-/* Memory Page Selection */
-#define LP5523_PAGE_ENG1		0
-#define LP5523_PAGE_ENG2		1
-#define LP5523_PAGE_ENG3		2
-#define LP5523_PAGE_MUX1		3
-#define LP5523_PAGE_MUX2		4
-#define LP5523_PAGE_MUX3		5
-
-/* Program Memory Operations */
-#define LP5523_MODE_ENG1_M		0x30	/* Operation Mode Register */
-#define LP5523_MODE_ENG2_M		0x0C
-#define LP5523_MODE_ENG3_M		0x03
-#define LP5523_LOAD_ENG1		0x10
-#define LP5523_LOAD_ENG2		0x04
-#define LP5523_LOAD_ENG3		0x01
-
-#define LP5523_ENG1_IS_LOADING(mode)	\
-	((mode & LP5523_MODE_ENG1_M) == LP5523_LOAD_ENG1)
-#define LP5523_ENG2_IS_LOADING(mode)	\
-	((mode & LP5523_MODE_ENG2_M) == LP5523_LOAD_ENG2)
-#define LP5523_ENG3_IS_LOADING(mode)	\
-	((mode & LP5523_MODE_ENG3_M) == LP5523_LOAD_ENG3)
-
-#define LP5523_EXEC_ENG1_M		0x30	/* Enable Register */
-#define LP5523_EXEC_ENG2_M		0x0C
-#define LP5523_EXEC_ENG3_M		0x03
-#define LP5523_EXEC_M			0x3F
-#define LP5523_RUN_ENG1			0x20
-#define LP5523_RUN_ENG2			0x08
-#define LP5523_RUN_ENG3			0x02
-
-#define LED_ACTIVE(mux, led)		(!!(mux & (0x0001 << led)))
-
-enum lp5523_chip_id {
-	LP5523,
-	LP55231,
-};
-
 static int lp5523_init_program_engine(struct lp55xx_chip *chip);
 
-static inline void lp5523_wait_opmode_done(void)
-{
-	usleep_range(1000, 2000);
-}
-
 static int lp5523_post_init_device(struct lp55xx_chip *chip)
 {
 	int ret;
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index 109162f1720f..6ba5dbb9cace 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -37,21 +37,6 @@
 
 /* OPMODE Register 01h */
 #define LP5562_REG_OP_MODE		0x01
-#define LP5562_MODE_ENG1_M		0x30
-#define LP5562_MODE_ENG2_M		0x0C
-#define LP5562_MODE_ENG3_M		0x03
-#define LP5562_LOAD_ENG1		0x10
-#define LP5562_LOAD_ENG2		0x04
-#define LP5562_LOAD_ENG3		0x01
-#define LP5562_RUN_ENG1			0x20
-#define LP5562_RUN_ENG2			0x08
-#define LP5562_RUN_ENG3			0x02
-#define LP5562_ENG1_IS_LOADING(mode)	\
-	((mode & LP5562_MODE_ENG1_M) == LP5562_LOAD_ENG1)
-#define LP5562_ENG2_IS_LOADING(mode)	\
-	((mode & LP5562_MODE_ENG2_M) == LP5562_LOAD_ENG2)
-#define LP5562_ENG3_IS_LOADING(mode)	\
-	((mode & LP5562_MODE_ENG3_M) == LP5562_LOAD_ENG3)
 
 /* BRIGHTNESS Registers */
 #define LP5562_REG_R_PWM		0x04
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index 1fb876f64cb7..ee4ff4586bc0 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -20,28 +20,14 @@
 
 #include "leds-lp55xx-common.h"
 
-#define LP8501_PROGRAM_LENGTH		32
 #define LP8501_PAGES_PER_ENGINE		1
 #define LP8501_MAX_LEDS			9
 
 /* Registers */
 #define LP8501_REG_ENABLE		0x00
 #define LP8501_ENABLE			BIT(6)
-#define LP8501_EXEC_M			0x3F
-#define LP8501_EXEC_ENG1_M		0x30
-#define LP8501_EXEC_ENG2_M		0x0C
-#define LP8501_EXEC_ENG3_M		0x03
-#define LP8501_RUN_ENG1			0x20
-#define LP8501_RUN_ENG2			0x08
-#define LP8501_RUN_ENG3			0x02
 
 #define LP8501_REG_OP_MODE		0x01
-#define LP8501_MODE_ENG1_M		0x30
-#define LP8501_MODE_ENG2_M		0x0C
-#define LP8501_MODE_ENG3_M		0x03
-#define LP8501_LOAD_ENG1		0x10
-#define LP8501_LOAD_ENG2		0x04
-#define LP8501_LOAD_ENG3		0x01
 
 #define LP8501_REG_PWR_CONFIG		0x05
 #define LP8501_PWR_CONFIG_M		0x03
@@ -65,25 +51,8 @@
 #define LP8501_REG_RESET		0x3D
 #define LP8501_RESET			0xFF
 
-#define LP8501_REG_PROG_PAGE_SEL	0x4F
-#define LP8501_PAGE_ENG1		0
-#define LP8501_PAGE_ENG2		1
-#define LP8501_PAGE_ENG3		2
-
 #define LP8501_REG_PROG_MEM		0x50
 
-#define LP8501_ENG1_IS_LOADING(mode)	\
-	((mode & LP8501_MODE_ENG1_M) == LP8501_LOAD_ENG1)
-#define LP8501_ENG2_IS_LOADING(mode)	\
-	((mode & LP8501_MODE_ENG2_M) == LP8501_LOAD_ENG2)
-#define LP8501_ENG3_IS_LOADING(mode)	\
-	((mode & LP8501_MODE_ENG3_M) == LP8501_LOAD_ENG3)
-
-static inline void lp8501_wait_opmode_done(void)
-{
-	usleep_range(1000, 2000);
-}
-
 static int lp8501_post_init_device(struct lp55xx_chip *chip)
 {
 	int ret;
-- 
2.45.1


