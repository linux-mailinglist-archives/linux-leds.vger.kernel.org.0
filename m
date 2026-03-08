Return-Path: <linux-leds+bounces-7151-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN8+DFjXrGnVvAEAu9opvQ
	(envelope-from <linux-leds+bounces-7151-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 08 Mar 2026 02:56:40 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA8022E49D
	for <lists+linux-leds@lfdr.de>; Sun, 08 Mar 2026 02:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 451AF30197C2
	for <lists+linux-leds@lfdr.de>; Sun,  8 Mar 2026 01:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DEF922FE11;
	Sun,  8 Mar 2026 01:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GX/zlQjF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1195828507B
	for <linux-leds@vger.kernel.org>; Sun,  8 Mar 2026 01:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772934982; cv=none; b=YcfbRFXuaC/tlsngj76HCOtsc8fIk7qq+QYHujBNMpWb6PxWvZfHtq+d4K6eTijuftA7RhhUUd4c3ssaBEfDne/zjjgUqVu496al4uhSw2zDEcqjADIBL0a6Nhb0Uc+D+AhyQMfiNVAkoToAwZ8TXuT+A1nCquZwGx/s+FVT/oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772934982; c=relaxed/simple;
	bh=wihT8f2B57JCAW4+hnTQatiO39AokSGgcJkHwOJkhIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jY01VIqF/f7JPf9N2/BCIuC6SHUcucGf5We0ZugezXcY5d7t7e4bOW7htr6XaDwjOrxg6r38QV6nKRPDUVvpYri5dKaSeAjEgBy7A1LLhomB3AzVFmBlnwet1ns4OUHM/9wl85OaFC0uAoCA+T3r0L04p6gMiCxTpS4nNN1I6i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GX/zlQjF; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cd759f502dso125062685a.3
        for <linux-leds@vger.kernel.org>; Sat, 07 Mar 2026 17:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772934980; x=1773539780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVzNmWbW6cP/6PYv9jBlbu21HDCAtNdYngPdNFBqaQY=;
        b=GX/zlQjFiQyf+Gb3Yaxhyx5qNKj9gmD9vOR2heHy/JKvrH2ImaBPmT8qRrz+EoP8ls
         MjB+CIuwf6n77UsRcz2tDtNR+9fZ5t220Mq48ZyI8kGIUwblfGvm7rDkoOgPf7rv8WSw
         b13vUW/i90WDSoG7ueX7iTHkT0+dYsbR82Yzt0jZbiOC6tUMDOecXSPaJNCja5kUbvzH
         oBUvfAYItoSwmir+FYkv2udzxr9TkQJ5bxx1Yv6Odrygwtwd/VYypgCeWp2Q97NgGeyX
         ROZlCH50Mj1NolPstP/mG3o+eB5Ck29Yl5yh+mPcIYr2JrtuFQ05rgD/xBVzZPcW35s/
         usfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772934980; x=1773539780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uVzNmWbW6cP/6PYv9jBlbu21HDCAtNdYngPdNFBqaQY=;
        b=OAQeI/HGMUVxdFopxi4GE/GbJxPgn4QOvImF4MzfFcc8acBQBKqBW8vTPnLsUcJfKf
         7HYHG24M9cw1vx7Q6shUOqp4ToaTJF/QtLEoyQFy0F7oeQefmyK3p84WSF7U4rCrti4b
         Zt0lf1fBlYhTQXLt2qgvwRlVpsbTu+RU20eXBT5OxnZgAjwNBa3L2tubKxmrEZ4tzKZ9
         1sLb1/xJB+9iUswyHtk8fHqFL8hWAPTo0FVtqTjtEFEq6WkZRLoMDHvl3vMoWock3paG
         wKSXmHGyEpePqVl/aEzuG68QlPqIvJY057XHwwIpgTRF2A+cBdALHKpDh9jzBEA4Y075
         ULvg==
X-Gm-Message-State: AOJu0YzigigsdlqzSZ3lEy5JDOZylRhYiYOqeYTjF+iCyekFafh/2Njd
	hFGLvBlF2wlGA6n6QOkGtgRhUG0TCpCeC4+y16pL5cmki05zOvzJP8iW
X-Gm-Gg: ATEYQzzR2BGjPvBST/ZCL+iqBpQnZDitwsPM0ALKiszOW9cS45/6qB82GqbSXaTrdIy
	A+uyie3nmZ29SQXc1sFUTfJzjpI2ICtFXBYrtjr0yiXTtMZ2TwU/lEPebDeTNYrQXg4XMT6XELV
	6CPJzQTQaRDkcS7vLil9gDr4tCvlP86YbtKLq3/0vW8XwkRYnxdiqqkizkTTEFH346gx4ySIlhc
	zPAZQTbynrAPSXyZ2l7I4T5TRPKvfivMbrPf1VD9xOv5VbVYnBqwWfQpOl6cFWWF3yjg5/1e+5f
	LlgcLmGefpIsB06ZKDCsqmZF19HiWZvxuR3xg242u73WGBQPF3AJrN/VgWFTmxG+VvaO37rz/np
	RPglvKPWZhPcICZlerzqpkONgNEflZ5TSdbgNNxXexbzGfBnQsee515sS+A+xTohj79I4IkzXIQ
	ve34WTXtAvykUR/mP4MNnBiUWt40nWwEvcx2k67go2CCx5CKCECcY=
X-Received: by 2002:a05:620a:470b:b0:8a1:b5ab:bbd6 with SMTP id af79cd13be357-8cd6d4fb49fmr916484985a.71.1772934979988;
        Sat, 07 Mar 2026 17:56:19 -0800 (PST)
Received: from localhost.localdomain ([202.63.77.193])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f57291esm447786985a.50.2026.03.07.17.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 17:56:19 -0800 (PST)
From: Bevan Weiss <bevan.weiss@gmail.com>
To: Lee Jones <lee.jones@linaro.org>,
	Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bevan Weiss <bevan.weiss@gmail.com>
Subject: [PATCH v2 1/1] leds: syscon: Add tristate option
Date: Sun,  8 Mar 2026 12:56:04 +1100
Message-ID: <20260308015604.2318336-2-bevan.weiss@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308015604.2318336-1-bevan.weiss@gmail.com>
References: <20260308015604.2318336-1-bevan.weiss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2DA8022E49D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-7151-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bevanweiss@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

This reverts commit f7d98a65d031 ("leds: syscon: Make the driver
explicitly non-modular").

OpenWrt builds with a single .config for a given subtarget, whilst boards
below that subtarget may not want to carry the disk usage of all options.
So there is a preference to have all functionality not required on all
boards as modules that can simply not be included in a given board rootfs
to reduce disk usage.

Additional changes:
- (int)(struct platform_device *pdev) => void return
- Add MODULE_DESCRIPTION and MODULE_LICENSE macros
- Add tristate option to Kconfig

Signed-off-by: Bevan Weiss <bevan.weiss@gmail.com>
---
 drivers/leds/Kconfig       |  4 ++--
 drivers/leds/leds-syscon.c | 20 +++++++++++++++++---
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 597d7a79c988..ea3afc76a9c6 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -903,8 +903,8 @@ config LEDS_POWERNV
 	  will be called leds-powernv.
 
 config LEDS_SYSCON
-	bool "LED support for LEDs on system controllers"
-	depends on LEDS_CLASS=y
+	tristate "LED support for LEDs on system controllers"
+	depends on LEDS_CLASS
 	depends on MFD_SYSCON
 	depends on OF
 	help
diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index d633ad519d0c..bc968e8a326d 100644
--- a/drivers/leds/leds-syscon.c
+++ b/drivers/leds/leds-syscon.c
@@ -6,7 +6,7 @@
  * Author: Linus Walleij <linus.walleij@linaro.org>
  */
 #include <linux/io.h>
-#include <linux/init.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/stat.h>
@@ -121,17 +121,31 @@ static int syscon_led_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static void syscon_led_remove(struct platform_device *pdev)
+{
+	struct syscon_led *sled = platform_get_drvdata(pdev);
+
+	led_classdev_unregister(&sled->cdev);
+	/* Turn it off */
+	regmap_update_bits(sled->map, sled->offset, sled->mask, 0);
+}
+
 static const struct of_device_id of_syscon_leds_match[] = {
 	{ .compatible = "register-bit-led", },
 	{},
 };
 
+MODULE_DEVICE_TABLE(of, of_syscon_leds_match);
+
 static struct platform_driver syscon_led_driver = {
 	.probe		= syscon_led_probe,
+	.remove		= syscon_led_remove,
 	.driver		= {
 		.name	= "leds-syscon",
 		.of_match_table = of_syscon_leds_match,
-		.suppress_bind_attrs = true,
 	},
 };
-builtin_platform_driver(syscon_led_driver);
+module_platform_driver(syscon_led_driver);
+
+MODULE_DESCRIPTION("SYSCON LED driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


