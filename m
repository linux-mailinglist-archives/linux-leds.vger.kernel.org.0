Return-Path: <linux-leds+bounces-7153-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GL18IerXrGn5vAEAu9opvQ
	(envelope-from <linux-leds+bounces-7153-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 08 Mar 2026 02:59:06 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA23C22E4B5
	for <lists+linux-leds@lfdr.de>; Sun, 08 Mar 2026 02:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A5DE303F075
	for <lists+linux-leds@lfdr.de>; Sun,  8 Mar 2026 01:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDBD2580F3;
	Sun,  8 Mar 2026 01:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TihjCnJe"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C929627A461
	for <linux-leds@vger.kernel.org>; Sun,  8 Mar 2026 01:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772935116; cv=none; b=AtdTouxXKmydz3iRKEm7kwFivPiZFKM4efMmrfRPNe+bB8rnS1UOP/3PJn58iGJjgIgfW1aKZxr9Tahc+Mr4qECMNcny/tVzj9Cnv5ucwilA4GYxL1KMtVyYZsc3t/lP9MjTkV21Tb92HRn9AqoBVYiIduv0IdD1XQflPO1iM98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772935116; c=relaxed/simple;
	bh=wihT8f2B57JCAW4+hnTQatiO39AokSGgcJkHwOJkhIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4VBcDLdBsgPZZONd7ou0KHTYiu9lkRGdUrWnsmbvMPrMG1GQO2SSeFGJ8SyCkAPvWnG3FjWPDkJA4p7O0Pm9sGuT8QaNCbgl+2VVm5R2z9xraaQIOMKcnfKMmnd3eIfThC70ou/6MqQ9VDlM9u95Gv4eLTDCP7AdMjLX/lVWFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TihjCnJe; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ae8177446fso13381175ad.0
        for <linux-leds@vger.kernel.org>; Sat, 07 Mar 2026 17:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772935115; x=1773539915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVzNmWbW6cP/6PYv9jBlbu21HDCAtNdYngPdNFBqaQY=;
        b=TihjCnJerl3SAwz4+SBURv3qOIA36sFaZvNhHgJ8MmSV7dA/kILfPb6SqkfbltAZSj
         3ejotZOfh4N7mk/Qgq6qbuYOdzsJSs+Ww1dNJ9mtQ+C9WJKPc49BSgqLz4zrQ9jbtPam
         jeiqGl3WBeE4s2mKT7+DutrUdKTH8cLJBJP/l8MKYecYJmaqPtc5g4Tb63lZHjyZx0gj
         3d6x2wwuKZaFR/aQRXVrs1oFzCTmHZS+uq6EmG6Kcuodo+8VnGz++Rd1h9fvKVpPuqS6
         yKctLdePbxr5133LxbO6WMg0YwH2/S5Stxg8YZQ02sbeJU/gYRIzcdtmj5TXlM19YqSg
         gdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772935115; x=1773539915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uVzNmWbW6cP/6PYv9jBlbu21HDCAtNdYngPdNFBqaQY=;
        b=OD72YTXkZGo/vL5mi/QBl/8xCPIG4v4gVRB+Y3JDQqHkq1JVI83BpKa2vCZPUQxe43
         rGykDE/PywclR9Le383FUnl3vDFRuEkC//8NoQPA9Gl9CPGcLkCTasyFzbAZzyrrt/+W
         W4St9dMSHk8dNqpzDYpLlG1V6paOEGPRFyXqp1J909EXs+JbbUb2V3lqpPXR/NVBREDG
         bLRnAjzN3y2G53WrtrYWwowuKdx7BkRIgfrZOTcar44e1GD/6MRIEZtM29XvpIbYQ/uz
         qsPHQaMzdC4zIH1YgfT920jrP9ycpqYwpjh1Ub96R6S1DqoE8YU7A3xMf1ToXDj6byXy
         98iw==
X-Gm-Message-State: AOJu0YwPS3BNZ19gx2xMMT4f1EKFrGD5D0gxdDA7dY86dQvo7mOdhuHY
	wHtsod/gUqqyFMxndiSFfFIVUXGn8+Z4YRWfMmvp+86VCrev6hMHVYrK
X-Gm-Gg: ATEYQzwjMHx+xGt1Al3ecdSHD5ueaaOJ0EIUtlNt4ADK+mnKM19IgZzcL1EaanR2AgP
	AM4B5T6HSqkjR+RH3LNRO0msp5Ci3XDwg3KPINHy3XYTLd8EoNse9K2RPXDRzX2p/8Cr7CR0iU6
	C/XC9rvmC8xv4J1XfZQEzolGbyE5+MjYZXNXe2Q6YFUH3vcypR4UqoeZN6q6ijEJ7XbDYs7ZyNd
	5rycdhxBrCNLe8eSuGppcMfbXZynSd/hSXBlBVikK0C2+Nvqtb0kbu9BM/H+aFgL4fMyJQczorM
	sV0LD1gxK/uhhJnbu3TVMKND+jp/qkqSb78JjU+3jmX+1+LDTJ0pGd9e3U76MlMiZWIBVHrNbb+
	FCf7y7xWfRFTqH7MK9iGJjaJMMWbG97YREBKPJ3JwQp8/BhBDqjzYt7SEgXOnQqnoF8/hm0fwUs
	jWnM4E5kOOPx7NDcBWXFIR1c4McdNIgmlfEpXu+4JPztkrzF5Y9/g=
X-Received: by 2002:a17:902:c94a:b0:2ae:698d:94a6 with SMTP id d9443c01a7336-2ae8241dd3dmr81651285ad.2.1772935115090;
        Sat, 07 Mar 2026 17:58:35 -0800 (PST)
Received: from localhost.localdomain ([202.63.77.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57b1fsm84141835ad.12.2026.03.07.17.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 17:58:34 -0800 (PST)
From: Bevan Weiss <bevan.weiss@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bevan Weiss <bevan.weiss@gmail.com>
Subject: [PATCH v2 1/1] leds: syscon: Add tristate option
Date: Sun,  8 Mar 2026 12:58:23 +1100
Message-ID: <20260308015824.2318366-2-bevan.weiss@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308015824.2318366-1-bevan.weiss@gmail.com>
References: <20260308015824.2318366-1-bevan.weiss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EA23C22E4B5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7153-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bevanweiss@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
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


