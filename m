Return-Path: <linux-leds+bounces-3242-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7C09BA4AD
	for <lists+linux-leds@lfdr.de>; Sun,  3 Nov 2024 09:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9034B214F2
	for <lists+linux-leds@lfdr.de>; Sun,  3 Nov 2024 08:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4945A15B13D;
	Sun,  3 Nov 2024 08:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="sCrB0seE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460AA157A6B;
	Sun,  3 Nov 2024 08:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730622933; cv=none; b=GR+FUkVL5gy8ac0Q6PO1gfSxO0faIZ7zDBpnJa8szHRD1ogHA9uJZHlQv4Pg8/9mrPeng5Eg8VN51MpBY00YMQjc3T95tdn++eSnFhfFIFsWuv51Qa2UOrfNgRJ3WDhGoQ8d2ROillu2XjWn7mBZP4IPd0VAuTL6/Oij3105Kx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730622933; c=relaxed/simple;
	bh=E5Ap82zgZMoj2TE1EVIHA3m2JDIY4KIBBBTbj5A3hM0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gIGy7J+tYBb3MoZrAP+57e8ivh0b4Cwj8GrEtaHkhl5okpjUJ2Mtlx82DasSyoO6t19JxLuc0LJclpQ+SAPzxOWffCvLD9MvGI8q61BEW8o82UL8/DY6dz99ch+nhn5ku/gFwhaN9HrAxqrjottrJPDEeXJZlrqClIpmI/OFavM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=sCrB0seE; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730622923; x=1730882123;
	bh=E5Ap82zgZMoj2TE1EVIHA3m2JDIY4KIBBBTbj5A3hM0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=sCrB0seEFz3ZBxVI9PAfYG9NsHLPnfo9Y7JCGBCoaqg40tY2YOLMFfNfj5nKTPG18
	 H6zyNi47qPC4MnqACEBS7p51AuijtEs/Y82dakKHv5bfpkE9B99cu/RzfsRMAYGML1
	 sDDv+C+uDi0+O2GGRDxGmoh+YxRJ07OGpfdtKpPap9J/5E4sLNRYnYDo5k4aE9QEk8
	 +gcrn5N7s87vOP+7fRQNPeC52IlLRC7UGEcuVy3/m1ALwd5s06/L/FXZas+GUhBNx5
	 VOTpQuEvPr5RV50nULRhPTiHD2FpvJ9vhvasWjWKxA02bxFmdJFL9OgwAVBpwEBSg4
	 hGu1DEnfcJv2A==
Date: Sun, 03 Nov 2024 08:35:16 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: pavel@ucw.cz, lee@kernel.org, krzysztof.kozlowski@linaro.org, duje.mihanovic@skole.hr, daniel.thompson@linaro.org, linus.walleij@linaro.org, u.kleine-koenig@baylibre.com, linux-leds@vger.kernel.org
Subject: [PATCH] leds: ktd2692: Set missing timing
Message-ID: <20241103083505.49648-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: 91fc728f538722165e4ec2ba4121d76784ffd4ae
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

props.timing is not set after b5a8c50e5c18. Set it with ktd2692_timing.

Fixes: b5a8c50e5c18 ("leds: ktd2692: Convert to use ExpressWire library")
Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 drivers/leds/flash/leds-ktd2692.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/flash/leds-ktd2692.c b/drivers/leds/flash/leds-kt=
d2692.c
index 7bb0aa2753e3..0a8632b0da30 100644
--- a/drivers/leds/flash/leds-ktd2692.c
+++ b/drivers/leds/flash/leds-ktd2692.c
@@ -293,6 +293,7 @@ static int ktd2692_probe(struct platform_device *pdev)
=20
 =09fled_cdev =3D &led->fled_cdev;
 =09led_cdev =3D &fled_cdev->led_cdev;
+=09led->props.timing =3D ktd2692_timing;
=20
 =09ret =3D ktd2692_parse_dt(led, &pdev->dev, &led_cfg);
 =09if (ret)
--=20
2.39.5



