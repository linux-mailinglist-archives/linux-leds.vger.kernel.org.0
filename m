Return-Path: <linux-leds+bounces-7525-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACgQGBkMxWma5wQAu9opvQ
	(envelope-from <linux-leds+bounces-7525-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 11:36:09 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC7C3337BB
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 11:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7AF5316D8E3
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7890D386C13;
	Thu, 26 Mar 2026 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pVBUjR6q"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B18351C2F
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519893; cv=none; b=F0oxAl6/KKN7sUx2axshfpZVIBypGOCJQW4pAS1mkj2v7YvRj9hnv+OPpCD12RB8n4B56JXfRCSbycWWVsse4xYQqwye7+BOFepQFli/czL+rl612YOegGzeWj+cTD6hBhoTJHnytLTuSBbphXIZqQ5f2x2PfpyqN0ya032gyV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519893; c=relaxed/simple;
	bh=QXFGyJCxVdNpF288bgk0fuzrDLWtjYWQ1ifovXx9A1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sD0+dZC5ZWgTGsPPck89sWXUa9MGbDPtDCPlch+aKc4FODGYb2Ur57xr7pIkRfv93ryHLeYiB8c2mdakcjYJxYWvHV07YulQ8Ak70snutGPSI2UiBtVOrrJywBXQ9q2voeNCGN7hgj724t8FIMnJ+CVDU6oE81+6Qrxh+StNHEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pVBUjR6q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3C5C2BCB3
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 10:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774519893;
	bh=QXFGyJCxVdNpF288bgk0fuzrDLWtjYWQ1ifovXx9A1Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pVBUjR6qQvl8xug/BhAV8gUrM20yrEvEgrD00Sa86uqTwaK9cS2VOxvNRVmgEyGjr
	 l1LhX+kcq9ZJgHEx5jHlDo/Dwy5x/ACJ8Nto5S0CnDBy0/GF3kyQeQbFwxPWbVCfFY
	 cvorQ3EUbJ80gzqAEf5uMMD0vlmDAmPWh3Pb+eKn+usFxsQeftw11S3UAFM+/FvSwo
	 EizJTRjmLK2vZwYCZWspG9FoyE1ZOxPSaL8QYkJ4QHzVT0e/Mpmdzl9rku5+TWI2b7
	 7BFrGW+nEcgfJbsBgM7nTsf1eZ1GK8LICKQRI4bOq8LQKYwenL1b5uW4LK6X+Ne60h
	 23atR6QRbJmpg==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79a535e7c00so7214717b3.3
        for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 03:11:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWx83wd959WN+/tt4uanchCjpCaYTGKphpxMoUd5dXDItRRReTusViO6q2NInd2g/2xn6Uj7oNG+X/B@vger.kernel.org
X-Gm-Message-State: AOJu0YyiTw7FpKvQR0OfSgLYQYq/SLZTXBIy975bWC/y2qqJs5vwbFQT
	1BrLTzR6bcbFKjbgNURVFkx9cLfKDC08srbBY9QRZEY8V3h1f1J5umKlLB9Kd0H6CJVHdUdhP2/
	EhHV8MPSUae3x0rjmBoyzVe1M3knO9d0=
X-Received: by 2002:a05:690c:c530:b0:79a:b46c:e60a with SMTP id
 00721157ae682-79acf6c80ebmr67567397b3.44.1774519892555; Thu, 26 Mar 2026
 03:11:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-expressatt_camera_flash-v3-0-e75e5d58990f@gmail.com> <20260326-expressatt_camera_flash-v3-2-e75e5d58990f@gmail.com>
In-Reply-To: <20260326-expressatt_camera_flash-v3-2-e75e5d58990f@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Mar 2026 11:11:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLkKqmEQ+Y4w4hHkNfw8KwoBPTg4o0NP=B85JNJ1X-_Z9A@mail.gmail.com>
X-Gm-Features: AQROBzCcPBE-367IK-ffpVZCMs_a5jdyIlj2tHpyWX11hFiACnnKCNZ3SJn6aXU
Message-ID: <CAD++jLkKqmEQ+Y4w4hHkNfw8KwoBPTg4o0NP=B85JNJ1X-_Z9A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] leds: flash: rt8515: Support single-GPIO flash ICs
 with vin supply
To: guptarud@gmail.com
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-7525-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 0CC7C3337BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rudraksha,

this is starting to look good, some remaining snags below:

On Thu, Mar 26, 2026 at 8:57=E2=80=AFAM Rudraksha Gupta via B4 Relay
<devnull+guptarud.gmail.com@kernel.org> wrote:

> -static void rt8515_gpio_brightness_commit(struct gpio_desc *gpiod,
> -                                         int brightness)
> +static int rt8515_set_flash_brightness(struct rt8515 *rt,
> +                                        struct gpio_desc *gpiod,
> +                                        int brightness)

Do not change the name of the function, it's confusing.
This is also used for setting the brightness of the torch, and after
this change it looks like the function is just for the flash.

>         } else if (brightness < RT8515_TORCH_MAX) {
> -               /* Step it up to movie mode brightness using the flash pi=
n */
> -               rt8515_gpio_brightness_commit(rt->enable_torch, brightnes=
s);
> +               /* Step it up to movie mode brightness */
> +               ret =3D rt8515_set_flash_brightness(rt, rt->enable_torch =
?
> +                               rt->enable_torch : rt->enable_flash, brig=
htness);
> +               if (ret)
> +                       goto out;

Add a comment befor this that if we don't have a separate torch
enable pin connected, we use the flash pin also for the torch.

Yours,
Linus Walleij

