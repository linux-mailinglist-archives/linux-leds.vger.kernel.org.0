Return-Path: <linux-leds+bounces-2160-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 251CA919EE9
	for <lists+linux-leds@lfdr.de>; Thu, 27 Jun 2024 07:53:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEE251F2280D
	for <lists+linux-leds@lfdr.de>; Thu, 27 Jun 2024 05:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F57D1C2A8;
	Thu, 27 Jun 2024 05:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="k8aBZcyh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E8D23741;
	Thu, 27 Jun 2024 05:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719467587; cv=none; b=mStEo3Go5RGuck1M8x+iEl11Fk38EtyYu9U2zN7z6hKeTlM4tiRxpUYEF5Vm3YJ1QC3NcSlbIukKKKV1RkE9k2/CqOXhZiRDzJ0vH3NkDKCoWhNL9Yi0EHn1+9pRC0JojBi2EnYaqDQCU7LBA30zkFLKQohC2KVpIvmCOWNhDMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719467587; c=relaxed/simple;
	bh=st//3x3GChbMXXBNvn4EfQv9/VlJNxVn8qeKld+8YfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=D2BykpzEIj0taW3V83bnJwWGeV7CiJPDWyaTiqXQaXVp1/CoYhiFwGIsq8l8N8R96Sx7bg7Du0kBYrHJwOpPX/wyRvQhH71GN61VnvRCqvb1TVdyd3JDPKfMZNwzOR9JPm3B50WadjHCpSQdAqJttxdyNrPZ2csHts64RX6N+9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=k8aBZcyh; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1719467568; x=1720072368; i=markus.elfring@web.de;
	bh=rvWyLWw46USusqeOXC9gww1xAivpcogWVTahFIprMUA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=k8aBZcyhFxL2+BlXBzrc8fHFOtXkb3G6xhhWYbdCnpqGGHZqBuXP+P4P4EzuljeI
	 /AEADn7q2V15Q3wpw3C2d+2Ey9MyjaEJ0kGHuL7vBlzALxmkHR5iBKkZbgmKMm4a5
	 4k+fRyD5RguzerEKgR4kKdqHUi8m7Qq6Ow4bgFOis0gGrwZKStgoRN+99L4ebupij
	 zS/y6GQmg6sJZuNrKBJ158n35xKwV1sp6EaAOXT7Jn2gGw5JHwylEmVqEADrj3cT3
	 xN2h9J8GJR4D9OJipTQ2BDWsd1KscGKrNbwC1el6NWHNikFHLhwBksb9DOIuXbJ49
	 mSjo2p+CYiKEATKjyA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mrww5-1shgvd0yiT-00hiFX; Thu, 27
 Jun 2024 07:52:48 +0200
Message-ID: <fa53fa80-4c0e-44d1-a62d-da219831526c@web.de>
Date: Thu, 27 Jun 2024 07:52:28 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] leds: leds-lp55xx: Convert mutex lock/unlock to guard
 API
To: Christian Marangi <ansuelsmth@gmail.com>, linux-leds@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>
References: <20240626221520.2846-1-ansuelsmth@gmail.com>
 <20240626221520.2846-3-ansuelsmth@gmail.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240626221520.2846-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6PKBVtq2ARWO9dcIbWLKYQV/yC1m65GGkNgQYGxAODZ/iePxZn5
 QQhTJKMhDwrNH7pjYwNLuekblMqf0vH8xP3ebU7HPlZNq0e7GyBseAg9YGdYR6qbDv8pWRc
 +hGKQ/ubD+19eVPYf8YY0KS3RkGT0fWx3lLmmMtFf+quN3C6zbSd3bBtmfAPSdTwyRRmQAB
 lvLGMFXXuON1AmHM2DLQw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:F0pVt3hHreo=;9j000P9YN/OTCLIdoakIFQ1rFvK
 PmPF3m9wW9dA6ljR37mY9asJJ8KoiR+dLjN02bAUoec/D1AmJ9Dt8ICu2tN+7xXKj6yhRPxeS
 hy+aqO+IMMcaVurt21WLJI6wtoI697Ih2JEMTINe5pNXwT8XMpzihm5wPEv1vs0yQz1ytA+gg
 HiXv57XAT2J/z/bvmpm4IzyPuOzH9xS1Y3/lMBVZsI8+Pvx9yb0A4IuBIi7pB++oCp+YcU5KD
 hPKqqGYsEaDNP3E5L1dnaL5ir26ods22yaa1c5Disjazh98Q+7vQ0QplnznixzGBOxtApk4B6
 DrBrCeZ3kVV8K/SAAXRkgj2F4xIB8u4Zfw+1hLas397dv0++HNxGbUX+dOpboX7HS8xo1kibH
 7/63p6eh1Rz7ysL66XKe61O5c2+UNL3FSrlXj+J0zSravGJlEbiXyLyfjZRXaqFJTi+NNMng+
 8JsXasjIs/UneT6YL9pSSk+2HtJA+xWdHyAcN4k47rtUIoieUO9fBek75IUqmtWmMNa56gast
 B+JU/vnvTF6qY5TEmnXYCLt+d5s1ctWeawjMA4ey4oklWD1thYIVkzxA7TVOMk1NQIHPTUVb2
 rizprD8dF08peIROb012nvTYSA5f28aZIwFLynXAVK+AJ/qr49a2DqPUnvT/XlZjvj7SS1fEN
 44vDFiKo14OL3KhnxQCOQ37toFrU5LG9t7/suEBupzUIk1A4h4qnI4ZdFfr+lCE7ET2K+EYDh
 nj/HGhHBL/TCxHVNROMaXBXD7zRejfUu+Dh4Nzb9+0ZyPf14HQ7dUECLDt2Vv09lmeqOl0fHt
 CCwehsQy7vIm3+RN0GkOsprCjtCC7d8MyPvHhMotpRDgU=

> Convert any entry of mutex lock/unlock to guard API and simplify code.

Thanks that you would like to support another bit of collateral evolution.

* Would you get into the mood to benefit any more from applications
  of scope-based resource management?

* Will development interests accordingly grow to adjust further source cod=
e places
  according to known pairs of function calls?


> With the use of guard API, handling for selttest functions can be

                                          selftest?


> greatly simplified.

I find cover letters helpful for patch series.


=E2=80=A6
> +++ b/drivers/leds/leds-lp5521.c
> @@ -9,6 +9,7 @@
>   *          Milo(Woogyom) Kim <milo.kim@ti.com>
>   */
>
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/firmware.h>
=E2=80=A6

I guess that this proposed addition is not directly needed here (and relat=
ed places)
because the header file is included for the macro call =E2=80=9CDEFINE_GUA=
RD(mutex, =E2=80=A6)=E2=80=9D already.
https://elixir.bootlin.com/linux/v6.10-rc5/source/include/linux/mutex.h#L2=
2


=E2=80=A6
> @@ -185,9 +186,9 @@ static ssize_t lp5521_selftest(struct device *dev,
>  	struct lp55xx_chip *chip =3D led->chip;
>  	int ret;
>
> -	mutex_lock(&chip->lock);
> +	guard(mutex, &chip->lock);
> +
>  	ret =3D lp5521_run_selftest(chip, buf);
> -	mutex_unlock(&chip->lock);
>
>  	return sysfs_emit(buf, "%s\n", ret ? "FAIL" : "OK");
>  }
=E2=80=A6

How do you think about to omit any blank lines (also at similar places)?

Regards,
Markus

