Return-Path: <linux-leds+bounces-2243-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A167292D639
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 18:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D5BE28789F
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 16:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DFF192B71;
	Wed, 10 Jul 2024 16:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="kdWFi3F7"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FFC20312;
	Wed, 10 Jul 2024 16:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720628679; cv=none; b=XsJ6H7sUl+70OWQWf2jDLVldHxj/kAyOaVj+HE2TQDGpK0InfG18kRA/SwxGd6vN9rJPBnZVa1PkyUgFr35OF/3+KoWEHVxBHNe+6UUgSVlfP5ORxXXrSsQG6x4qk9P0x5IFtBj/4eYRKfEBrdaJrrGUNRJOfvMD9HeQWZVmgvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720628679; c=relaxed/simple;
	bh=UXU+DxVxjQagSgAXY7Rb8a048yQL1SfKoLai/ZzuI2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=RTG1VGIxkEukzhuHWvqP3OmRUUb7RTipKDDSWijQXxMlAVxnXzFQqt219lp4fUGwHT5hKm3jOntZIENlesDbG+RioXwlkcN4zpTYa1zG1HXNgGZQm3IuW7dj9c6tUcHK49X4aNY1+XCpJKOAFZ5wuQTXeDkIJAyWgtI7ZjzBvHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=kdWFi3F7; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720628668; x=1721233468; i=markus.elfring@web.de;
	bh=4IJhOj56nkIUoFk5P3kuHi2YMmKFFhtp70989RwP5ig=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kdWFi3F79eWGyE4naYgAprjPwAIu1JyglJABye15pi5Hm1dvcZ0D3Oj4VmjxQwJB
	 mwCKUtSXXdKCLxbDL0nliX8b5LbmaBPVuQIoDvTeXzY3sAwx5yDdO0QLrkSa4DXyM
	 IAUzcDv+QMJRrkZpnvj41Idfq5NwFi5N+HRaB00jHkeyKXI1TWWK4fAr5Xr91kHiu
	 0Rdc/0dXVgLkiGDLnlaWikg048jvqTm8oMGuJQFcjnYAg217Jwvj3TekMM+T9JqxD
	 cSs66TmgAD4bLJgvAeT69IfWCSWnfWzh9g6MznkpPBaSZnj7iuY+w2udC2mzduCyA
	 FfHqSnNjZlMxdDXbSw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MjBVh-1rvnWz2xBF-00diE0; Wed, 10
 Jul 2024 18:24:28 +0200
Message-ID: <493f3160-90be-4c02-a0d8-bedb630e5f1c@web.de>
Date: Wed, 10 Jul 2024 18:24:28 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] leds: leds-lp55xx: Convert mutex lock/unlock to guard
 API
To: Christian Marangi <ansuelsmth@gmail.com>, linux-leds@vger.kernel.org
References: <20240626221520.2846-1-ansuelsmth@gmail.com>
 <20240626221520.2846-3-ansuelsmth@gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>
In-Reply-To: <20240626221520.2846-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FRG+/KXd/pIe/Mus6vmllhAmzHbhpwQKy8K14r/MHK43mTmOfnF
 zvlLhIW4Oot0GW2xoJkyzEfCvwr+Xh/xriI/iByRY2G93CHgYk/uEcHM9Ki9MrLl4lma+kg
 542cM+bXs+Qh3kzhj0TrGXhfpEP0zzajJLFH9pIdVV39yDmERwIap+B38Wnj5spiIvhTnmi
 8QyCylMNFK0p1qMfDlnPA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:g3Ic6HYhxzI=;bTUyNxP7aomfs6bbZlWIFCAqoMZ
 dUCYkU2fknshhgrKYtsFNiZXO57lBKUOGY6s2iAaaFbCEYoPBwCUj4KYIaFB8SUQqEt5qPyYj
 t6L+T7vl1T0AEjjrYA+2iIp7xK29j9sKdn+BPbMA/KOsOV9cf56oWTzcFa4CUR8u0xwzhBO+0
 zmVDWgI49yc2UPA6RopvfbBIshfPpilvaJTnL6Yaj+NQTZ4670ceo4ctdnxWlO3U+xpUuzknq
 Px987/PzSPqPNc5ycRYviDJPzuGObj+MyVeFmr7z3egPjz2ukADF6AGhH1dZgE7+8suQq/qVn
 EvTYAP4Q3Iyc13Ej9DEoAi8kVfFo3TpID5C6mUUFTRYGS0F5I4ITQ2/NWQH0i8jjYHgk4khbc
 +5ToC1iY7ycttLLAGf7qbXsWi2Fi+tlf96fGli9+heOY7giChAjZm32M2JYR8lIWm/4pmqGuY
 3xBFz+GgnZIXAsXJ/aYU6yrZ3l+VGVx602H6OXlKWmsuBKYIvl7mq02U+GsRHplG1cUdt1ErM
 qqgyQaTbElyUC51jXeS8QCMyQ9ygFyXaed/AyjNGc1JsLynzINv8GyidDvtFe4Blnn1muypYy
 nslWZdWbajGGjBjfCgeX9ZF7UiaXmVh0Auls7ApfBVqFNzO96k1QOKAdUnP5PCL/vp3LOfyXb
 UMv/63qF7kZR4cRc8pAl+sEbgkiUzYNGbySmfn2q9XXkCscTyDoBmrfkvDrew93/vLf/YWyoJ
 vCKgLqfZ0e/HjP2KUd6G4HsxMFgbRNfWwkweYZAxfzkxjQR5IwXpyqZCFF4h5l1GioxnFWd2B
 ye8ilAlHTzH0/OkJkiPcqmzA==

=E2=80=A6
> +++ b/drivers/leds/leds-lp5521.c
=E2=80=A6
> @@ -185,9 +186,9 @@ static ssize_t lp5521_selftest(struct device *dev,
>  	struct lp55xx_chip *chip =3D led->chip;
>  	int ret;
>
> -	mutex_lock(&chip->lock);
> +	guard(mutex, &chip->lock);

How did you come to the conclusion to try such a syntax variant out?

Would the following statement (with additional parentheses) be more approp=
riate?

	guard(mutex)(&chip->lock);


Regards,
Markus

