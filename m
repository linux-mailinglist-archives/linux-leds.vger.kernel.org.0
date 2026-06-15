Return-Path: <linux-leds+bounces-8601-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jlmhGz8UMGoHNAUAu9opvQ
	(envelope-from <linux-leds+bounces-8601-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 17:03:27 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ECB687733
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 17:03:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=seu.edu.cn header.s=default header.b=C7ZxizVU;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8601-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8601-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=seu.edu.cn;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8FD1E30066B3
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 15:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7233FD96A;
	Mon, 15 Jun 2026 15:03:21 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B003FDC03;
	Mon, 15 Jun 2026 15:03:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781535801; cv=none; b=P+jxKyk2Ti/AXTKmGDFU+69zTc40V9XFzRxKuuLPTr3Oxj1xs3YhkTH5mlb9iSLnybDbYlxkY2IdKo5nR+q0iXIlA/sCJSthe4Pae63RjPRAq8tGgnM7AVTDMzrRjn3FsD7tUD0okSN6qboKrIeJSjQTH2Rf+YqJBxbCLJMcaTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781535801; c=relaxed/simple;
	bh=8p9gnwHQvxwVrY+bWz0KHyFeOCSx/M3/R2T5XwZJkv4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kMP/U8JfhnvM0NzVjAVdzsxzJxEWsE1XdrY2cAc9OyAfOjOzRFKhhe88RWeB8RYInoR3d/0LJyL8tY/FurR3gu7HhnevDU1zxwrHgjE+QrKbz3Td8yrnjzakBnE5J6/LfV+vQmksKcjyO+c9XUKjnlOoOqADGwyDp7nU2IPUUWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=C7ZxizVU; arc=none smtp.client-ip=45.254.49.198
Received: from PC-202605011814.localdomain (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42733caae;
	Mon, 15 Jun 2026 22:58:05 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org
Cc: Andreas Werner <andreas.werner@men.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shreshtha Kumar Sahu <shreshthakumar.sahu@stericsson.com>,
	Bryan Wu <cooloney@gmail.com>,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn,
	stable@vger.kernel.org
Subject: [PATCH 2/2] leds: menf21bmc: use brightness_set_blocking for sleepable callback
Date: Mon, 15 Jun 2026 22:57:56 +0800
Message-Id: <20260615145756.1019184-3-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615145756.1019184-1-runyu.xiao@seu.edu.cn>
References: <20260615145756.1019184-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ecbca2e4603a1kunm9a9f3cac5b3a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSkhDVk9PSh9NTk0dGkMYT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=C7ZxizVUOfPaU1ewMwxw+fV4k6BAinZB04S5WPdUOEsgquFYzfSa8un1PQDkr5fAsAzAjKRhHXU6wX+/xbb6LWbCvvz60IoeM5B78UuoV3v0ZmgvW05sxUbQNI4KhG9Io/qZj43XCdT8L2qQ/cUsgx2JFI2jDygfzPyMneZWI1o=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=MP029Tyg6N5UTNgnyxRwLgzrZfQZLUIB/migs+vLy54=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[men.de,linux-foundation.org,stericsson.com,gmail.com,vger.kernel.org,seu.edu.cn];
	TAGGED_FROM(0.00)[bounces-8601-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:linux-leds@vger.kernel.org,m:andreas.werner@men.de,m:akpm@linux-foundation.org,m:shreshthakumar.sahu@stericsson.com,m:cooloney@gmail.com,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:runyu.xiao@seu.edu.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[runyu.xiao@seu.edu.cn,linux-leds@vger.kernel.org];
	RSPAMD_EMAILBL_FAIL(0.00)[runyu.xiao@seu.edu.cn:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[runyu.xiao@seu.edu.cn,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53ECB687733

menf21bmc_led_set() serializes access with a mutex and performs I2C
transfers, but the driver exposes it through brightness_set.  That
mismatches the LED core callback contract for atomic callers.

This issue was found by our static analysis tool and then manually
reviewed against the current tree.

A minimal Lockdep reproducer that keeps the original registration and
call chain is enough to trigger the warning: menf21bmc_led_probe()
still publishes menf21bmc_led_set() as brightness_set,
led_trigger_event_atomic() invokes it under spin_lock_irqsave(), and
the callback immediately tries mutex_lock(&led_lock) before reaching
its I2C accesses.

Lockdep reports:

  BUG: sleeping function called from invalid context
  __mutex_lock+0x4f/0xd20
  menf21bmc_led_set+0x15/0x49 [vuln_msv]
  [ BUG: Invalid wait context ]
  ... (led_lock#2) ... at: menf21bmc_led_set+0x15/0x49 [vuln_msv]

Convert the driver to brightness_set_blocking and return the transport
status to the LED core.

Fixes: 38433639af91 ("leds: leds-menf21bmc: Introduce MEN 14F021P00 BMC LED driver")
Cc: stable@vger.kernel.org
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
Notes:
  - Validated with a grounded Lockdep PoC that preserves the
    menf21bmc_led_probe() brightness_set registration and the
    led_trigger_event_atomic() -> menf21bmc_led_set() ->
    mutex_lock(&led_lock) path.
  - checkpatch.pl --strict: clean.
  - Not tested on MEN 14F021P00 BMC hardware.

 drivers/leds/leds-menf21bmc.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-menf21bmc.c b/drivers/leds/leds-menf21bmc.c
index 6b1b47160602..da476fe6ed2c 100644
--- a/drivers/leds/leds-menf21bmc.c
+++ b/drivers/leds/leds-menf21bmc.c
@@ -49,28 +49,33 @@ static struct menf21bmc_led leds[] = {
 
 static DEFINE_MUTEX(led_lock);
 
-static void
-menf21bmc_led_set(struct led_classdev *led_cdev, enum led_brightness value)
+static int
+menf21bmc_led_set_blocking(struct led_classdev *led_cdev,
+			   enum led_brightness value)
 {
 	int led_val;
+	int ret = 0;
 	struct menf21bmc_led *led = container_of(led_cdev,
 					struct menf21bmc_led, cdev);
 
 	mutex_lock(&led_lock);
 	led_val = i2c_smbus_read_byte_data(led->i2c_client,
 					   BMC_CMD_LED_GET_SET);
-	if (led_val < 0)
+	if (led_val < 0) {
+		ret = led_val;
 		goto err_out;
+	}
 
 	if (value == LED_OFF)
 		led_val &= ~led->led_bit;
 	else
 		led_val |= led->led_bit;
 
-	i2c_smbus_write_byte_data(led->i2c_client,
-				  BMC_CMD_LED_GET_SET, led_val);
+	ret = i2c_smbus_write_byte_data(led->i2c_client,
+					BMC_CMD_LED_GET_SET, led_val);
 err_out:
 	mutex_unlock(&led_lock);
+	return ret;
 }
 
 static int menf21bmc_led_probe(struct platform_device *pdev)
@@ -81,7 +86,8 @@ static int menf21bmc_led_probe(struct platform_device *pdev)
 
 	for (i = 0; i < ARRAY_SIZE(leds); i++) {
 		leds[i].cdev.name = leds[i].name;
-		leds[i].cdev.brightness_set = menf21bmc_led_set;
+		leds[i].cdev.brightness_set_blocking =
+			menf21bmc_led_set_blocking;
 		leds[i].i2c_client = i2c_client;
 		ret = devm_led_classdev_register(&pdev->dev, &leds[i].cdev);
 		if (ret < 0) {
-- 
2.34.1

