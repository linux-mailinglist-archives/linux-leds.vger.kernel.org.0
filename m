Return-Path: <linux-leds+bounces-8907-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sboIOHx4R2ocYwAAu9opvQ
	(envelope-from <linux-leds+bounces-8907-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 10:53:16 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D8C7004D2
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 10:53:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Yp35/55s";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8907-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8907-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EE5930048FB
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 08:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE4B37D130;
	Fri,  3 Jul 2026 08:50:30 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6AD35AC28
	for <linux-leds@vger.kernel.org>; Fri,  3 Jul 2026 08:50:29 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068630; cv=pass; b=KXI0+IzCrXaEqvHkKGhz/hSwCzt1jEbVjjLmSoSpdlClswYtA8++02VIbGShz/y4tCr+kI9LTzCjwceIFMlViGpG3H7YvG6HMFdqpZQHfM2sbtTGBENEg2WtETcmE6BlvYJLJSOxus+Q9BbQDiosuQidkep8CM3rM7rgK3eePuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068630; c=relaxed/simple;
	bh=JIGfUZOnaS68j2TExBUBX6hHqwIcodMVFuEw4DTpCW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wu/1pYGn9CCn907fynRGqmKQk6NVCLCuc/DjmGqNcaOexU5PD4tjgpkOjFS3l66PPgelzoSpMxNRf56ebGqTitJCFnYa1AT9J5ycdFSklsTzGIuvWpLscwrQUAU275WaeziSpFD8c0P2W/vYfmNlPVKpLpotPSqaMFVHGkBTHmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yp35/55s; arc=pass smtp.client-ip=209.85.216.42
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-381018b9375so272753a91.0
        for <linux-leds@vger.kernel.org>; Fri, 03 Jul 2026 01:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783068628; cv=none;
        d=google.com; s=arc-20260327;
        b=s+lRLbb2oworCyytUFx7TUPuJ2p3Ic3tWV+OJn3Pm/k64XjFFnANinvVA+yHBYYgJF
         Vpvgbi1ZKfo0F+MdQe4My49SO55g8wTK8OVVl15bpg64odkjzjwPbrFec4zvHrPLIosX
         fcFI3xWcSady36icSdfegmbdQimyK6picSrRzsYmePSre6WFZkTW0UgA6CSjeya+fnr4
         ddPbj+8KOcYIb56s2xi2EUqLEbql/rG6G8SQUNmbk73zJZBdDFBxnN/RnZnH8RgnJ+Oh
         w0Vz1YxNTBTlaDe4Yze8zLc2fOAm/8VWnKF9xP2eL6z3Gw0JyTQB5FKmB4EfZm96eMsw
         779w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JIGfUZOnaS68j2TExBUBX6hHqwIcodMVFuEw4DTpCW0=;
        fh=oZxrcGCt3k312K2rWtDqamH5yHt+cvKsrs29unFDC80=;
        b=Lsad9fR/xt/DXPoe6oYtk+U7Pbe+dMoc+yZhxwA8enfOepm1jUX8gDrtp0UaTL4XjT
         JnNtKjW6Q9vrjZKJfkjQXymVE8DizBgjNdwpgtigL0KMjOxUNNVuDyFZCRnqF02r2aC2
         7FZ9ZzOfBsAKt1JO2XTfj+s5Yd+ttjO1Q7DQnvhiU72R/iQlrFHAQl+9Vlft11p0y21z
         x6bVpf9yQaxzqNcTXNp5Yb/IhoMnTopsbOjUkAKMYqlb0fk+aNZOf4nyDhwDw1jVqrCb
         PNJlE2JyyXTJc6+EUEPwmwk9VgGVz2Z6B3OyUdVQGwRnSc97UYRBfXXQEoXAh7tUY+2N
         IjDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068628; x=1783673428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIGfUZOnaS68j2TExBUBX6hHqwIcodMVFuEw4DTpCW0=;
        b=Yp35/55s2vBK2gEHGs8sgoI4osunm/jZFHkATgRYASC18u4qN6qcDOA83y0Cdxh+o6
         662moOywNpzPRSm6IfkxhQGHxJCFKGZuWl7sBT+LyeT8WG3ey8TijM8RdF2Wb9UG7IHf
         Z+u8B/sfKHEOfDIhY1mm2KEYg7Hd/7HHLOj5jVWz0EzKOSpm8yhwNRd9Xa+5gBtEt+qA
         J1yriTyygEOyXJgZ2983NY98/f9+OH9YXN6AoD/E2fMB+hnW0yiaFpi2qnP9Axtd6LWw
         Y19k/WHx59Oz1dyeGCfMHMJSwufeMXvUd+o79pWRAM7jVwsUyEbjAHBnvzl8qk99dTuw
         Ql8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068628; x=1783673428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JIGfUZOnaS68j2TExBUBX6hHqwIcodMVFuEw4DTpCW0=;
        b=EetQOHL5QZSvbSTksbgOjr43yG/teiw4xUkdlTzS9mQAKeFmnOrS6K2UWVSR74WVeG
         iobsniKHPy9H3IGV5YS56y4nT4ISApa3xdsTvJm36iMMXwPlFsXCrok96ThGgsDueJaU
         1Kjj5UVbuVCIznjKNSn7IOtGfOs0bJtKMPL2EQV3rNCuQrx4xYxpZWnwQgFmk4ukdcUy
         fYF5/oMjHqqxbFQZBKIX9WYLKtF3LSVawzOad87bS9ETONV+zAX3zYvX2/Vdbo5+82Ts
         Bv0SJhLwCAdl7Bve3CNhcV182B4xP2CB4aLtVn8lYKu0NqGKBUqVMaUtyVjmo3Bzjx8t
         omFw==
X-Forwarded-Encrypted: i=1; AHgh+RqWxKzWcrWG3NPXfa5q1xk7K4L7HlxCHP0fE1Uk6hCuI9k74buvdz77AlXoMqYksYHj+2AyInb9mXvw@vger.kernel.org
X-Gm-Message-State: AOJu0YxJYp9/ffNVMoII4Oen/vQnPWKd5YOeegJFB9K+6lysW0hbqs1j
	AkViStTahcUpPnPScx4fPLPnTdfdAOEwN105fts+98vS516oUzdoLK/SleJVgGiMRrpkv/cBn2X
	cALRXgxn2Aqx6h/a+21iDi7X85V64wHk=
X-Gm-Gg: AfdE7cmpDgYbDFd9o4uxT0soWpuME01hSZyv6r1J5fzKHFXvvnQsKCiLgBKSB57XVT0
	oOJiMKhJX9uIix1VxYv6tKNZYXQ9PLJiJBoXvK6W0G/7v0WNmJELPQOmXmJ6qNU6zjCATe9mYaN
	3dtROnhFHIrbD3rWJ/+FfhRVFU3cQJc0WqqdgcdvSjxCPLEcwOxC5w6MPh7ebq3WfG82T+4u1rO
	7rZg52oYiNOy6emorCDmdnu7L8lXpvjOl2FvbwySn5Zr8TwaY5XeaiPJu9DecsfAr8xC9tRW4YB
	P7js4ncCQiqEVgF97+fcofA73PAa9w==
X-Received: by 2002:a17:90b:4ac7:b0:37f:9ce1:cdb2 with SMTP id
 98e67ed59e1d1-380aa212cd2mr10449000a91.32.1783068628598; Fri, 03 Jul 2026
 01:50:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260702161828.GB2108533@google.com>
In-Reply-To: <20260702161828.GB2108533@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 3 Jul 2026 11:50:17 +0300
X-Gm-Features: AVVi8CfxYzwSfzZ6fk5dLYRyOYewH3BnmAC08YjOJmTVCgpVqq5v1ruOm9aDpBE
Message-ID: <CAPVz0n1Pozgz8DBt5BrYSktVfE=D5E41oy+fMODGpx-L-qQ3YA@mail.gmail.com>
Subject: Re: [PATCH v5 00/14] mfd: lm3533: convert to OF bindings, improve support
To: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8907-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45D8C7004D2

=D1=87=D1=82, 2 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 19:18 Lee J=
ones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 17 Jun 2026, Svyatoslav Ryhel wrote:
>
> > Convert LM3533 to OF bindings, add missing VIN supply, add support for
> > setting mapping mode and LED sources based on device tree.
> >
> > ---
> > Changes in v2:
> >
> > schema
> > - maximum led sources for leds set to 4
> > - anyOf > oneOf in ALS
> > - improved ALS descriptions
> > - adjusted example
> > drivers
> > - dropped devm convertion of irq and mfd helpers
> > - all als configuration moved into lm3533_als_setup
> > - added regulator/consumer.h
> > - lm3533_bl_setup set before sysfs_create_group in backlight
> > - added check if LVLED is valid
> > - LM3533_REG_OUTPUT_CONF1 > LM3533_REG_OUTPUT_CONF2 for LVLED4 and LVLE=
D5
>
> This set looks good to me now.
>
> Let me know when you have all of the Acks and I'll merge it via MFD.
>

Hello there!

Jonathan and Daniel added their Reviewed-by for IIO and backlight
subsystems, so I assume that should be all required.

Best regards,
Svyatoslav R.

> --
> Lee Jones

