Return-Path: <linux-leds+bounces-8079-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHfsN0ugAWpKgwEAu9opvQ
	(envelope-from <linux-leds+bounces-8079-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 11 May 2026 11:24:27 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BEE50AD35
	for <lists+linux-leds@lfdr.de>; Mon, 11 May 2026 11:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8FBB9303185D
	for <lists+linux-leds@lfdr.de>; Mon, 11 May 2026 09:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4F33BBA1A;
	Mon, 11 May 2026 09:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYPZc2YK"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AE83BAD99
	for <linux-leds@vger.kernel.org>; Mon, 11 May 2026 09:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490671; cv=none; b=FsaIQUbSfIxwXZ9aYnUozkMpYbk+vWzI7AQEa7TbWHRZ60ar2blshluhgqz/D1qcqGfwdyHhwlRFqTZ32IkwlvaqC/HInY2S3YillJsR/f9ndXhMOARcU3YYON4IxWqcX/aXDhprjTWkdkp6Tf7g3Ag4g2ZMhFwWIgLZ0DjwR8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490671; c=relaxed/simple;
	bh=Rq8c6gQubM6Etwr4803ShCbdPyCxzJxyabdtEaWZpKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sSvR79lB59NVbqkVNuLvcmIN0MEjPN62F0mmoRNff7ZwYitQaAweFoj7s+OrYnnBja5W5pKZjExzUL3e2+2CPZnpd7o3oWTAVkWt5G26Q+9kuAcF+ylTd0v3DdCex8wkPR40SbtPaR1t0x8yt0030S/AZ/cZwiACfX7L8vy3hdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYPZc2YK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED39C2BCFB
	for <linux-leds@vger.kernel.org>; Mon, 11 May 2026 09:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778490670;
	bh=Rq8c6gQubM6Etwr4803ShCbdPyCxzJxyabdtEaWZpKo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CYPZc2YKKs3jzaGoP37LTFFB13cweGZWUs7fTQQcc0RJpJPDWuu+kBW55S3Ph/rpT
	 mS0t9sOoEPPXhcoSEX/IaLShoJw7thZNZyI0PnAhNOsr0bojBN/CzSZ+hVZWdkO1sH
	 br3r0WyMoZADRXJdUwwWdNHEh89+JI6nLufe8HZH4+dcHacz7PBAmmIWFrpuaY2J7X
	 0T7PmXSU5pYRSw4ycpxefqigKWePvToGA9AjX6Nbf+6Bdvos5EzUphKI/oxOOPO/Gg
	 DKmy47Fs4hTfkvVtDBRjPPLk7eje5fZjiB7uGJ3fvh1yxAjs2MvDXQEaZbAMmBJQsA
	 GPEfGuB0jvjYA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39380e79936so51059021fa.2
        for <linux-leds@vger.kernel.org>; Mon, 11 May 2026 02:11:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+E13/N+P1ujL2FU7uFXkpsK9Ds8fJZC+i5TCfH6aH1X5QGQasCSrDHF5hmE/hj+iaeklHwLwjEGSh9@vger.kernel.org
X-Gm-Message-State: AOJu0YwxnZfDiAWnczmyBubpC3ZfYIBtONPiB6hNNvrisa4rF9pnAvDh
	8GbAmJNMdn/l8r4eCuCrshXsIpVZk++H2C1emaBJCgEExAVodjqVsk4veU2DFN344+N4opzYuy2
	8GbDDn3Wf8gx9hRlj3Cd1b8iaGSYEvgE=
X-Received: by 2002:a05:6512:3b0d:b0:5a8:d3a3:598b with SMTP id
 2adb3069b0e04-5a8d3a35a8cmr588739e87.28.1778490669254; Mon, 11 May 2026
 02:11:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508152435.21389-1-jerrysteve1101@gmail.com> <20260508152435.21389-3-jerrysteve1101@gmail.com>
In-Reply-To: <20260508152435.21389-3-jerrysteve1101@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 11:10:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLk0BrV+MAh4n6+wAqNX+O8BcHcoehbX574F2_Vcm4qvGQ@mail.gmail.com>
X-Gm-Features: AVHnY4I9UpFMxLFtwpAb2IS6AOTYSN3VvmV0ICtP8Qkl_hlv_QQKJow__4PiAoU
Message-ID: <CAD++jLk0BrV+MAh4n6+wAqNX+O8BcHcoehbX574F2_Vcm4qvGQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] leds: is31fl319x: Fix shutdown GPIO initial state and
 remove redundant startup pulse
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>, 
	Andre Przywara <andre.przywara@arm.com>, Baruch Siach <baruch@tkos.co.il>, 
	Romain Perier <romain.perier@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, 
	Peter Rosin <peda@axentia.se>, Robert Marko <robert.marko@sartura.hr>, Pavel Machek <pavel@ucw.cz>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Wei Xu <xuwei5@hisilicon.com>, 
	Paul Barker <paul.barker@sancloud.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E5BEE50AD35
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8079-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,tkos.co.il,st.com,axentia.se,sartura.hr,ucw.cz,hisilicon.com,sancloud.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Fri, May 8, 2026 at 5:26=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> w=
rote:

> 1. Per IS31FL319x datasheet [1], the hardware shutdown pin (SDB) is
> active-low.

So that means that driving the line low will shut down the hardware.

> -       is31->shutdown_gpio =3D devm_gpiod_get_optional(dev, "shutdown", =
GPIOD_OUT_HIGH);
> +       is31->shutdown_gpio =3D devm_gpiod_get_optional(dev, "shutdown", =
GPIOD_OUT_LOW);

Add a comment here that this will in fact drive the line high,
because the GPIO line will be flagged as GPIO_ACTIVE_LOW
in the provider (such as the device tree).

At least write this in the commit message, it's a missing piece
that helps readers understand what is going on.

Have you checked any existing device trees so you don't
break something here?

If you're breaking platforms you may need a fixup in
drivers/gpio/gpiolib-of.c to force the consumer active
low for legacy device trees.

Yours,
Linus Walleij

Yours,
Linus Walleij

