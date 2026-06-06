Return-Path: <linux-leds+bounces-8517-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 34yJCsipI2pjwgEAu9opvQ
	(envelope-from <linux-leds+bounces-8517-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 07:02:00 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F0F64C754
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 07:01:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=E49JGrj4;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8517-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8517-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C73E2309547E
	for <lists+linux-leds@lfdr.de>; Sat,  6 Jun 2026 04:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A0730C632;
	Sat,  6 Jun 2026 04:58:27 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F22730C155
	for <linux-leds@vger.kernel.org>; Sat,  6 Jun 2026 04:58:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780721907; cv=none; b=cgVsKaJOGqcwVY+BoibGCBacZGexlfYZYg+kqsX/tw/WMqDZ/hNOpHfjAx1qfwMqnfRgBq4eASA2ba6Yy4XGZshx8wk/+CC2uupEwXv4PO+8CJ5YQGFE5Le/P0gHJyrTA42d1QaXLuKk0F+c0vMZugukmxpS62d/A2T0LX+S2Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780721907; c=relaxed/simple;
	bh=O+IQDDaskjpiY9H7vh3SwWeHCbOSEhzjDI8laqLbRkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PEP0UT8N8b0VEZp3kSe3DqN2zXnrYOhYatFa1kScaHfXjz98bLX3r6Rv/FkdjG7VxTYlTa55oqz0pVIhHw6a7avOMXOEDEGRGINm+BUpSKNvwNnBqHHasozLyakxMBOdGNMMtQW4H0+iEEiSd3RZ6TETwMIuIFLyWC6seUJbseU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E49JGrj4; arc=none smtp.client-ip=209.85.218.51
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bed2b9bfa02so363451766b.1
        for <linux-leds@vger.kernel.org>; Fri, 05 Jun 2026 21:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780721905; x=1781326705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yN9wV+nrusoIiZXpR2QbLHADEoHUVVuow5fDPzDOfKY=;
        b=E49JGrj4Nx+Ge9LGt1wMJ1FmPcIKiAT5nYDYu7F9BK3kHL0NhPX2bABzkD+KSEC8RB
         93lXRNaJatpao2sKzCk5RD79L4Yl258IZmVVwamxpPPt+dO3kkIjHxXMsDhraXFC48IU
         rNgDAP+LGeSrph0vwpHhNvlyvoc1d296v+wCYoZmhV9RiREZo5Vh4LiHsdSIK6BliRJ6
         WBjPVEojKkPX9vEejLxNAD8i5HDk8AhZfNpFWR1U70JBk0pImX1mjGOB1OOf5lMvIBoj
         veErV2Ym4lq8fJxmk3eCyJIJxIfREbGEF1nvE5p8j7PxYJw0u8utWfkudGYdkYdR1Q25
         B9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780721905; x=1781326705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yN9wV+nrusoIiZXpR2QbLHADEoHUVVuow5fDPzDOfKY=;
        b=QlUKsyI7DBrGJaCYPnf7JCkLVNA0ynB7JFT6ipxoz1VJiaB0fz15NpVyM1MNf/nHn4
         RYfUOE+I2lgtN1Fdg4ratvAkwoPDZjsIMDOI9k7hbpPT4+y2fCbtbpo/P+BQYf+M0SBo
         oPVrHNa+LKkFxDOoYcuagbc9vsPtfM4C5fOFxuzLJQ1Q93W/oTtGdFQSLuVUnFQ7iBlu
         u82PUadsVdLy0jfrdAkUfSvsgxMgQ4VIusoSKC6h1cYDhESDxkIOYi+Dm2a6gNX3iWwA
         wy/eYPPu4M75/OCvP58/V79OQILC7Cy/cQfb+5aetXIG24T/TlScmR0cTbsB84/LFXt3
         A7hA==
X-Forwarded-Encrypted: i=1; AFNElJ+2zjD1R+yPQseesE8hLpwnGfbdRnM3vIw7CseoTNZJrLKSAVWwVlGtgkhacdYK7Orj+/0O8POZ3uEL@vger.kernel.org
X-Gm-Message-State: AOJu0YyY5c3SP1WslciKyRqnzcVVQMQVBcBTt7rkt/C/Vyap8BgJyT0v
	gZOKo+zrFcjybH/mmxzFASo7nOam4YCCDbH2ZmZbfSPZMNaRvV6eDVYi
X-Gm-Gg: Acq92OGfj8TbeRAnlwA6QA4euu4snZ4IsL3OtbY+wNFP5x4xXqO6YOe9HbEHH+PP0/M
	pfVEm7GDWhwcPBMazBSDKKC48B6UVeoH7oOT2cR0wPEbodMCCaBcah402kiZY9QqnSwzT57ehl0
	UNBbt5MYtzs3fPkujo9wSv7SDHOkMelBkykdP4+UjX8qO5wrLfz5e/Icb30HIZ4+PCR3oJxuMbr
	6FkB1bvnbFE/LmpKOcq6mTLIm/rAAHC2SCSJ9PtqVm64BINYNqj3KZZCIAc6MbvEQ5lVjttdcw0
	pzIUOeidutHtPNzQQLV6QwpZcGm2bV/PRuFhH1OysKvqOZykZKiaDDJM+epSwFtThCR+abBg9S0
	22+9gZZ0OAWMn3dGVJrVviJzSmZhelOMUbrTLyY59xmiuVvgJ9dCOes1RfJK9SY8tVOl+wZi/CZ
	9/GqIe0spb1ma1VujauC4eqqE=
X-Received: by 2002:a17:906:f58d:b0:bed:5d12:db5d with SMTP id a640c23a62f3a-bf37135e498mr329022266b.4.1780721904690;
        Fri, 05 Jun 2026 21:58:24 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm570597166b.32.2026.06.05.21.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:58:24 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v4 07/14] mfd: lm3533: Switch sysfs_create_group() to device_add_group()
Date: Sat,  6 Jun 2026 07:57:31 +0300
Message-ID: <20260606045738.21050-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606045738.21050-1-clamor95@gmail.com>
References: <20260606045738.21050-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8517-lists,linux-leds=lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:clamor95@gmail.com,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96F0F64C754

Switch from sysfs_create_group() to device_add_group() including device
managed where appropriate.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/lm3533-core.c           |  4 ++--
 drivers/video/backlight/lm3533_bl.c | 19 ++++++-------------
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index 45e7f7481aa0..e3efc9f6f348 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -416,7 +416,7 @@ static int lm3533_device_init(struct lm3533 *lm3533)
 	lm3533_device_bl_init(lm3533);
 	lm3533_device_led_init(lm3533);
 
-	ret = sysfs_create_group(&lm3533->dev->kobj, &lm3533_attribute_group);
+	ret = device_add_group(lm3533->dev, &lm3533_attribute_group);
 	if (ret < 0) {
 		dev_err(lm3533->dev, "failed to create sysfs attributes\n");
 		goto err_unregister;
@@ -436,7 +436,7 @@ static void lm3533_device_exit(struct lm3533 *lm3533)
 {
 	dev_dbg(lm3533->dev, "%s\n", __func__);
 
-	sysfs_remove_group(&lm3533->dev->kobj, &lm3533_attribute_group);
+	device_remove_group(lm3533->dev, &lm3533_attribute_group);
 
 	mfd_remove_devices(lm3533->dev);
 	lm3533_disable(lm3533);
diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 39f438114c48..b4363a30b2c8 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -304,28 +304,22 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, bl);
 
-	ret = sysfs_create_group(&bd->dev.kobj, &lm3533_bl_attribute_group);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to create sysfs attributes\n");
-		return ret;
-	}
+	ret = devm_device_add_group(&bd->dev, &lm3533_bl_attribute_group);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to create sysfs attributes\n");
 
 	backlight_update_status(bd);
 
 	ret = lm3533_bl_setup(bl, pdata);
 	if (ret)
-		goto err_sysfs_remove;
+		return ret;
 
 	ret = lm3533_ctrlbank_enable(&bl->cb);
 	if (ret)
-		goto err_sysfs_remove;
+		return ret;
 
 	return 0;
-
-err_sysfs_remove:
-	sysfs_remove_group(&bd->dev.kobj, &lm3533_bl_attribute_group);
-
-	return ret;
 }
 
 static void lm3533_bl_remove(struct platform_device *pdev)
@@ -339,7 +333,6 @@ static void lm3533_bl_remove(struct platform_device *pdev)
 	bd->props.brightness = 0;
 
 	lm3533_ctrlbank_disable(&bl->cb);
-	sysfs_remove_group(&bd->dev.kobj, &lm3533_bl_attribute_group);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.53.0


