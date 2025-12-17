Return-Path: <linux-leds+bounces-6448-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C8697CC9464
	for <lists+linux-leds@lfdr.de>; Wed, 17 Dec 2025 19:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5575E3046149
	for <lists+linux-leds@lfdr.de>; Wed, 17 Dec 2025 18:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB5C337692;
	Wed, 17 Dec 2025 18:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7pS1ZSW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D93F33CE8A
	for <linux-leds@vger.kernel.org>; Wed, 17 Dec 2025 18:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765995276; cv=none; b=fIikRvgUJvCO83Ws9cdroQ8no7UQi0JfIlMicuKWOUe2KtMgtzkCyS3h+C35Zh6nsVyDwXO1RNiIwG+TYaNZTbOY0FaMiiGzBw6CZUVjZIVi+D6hBaVTQDJNgSWP8X67nMorYRWQE2vihXwXBG1T+DBlM34Fyg7X/n3aVgcUN2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765995276; c=relaxed/simple;
	bh=K15nuZjaTiUBVKSXtUhPDvjMT3AwbGOD/SO+UT+RLk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UwoAk+PjzvUOscwWVQQLsAV/6xbZWhxo4GTPYFk+7duXdSObf+T+LhL3vcqMDNQZ9GpzvtR8O9CisZ8K5rOpoPb2kJbfXxRYY5dA5rl7qYeq7wRzkTOHoWZQOZM1AJR2mnZkVSQ7suoAfB9g+jxh3JS2PyuyVPm1XX14pum2PoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7pS1ZSW; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-649e28dccadso4524910a12.3
        for <linux-leds@vger.kernel.org>; Wed, 17 Dec 2025 10:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765995273; x=1766600073; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VbVikF+2G1b3d7XO038cFmze5WHGBBZWgyB+3vlCP44=;
        b=O7pS1ZSWIOJDyPqRS1/ZKwWa/vaVFBZb1quTM0M1/jn69zG7HtnJd1CzSEJl52lORy
         ZaUmsvYsJ5v8ePHhxs/GQfQ2aRkplv+xXb3WT92vASgI/crapJ3ouzzE/SM+iETl+GaJ
         9gtr8ec+MkRObbofkmQjwwjZYokrynXgj5HZz048WqbguUz2yt4Vb3+NWU47o60ZROxZ
         0tGABTOrMxj1jJM7bPwZpqRo3iH7e1ElglEqJdMGIhuUnOWW7vAq4Pf9Qb5ern2wwh6z
         Qx7navV4pumQfi+p8MKG9XlLNdSNnmAWYmeQnU0xyPxk06PjKb0dNLIFDmhZDCyfgj5d
         PErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765995273; x=1766600073;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbVikF+2G1b3d7XO038cFmze5WHGBBZWgyB+3vlCP44=;
        b=bq+z2Lv5+829wliSavmZdYWq1FGqCM56k1Nlc+Wvmce10NkBnCmWhaTXBXEAswK01L
         UgUidEk2KRrt6e90PjY627EvWuuxVOY4H2XwL30yWciqo7jYLatRUqinVv86EpJSb0Jq
         f5zghWgz1EGWhkqevaJ8rAyyBNA0mRqLtDk94+24Gn/LsdGIKUbyAFh9pCgj/q3FtWBA
         QKb9Of5qAscbJBe2tcS0KI3rZFu4t69ctmXmZ5MVQ9FNarMDDsXgtfUOXaNRpVKlKZhj
         +1aLAgnejgf00/0OW9c0Kz5LpW5w8fWVk7aXoNhjMvfP3VPqADGJKpevrbVe9XlGmNLi
         PtWA==
X-Forwarded-Encrypted: i=1; AJvYcCVqgrzTfeoPs0L+u6yV98WF7r6T0Tbc+pcr/bYipeTh8a6eYl2ueOaPJN6jZEaAj3hHI5uYsdWXI+yn@vger.kernel.org
X-Gm-Message-State: AOJu0YwHIZyhjgFqlfJpKPmOLa84ZqcmUcdPL2fRIj23xx5HoAQD4AXg
	XT2yYBgXKVIscVPLo+Po/PzqV6BdJnkjNNHDHrrUKn7c59EukZByVXik
X-Gm-Gg: AY/fxX5GbaNwSDwTYr4K51MBqbPI/tfgoAHLX8I5slVQEPnEVzYU4BVM3p6zZeW4tDN
	4uyiVWw3Q07y/GqU5PNYdYkrX9dg2+lVLWTvWBpxqYqClEA6USum1tQ68YRejDXLPCRt/emibLo
	la2iF9yMBpyQVEY8Lhf0mBOZBxB5ipd3az+b663q6UzSCwqYYcw/IoDFY3d/pt/dSpZhNcmCFU/
	oIYsA93R2KG3+um9NIXDXpatUcX3klZykEwbsm0ixOVi15F/38Pbyf+usbN7xKTjjIqv9zZSzld
	fKihcfVkyIRUnWr2A9QWvdLy7PAnfmNnm3G9T/r9Bkil4FOOhR/JgmBXabJaeILlw/arpiLsPJx
	SlSU7yB7C7oF/LLbvfi/z2iAvuiBETKC+3nwvF3/4UCaHhFgRQLsmBOgc9xzgh2YKvvC3wMdkOb
	BwlJQ4bs4dQbA6WGsRSrRwogwVWWIcElxLSY0rb66f9k2KDQn+0W23oOwmkDQ5ThFj
X-Google-Smtp-Source: AGHT+IFj3TCyaBMkYZdzStRuIRqQZOLqF7ec/I58OPcphVai+0kRlE2QbnpuALvqaq35kB4vGBD2QQ==
X-Received: by 2002:a05:6402:1446:b0:640:3210:6e48 with SMTP id 4fb4d7f45d1cf-6499b16a78emr16792502a12.4.1765995272511;
        Wed, 17 Dec 2025 10:14:32 -0800 (PST)
Received: from Radijator.localdomain (93-140-155-17.adsl.net.t-com.hr. [93.140.155.17])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b5886d3d4sm152344a12.19.2025.12.17.10.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 10:14:30 -0800 (PST)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Wed, 17 Dec 2025 19:14:23 +0100
Subject: [PATCH v2] leds: expresswire: Fix chip state breakage
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251217-expresswire-fix-v2-1-4a02b10acd96@dujemihanovic.xyz>
X-B4-Tracking: v=1; b=H4sIAP7yQmkC/3WOTQ6CMBCFr0JmbQ1tQ4OuvIdhUaeDjIlgWq0g6
 d0d2bv83sv7WSFRZEpwrFaIlDnxNAqYXQU4+PFKioMwmNo0dWsOiuZHpJTeHEn1PCvnbNAXi9Z
 4D5ISV+St8dwJD5yeU1y2gax/6v+urJVWfYstOh8cNv0pvG50ZzkyZcb9vHygK6V8AXq18CK2A
 AAA
X-Change-ID: 20250829-expresswire-fix-663d1b3c32aa
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4518;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=88T4mkMcx1ShNFI4rFzfnyovyPLWzXoaZQkJnadZHJY=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDJlOn1kPXbT4s1472WKZyw3dpe2Jh4qWaE3qW/nhToHIL
 ZWPHlK7O0pZGMS4GGTFFFly/zte4/0ssnV79jIDmDmsTCBDGLg4BWAiV84zMjx5bX7ygW2PwbN7
 CVXdOkYWfIssXnzmXPvG6OtWsSSFOdMYGRasKVkneSLe1OvV9r8rfQ4u/ik/4QurQUNA1+KpJfe
 9mTkB
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03

From: Duje Mihanović <duje@dujemihanovic.xyz>

It is possible to put the KTD2801 chip in an unknown/undefined state by
changing the brightness very rapidly (for example, with a brightness
slider). When this happens, the brightness is stuck on max and cannot be
changed until the chip is power cycled.

Fix this by disabling interrupts while talking to the chip. While at it,
make expresswire_power_off() use fsleep() and also unexport some
functions meant to be internal.

Fixes: 1368d06dd2c9 ("leds: Introduce ExpressWire library")
Tested-by: Karel Balej <balejk@matfyz.cz>
Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Changes in v2:
- Update trailers
- Rebase on v6.19-rc1
- Reword commit message (fix grammar errors, simplify text)
- Add Fixes: tag
- Link to v1: https://lore.kernel.org/r/20250829-expresswire-fix-v1-1-f8c8c6ad6c5f@dujemihanovic.xyz
---
 drivers/leds/leds-expresswire.c  | 24 +++++++++++++++++-------
 include/linux/leds-expresswire.h |  3 ---
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-expresswire.c b/drivers/leds/leds-expresswire.c
index bb69be228a6d..25c6b159a6ee 100644
--- a/drivers/leds/leds-expresswire.c
+++ b/drivers/leds/leds-expresswire.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/export.h>
 #include <linux/gpio/consumer.h>
+#include <linux/irqflags.h>
 #include <linux/types.h>
 
 #include <linux/leds-expresswire.h>
@@ -16,37 +17,41 @@
 void expresswire_power_off(struct expresswire_common_props *props)
 {
 	gpiod_set_value_cansleep(props->ctrl_gpio, 0);
-	usleep_range(props->timing.poweroff_us, props->timing.poweroff_us * 2);
+	fsleep(props->timing.poweroff_us);
 }
 EXPORT_SYMBOL_NS_GPL(expresswire_power_off, "EXPRESSWIRE");
 
 void expresswire_enable(struct expresswire_common_props *props)
 {
+	unsigned long flags;
+
+	local_irq_save(flags);
+
 	gpiod_set_value(props->ctrl_gpio, 1);
 	udelay(props->timing.detect_delay_us);
 	gpiod_set_value(props->ctrl_gpio, 0);
 	udelay(props->timing.detect_us);
 	gpiod_set_value(props->ctrl_gpio, 1);
+
+	local_irq_restore(flags);
 }
 EXPORT_SYMBOL_NS_GPL(expresswire_enable, "EXPRESSWIRE");
 
-void expresswire_start(struct expresswire_common_props *props)
+static void expresswire_start(struct expresswire_common_props *props)
 {
 	gpiod_set_value(props->ctrl_gpio, 1);
 	udelay(props->timing.data_start_us);
 }
-EXPORT_SYMBOL_NS_GPL(expresswire_start, "EXPRESSWIRE");
 
-void expresswire_end(struct expresswire_common_props *props)
+static void expresswire_end(struct expresswire_common_props *props)
 {
 	gpiod_set_value(props->ctrl_gpio, 0);
 	udelay(props->timing.end_of_data_low_us);
 	gpiod_set_value(props->ctrl_gpio, 1);
 	udelay(props->timing.end_of_data_high_us);
 }
-EXPORT_SYMBOL_NS_GPL(expresswire_end, "EXPRESSWIRE");
 
-void expresswire_set_bit(struct expresswire_common_props *props, bool bit)
+static void expresswire_set_bit(struct expresswire_common_props *props, bool bit)
 {
 	if (bit) {
 		gpiod_set_value(props->ctrl_gpio, 0);
@@ -60,13 +65,18 @@ void expresswire_set_bit(struct expresswire_common_props *props, bool bit)
 		udelay(props->timing.short_bitset_us);
 	}
 }
-EXPORT_SYMBOL_NS_GPL(expresswire_set_bit, "EXPRESSWIRE");
 
 void expresswire_write_u8(struct expresswire_common_props *props, u8 val)
 {
+	unsigned long flags;
+
+	local_irq_save(flags);
+
 	expresswire_start(props);
 	for (int i = 7; i >= 0; i--)
 		expresswire_set_bit(props, val & BIT(i));
 	expresswire_end(props);
+
+	local_irq_restore(flags);
 }
 EXPORT_SYMBOL_NS_GPL(expresswire_write_u8, "EXPRESSWIRE");
diff --git a/include/linux/leds-expresswire.h b/include/linux/leds-expresswire.h
index a422921f4159..7f8c4795f69f 100644
--- a/include/linux/leds-expresswire.h
+++ b/include/linux/leds-expresswire.h
@@ -30,9 +30,6 @@ struct expresswire_common_props {
 
 void expresswire_power_off(struct expresswire_common_props *props);
 void expresswire_enable(struct expresswire_common_props *props);
-void expresswire_start(struct expresswire_common_props *props);
-void expresswire_end(struct expresswire_common_props *props);
-void expresswire_set_bit(struct expresswire_common_props *props, bool bit);
 void expresswire_write_u8(struct expresswire_common_props *props, u8 val);
 
 #endif /* _LEDS_EXPRESSWIRE_H */

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20250829-expresswire-fix-663d1b3c32aa

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>


