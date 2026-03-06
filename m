Return-Path: <linux-leds+bounces-7119-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDnYLO17qmkqSQEAu9opvQ
	(envelope-from <linux-leds+bounces-7119-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 08:02:05 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6087B21C3F1
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 08:02:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37B813043039
	for <lists+linux-leds@lfdr.de>; Fri,  6 Mar 2026 07:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BBA37268F;
	Fri,  6 Mar 2026 07:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E4T4ajbW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2811B2DECBA
	for <linux-leds@vger.kernel.org>; Fri,  6 Mar 2026 07:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772780514; cv=none; b=lUzYo4VM4S9KZsczIJS5/7R30dFkh4Ll/W6j/otCyZ0DLMmXFZ4BbYKeFDETXyKwIWj4nf8mZE9r0l3EKK7/BDmbxFX0ToFrtrx6D8erNZ6w41HgIf4cQ3EuviRc6XETDr1+BuF3AstuXz72nAKSrRbRQfYfx9f2dlGH1wKTGBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772780514; c=relaxed/simple;
	bh=U5ovtFZGT6J0/COcDYCmDClaijQmWD3Zbr+hgB175wI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mfxcszviyKtUMtN+wEPT1b7azAbxz1swbw4nUhv3lRlquDLNe7hFSeJDYuizDIlC1a+Bz0Hq8xSGTwsKBnDUvTKXhpGyL9FXyq/4XoLpDgcx16y6VrXOG/98QSR38dh7sALvAfFBujhEq1CYWxbdDyXgGfMD2eKvjnP52Qwax6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E4T4ajbW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-483a233819aso87293775e9.3
        for <linux-leds@vger.kernel.org>; Thu, 05 Mar 2026 23:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772780510; x=1773385310; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g/Izo1I7P2lYa0tqmXpdAdhxEzYAi9jVGmrjmB9VLPo=;
        b=E4T4ajbWUTWlFMArKhQ6V7XMrb5b2K4Skb3GX6ke3CeDTdq3BOs5CkdvPyOwoUoCYi
         gFltKAZML+LKYgacr9grDe7rklDT2EkfpUgMCfs2m68QlzKJSERfTsdq9vVBnGNQNxnD
         Edxm8qvuUpq43O4yKhsLmzu6OwNIW58mIDXibMJAkBb/im6Kf38EimmUo9oCFtBYdx/r
         ELc/gJQUSG0VB5ONcK2psBkqf1zZuTvi9Si01FLfj4E8da1be8XGIKjINLzoDEdSmbtO
         GeS17bHx32jn/ZFqkIbn8zAua8xJIDoC3YtWageqBL1JbvyKxon49CnwpRq+I3ZwRLvZ
         93vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780510; x=1773385310;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/Izo1I7P2lYa0tqmXpdAdhxEzYAi9jVGmrjmB9VLPo=;
        b=wijpbgLcUTgTxEoNlvTp/LMQhooZMNM8sIh38jpBH0v13Y8ANrp51Pysl0POKzOhKu
         T7yqDbDfZpPEKyJGZgrXv57ZNHtAI0MjKGQVv1gwRoGVbA96wc/NTfeZoLkcMhLzlDt4
         9zlLtxIyEomyJQrH5EZpbIsEHmpB5qUrF329IfSS4ap6lS1Ae26yUKWvmFbWDaHmbftU
         DPQ4bTwyGtMe7CpEse3oyr+jBDnAeEdtxahY0dxAXm5mJBOTYpzxAmVO1V139e02DlPb
         3s47ZZZrkNfMYNnSDxZfJ3+jvBX04YYE9dYVnwsAfJAIBe8ZntnOwczzJPIPqj22PHf9
         3BRw==
X-Gm-Message-State: AOJu0YwtiPGJta/rgjaz/D24a6Pb7XdGAbAyGBRpTeOz0XZa1J98Z6fc
	oVZpK0+4eiSrz/NrSyGFvfwhSmgq7yswJKSF+spP/qxMgohjJ7aGNBlb4J0DRT2LnLU=
X-Gm-Gg: ATEYQzxrLXHHDHuXGMwpvIT2XwXJGb9P0dSwRP4xtlD37qF3RfMItCCFIj1uAAMI46q
	9swYRt8T2ye+rUR7zHrtC7lzgOelIoxx6y8scmmPVaoCGVC3mIoA9ik38UZn6bVy8sRJ3a2zOIe
	fYP39/yK3VJ3xEl6fdVDdmEROER83PmEV8JX5mo7JwGxjiTxYQ0Mu7l374Hu5RyR2oAIuh8njgT
	jdko4bev5w0pbqYAfSFEJiTsq1XAlsc9cIw/EZbqdMpJ/WjJfUAlE+qlwFxI398W+a2ZZux3vEI
	lBUrP39L8R1Fh7QQ/Qm6rfVo3e11eN1T1686LnNKJ2/nlY6ZXZQW8QQmuzLdgxIfrxmckB6EwN9
	kTolVnRpIAeNsE7WtY19AykTwlosMVlbnq0HjreR/uwxAd+JdwSamIe5APoyzze0rPKlV+/z6JP
	j67+i79itpY8SA2vw+K2vtaRpmXC4m
X-Received: by 2002:a05:6000:2c03:b0:439:bd70:610f with SMTP id ffacd0b85a97d-439da890077mr1657657f8f.44.1772780509950;
        Thu, 05 Mar 2026 23:01:49 -0800 (PST)
Received: from draszik.lan ([212.129.78.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2ba06sm1713784f8f.24.2026.03.05.23.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:01:49 -0800 (PST)
Message-ID: <198f569078f4a6e3b4e8ad080a94cd336c1e39bf.camel@linaro.org>
Subject: Re: [PATCH v3 07/13] mfd: sec: set DMA coherent mask
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, Lee Jones
 <lee@kernel.org>,  Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo
 Choi	 <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jonathan Corbet	 <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Nam Tran	 <trannamatk@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-doc@vger.kernel.org
Date: Fri, 06 Mar 2026 07:03:10 +0000
In-Reply-To: <20260225-s2mu005-pmic-v3-7-b4afee947603@disroot.org>
References: <20260225-s2mu005-pmic-v3-0-b4afee947603@disroot.org>
	 <20260225-s2mu005-pmic-v3-7-b4afee947603@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 6087B21C3F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7119-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[disroot.org,kernel.org,samsung.com,bootlin.com,lwn.net,linuxfoundation.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid,disroot.org:email]
X-Rspamd-Action: no action

On Wed, 2026-02-25 at 00:45 +0530, Kaustabh Chakraborty wrote:
> Kernel logs are filled with "DMA mask not set" messages for every
> sub-device. The device does not use DMA for communication, so these
> messages are useless. Disable the coherent DMA mask for the PMIC device,
> which is also propagated to sub-devices.
>=20
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> =C2=A0drivers/mfd/sec-i2c.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
> index d8609886fcc80..9fa1449a4f6eb 100644
> --- a/drivers/mfd/sec-i2c.c
> +++ b/drivers/mfd/sec-i2c.c
> @@ -177,6 +177,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *clie=
nt)
> =C2=A0		return dev_err_probe(&client->dev, PTR_ERR(regmap_pmic),
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "regmap init failed\n");
> =C2=A0
> +	client->dev.coherent_dma_mask =3D 0;
> +	client->dev.dma_mask =3D &client->dev.coherent_dma_mask;
> +

This should probably move into sec-common.c as it should apply to all
transports.

Cheers,
A.


