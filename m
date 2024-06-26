Return-Path: <linux-leds+bounces-2155-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5551F918A52
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 19:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EB972835C0
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 17:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C3317CA1A;
	Wed, 26 Jun 2024 17:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="vpFq88Qn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24A3155A26;
	Wed, 26 Jun 2024 17:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719424110; cv=none; b=lyCbaoraFNsQfJtWTvTK3cFJQ3uSCQlqypWieFl9/Yf83AfP6+07EB6+JTEAxeBvZ6jHKXvBrz/7ib8s7GdNVyOSEtAtYTO1lIfegFqECD1I+e6WSi2UBC5P+ittTBoxKUr5A7A9NTPphwnFSBb9iZx/eDnoYaq/fbDkNjrYrO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719424110; c=relaxed/simple;
	bh=s35+qZTcqhwM8W3AinynCg6kiFRF8n8VyM1SZPYKXqw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=ncc4/ucIM9cs40sd4jP53J/g+YYEl6xmyAMyo/rgPVdjFZvFgGXjgOw9ZXU4G1UoVoINA1bQ16MasKRYHJFux8OJ8diyuXHz2ycFTqFLk+FfE2Qm5Bkd4DLor9NCcDcwhCJGhRzP6tzHc+UcpFpfJAOr8aaSwtdU+tMR1bbQQuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=vpFq88Qn; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1719424097; x=1720028897; i=markus.elfring@web.de;
	bh=ckRm9hxi4SLgTfnZQvPFzAXNKifH/3B+TbZxccPOSOQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=vpFq88QnbNH7HmABo7mPWqDsYuyoVpVSdhObFfvIR9X2L4hKxModF4fvj+qmuct4
	 UGGbQvc823sEgwSGcNK5DDbJ0jbjLMsNcjIZpt40GOrMvNT7KSZ77nCP+MxgMyjsp
	 hIj2gRbNTSbqxWbP2JJkfzsCLWOwn3a8McPXZUpjfTuyFLc6OHeRsbxCHlijKwJyl
	 GNt7m+VXTSOpNR2swCAuq2CGrhF9FrKTIkf3qSNo5ka3hrByiEy3tI+yPKTS2ZDGQ
	 msctZq47Tvoze2jko6mK3Y5/7Fu1udGa86VsRDYmaSOtufEZRLmhdrzRzYWgZ/dIW
	 Kcn8NTdAtHYKyI1Pqw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N79RI-1sNiYf0i1E-00xIMV; Wed, 26
 Jun 2024 19:48:17 +0200
Message-ID: <db2d2cee-64d8-491d-b8a5-f0362ddc269a@web.de>
Date: Wed, 26 Jun 2024 19:48:12 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Marangi <ansuelsmth@gmail.com>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240620210401.22053-11-ansuelsmth@gmail.com>
Subject: Re: [PATCH v7 10/20] leds: leds-lp55xx: Generalize led_brightness
 function
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240620210401.22053-11-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ey+tkCJX0xs2Ahlx0Ke1CKYmRvYbATtl65O1+zpFb+F2XLFr/fv
 FlqwzFGNauBuiyxAh0BZoGf/3bxKEpAbS6kSTkCH2huMdcTAeo9vB3FYKt0kd5kuMzafdT8
 VIrNFbkGyyostHbcJGhsM1GWh++Iukfjzy39cw66f+q4x0AkDVGSfYxagUkB6Fl9dptU+Ch
 qvttwJ90jgeokGBRp+qfA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:l1iGpyGvBs4=;7BKbWR2rkr7FYKX7wZXDU40C0Ij
 UtQYiP0pJsBPidm+sQgK7NrqSH51wEjn6zXI1c2OBVALaLFz0MDVInhFv+30ig6TGR565aQP9
 +CEccUH33fxSFqUPRTDBqtDNKlvFyjVOldzZ01dtFbF+cvkB2wU4w2k6+zJrYjn1+Aqepew1Y
 qtmYt3QQ07zfFF9cmyblKH/4LLUZVye6L6seVp3a1getIo1Et7LgadCF6jfLq36KgyZBoycM6
 QAHDDR6psIzDygR1S9dQKgW1MBy4ZBaCEhofHD4+V4ltek1wad5ZsYnPZ9klDt+a9QGS1RCVh
 uE6axgQq3mzP/VhJw/beU2LuZdP2MCYlMdie+lOV5MIBHYes8UG1YT45UMzvljAi3NoOSBV9Y
 WV2pVjYZm/ji9YJKj66cIrubzl9v9opiJbi3LauHGX0QfGAU/QW037cXIiutxS0Gx3bgqju3B
 2yuHSgYgZo6x74HbzyLz7nQ8N/JqtdQfn7JQlJpoXGvzgnO+gJ8a8cw4aWyTkfS9V1ZBD0kT3
 IdVNbqBw8AWfwpOe1aRajT2/xMhjo+hab+KgXV1Owz1P7kD73LcyjbfZsq/Bvq7HPmbaB6ovT
 jZNVJfPXFVOW3gN6DGsXgHB+E0m5leeTAO1FKaxA7p1AZi0/WGrjhWqxSivGK3XbeYWK3pAVF
 0sN+V35IkQ9qTBzhL093sGak99KT6HjHT12EvvZQrO+K6X5uRiUNLJEntBgqEZGVGYcG6HJN7
 mHnGIpUOuJVwIzmpyrUjXXjlZjEJQaWHLnEl6vKWFPQae0AkWCyyY/SaqYACvF7CxNF28/b4O
 gYm8NoAX2llnvZ2eNy11Ob9yGV8zufN+D+2MJ627IiKKY=

=E2=80=A6
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -242,6 +242,20 @@ void lp55xx_firmware_loaded_cb(struct lp55xx_chip *=
chip)
=E2=80=A6
> +int lp55xx_led_brightness(struct lp55xx_led *led)
> +{
=E2=80=A6
> +	mutex_lock(&chip->lock);
> +	ret =3D lp55xx_write(chip, cfg->reg_led_pwm_base.addr + led->chan_nr,
> +			   led->brightness);
> +	mutex_unlock(&chip->lock);
> +	return ret;
> +}
=E2=80=A6

Would you become interested to apply a statement like =E2=80=9Cguard(mutex=
)(&chip->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc5/source/include/linux/mutex.h#L1=
96

Regards,
Markus

