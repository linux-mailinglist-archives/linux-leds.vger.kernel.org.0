Return-Path: <linux-leds+bounces-7993-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BDhOGLk+Wn2EwMAu9opvQ
	(envelope-from <linux-leds+bounces-7993-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 14:36:50 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 533004CDA29
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 14:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 706B8303BB20
	for <lists+linux-leds@lfdr.de>; Tue,  5 May 2026 12:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DFE429814;
	Tue,  5 May 2026 12:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkwiHFIW"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DFC4279FC
	for <linux-leds@vger.kernel.org>; Tue,  5 May 2026 12:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984285; cv=none; b=cZBrnQLTdeCorenp4U2zRVq0W+mYIF0nivThS1s1+iba2I9AxOg/LOabPB5T9HRXFr9xMOKPLsAJdmXsHp6AQoh/3tm7629QPNWKOrQEUDGUKJQ2GdSFWs+28xm7BITnLovtowLvDmdUEXkR3tr9B9KiaWhrcKfNP3g2M7DDbI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984285; c=relaxed/simple;
	bh=foLLEzBbN+ywv8yjP/fbIze4bIiy6JLKs6ops76RilM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V1A72dm1fojS5hmgCXCryLc5fFxkSSljoG+93KikrhkXBOudZN/9CcZLIQiKnEt+WqkZfo6d4cVwu2K38IEqyupj4eGrUgAO1LjIJ/S6KzZ6qiZ+1yxZa5oXhWHfIWmDHliJvQ6BMcBPgyNrAl5RSUYr8o07tIt1Rb/sL2c/f3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkwiHFIW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E7FC2BCB4
	for <linux-leds@vger.kernel.org>; Tue,  5 May 2026 12:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777984284;
	bh=foLLEzBbN+ywv8yjP/fbIze4bIiy6JLKs6ops76RilM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TkwiHFIW/0yGibJfy+06z9JlZjkFTcWiKatHAE/MiRwdBzF4gt2A59GvMh98BjOEx
	 re1r8QAUqY+ch1Q+2xmwPfK6+471CpDQYcIc0x0QNRuuxORUdFC+ANiJeD+A4F10fN
	 ak5L5xU0JxuO5HMYbOezL9U80Bgfrs5dDaAiu86ZTI4/hPSWNeCyHOUafPoFLVtfXf
	 MzD0lvCfNkW/ng1CpzE3R0QRsCjeWa3rxT+4/TRaIv6b2wPthIl8tE7he3TS9PrtoF
	 cAwCHzgTxY0fSb4kNBzLEzfi+JZutgZFyBpb2ot6bS534pYyi285MzMb+MOa0PKrVI
	 tdnKJpNdQwNMg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a283c44478so6784991e87.3
        for <linux-leds@vger.kernel.org>; Tue, 05 May 2026 05:31:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/3mAzGBueOFuJeWw8W/Pzj1K5I/sq517/BYu/1VbXzASfe8FQasEvwP/pKzT8H8V+tZy1Hdg2+y8co@vger.kernel.org
X-Gm-Message-State: AOJu0Yy21yAcZqtlyOf1fmkvAZ2/LTQCMWV8PsusoEGyz9EWwBPSi/AV
	G1sgS9+P3JbVUdTvOXH/qBVyKNbJf3PgmAt5U5lsUlpdTJESC5SRKTaZubct8FIF9rt9NRgYw7N
	VL45qgNm+EZeGS4lpqs6/m8U9JoptNJA=
X-Received: by 2002:a05:6512:114e:b0:5a8:6b9c:158f with SMTP id
 2adb3069b0e04-5a87f2178f0mr1360891e87.40.1777984283361; Tue, 05 May 2026
 05:31:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430091202.2724109-1-arnd@kernel.org>
In-Reply-To: <20260430091202.2724109-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 14:31:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLmNuDjzPueG9JQJhxPma9E3qs7GLmJ3tT897BqZ4SPeNw@mail.gmail.com>
X-Gm-Features: AVHnY4IYKNQQJ5BK8dMxt7pnrAIscOVuoUn3kiKb5FznHV3iz6kzhipYLkFJmGg
Message-ID: <CAD++jLmNuDjzPueG9JQJhxPma9E3qs7GLmJ3tT897BqZ4SPeNw@mail.gmail.com>
Subject: Re: [PATCH] [v2] leds: gpio: make legacy gpiolib interface optional
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 533004CDA29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,arndb.de,linux.intel.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-7993-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:email,mail.gmail.com:mid]

On Thu, Apr 30, 2026 at 11:12=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wr=
ote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> There are still a handful of ancient mips/armv5/sh boards that use the
> gpio_led:gpio member to pass an old-style gpio number, but all modern
> users have been converted to gpio descriptors.
>
> While the CONFIG_GPIOLIB_LEGACY option that guards devm_gpio_request_one(=
)
> and related helpers is currently turned on in all kernel builds,
> the plan is to only enable it on the few platforms that actually
> pass gpio numbers in any platform_data.
>
> Split out the legacy portion of the platform_data handling into a custom
> helper function that is guarded with in #ifdef block, to allow the
> the leds-gpio driver to compile cleanly when CONFIG_GPIOLIB_LEGACY
> gets turned off. Once the last user is converted, this function can
> be removed.
>
> Link: https://lore.kernel.org/all/e9252384-a55c-4a91-9c61-06e05a0b2ce4@ap=
p.fastmail.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: rework a little bit to keep the legacy code path more separate,
>     extend changelog description
>
> Related to this, we may also want to remove support for passing
> a gpio descriptor in the ->gpiod flag. The only user doing this
> at the moment was introduced in commit 1892e87a3e91 ("powerpc/warp:
> switch to using gpiod API").
>
> Linus Walleij previously gave a Reviewed-by tag, but I dropped
> it again during the rework.

You can have it back :)
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

