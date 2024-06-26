Return-Path: <linux-leds+bounces-2156-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 704A6918DEA
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 20:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F172A287CB5
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2FF190071;
	Wed, 26 Jun 2024 18:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="XW0D2251"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE76F18F2F9;
	Wed, 26 Jun 2024 18:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719425314; cv=none; b=HeOp5efVamAvrhIM5+8Bu1IdOcsZ6ndnYvYEpwfUtiDvBrq+JiT+V4jaTfzrMVCKX7gaIhd+T4H1KPWtVeN3hgHu4fHpRqhMcl2ENCqPmJvcJC1EoFg/uErBrLsdLewoOjTpJ1Fj0uiqPD9klbB2r6ZEfxsJ/zjIbjpM5BcKUHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719425314; c=relaxed/simple;
	bh=nqFkuvGoEfXIbghEsJeiHvKOUVP3ZAtCwu76efKGlWc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=XsTFhPW4GqgjUDakVyw5PhwtraUfhxiV9rPhlh7QK/Cr2LrbRtbkFsq7I26s9VUMcysZtAlHIXdCOrrNyFyQ94XfNnjRcdSPfhrj22vaBzTJlJKVYNePPvhJtNDAeOXU70pMe7Sptoe2w9xu0g6V217ieVeGODtlYZT1SJul174=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=XW0D2251; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1719425305; x=1720030105; i=markus.elfring@web.de;
	bh=3dI9ANn3NzfSRMZEIZoWOqEEKDQKH+9ITjk5MkK8hRk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XW0D2251HCSpveMJlNBKTKgHBa+5Wj1l8cNZkQVODfBbK/XqfL+PldlsQDTmmhfv
	 XdIOyN7e3AIgYPGXRUjx7/VgKggKnZJqkxtaJLG7djJLLyb8hsrk56Hh50TXdR7Hp
	 niFon2UqoETgrtusfoI5Tcm8g/fQFRxsXm+8ctJaGRwvhHRSPwx8AFJqswYj50eSY
	 Ybb02ZrCR9PL5V/E2CKmkALZ/ZMWsnsHrCEfCU9m8nI8+KLFvqpM9uW8hNO7o2sWu
	 kd/z8D8xXc5R1xywdaetkr95TtzFgbrbXAn1lm6M4Obsj88MoRbfwUflK+9xvZQ5O
	 GA568MY29lpvhdAzJQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWzD3-1rpkTB40N7-00Mbgu; Wed, 26
 Jun 2024 20:08:25 +0200
Message-ID: <dbf9ef52-78d4-476c-a2fe-11e6527e8ff3@web.de>
Date: Wed, 26 Jun 2024 20:08:24 +0200
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
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240626160027.19703-16-ansuelsmth@gmail.com>
Subject: Re: [PATCH v8 15/20] leds: leds-lp55xx: Generalize sysfs engine_load
 and engine_mode
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240626160027.19703-16-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fPDmXKJlV7r/oBmEGitj9+YMtDqRudhRY1yZfuiNo1dxzYVIF4M
 Zw6FqROj5+VNgOGMkOgCpTsHDYdn+3FEEtMf+68QghnhOT7xDqksTNF4Czb3ABsc/qTCShD
 nvEAUKsm6VFXIsjqxCvmohgQM+uTLZnGxA4W4v6JVUR/HApodd0Qv6zU9iXAWQjTzpa9hx5
 o2zbqbAsYWJ3z+8kglhbg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0tt96DqzZBo=;0REToPgJUHF4zxt46RPxGHQepoF
 XMBW+1OsRNXPIC4BVitL2U46JE7jeLGjXsyHpePYGwYekSPyHDQNZRWAAOA0IGF+8+NfQSmn4
 J8ofU4HisOwcgqEpgHhX9G6KC2CCWgljBx2XBFMp+dGgQVcgwgSNRI2nsmveRtPKjGKN237pk
 kXXozf+QAbi0PDNqgNzPdykdhwBCwPyZvw2YPDfP994Bk99XRAwgfNM0SgQ8se1BAjoc4s4Ha
 cTo1BmD3az7slZuEuGQG1CBPumu6s8UhWlBIwc+jc3d7ph8+I6CEYucGugs02LKUsqjtssZko
 mNIvXwLA5uTt5PLIEHlbMEuhnFqbs2Itkk72bQYZxZ7kAL5u69z6KGffgrCq10vHD6euGfLWZ
 tGc1aP38a7MDKQKw+jl2oIN1dvZXlQfuh6xCaBPmJb+UrsOrzlNUODdoymoIRdjs133NOXAIK
 KiF0QF/NmazDSMRf4KbejAEKl/jW6Y1y3Lk8sOWQg5/KdyublpZ+FNgE4GvxQpi/NuhitCyQQ
 8Mj+gr2s0oiXEQ5+ARd4LL/IoJRxPWS2YZymfipxzGvcDmVzshNex1AtB+y9fq9xtNN03prBH
 5DIEEt8DXIwZlTMS3ZwijRpUzg0AJVcC6vRpRaSmCq887/9r5ohgyEOjxr8EOYoQ1RjH4asug
 ul9czitHj0keg5aT5UEPZzsmF9kUzT4+s4DG8xdIJSsne5KtElF+AuapCVMMw1UlgtQBHfIXY
 Ubp4xTq8UKFlWruBq2c641eFpQmGfCbnEzHLA1rG+1dhcyMxu5GmF5sQfjmIKAtiH1fHORlKG
 1CeKeGLchSeO8yI6TywecmVArL7oZ0SrYWz9BYQqQyjQ4=

=E2=80=A6
> +++ b/drivers/leds/leds-lp55xx-common.c
=E2=80=A6
> +ssize_t lp55xx_store_engine_load(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t len, int nr)
=E2=80=A6
> +	mutex_lock(&chip->lock);
> +
> +	chip->engine_idx =3D nr;
> +	lp55xx_load_engine(chip);
> +	ret =3D lp55xx_update_program_memory(chip, buf, len);
> +
> +	mutex_unlock(&chip->lock);
> +
> +	return ret;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&chip->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc5/source/include/linux/mutex.h#L1=
96

Regards,
Markus

