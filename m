Return-Path: <linux-leds+bounces-7407-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id c3ujBFLIvGmA2wIAu9opvQ
	(envelope-from <linux-leds+bounces-7407-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 20 Mar 2026 05:08:50 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2E72D5B62
	for <lists+linux-leds@lfdr.de>; Fri, 20 Mar 2026 05:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C8E3300B9D9
	for <lists+linux-leds@lfdr.de>; Fri, 20 Mar 2026 04:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9E21C84A0;
	Fri, 20 Mar 2026 04:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FoIh34cn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABEA2D0C7E
	for <linux-leds@vger.kernel.org>; Fri, 20 Mar 2026 04:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773979722; cv=none; b=VCljoT7i85NaMziKFiTFFRyIR3iGFNT5Ajd3zrpujPSH0DZutl0G8DUu/9r4TBScghqeGeVitibpgE/ibtt4z4aL2YU1F1jsJysGVp6cwJO4T3w+lZLy3JhxUEqEWbymijv5lRHiEBXBwvUm16bA2UfYyS5VTWxB/owBMNw2MVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773979722; c=relaxed/simple;
	bh=Hs5JCVi/mDCoUp8T9yD6sHiPNpI9OAcvAkx6z54p0S8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U7FfRVq1Q9VLFh9TEXE5yvWy8t05QmcvIYoMI7Vxxt/NZW50dbhpce4lLDJQdUSzWBhHTIwAuHlpPb+9jz67jzuAeSPCG8oFVw0AOMaqOdS8MAVVHf16Bp2cuEwygK/lWDvTztMAo07HpoR+GkfKvomQehxSTpSoRbAulzncc7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FoIh34cn; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64ad79df972so226564d50.1
        for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2026 21:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773979720; x=1774584520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9qXYjAYEG/7TdZTZTuXrafJ6evX5BXEzOr2dZP97xrw=;
        b=FoIh34cn5A4QYrPFj6riiJSMAqmdTsurN9HdQ3GjBIBzp0VG6BUAFckjIPSiahe9Eq
         zKnRVFlC0a7B88M7wdXqELpWk96HgenxFHxlCOQLf7082qllyyyxrTiAGQXFgk0fKZMi
         A2rKbZW/5DbGM7Cf24naDkquQajB0yjf202sKUilHm+whhp5JDPvvkY/GHmagleAOa9c
         HnBFKiMhCE5oUsrGBkHux0OqFKvp5WLGkci/Yk1VKCeeDswTTJPCKTW5VXglz8/FMAwI
         86yuTMJBWnmpdroQftitfZM6XNpMbORGLDeMBQU+aTVHvvZNEvsNk4yCSJYKKSW8eO/k
         iubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773979720; x=1774584520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qXYjAYEG/7TdZTZTuXrafJ6evX5BXEzOr2dZP97xrw=;
        b=PtS2EW3HO2v5/BYeSfjuVy7HcxFk1r54j+bW+saqrunedGxEMuBV9jaaGEBOViI6DL
         Uz3asPBvbXwGY3cAbvr3FQ9t99TMhDE6RyAYNIeydV55xSR8iZE9Yh95ctScYysxz+LH
         m4Z8sqU6ea9M7MDj/BzsHsgu3yv2Voan9EFEcwd/Lt81m4qj43fF9ucoVMoKNL8+c5Bx
         w/ixGCW2hvceFOoOwVXnffe6vVAh6A5eHVTpKBgVPU58LFsFkHk0mD/fBm9bzmWi7MxK
         EEniKjdPs5exGKvKmQIkkQxw4DS0ggKq/Ne7s3vAY1L9LL80pDMxCdYU0rMdIJ4LYHt2
         +n4g==
X-Gm-Message-State: AOJu0YxVW8A8gsOcOSfBzZSa72Py0xOGKYzZVvaNQ/15iHAHdsXHkT/m
	PBsLhntrhaSHKpKCuZewBvYw0gg+fimpYx2YvjCCOKpWk3XnXOaHPcSZelpW2mOi
X-Gm-Gg: ATEYQzxflRQ3fmQmTDhTc/7MPY4F9PrGUsdmFWdLiR99jqBbpV5PhL95x1NAU6fY5h4
	Uu7P0k1nsM+i466UuHNVCbrZzetzh3oW43pUQP3NIH7AjLe3yTrCCk0J9DLWxRA87XRvQQctX/Q
	FlAIfozDahhIs0LwqAM1uAwM6PbLgGJA5sUOahZ7wpwM9J5ZplZ9op0CZFpi+f2AjQAcch9oWts
	OPGWso4HdTJYYBBBu7CvHVsLFbz4S5rgvcXFvRp8mi5Une5osJXZnjJ332eumEUgkmqlYyeo12k
	ekffamlLOiMnAR2Cg/rflBgrg6/tAsnH8mljdlKTMXNCuek6LwEySfoK99kTd9nVnXRcfXy2Jj5
	EXDwpeS5g/QTyB0FGNbkn9ybbjc18SJupaB/oJEKG3nzNC3gVJuZvMjwqfYbkTvegCBgi4k0wr2
	jtNqan3ETCvlEH2j6iQAkOcgMK7OXxnsUDHyFTGnASyEkwHato+asjZTgj1BwC9ugoVw==
X-Received: by 2002:a05:690e:e25:b0:649:c512:1422 with SMTP id 956f58d0204a3-64eaa77e9d1mr1564985d50.42.1773979720476;
        Thu, 19 Mar 2026 21:08:40 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64eabecdbd3sm717558d50.18.2026.03.19.21.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 21:08:39 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] leds: pca955x: kzalloc + kcalloc to single kzalloc
Date: Thu, 19 Mar 2026 21:08:21 -0700
Message-ID: <20260320040821.46540-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7407-lists,linux-leds=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.970];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-leds];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0F2E72D5B62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Two fewer allocations as a result.

Required placing some structs before others as flexible array members
require a complete definition. Declaration is not enough.

Added __counted_by support for one of the structs for extra runtime
analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/leds/leds-pca955x.c | 45 ++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 28 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 2007fe6217ec..ee5f02eaa3c9 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -112,19 +112,6 @@ static const struct pca955x_chipdef pca955x_chipdefs[] = {
 	},
 };
 
-struct pca955x {
-	struct mutex lock;
-	struct pca955x_led *leds;
-	const struct pca955x_chipdef	*chipdef;
-	struct i2c_client	*client;
-	unsigned long active_blink;
-	unsigned long active_pins;
-	unsigned long blink_period;
-#ifdef CONFIG_LEDS_PCA955X_GPIO
-	struct gpio_chip gpio;
-#endif
-};
-
 struct pca955x_led {
 	struct pca955x	*pca955x;
 	struct led_classdev	led_cdev;
@@ -137,8 +124,21 @@ struct pca955x_led {
 #define led_to_pca955x(l)	container_of(l, struct pca955x_led, led_cdev)
 
 struct pca955x_platform_data {
-	struct pca955x_led	*leds;
 	int			num_leds;
+	struct pca955x_led	leds[] __counted_by(num_leds);
+};
+
+struct pca955x {
+	struct mutex lock;
+	const struct pca955x_chipdef	*chipdef;
+	struct i2c_client	*client;
+	unsigned long active_blink;
+	unsigned long active_pins;
+	unsigned long blink_period;
+#ifdef CONFIG_LEDS_PCA955X_GPIO
+	struct gpio_chip gpio;
+#endif
+	struct pca955x_led leds[];
 };
 
 /* 8 bits per input register */
@@ -542,15 +542,11 @@ pca955x_get_pdata(struct i2c_client *client, const struct pca955x_chipdef *chip)
 	if (count > chip->bits)
 		return ERR_PTR(-ENODEV);
 
-	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
+	pdata = devm_kzalloc(&client->dev, struct_size(pdata, leds, chip->bits), GFP_KERNEL);
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
-	pdata->leds = devm_kcalloc(&client->dev,
-				   chip->bits, sizeof(struct pca955x_led),
-				   GFP_KERNEL);
-	if (!pdata->leds)
-		return ERR_PTR(-ENOMEM);
+	pdata->num_leds = chip->bits;
 
 	device_for_each_child_node(&client->dev, child) {
 		u32 reg;
@@ -568,8 +564,6 @@ pca955x_get_pdata(struct i2c_client *client, const struct pca955x_chipdef *chip)
 		fwnode_property_read_u32(child, "type", &led->type);
 	}
 
-	pdata->num_leds = chip->bits;
-
 	return pdata;
 }
 
@@ -623,15 +617,10 @@ static int pca955x_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	pca955x = devm_kzalloc(&client->dev, sizeof(*pca955x), GFP_KERNEL);
+	pca955x = devm_kzalloc(&client->dev, struct_size(pca955x, leds, chip->bits), GFP_KERNEL);
 	if (!pca955x)
 		return -ENOMEM;
 
-	pca955x->leds = devm_kcalloc(&client->dev, chip->bits,
-				     sizeof(*pca955x_led), GFP_KERNEL);
-	if (!pca955x->leds)
-		return -ENOMEM;
-
 	i2c_set_clientdata(client, pca955x);
 
 	mutex_init(&pca955x->lock);
-- 
2.53.0


