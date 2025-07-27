Return-Path: <linux-leds+bounces-5142-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FD6B12E25
	for <lists+linux-leds@lfdr.de>; Sun, 27 Jul 2025 09:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FFC7189C480
	for <lists+linux-leds@lfdr.de>; Sun, 27 Jul 2025 07:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E58194A59;
	Sun, 27 Jul 2025 07:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.us header.i=len.bao@gmx.us header.b="CnHoGnSS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FDF433A4;
	Sun, 27 Jul 2025 07:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753603069; cv=none; b=gsueje4cb932DsjfFz+Bvst7jKr+XJnPdSzV0QsQClkT+oVFc42qfwVCn2IhNrvOtc/NhcYglXbbOWcJGqPFzTfgpDIOhhko2lbOw0VnM8W07IUOVpjANb5Tbagwdx2RBENfvBcmkiSYMnNJQXlo3e+uM6ifGXnM/DcfVNEMWIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753603069; c=relaxed/simple;
	bh=SdELJwIbA+c51zLR+hAFh0+Z2/Xc+ZfDCiE78vHesQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kkPHhCtAyVckpJpQOJsBmQkR/ytuBV1QO/H8JFHhi77tLGbbuZxSBLznsUNAf5oc/dyUy1+GN824HN6u8bYPKXEd/GbyZqiDmSsWNSx22rw/xfxt7r+QrEY/rz6QqIg/r4FkF7VWvjvvnOAAm6cVyM6UYYqegQ0RXDMAlLohIMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.us; spf=pass smtp.mailfrom=gmx.us; dkim=pass (2048-bit key) header.d=gmx.us header.i=len.bao@gmx.us header.b=CnHoGnSS; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.us
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.us;
	s=s31663417; t=1753603055; x=1754207855; i=len.bao@gmx.us;
	bh=hYUGBfp2u4s0lenU7GMdlp9Z1BD2mSHG7Ed7amzTntk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CnHoGnSSPQLcbeO4L4ixvYGJyxuX5iBVf0uH8ZYRjaUYb2FF8igm+yuSx1jQJISj
	 fiSru6I0ECWgV75lpAxZ0a4ItX+N6tEvps06brXfbV+0XdDToU5arf9IOWyVzR96Q
	 9GVzAYLOa77KBWMG6BCWdrE/qXUbfJ51KwhUKwad8MFOgGZaSVad1VqLKsr01bnMw
	 8yKpxzuEzqmE/edh1ESM1YG5itpJx0yncht9WtPnapOFvBz3op6qMcJ7jADTEFIbS
	 mZANt5K97RG/PkJXRnCvz8ttZay7F247MDGIO2ilH+CHgwvVaebFd8SILKYDwYDBP
	 4YgdmXUuhvvmFW3/Uw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ubuntu ([79.159.189.119]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1My36N-1uTsn311ah-00ulTu; Sun, 27
 Jul 2025 09:57:34 +0200
From: Len Bao <len.bao@gmx.us>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Len Bao <len.bao@gmx.us>
Subject: [PATCH] leds: max77705: Function return instead of variable assignment
Date: Sun, 27 Jul 2025 07:56:45 +0000
Message-ID: <20250727075649.34496-1-len.bao@gmx.us>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BkG4EHYQA14N2zQ/aei/3d4PHFHOyfY4SuJgaqdJO7cpiRIl37r
 OE1Y8gnCXKrQZrlPUPHmlnoKWKakN0uOcuddSi7kVPq63PMezUo1opuK70i8hVCJhVS6zwC
 l0ti3OHGaiefBlycfvP16tY6ibbeFVd6ScjLF/HW16HhEiaENQY6dMzTNYx9yRULRa4GRVJ
 xCl5iVxclOBUKfKPkBvrg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wCdwL6+QkQs=;fTEd4qvNF+sJqk+Bbb37a1rhKXP
 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
 WqxpoNZjMIw==

Coverity noticed that assigning value -EINVAL to 'ret' in the if
statement is useless because 'ret' is overwritten a few lines later.
However, afer inspect the code, this warning reveals that we need to
return -EIVANL instead of the variable assignment. So, fix it.

Coverity-id: 1646104
Fixes: aebb5fc9a0d8 ("leds: max77705: Add LEDs support")
Signed-off-by: Len Bao <len.bao@gmx.us>
=2D--
 drivers/leds/leds-max77705.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-max77705.c b/drivers/leds/leds-max77705.c
index 933cb4f19..b7403b3fc 100644
=2D-- a/drivers/leds/leds-max77705.c
+++ b/drivers/leds/leds-max77705.c
@@ -180,7 +180,7 @@ static int max77705_add_led(struct device *dev, struct=
 regmap *regmap, struct fw
=20
 		ret =3D fwnode_property_read_u32(np, "reg", &reg);
 		if (ret || reg >=3D MAX77705_LED_NUM_LEDS)
-			ret =3D -EINVAL;
+			return -EINVAL;
=20
 		info =3D devm_kcalloc(dev, num_channels, sizeof(*info), GFP_KERNEL);
 		if (!info)
=2D-=20
2.43.0


