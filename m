Return-Path: <linux-leds+bounces-4365-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00622A70A16
	for <lists+linux-leds@lfdr.de>; Tue, 25 Mar 2025 20:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C0FA168512
	for <lists+linux-leds@lfdr.de>; Tue, 25 Mar 2025 19:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485001E1DE2;
	Tue, 25 Mar 2025 19:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="wfWEfxKU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E2F198E63;
	Tue, 25 Mar 2025 19:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742930150; cv=none; b=sNh3FJYEVeonCQhri6qOjGVk5h9TjMQ3HktMKki+cQsDp6814L9PhuNMkWeuMCuxAppTZEsAmnX2ZMHklEsnNNRj87vHLlNb42gA1ZuaD7xzKNqg+YDIEUPQeGjQon8VGuvx+KhHIhrXMsGeUYXn3Dw++VBfIzIJcIQyElSRIb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742930150; c=relaxed/simple;
	bh=8c74eJmn7n9BkWsNrIday1jXp2iCIWTke1lQUCKYKdQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=KZnsNRhhdLwk40e7TB43vnxM4uOhQxmWDS/qdXXaXz3n2QUV/iDTmwNeXwbgZChomfcvVzLg9nACjEyDE56SisZHirGQHmpwjK6D4WLW7Dro4VEDCsORx5bWTeuUGYCWRDJjdRaMWtGKlJL6G/EmjvEj6LoGnR70HN8R4ofQcKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=wfWEfxKU; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1742930140; x=1743534940; i=markus.elfring@web.de;
	bh=rryZy3XSWcvAXX+Ot8SnAu3s2oKHSy8k04PfKWLoDRY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=wfWEfxKUw6LWwGamf4675PywcFq9qGOTCS7rehpgz+wAingxbiVoqtzDw9zb47K9
	 s5OGf25MlDG8UjAxCbaIzXU0zVoklIGT1FzfoAoBk1y1sY8aAa72hmf+xHvwx/SKl
	 QW1dGa6y4Hn+kEiA1MZ+HW81Lda4l2QhygClhYbA9nabdfFjhmteIqAZOcwl4dKSg
	 DoevFGuSqlkjW1ZmvfDdqoaYTWgbgDFfeB9YQLazs10AjhQNcdFe4t9z2CxfBFvYn
	 +1D599OZJY4EfNvT7d4i4NlUGobKLnQhJPggXAS6muBetrRAJ48q6Sg3IV5e1I6dE
	 Rk8m/SwFsRW94afEjw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MoNV4-1tLxJr43mi-00ZU1r; Tue, 25
 Mar 2025 20:15:40 +0100
Message-ID: <2bfc3077-7ef4-45bc-b747-caf0a701f987@web.de>
Date: Tue, 25 Mar 2025 20:15:31 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nam Tran <trannamatk@gmail.com>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>
References: <20250306172126.24667-4-trannamatk@gmail.com>
Subject: Re: [PATCH v3 3/3] leds: add new LED driver for TI LP5812
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250306172126.24667-4-trannamatk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c9+KKO3cFToP1JFoKxIdBPo1oT14/DuY6eb8LXBHhApLJ29Cg0y
 2m4hCUnyf2GT43GFM792zGS+GcIRyB8hRp37ojvbsgbUwC5ZSV0Hxr/IwmG3VhJ3UwjBCiF
 J2Rmg3ZxqJbBObOHW8guY0nkK1OjsH946DlvrHSbC1DwSLe6V6+GV1kgRj0+9mraePIk7tS
 dZHNd1mwQyb85dyyhCrOg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hyvtcVdHdc8=;tUsqg+R4Vmrf5N2dMBEJ9wYau77
 QrI7Hvh9qXkfLEeLyTiZiswdl7nJpLs51T5p4E3kZl0UkecQvVqP58Qda4jzWZOAYG0O3b72A
 qDvcUqNIbzXzw8u6px2eBDEhezelkpEogzNu9GvzM/25EU/XnYD2gFLlw8vM5UJXJOkI9Mw8V
 OO5BE4TuF3sufb+GAHwFXtE41hNL9M7vHye8jGRRmZSGerHcqF6pwJ0+8Sa++S6uYA3z2FOKU
 02znn9X3V9znLtL+X+yPQTwlfmAIxvxejgbX9YLJofv5qDnNEa7VIpcgJWeLEZH+ABFklVI9u
 0MwZPoOfv+lWKGTbq0ul5yYC8ZXtsU73rrjbKezO79okgiY7GzShg4izODaJ+x5XTVRRYjOZT
 2XzlobHatzIFB5SukPyscPj1SSOgTxXjNHkAmNjnu8ZRkNwLQBFe/T8Adzo4JhMxEHdLEEXl/
 bpGO4h4XJw7uGDWMX2vzbzF8fcQBHc2UXRHziAfPtzNhUqhnN3wXptho5VNE9gCqu8fx66naT
 usa0lXthRZ27XdpBlfraydcCuIqwzFAkefLmqaChP+AiottpVQKDVqy4GlO0cVlC7IHPbWtEu
 Bw5tYjkH+7k+s2horQXIa9Fyf3sUwEAa6jy4oNHD5daepNie9YWxtLoV5x5wPZqjcbu4e+ZBy
 M9ztCrBKHZk+OOwvY/5+yIW6KIe6ClJXV4UVThmYAFlGTYLfpu9dYVvYbvMBPeHgX4Qj1/jxP
 hcVp/JRkLHUCyyifWndQYm3D0so8JHpy9TmNaT3unqpyUCiOrs6j9C14FVDVhXVw/ohJWfI3A
 1N/zDFmr6ma+urL4ER3rb5Z4d+25u8riV1re8old8NT4a0XhdNN/Ec2SfZGfCD+sDB7h/74eU
 WK7nehxhtsLZ93LgMb/oSt9iup8xNYfTB7LrAWvyOauynFolxvrcPEd4GQNPpCgm/vjR0YOpq
 C90oHDPSpCsjvszVj1tYUOZxfWWB6Kna+CgliNsRrkD/Gyh2UudldDqupICXHfyK9ysE+eXT3
 IVP9MNTW/OH71Y0o7w7SCN6kbvzD/b4z3wRAfrO0WFnAEytXktOdkmz8FJCICfmSxSRntSg7b
 0nJDnbGVSslyequUuuryt/rLhxLxEve4IRVm8J0EKSWWgBF/L48LSI9IC5+xVIp0od0zGk+3r
 lpj2jKVjBlVnN9FaeKac3TU28dTmSzvtslGr2MslCxEWyi2dIdgZXz30s33oVQSaNaFT5JgqJ
 Rb5cm7c5LmT5cCgHOGO/KOzb5HFd9i3oCykX1+omKp5QoUTJbxGK+eI16TxbPakJ0I3lI2U6Z
 qAVpj+s8sINEg7QrkjmygYP4cDAStw/8QPueF+kuHDQmlm2krJpto0uu2PAmtHWnCIr1aKN6O
 ePR8lseTV/yE8Rla9WD1V7PIqIjj01mybBfdrLY9OJqjyBbpgko5jpXCzWq0IfUO17CgyeyAj
 6qPvSWvs0Bifq8pOImlXXRuYM6eTl8kJHGB6TB3jsSOIyBZ3BWuN9Je37SXhnG8ZW2c9o4g==

=E2=80=A6
> +++ b/drivers/leds/leds-lp5812.c
> @@ -0,0 +1,2190 @@
=E2=80=A6
> +static ssize_t device_enable_show(struct device *dev,
> +		struct device_attribute *attr,
> +		char *buf)
> +{
=E2=80=A6
> +	mutex_lock(&chip->lock);
> +	if (lp5812_read(chip, chip->regs->enable_reg, &enable)) {
> +		mutex_unlock(&chip->lock);
> +		return -EIO;
> +	}
> +	mutex_unlock(&chip->lock);
> +
> +	return sprintf(buf, "%d\n", enable);
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&chip->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.14-rc6/source/include/linux/mutex.h#L2=
01

Regards,
Markus

