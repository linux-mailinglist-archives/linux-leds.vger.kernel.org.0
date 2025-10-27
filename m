Return-Path: <linux-leds+bounces-5899-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FE7C0D519
	for <lists+linux-leds@lfdr.de>; Mon, 27 Oct 2025 12:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DA47422750
	for <lists+linux-leds@lfdr.de>; Mon, 27 Oct 2025 11:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753EF3016F7;
	Mon, 27 Oct 2025 11:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPUZ+4vt"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C9E2FF66E
	for <linux-leds@vger.kernel.org>; Mon, 27 Oct 2025 11:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761565680; cv=none; b=n0kDQPf31JxHft5uvnankjbjxkGgnzEDQH3l3jtaXtEMTcNpJrtqsqVjP2+P8S8s1om7xFDmwxzPEhqZS0Ar2qR+/rNaH3/j6vOp7c5xJ1IAZ5x9lC0ZT2x6cLv7mX4PKwXUFvLZGZ9XHPwmA5Wec6LtDv22qTzm3/Lk1R5e9VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761565680; c=relaxed/simple;
	bh=kxQqLXC/vocVby1iX86lsomk1qD0pPzWyqm+L27Qs4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAf3NpiKV9g6CU6QxYQD1x4v60C1vlJov7ORSpzmcaBBdd9aK7yeKNL0gpOI4XHtrT/TRE/9T9wcW6EiQiPzi8P1NMPRMbO9xJN/v7R6cx7/C1FzkfGWfYCnD0a3ATJrV0w2fcHFpRObYzh9+RxFUwB9pgnHA/wOnFBHa0kGtdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPUZ+4vt; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57992ba129eso340471e87.3
        for <linux-leds@vger.kernel.org>; Mon, 27 Oct 2025 04:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761565676; x=1762170476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dcg40gldVVcahOKLGZMsmMG2vkEtjG8d8GcqdJrWwQY=;
        b=iPUZ+4vtv8XulflFkAsmcs8WVGaXoXTY0Kl6lRyvVdn/R1HMFZBSW9dQxMBkWxk1w3
         juQOFuu1MIANhYoiaCM63beVPpNZJnzz5nkLyfzezhMKk2QmL2ukCL7G2au747H58THq
         5U87DaQivaMYVPoYI52qI96bwZhls7u+6vLPOKo+hrT/9x/MEsWat+ghhe3sJjji/8yA
         HyGLy6srDEh71022QGdJJWn1rZ7L4Yr3nTfMSPZpTffl/mdvx8qLsO3wiRc2KfqWW26I
         3RySBU07k+gb7r0kljCe97Sa819zzn/y60TMQbrMaprBQpUPo3fpBQsjEvnTCxeiCaJG
         9wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565676; x=1762170476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcg40gldVVcahOKLGZMsmMG2vkEtjG8d8GcqdJrWwQY=;
        b=kEdRRxCQah5gmIx5vVXAUoq9rLxAYokzAz+Tk+leUlDNQFJkaZql8Teg00JhHekaKT
         DTE30+czMuI1JmsWnly1rIihMfR0EEArBcOTzGKUfJE/Iqrz1h/BDhgsVraIKK2hWRpk
         je8u28eTMyzlqGMRL4fvxmio5NHsuFPKDlenrB2rnmsbWeTvRIFOWPv9HnhPp2F/zAUq
         s0mTL+plcVG/J1V6gWjxpL0snuyleiWQVYIRluImyKaw/m5hnKcwYvmjexiz+xs8uEkr
         BvH/6GKZOv/csM3b5kX9/SVYQ1mMiYoi8h0pzBz3N9v+A8VS6NwAk/N9fC4TWBHn4ogh
         IC1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWa9TQ75O2cL/4l20usGEZ3xHVU+j8aBm+anRKBfLiOiGnRuHs/kFd38HASAuOP0xR6USQjk98jUX69@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1UyeZWY8H1uaDLYGyUW/0GVtFQk840AllAxEoa1y8sVRl9O6P
	V9HmYZwFRBb33p0Rj9axgeB285YJRHBbbvEPYX0QOUsvxz5UV4Npr0EQ
X-Gm-Gg: ASbGnctH7tQGOdHi6m/lafq4miaoIYYDi+u98g75ldBXSbeyCZ07xOPD4jYJztspJXE
	y3O+wSIyqSPg+ObZgAv/DFsfdlHhZCx76H1beeX/M2dqQOkH7mz41qdHoz6ZU41NemdFD0YxFPN
	U1fxaELTkYFRQSjxAyUnQmxxP4uBC2BJ7sczb0xK7KOWSKahtBf0qVQ87D5Q1O1ucQRfqfSsxLH
	djThI9lzgReF6nEQE56VllwpdwjLcMtogLzD+yfmpZquYZVfHbwE1276tvMm4h+K6mJ6/jg+Elq
	lMrPckufT7B3epruv6kCx98NmsxHMneFP9jfIcy5DSGfOp5lDzkds5VZSn7dgRejhxOWmY/Kkbn
	PhXM77HtjuLPDt1Sg+NPUnRJs8RBxHJiiHRs0n//xyIZHmci2VwKtCkaM+JwajJ6Ez03nEi28T4
	cwp9IUwiY=
X-Google-Smtp-Source: AGHT+IFyce7El8E94tjFtxV66B2JShxRuoYR16OveaviLm+6rof2Y2XS3w/azw2jsqyNQbUEoHRxCw==
X-Received: by 2002:a05:6512:e81:b0:592:ee1f:227a with SMTP id 2adb3069b0e04-592f5a61330mr4908241e87.43.1761565676062;
        Mon, 27 Oct 2025 04:47:56 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41be8sm2308839e87.4.2025.10.27.04.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 04:47:55 -0700 (PDT)
Date: Mon, 27 Oct 2025 13:47:51 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andreas Kemnade <andreas@kemnade.info>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v2 12/15] rtc: bd70528: Support BD72720 rtc
Message-ID: <380ea1fdbb94a796418e8f463c6a9436001d572d.1761564043.git.mazziesaccount@gmail.com>
References: <cover.1761564043.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iXlw/xinAhAbqwAt"
Content-Disposition: inline
In-Reply-To: <cover.1761564043.git.mazziesaccount@gmail.com>


--iXlw/xinAhAbqwAt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The BD72720 has similar RTC block as a few other ROHM PMICs.

Add support for BD72720 RTC.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
 RFCv1 =3D>:
 - No changes
---
 drivers/rtc/Kconfig       |  3 ++-
 drivers/rtc/rtc-bd70528.c | 21 ++++++++++++++-------
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2933c41c77c8..418f6c28847a 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -561,7 +561,8 @@ config RTC_DRV_BD70528
 	depends on MFD_ROHM_BD71828
 	help
 	  If you say Y here you will get support for the RTC
-	  block on ROHM BD71815 and BD71828 Power Management IC.
+	  block on ROHM BD71815, BD71828 and BD72720 Power
+	  Management ICs.
=20
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-bd70528.
diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index 954ac4ef53e8..4c8599761b2e 100644
--- a/drivers/rtc/rtc-bd70528.c
+++ b/drivers/rtc/rtc-bd70528.c
@@ -7,6 +7,7 @@
 #include <linux/bcd.h>
 #include <linux/mfd/rohm-bd71815.h>
 #include <linux/mfd/rohm-bd71828.h>
+#include <linux/mfd/rohm-bd72720.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -262,13 +263,13 @@ static int bd70528_probe(struct platform_device *pdev)
=20
 		/*
 		 * See also BD718XX_ALM_EN_OFFSET:
-		 * This works for BD71828 and BD71815 as they have same offset
-		 * between ALM0 start and ALM0_MASK. If new ICs are to be
-		 * added this requires proper check as ALM0_MASK is not located
-		 * at the end of ALM0 block - but after all ALM blocks so if
-		 * amount of ALMs differ the offset to enable/disable is likely
-		 * to be incorrect and enable/disable must be given as own
-		 * reg address here.
+		 * This works for BD71828, BD71815, and BD72720 as they all
+		 * have same offset between the ALM0 start and the ALM0_MASK.
+		 * If new ICs are to be added this requires proper check as
+		 * the  ALM0_MASK is not located at the end of ALM0 block -
+		 * but after all ALM blocks. If amount of ALMs differ, the
+		 * offset to enable/disable is likely to be incorrect and
+		 * enable/disable must be given as own reg address here.
 		 */
 		bd_rtc->bd718xx_alm_block_start =3D BD71815_REG_RTC_ALM_START;
 		hour_reg =3D BD71815_REG_HOUR;
@@ -278,6 +279,11 @@ static int bd70528_probe(struct platform_device *pdev)
 		bd_rtc->bd718xx_alm_block_start =3D BD71828_REG_RTC_ALM_START;
 		hour_reg =3D BD71828_REG_RTC_HOUR;
 		break;
+	case ROHM_CHIP_TYPE_BD72720:
+		bd_rtc->reg_time_start =3D BD72720_REG_RTC_START;
+		bd_rtc->bd718xx_alm_block_start =3D BD72720_REG_RTC_ALM_START;
+		hour_reg =3D BD72720_REG_RTC_HOUR;
+		break;
 	default:
 		dev_err(&pdev->dev, "Unknown chip\n");
 		return -ENOENT;
@@ -337,6 +343,7 @@ static int bd70528_probe(struct platform_device *pdev)
 static const struct platform_device_id bd718x7_rtc_id[] =3D {
 	{ "bd71828-rtc", ROHM_CHIP_TYPE_BD71828 },
 	{ "bd71815-rtc", ROHM_CHIP_TYPE_BD71815 },
+	{ "bd72720-rtc", ROHM_CHIP_TYPE_BD72720 },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, bd718x7_rtc_id);
--=20
2.51.0


--iXlw/xinAhAbqwAt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmj/W+cACgkQeFA3/03a
ocXhuQgAohzG/FT0WPrB4EXABGvqNzmqjKaMFuBFPoGjFAkY3N/pJEmd0V7ydCP1
DSxlrk+dmquiaskjSTm7uICC3qTx5B14LpDOqF43tCQLGcuuUsbMGFEI8uMfgLQO
0146ZZUjDyA7fc4yn/+0JyIY+qzkf4cJDpe2chRxpcz0C6p7O5oCKwfTlkiXuAWy
sup+V/PbhQMeKsnrJJZmpYos7w/Ayx3ISRYBKHqEuDf1uOiP3d1EPP0jU/QGd0ek
BAAtnckkowJNNh9ymc7Y79298TVSnu4iIfrS+Zn8aNeJPllYBYOK4QGQSdW6P456
syqZCLS1tPmiNwW3ux7Pcn333AuT5Q==
=Mpk6
-----END PGP SIGNATURE-----

--iXlw/xinAhAbqwAt--

