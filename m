Return-Path: <linux-leds+bounces-1979-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B33C90A052
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jun 2024 00:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9F75B209B9
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 22:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D5313BC35;
	Sun, 16 Jun 2024 21:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UI8/EfOl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756B513B5B5;
	Sun, 16 Jun 2024 21:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718574970; cv=none; b=WNbWtSPOMjPcjAOC4ggHEnkr907Y+jSRzgGsZELG03+08KMfIKchjXD7CP99Ja3RRl9Wk2f8xomBTKuwcfZ5GVjTnAMGkgYYUJ9bzwMEfcqBjefjQb9LTuQerk/cqiwyUZAXeyT9BWXgwUYUYNbZpFOBRCwqBuVkQuZrBFU5Q4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718574970; c=relaxed/simple;
	bh=Qri5xysaOutaV7cRmfiajw/hUm4xS4gzT2WmqGJ6O6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jefg3IHQEpxwV4DmTUhxdOPpOrXZixKtshyTumKP6PAblJ1p1n8QN3vzQfvUbmPODCcKacFO9OIO+EkGt6QujJzRT8Uo3i4OFIzWTE2q4vZ1VP16sF9Qkgw3G7env7W5P8ut4iwNDb0/Hr55GEj3/amxigbxKhPxC+MXXx/y8pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UI8/EfOl; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-35f236a563cso3100925f8f.2;
        Sun, 16 Jun 2024 14:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718574967; x=1719179767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZO2jSTOjjW2TJhM4hgpkZ9GfcYTJ+1yDgbg82D4U2A=;
        b=UI8/EfOlAFySVBQEJKF735FO6LruumMNxqOmOurYYPKIR2UEuiBTxac3WWvj0ony7W
         srR/MrhsgXqeuCdp4pCrkLue+LLxnuVloGNud1Bo0frMDVso55XAowCx4AYsuJZ5hPDT
         3NUhE6K7STVtuT3s7IH3ZltIP/oVfdAClCeoq9ZTPLY7TwkUuxVHPuULHwl2SjS4e/lW
         DfbIQS+rodhr6Ij4gDkMLNU4PFQpjbkd2j8kBNnRQkqaq8QYKtE7JnngPCDm3xv+aD+l
         o0BdAyj4xS9kr3xdBuh8fzOMABtmHEwRHp4AKuhIfvkn8nXyY9RnrNjAYpW772KwJ8Gi
         LyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718574967; x=1719179767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZO2jSTOjjW2TJhM4hgpkZ9GfcYTJ+1yDgbg82D4U2A=;
        b=pF0HEvxwHSOQaFAjmYi+IkPuutq3woBsf/MykZtCJWCgBjwdeOlbbON0dd/NHGUtl8
         UHxxN8gKcCdDS7p7zxyYC/z0wzyY1RUTX8yX0ezDyDTVZ/kDa7BQ4PkMlIumFj7XugcY
         9sM0zkXi4kNsUGZEM87q5FMI/nGvrUskP74p4ix5Q5e4M6WfA54MR/Fheb3232Bjcc2A
         jB9dAs+jNFcRmY2HHfky5ycANWwD0wykMf2xW1DZd8M7N0cLWyvyH+w1qE14xNdwMfp7
         dufb/VWEiC5itQiDL0EFVcSDp/DWQI5GaWGFxD+OLsPMpBQFd5N/xiMusutKqaT3MJw8
         axmw==
X-Forwarded-Encrypted: i=1; AJvYcCVlH4Rk0xsY0VEbPehZaqINzQHfq4tPaXZeU2NVp24WHJh5Jzrhyc1yMvme9/qYA5/S8lAs/ZYWwItfY4BnUh+ZiRQeVYriSIekbD3voQWDx8IuEEAAPPjHcKkigBRi/13gvL4BTkzIqTe5LYOroxI+nw4xdY46FEVIyU/d/FoScjnr5Z4=
X-Gm-Message-State: AOJu0YyYTLSpBAqS0zJAE8j4fvJ+KWJelYRXzFh/zgcc267CsDjD8Yaj
	eGBCO2FMg8X64hzxsVG4J/5xbrDSk/xUaikEvlajYg/Hu9OUaaEx
X-Google-Smtp-Source: AGHT+IHAFj5gRKjdBtB+Bnd+nwCZgAD0ffVEVs45lOY0jlsiu/eVDsT06IspppH/RWvxNXW5Zr21eA==
X-Received: by 2002:adf:f6cc:0:b0:35f:1f28:2ec9 with SMTP id ffacd0b85a97d-3607a784494mr4992853f8f.70.1718574966782;
        Sun, 16 Jun 2024 14:56:06 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b74sm10362879f8f.107.2024.06.16.14.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 14:56:06 -0700 (PDT)
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
Subject: [PATCH v6 19/20] leds: leds-lp55xx: drop deprecated defines
Date: Sun, 16 Jun 2024 23:52:18 +0200
Message-ID: <20240616215226.2112-20-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240616215226.2112-1-ansuelsmth@gmail.com>
References: <20240616215226.2112-1-ansuelsmth@gmail.com>
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


