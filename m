Return-Path: <linux-leds+bounces-8602-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F+UBMysVMGqBNAUAu9opvQ
	(envelope-from <linux-leds+bounces-8602-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 17:07:23 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F9068779A
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 17:07:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=seu.edu.cn header.s=default header.b=PyAPjSAK;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8602-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8602-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=seu.edu.cn;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2F21319D546
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 15:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD2F3FFAAD;
	Mon, 15 Jun 2026 15:03:24 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D9E258CCC;
	Mon, 15 Jun 2026 15:03:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781535804; cv=none; b=IZbvbNWzyKe+eLSrhzpDyBLKOlFPouHtLXL+UXmvvkzfZ7vyHChTmSKYaGXiVm18hfUgNI3nWUVIZ2s4+6CRO7SeOGPkK6xjJZ5CL1DBJEs5fLkQgJo86nrFOnQfo518+NmwQFLX+J5rb3VRre4kP9Jah2glzYjr9Bplnp17oBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781535804; c=relaxed/simple;
	bh=73e1DdZ+QIiRhlKXN8cwPIzmnNKAZDeP+2nvLRWZ930=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VsIJVEBnGlsajsYrBd1Q7K1HGkaqlMwWuInAGrhcsj15FiHk4YVj9rLzAEyjInysMWJZBeZwstbnB6IgqgdYERRhpxmc5D/gOf9LCEvh+zj/ugsOYc3E3imh8lsIzSxYgglGu5BhYKSC6HWNPWo89iTmCDPSJtjfd9uRBCCeQEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=PyAPjSAK; arc=none smtp.client-ip=101.71.155.101
Received: from PC-202605011814.localdomain (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42733caac;
	Mon, 15 Jun 2026 22:58:03 +0800 (GMT+08:00)
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
Subject: [PATCH 1/2] leds: lm3530: use brightness_set_blocking for sleepable callback
Date: Mon, 15 Jun 2026 22:57:55 +0800
Message-Id: <20260615145756.1019184-2-runyu.xiao@seu.edu.cn>
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
X-HM-Tid: 0a9ecbca26f003a1kunm9a9f3cac5b37
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTkMdVkhKGksZHkxOHkhJH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=PyAPjSAKzyt7dH3aOnnJNqV1zL1IPXG2gLZ80cBJWn+wNiAXWy9mdHHAv7hxwREF3lz3uti4hxs+M8DbsS7IqWT2SR/TePY7795MUFYUediYG0eH2RZ0EAn29bkY912Q3aS63LyRq+A3r8Gr0rVO764Ab1eXaAxbZEmbOK5tAW0=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=JCCunYeVHa+1sB4HCYuS09JRHSXJpHAiCHjDNeVGR6Y=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[men.de,linux-foundation.org,stericsson.com,gmail.com,vger.kernel.org,seu.edu.cn];
	TAGGED_FROM(0.00)[bounces-8602-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:linux-leds@vger.kernel.org,m:andreas.werner@men.de,m:akpm@linux-foundation.org,m:shreshthakumar.sahu@stericsson.com,m:cooloney@gmail.com,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:runyu.xiao@seu.edu.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[runyu.xiao@seu.edu.cn,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[runyu.xiao@seu.edu.cn,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,checkpatch.pl:url,seu.edu.cn:dkim,seu.edu.cn:email,seu.edu.cn:mid,seu.edu.cn:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23F9068779A

lm3530_brightness_set() talks to the device over I2C and can sleep, but
the driver registers it as brightness_set.  That leaves the LED core
free to invoke the callback from atomic contexts.

This issue was found by our static analysis tool and then manually
reviewed against the current tree.

A minimal Lockdep reproducer that keeps the original registration and
call chain is enough to trigger the warning: lm3530_probe() still
publishes lm3530_brightness_set() as brightness_set,
led_trigger_event_atomic() invokes it under spin_lock_irqsave(), and
the callback reaches i2c_smbus_write_byte_data() as its first
sleepable edge.

Lockdep reports:

  BUG: sleeping function called from invalid context
  i2c_smbus_write_byte_data.constprop.0+0x14/0x30 [vuln_msv]
  lm3530_brightness_set+0x4e/0x66 [vuln_msv]
  led_trigger_event_atomic.constprop.0+0x2b/0x40 [vuln_msv]

Convert the callback to brightness_set_blocking so the LED core only
invokes it from a sleepable context.

Fixes: b1e6b7068f02 ("leds: add driver for LM3530 ALS")
Cc: stable@vger.kernel.org
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
Notes:
  - Validated with a grounded Lockdep PoC that preserves the
    lm3530_probe() brightness_set registration and the
    led_trigger_event_atomic() -> lm3530_brightness_set() ->
    i2c_smbus_write_byte_data() path.
  - checkpatch.pl --strict: clean.
  - Not tested on LM3530 hardware.

 drivers/leds/leds-lm3530.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-lm3530.c b/drivers/leds/leds-lm3530.c
index e44a3db106c3..ba744961ebcd 100644
--- a/drivers/leds/leds-lm3530.c
+++ b/drivers/leds/leds-lm3530.c
@@ -301,10 +301,11 @@ static int lm3530_init_registers(struct lm3530_data *drvdata)
 	return ret;
 }
 
-static void lm3530_brightness_set(struct led_classdev *led_cdev,
-				     enum led_brightness brt_val)
+static int
+lm3530_brightness_set_blocking(struct led_classdev *led_cdev,
+			       enum led_brightness brt_val)
 {
-	int err;
+	int err = 0;
 	struct lm3530_data *drvdata =
 	    container_of(led_cdev, struct lm3530_data, led_dev);
 	struct lm3530_platform_data *pdata = drvdata->pdata;
@@ -344,6 +345,8 @@ static void lm3530_brightness_set(struct led_classdev *led_cdev,
 	default:
 		break;
 	}
+
+	return err;
 }
 
 static ssize_t mode_show(struct device *dev,
@@ -438,7 +441,8 @@ static int lm3530_probe(struct i2c_client *client)
 	drvdata->brightness = LED_OFF;
 	drvdata->enable = false;
 	drvdata->led_dev.name = LM3530_LED_DEV;
-	drvdata->led_dev.brightness_set = lm3530_brightness_set;
+	drvdata->led_dev.brightness_set_blocking =
+		lm3530_brightness_set_blocking;
 	drvdata->led_dev.max_brightness = MAX_BRIGHTNESS;
 	drvdata->led_dev.groups = lm3530_groups;
 
-- 
2.34.1

