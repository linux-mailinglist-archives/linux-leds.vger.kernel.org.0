Return-Path: <linux-leds+bounces-2095-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A21591150D
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 23:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD0B01F23ACD
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 21:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11EF15B558;
	Thu, 20 Jun 2024 21:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gj9Zr4rx"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB0215AAC1;
	Thu, 20 Jun 2024 21:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718919717; cv=none; b=roQ3ysHz1CnnHJHPPFNUt9O41ty42FUHk3JJ8s9QIcZ1wQ8JeUGMXjEoFtovQoywKYqsQ327zNYPnJdOA0umloQd/E/jYogkBgKZRpt5APtvunovHoU+KaCp3iNBK6Ek+XwnUm1HJVSZVnnU/JNyqwjfXxpus9qhg6CzxBLG8Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718919717; c=relaxed/simple;
	bh=nA6S+D3r9en9RPR0VVUrNP1Uukp9Qu5XclTQ7m4h5G0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nKF+XrJgfDQNLRpMmuB2Vjir3zlh/Jygx9KsFcQtPY3X5ZJiyvmd37pdVxJQK8sUq51/8w3nbTF2VS1Z1C8thBGCxxtjIPZDsoNpXmwiI0VlvnzingJJlk7Igvf83JqmNhys2ndgo04uwxUjqcpuNtGUPCkvZp1rzqQPcjottVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gj9Zr4rx; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3608e6d14b6so987079f8f.0;
        Thu, 20 Jun 2024 14:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718919714; x=1719524514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DddTKLoW+PPYUSvSFIuzDD8SGvM2v8GitD/QPej7SSQ=;
        b=Gj9Zr4rxaLrYb9zprIqucXb7MDnUiI+OVZMBkuGI3LGTPBGZ0V8fiZ6FDMmoZB7s5U
         JBWANE/JvPyTccqac1hLrK4MfJVMqdXRVUAGWWOgXkX+0zWj4YEhnE+m5eVcy2edsdBi
         5mpwNlXXvVCmq8a9rxCj4iNTHC2osPzAETS0kam6smeu3wkTXM1WOAInN5hjxNPqZCFU
         vo/94WWZhp2CAe1fH0aKRfCmPkfgzYDHy01Ob7m21Wycgf6WLl+xuWsmawDzi4Yz5/LX
         xs4hR84Stp5r0cJHl/dfp9AUUuVXmgsjWhoyKt7i5HS2LfXVV9K4Rq0n/Qmkhm228GyJ
         XJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718919714; x=1719524514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DddTKLoW+PPYUSvSFIuzDD8SGvM2v8GitD/QPej7SSQ=;
        b=au3WIkqZWD+H6XvbqMIStYcve3cKzcWZuEGrqtNt3MrsY3OoIhrucuCkhl5olvp9tH
         UTJ5yziXl2F5PgpIYnWtKRG0zrOkAtJScuyd9BeESkSWCWQYhCkp0ErD8i/2MA/2lVA5
         y1pm20bHXXFHVgypDcgtttG28fCc/C3v0GCQa7EeL5EVJvz4dWt3Nv0l+rs83VF8/BWN
         zSEzFPfIhKE4tU0yWvGEZj3pNieyf8W/OmC4OdQ4Hzb9NVdBvcMpQS1WgDxvAa09JPOo
         0R4KbjFTvjvrUzxgIpnP2crrZJ0TQmhGCaWk4kBU8AnAHvjm52kaq4sanKg3Myx9O5P2
         KYoA==
X-Forwarded-Encrypted: i=1; AJvYcCV1lpbGbiJ954JN1c3SJSjMU9I0Fh3zjUlBf4Cf3GKzV/es4v444M+GOdsV8u712ltv95OlThLlgDXE74iyxFrhLRfUxr9PpwU8hX+zlfQIzFQL0vyh4kyGgZE3XIQSWN2zHjrSpj5KZzp0znzIfZjR+7h3tsamnxkPGoGU1UA1JkYtJWg=
X-Gm-Message-State: AOJu0YyTJRfAB3ve9k0TNPt1jULxPEGzle6mJkQqH+mDN6KN7e8G/Q7r
	TONyYvVLhxqBtDe0w0gWZVntQNhwQ9qRMw6hJ/MkAlc1MP+rNJu7qWejDg==
X-Google-Smtp-Source: AGHT+IGf3fiWg8vvd3bkA6Jv4H54SKxc5jQBJ2LdfCyVfQRTvA8cmsxpUBbjgdxm2nSQG98azGm99A==
X-Received: by 2002:a5d:438a:0:b0:362:ec51:b9ea with SMTP id ffacd0b85a97d-36317b7d437mr5263809f8f.34.1718919714148;
        Thu, 20 Jun 2024 14:41:54 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366383f68acsm48866f8f.2.2024.06.20.14.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:41:53 -0700 (PDT)
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
Subject: [PATCH v7 19/20] leds: leds-lp55xx: Drop deprecated defines
Date: Thu, 20 Jun 2024 23:03:35 +0200
Message-ID: <20240620210401.22053-20-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240620210401.22053-1-ansuelsmth@gmail.com>
References: <20240620210401.22053-1-ansuelsmth@gmail.com>
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


