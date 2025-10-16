Return-Path: <linux-leds+bounces-5796-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FA8BE3B3B
	for <lists+linux-leds@lfdr.de>; Thu, 16 Oct 2025 15:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07C7D3BC880
	for <lists+linux-leds@lfdr.de>; Thu, 16 Oct 2025 13:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93B4339B34;
	Thu, 16 Oct 2025 13:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="100tgXPO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4176339B28
	for <linux-leds@vger.kernel.org>; Thu, 16 Oct 2025 13:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760621332; cv=none; b=bJOf9rNaW9/aHdtIHWKv30vnEw4YgzTG/o+S5lmGuXa52KndvhZO1TZMEIE+aA4T4uS2DF3S2gpBz5XKnYVF0BX3rI6Z+D18jxhnL/S52MR9vo55UxcR76NbpLpbwamNCfjcxa+SbR4ELpx7BIXpQAIj7ei0GobqezsmAwpnnew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760621332; c=relaxed/simple;
	bh=yXITrtW5JHJgs7EZqQXs3E8iTvXoW2BNmrEyDm+VM6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=olO2R+eh2MlijG8FcY4uwNpmdf4NTEHbww8g/n0Fmpl1P28NOMxWyMOQBfdp3iw0T2PfkwEGfuE3+v76zscqgF8Nw6qBkCJzdTwcBEQU2K0xdcwpcHsZ7ehsDyhsXzO7unQopUqv5zfZvgyqBQo9m/sGWxRugLUtQtY7IHrDrTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=100tgXPO; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1C3CB1A142E
	for <linux-leds@vger.kernel.org>; Thu, 16 Oct 2025 13:28:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E52786062C;
	Thu, 16 Oct 2025 13:28:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0DFE4102F22EF;
	Thu, 16 Oct 2025 15:28:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760621327; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=PIs+eMpB75h0QvSbjmDChujBOc8Dh9k+MG5umnAccEw=;
	b=100tgXPO7dl5N6tNL037vtgZJs7S82gIn7i4T4rXANAH+Dwb6tnzVSAUWvVyBASrHhaUsN
	qYgO1bA/GjUoZnWUFYLuH7TYZiPH7HmGqNBjQUTfXXa5UoWq/QZR3GsWhMjRs3wGZRhYKF
	0uoiORULknDp04kgyoQg7lFMU+67jxtVHNr35aayYxNb7+2rAl22Fd1HLF8WZslFsfPAbj
	9yFLrzGh/MjtC1p3Ni84OWtx6qHUiDR+h0jp+RO54pHP/TONORLEzwUg3PAb5cDYpN++kT
	aXM5DLENuOaHvgEQwwUvPv80yEzwH+Cj1pZ9XUuoz7g16FVG3yIJ1yQMsmyuuw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Thu, 16 Oct 2025 15:28:37 +0200
Subject: [PATCH] leds: upboard: fix module alias
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-leds-upboard-fix-module-alias-v1-1-be63bafcf250@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAATz8GgC/x3MQQqEMAxA0atI1gYaR2X0KuIi2jgGOlYalAHx7
 pZZPvj8C0ySikFfXJDkVNO4ZVBZwLzy9hFUnw2Vqxpy1GIQb3jsU+TkcdEffqM/giAHZUPq6sa
 9eXkREeTHniQ3//8w3vcDY1XT1W8AAAA=
X-Change-ID: 20251016-leds-upboard-fix-module-alias-194508af3111
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

Fix module alias for auto-loading.

Fixes: 0ef2929a0181 ("leds: Add AAEON UP board LED driver")
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/leds/leds-upboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-upboard.c b/drivers/leds/leds-upboard.c
index b350eb294280fd68535c47843417f4282f97b423..12989b2f195309cc930095ecc5f855065e88d9aa 100644
--- a/drivers/leds/leds-upboard.c
+++ b/drivers/leds/leds-upboard.c
@@ -123,4 +123,4 @@ MODULE_AUTHOR("Gary Wang <garywang@aaeon.com.tw>");
 MODULE_AUTHOR("Thomas Richard <thomas.richard@bootlin.com>");
 MODULE_DESCRIPTION("UP Board LED driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:upboard-led");
+MODULE_ALIAS("platform:upboard-leds");

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251016-leds-upboard-fix-module-alias-194508af3111

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


