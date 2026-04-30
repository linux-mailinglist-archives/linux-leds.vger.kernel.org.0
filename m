Return-Path: <linux-leds+bounces-7927-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLqmIjNl82le2AEAu9opvQ
	(envelope-from <linux-leds+bounces-7927-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 16:20:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1434A3F1C
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 16:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D51B0304EA94
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 14:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B458421C16A;
	Thu, 30 Apr 2026 14:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jc5HtqNa"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8E92417D1
	for <linux-leds@vger.kernel.org>; Thu, 30 Apr 2026 14:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777558749; cv=none; b=XQ19H/jRUGqQEWjElbkfdXg6PLFZdRNS6sdKtGGTRoZ8Bq4Lpf3HZX3mI+idTSbfMjhVAEb/UqO+OB5BU6fLhgsgDBR2hIfkph7p9Bfo8wSWs3m2Q0vEQSeAKWJq+yEGCG6/Dlt+7DNx1LSnQ3RS3gjCmapeB0rOvNJ7HSF+pMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777558749; c=relaxed/simple;
	bh=Q9tt+mnufVVwhHRJ8ZcddPBPStA7bWjY220nJuQiZsw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LOacV5xKiIt3Kc6huXNLKT/QKNVGh8x9wYOnRntREeZJASb/mvRqcN+PiI/owCtYdp+Ny2QXDQW4EJG3VkwNIv8GOM6+5LhkEkymf4qCBnKFbfNDhTZZAVz/PHRXGMd5zqrDu+Z1HcXc9ILbPjSxWr5o2xqJIS7WpbuOsw1prgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jc5HtqNa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB06C2BCB8
	for <linux-leds@vger.kernel.org>; Thu, 30 Apr 2026 14:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777558749;
	bh=Q9tt+mnufVVwhHRJ8ZcddPBPStA7bWjY220nJuQiZsw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=jc5HtqNacskNprJJ9Dlp7HsGz1z9+SSyhb8ZBvHJlCZa58bZHhWGkWgKW5oN3eqIV
	 qVWy6G7UTpq034Ls83mhuQTbY8JHtkHJCvMjgCsSXjz8gTQSfNdUZH9gC4WdESysKl
	 rUC1kNk+8Mfhth1p1ppElFSiKYqN2S3dDG4R+QZfhktHRVoAA9hPCagZjL9of75QD4
	 kzSdVj1Alo0Z2e1bYwa0b75CwYW4LP9oqpzm6eaSN2ZW/4PVBh5ARNIR83dwmAl/th
	 DPgZND0chXmkuZ0rUoO/40vr60VoOaa0b21hRFJfioPAqHqOJal5k7PWJRFME2lz+w
	 /zA1IaatKmv2A==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38dd9f0fdc6so23936111fa.0
        for <linux-leds@vger.kernel.org>; Thu, 30 Apr 2026 07:19:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9MDrT3KWDQvIs2vnNBMp94OfiMY6xRpr3Z5b9ppdYUeHtld2h4yvGmsO3bqsKhE/jtsq5tWTumh8GB@vger.kernel.org
X-Gm-Message-State: AOJu0YyfUCaXPgqxK3lkGP6+zfdimET0ILm5rEHv4imLTcn2E+EN+F0o
	TX0/ZRQ8VRKhpY8Y3q7WSavNIYINjQBsQJquhu/66j2fGMisX6+zYoSU2HzYtYSfX3CLOo1T4fz
	QcAPwGKaAfMEeHuUC7YOP0Q/Yd70KApSYffsnrLFKrg==
X-Received: by 2002:a05:6512:1148:b0:5a7:4912:1a50 with SMTP id
 2adb3069b0e04-5a852741d7amr1333075e87.20.1777558748095; Thu, 30 Apr 2026
 07:19:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Apr 2026 16:19:06 +0200
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Apr 2026 16:19:06 +0200
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260430091202.2724109-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430091202.2724109-1-arnd@kernel.org>
Date: Thu, 30 Apr 2026 16:19:06 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mcy4SU_djLHzkvTT8TF+m+ny00HzitbEzafv=2hWeWAgw@mail.gmail.com>
X-Gm-Features: AVHnY4Ko156ktPJQzga9Q43_ALjDDN6D0nk4oJKZZDvj7AlNETrBLA7qJ5w-vCw
Message-ID: <CAMRc=Mcy4SU_djLHzkvTT8TF+m+ny00HzitbEzafv=2hWeWAgw@mail.gmail.com>
Subject: Re: [PATCH] [v2] leds: gpio: make legacy gpiolib interface optional
To: Arnd Bergmann <arnd@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: EE1434A3F1C
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
	FREEMAIL_CC(0.00)[gmail.com,arndb.de,linux.intel.com,vger.kernel.org,kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:email,qualcomm.com:email,mail.gmail.com:mid];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-7927-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Thu, 30 Apr 2026 11:11:55 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> There are still a handful of ancient mips/armv5/sh boards that use the
> gpio_led:gpio member to pass an old-style gpio number, but all modern
> users have been converted to gpio descriptors.
>
> While the CONFIG_GPIOLIB_LEGACY option that guards devm_gpio_request_one()
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
> Link: https://lore.kernel.org/all/e9252384-a55c-4a91-9c61-06e05a0b2ce4@app.fastmail.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

