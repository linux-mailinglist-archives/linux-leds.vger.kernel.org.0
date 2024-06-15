Return-Path: <linux-leds+bounces-1949-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA52F909A8F
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 01:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5429628233E
	for <lists+linux-leds@lfdr.de>; Sat, 15 Jun 2024 23:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72A313C3CF;
	Sat, 15 Jun 2024 23:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvKacfKk"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D112F13B792;
	Sat, 15 Jun 2024 23:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718493191; cv=none; b=dj1f94+4ba/zlLGgtx+P63IBDTs7/b/ywZAkTgefYTZaJ59JOHNNhJyLQlBrz1+0rToTqg8tBbUqAb6df7c4mkszTPcYX2DEL/5FDGMruOpfWTtWLbu8HHbHKADpkxtMEQK6TaZ+4S4xDnyLZ9OE0dDeNeqkh0Vrsn8qQ52wW7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718493191; c=relaxed/simple;
	bh=Qri5xysaOutaV7cRmfiajw/hUm4xS4gzT2WmqGJ6O6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2K4rIK0WbLLZyqYlKS/t9k1aifsESj+tGX1hL3gcD/zJFIIGgKNqRWMJEjP6b8cRlNSw17P6WjdXmjz+UlZdCSJv5ryGPPBRy28KvFb9u4yPwIRR8ac17ez0nomg2TRXNXftoUFivmQlkHoM9HD3jzQZDD1CpcTcBcDm3TDaYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvKacfKk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-35f236a563cso2693941f8f.2;
        Sat, 15 Jun 2024 16:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718493188; x=1719097988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZO2jSTOjjW2TJhM4hgpkZ9GfcYTJ+1yDgbg82D4U2A=;
        b=cvKacfKkfPRpHh5fLiQI/386W2vL7Bk54d6Xsxncg8F1Ra2NXUXUq9U27Qi6Ouwrgb
         UgpfvcKD5iBtzmkThlUo3uH8W1hFHAcmUQZzuFmlP4M1boWbLSUuLkRFGqT/CVFoxe1w
         Ecm5MwgRP2v5L6TCilfOMnlGyXyaKglVghYDl+WQTVDQilsouPccOvZthmDQKaDjViRS
         mG6ZLcEfr9WcnnkNK3DbLwIuRSUbjwTwSHh9PrOaSxW3j+FLU6aluE3dzn9VPQsN0ApH
         OqSUO7OpExg5XUVD+6AX4S3DOAGR/SO1BW7NF60nMjZZjIXOv2/RUs+fr1sEtSObRNVF
         2Bzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718493188; x=1719097988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZO2jSTOjjW2TJhM4hgpkZ9GfcYTJ+1yDgbg82D4U2A=;
        b=YM8ql8UDpUtcMRwAvkGa2cPPJSHGrEoYxpDHsyNhE6rwS3lJY8TH/Wo+ZfIjG2JWym
         FRyMGjj+4P67seusH9cOy8DAYP/dgGp4olbyZQbPK3GmRaxHqrGSjWmuMFD3JoVkzu6s
         SyTbybpq5GlpTThivl7c9YhOt1R7TpRLDH/OBJJ8J5JMQyBeGp96ncEdCGi3YnQqNSnG
         ufScLHbdVDIBu6I5ByuZEijXBmxKwbUYqKgkD29mcxFvHyJ+GWYPa2tTJt87BOTu/rAh
         ctcX3R/N7X8IhLb3bEQojqk0GuL1NUgX45/WjD6n+fKWMfhAMm0EUnWKZaliaFOecnIL
         t7hA==
X-Forwarded-Encrypted: i=1; AJvYcCX2L7VwgNqcobj+L9dPQ5BCK15JAzN98SO5gmEueOkXBcFFvghapfejLGSrWii9d/gOGZMAKFqGW9D7M/hUjVYnhcN+7IjiuapsI1UCX1tQm2ywwiBy7LoFQceP4/UBRqq9r8L9jxsTPzuJhGcGo1aDDF5Eo43DyrxjqaaL5jaZoIxwf9c=
X-Gm-Message-State: AOJu0YzkOECblIrgI0wQnTELlCzVVP/27E2gExcDWdiZe2GTQ/0+pysj
	rzw/c1vZzm3oRrr79Hw+D680+1Giq3JbMXAMianhybqH/0iVjtt1
X-Google-Smtp-Source: AGHT+IG7NLtcLSkyl76usc4zy3b6iXheFgskBkDQjdlsxrMfyJcQrbL5TBfiZQgjqXqjKnDlkriLIA==
X-Received: by 2002:a5d:6312:0:b0:360:6435:b37 with SMTP id ffacd0b85a97d-3607a726087mr4898708f8f.9.1718493188148;
        Sat, 15 Jun 2024 16:13:08 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3607509355dsm8145532f8f.13.2024.06.15.16.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 16:13:07 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v5 19/20] leds: leds-lp55xx: drop deprecated defines
Date: Sun, 16 Jun 2024 01:11:49 +0200
Message-ID: <20240615231152.28201-20-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240615231152.28201-1-ansuelsmth@gmail.com>
References: <20240615231152.28201-1-ansuelsmth@gmail.com>
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
index 1d00c6cc4174..eb686240f097 100644
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
2.43.0


