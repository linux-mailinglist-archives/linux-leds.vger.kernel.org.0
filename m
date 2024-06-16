Return-Path: <linux-leds+bounces-1959-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E40909F5D
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 20:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65ADF1C21448
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 18:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E72946447;
	Sun, 16 Jun 2024 18:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="v6ej0ZxR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC7D38F9C;
	Sun, 16 Jun 2024 18:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718564167; cv=none; b=G667ADaxvHWQuW+stnwXN+jRZyKIfxL1N/fn2Ag+fD0Xz1f40JJDfGSpM2UTdZ4qCvx82A6dAai0MJN31FC5bDUkcH3VdWox5DXwC5ARDoHJknH0dBsE0+Q5NrM8ZO2kCmNk5OmyeR0mm+t5xEQ7LUrGCu9gU6aT7M2e3KHHkms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718564167; c=relaxed/simple;
	bh=0/pOEFxsthRlQhSl5WrOvFSRv2TE6ENvSR/uC4B/sMo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=i9Jo9yVuEKa723PBjEc9A6tw0yee1oShgPd7BkKvf0JWiNZ9FVqPgfh8WU2oV1vf3PkobJn08mCE/H38KHlMMMYo0E03xI04FdvrkAH+42yAEXNr6KYzfJJZlMJXmXtWVIejLUSungLAL5du75x+K3x7JHdgops3CWTKeP+R8wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=v6ej0ZxR; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718564147; x=1719168947; i=markus.elfring@web.de;
	bh=TadSfGlgyQ3g8pB+Z17nGGdeUmohHYYee54GY/jGgcI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=v6ej0ZxREsrJB8odiZFtwUCH0c32vXeGMhBXv03SXqpaFhe2J081AHeGv9w/rTXf
	 KjLfDXfTL/Vnhbq0lJte8jA75iJFLZMUcF8/PrYhE4IGhK5bI1mJduUbVJvOSPTxC
	 51VjLTIZUOr0gvOkGK37zJfJxETAVHWvOvHqb77rjHBFLYHIwq5k6Z1NfpLvZCaLV
	 qtZhcNTcu1Yj0nf4rF2isiKGAuu8drY1ufejmYCqaz7afImUDM6UYfmyR/BGwdMfu
	 d6l+sYuoPacM3SMqudiBTA0yf1+DeZ7BkPthYsUw8cXKHg9LlhnrcZ7LK6ctHZ5m4
	 PauP2GM46Ufgipk32w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MkEhR-1sgxBK0qWP-00a0j5; Sun, 16
 Jun 2024 20:55:47 +0200
Message-ID: <5701d3e7-f67b-4189-a5fd-8a992b9155fb@web.de>
Date: Sun, 16 Jun 2024 20:55:41 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 linux-leds@vger.kernel.org, phone-devel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Bjorn Andersson
 <andersson@kernel.org>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Conor Dooley <conor+dt@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <kees@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Trilok Soni <quic_tsoni@quicinc.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240616-sy7802-v4-2-789994180e05@apitzsch.eu>
Subject: Re: [PATCH v4 2/3] leds: sy7802: Add support for Silergy SY7802 flash
 LED controller
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240616-sy7802-v4-2-789994180e05@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ywmCAB1urZYwmKWG28z7eeRvFFUcqwBcSdSNHJxyQpGb4LgzckJ
 xpIRNMpfsN4y9ydnb4FsTGqE1FXb1dRETutow8zQfzV9RbscpsCC33iCrZCUGp2SnjGL//F
 nmCBy+K+HzGYAAahPTthzaIxguACFfFUqcb8ZXKz2tp4mrReIeysI1xDJv1UfIAbu07gpq3
 vm+Jwd7RZzTuJ5fKYrqfA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:d+CmPQ5T6d8=;LY+jjA61SkrYUiRyE6sVijHQeCr
 +wSWhDx2+pOM3HjnD3vHVNgtkPG6APCgLGneqFQYgt1T/+McO6R2O2Q7cZSGaTbayJ2Zj2fHg
 WndmgWmJ403EcVA98yNgZxSuhMubZyH361FMuldHnaJmcOTeSmiOGkEbc3vP08jcXD4X7Ah1u
 Zw3Q6mYdpeSXh4boqS8V3/NgRpMHF0SIWjrjZMZFfjLGouY/X87ynBopI+cD6Zk8IoZY7bcmG
 4UEPVjzZTwzityCmF1W3iVqA5MrwT9ZdkIfYhylZJNHG6h220D2OAZMvcIn3SIDnxkueixitR
 M24NxJYtPlJOQzoU/VkEXUIEVvjjkITbHkabdE28njyV9fyuj/u3lub4j1tgjTn1KgycE0x2h
 TemrZ07dtb+gbgnqAro2R4sEuzrWlL/6jIo2onX8zju0b2vXWCxHEnnyDih/TCIo4BDdKhOag
 T8NVf2Y7AK4IJF6zZuzbX7ldVSGTjdfHO23TW0pxBshT/HGr1sqnJn4bRXNrrjE9uygukklg6
 bPHALhAFr+27ICMgpdq+rPjm7oB1B4XIZiMLM0+iIznYvHL0HFNVOsMd75nopWn7roW6KV1yB
 VGv1ZYpFTQaOIQT0WARMaUPGuQrW1cfKXhwW1D+wvLjknwaFwMyzkOt1KZ0ly07ua2rKV3LRh
 xfSB7zkCN0yjsPOVH2tZXTkQUirpghX1xBGYNAxlDAvRVhpr/b4QEQFKTImsRNmZ87ayztouq
 ZqfGKjTHJ6VBQBBdCsvfHr7pZZ7Fiax9DtGo1U2MFme4cjOlbvQnB+mCxqzaqHvo0/6+TNuls
 aKIcS82tC1xh8NvtG6PWmlX6jbFa+CtxDRf8ZnLODKtu4=

> The SY7802 is a current-regulated charge pump which can regulate two
> current levels for Flash and Torch modes.
>
> It is a high-current synchronous boost converter with 2-channel high
> side current sources. Each channel is able to deliver 900mA current.

Would you like to improve such a change description with imperative wordin=
gs?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.10-rc3#n94


=E2=80=A6
> +++ b/drivers/leds/flash/leds-sy7802.c
> @@ -0,0 +1,542 @@
=E2=80=A6
> +static int sy7802_strobe_get(struct led_classdev_flash *fl_cdev, bool *=
state)
> +{
=E2=80=A6
> +	mutex_lock(&chip->mutex);
> +	*state =3D !!(chip->fled_strobe_used & BIT(led->led_id));
> +	mutex_unlock(&chip->mutex);
> +
> +	return 0;
> +}
=E2=80=A6

Would you become interested to apply a statement like =E2=80=9Cguard(mutex=
)(&chip->mutex);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/mutex.h#L1=
96

Regards,
Markus

