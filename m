Return-Path: <linux-leds+bounces-6781-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QL9oBljxeWnT1AEAu9opvQ
	(envelope-from <linux-leds+bounces-6781-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jan 2026 12:22:00 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D69A03BA
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jan 2026 12:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04CAA300EFA0
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jan 2026 11:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13241344DAA;
	Wed, 28 Jan 2026 11:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="3f7kyQJi"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5191F30BB81
	for <linux-leds@vger.kernel.org>; Wed, 28 Jan 2026 11:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599263; cv=none; b=FXBO4mSsVSU01CXeXj70CX4NVpDGpcaPHR+GV/5MtpXxT8AfqBjS5ADO+BrwEYlHR7VVvsBTTG5OEPkOmUhBMMsSf3z3sRLJ4JnfuF7WOKIZaXLNzSkskKO9cRel2ubK3EkwR+/5kmwTQg5M5ulJyRumR921OyDrD9e1aEgMlCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599263; c=relaxed/simple;
	bh=wosS8gSZQwNatY59Tw5xbh3t7QOl2V3ezMLzg/qyqP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvWa+Z45YT+vTi88Ge8hl53C1ScysgrYmfH4D6kfW57dKxx5Yjv0sDfZ3+1DQe4Kif7fH11AzAcGZhCvXmNn48VEulHfL2HWJqtdt31K/FDXnjxkm6yRAbpxn3a7MukL94qeNHEU8h7k+Z+pQ9iqldWJQ9wRDwMehvuE0d6rEfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=3f7kyQJi; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso4961735e9.1
        for <linux-leds@vger.kernel.org>; Wed, 28 Jan 2026 03:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769599260; x=1770204060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wosS8gSZQwNatY59Tw5xbh3t7QOl2V3ezMLzg/qyqP0=;
        b=3f7kyQJiVxjHELXA4HQAbjkI5vTJ5Pwe5iijLrNLeOEP9tiquUiuL+cDN23L9fCiGa
         ljNkUR47Qv2FRTFvR3hGGXUhlKwiKMFGwukZaDO406Y5SAWegqU9M8hDIzKkiFVJNoKq
         w6sUtPZ9UtILnQ5sJeo3zsS4pGmN3x5CXxKlptOB3ea+16C5dESdRyylWRJPpnWUxPFn
         jfFwxTj4htTnIWuw6zWwPoCPfhCyp5eTH/mWMyJEXFzkxPwSN69j1o1iSeXu1WgKp8i6
         e9/hbvMEH1mB+210rf2PnZhxmt34F0Rl4vI+yxJNASGhkxfouPfhaOsIyshd/dLLTrRg
         D3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599260; x=1770204060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wosS8gSZQwNatY59Tw5xbh3t7QOl2V3ezMLzg/qyqP0=;
        b=SmUGx5FSkB5V3VGAHDlPlOTyu/67iEpy+J1zvlQvfs8LAFzHF2hjkGadUXvXQjx4gu
         WD+r4DRPXjLscCk9W2BQHnZoGeioQM78bb1bP8Y91wffIgCatI+hZgX0//Z/sLYaOu4R
         aJdtRoc/Kt/wFiXEi4Q+aMy+IZ1MVT6rfb1KJ/BFVQefacAlaDWGY12iGnIWQ2ipupbi
         JFn1C6u5Pzbk4xECMMr5+bLq1KFhQ9DdUQckwn8Z0MGZFr0EdTNQPzcTzzs7ohp/AbKT
         gM0BQV34JvaanJicoCOOyboo7vdjcJ9FMGlijy8cUfQIpjYJAYOygOlCwwJx0XH+uTBp
         /m7A==
X-Forwarded-Encrypted: i=1; AJvYcCWJZ7d6P5/Fhawf8eyp0R8ye+rM7bpOcS4YQuOhl999eA8juzvGR3k5Q1M1z6LvmEiiJ9MfYUdul3IY@vger.kernel.org
X-Gm-Message-State: AOJu0YykHSJOMrZG16FZXE5mUJxFhin+Vu8OgKmpxWlvbr1REULt/naA
	2vnxsloQ8PMkjzKv3cajy0dudSozTO+XKrr7UTKu2J73o9cEaPxMSmhjwclX3D+GfgQ=
X-Gm-Gg: AZuq6aJsYORkGMB6svzzmpdM7OXvVYRUbgXSZFtxUVkbaRqmgMcNALXUceIXEB2DVdA
	iFRgfU3tg7DRYG97xey4OgRcLM2f4O9TjSpwO0BGVOFfax2Uj3jzGppCbktZ7zRh/RUYm8La+lU
	JgyZyWp3A6NNfn445Km7J03DGqFCxXZShOtXpcA9DDj6rTSebLim7d+qwvxnQYTNeumjLSAHFJc
	Jo2HG4Wd9A/9q819RZahkhu7vixSb5+1AHLIN9x8a/f15yClHq/9UtzVJUsQ6TQAgNuoCeNkS6T
	ne0D3GgAeW/juODT9mzAaLoyBf4ukLZEOQxyjyadq8U1M8AKmJP/TlNVOYsl/Nej0Ik5W/cC5F1
	Hd8kfwvuJXvF00xlpIEp+W/G5YRDvszb9t4ZO/3zLnBXKvBIgMyQlIBRkMqcTOeerbxTlKZEzQi
	EVKyMpc32vAeV6lPQ/RQnfzmNrO0LKhM1xBHDAPKK5WEJbnST34ee/CLxtl3Nf5UGdQGhv0OGMA
	0dIGWN5/332Uv5fKHaK1tExdz0oPbt5IbOrY1smqEFZAN6RAfgN2Rd6d37JpNLEDo0b/6nl
X-Received: by 2002:a05:600c:8b61:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-48069bfad7fmr63503125e9.7.1769599259657;
        Wed, 28 Jan 2026 03:20:59 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806e2e5ffcsm4307315e9.18.2026.01.28.03.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:20:59 -0800 (PST)
Date: Wed, 28 Jan 2026 11:20:56 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: tessolveupstream@gmail.com, lee@kernel.org, danielt@kernel.org,
	jingoohan1@gmail.com, deller@gmx.de, pavel@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: gpio-backlight: allow
 multiple GPIOs
Message-ID: <aXnxGPNtk5BwoJOu@aspen.lan>
References: <20260120125036.2203995-1-tessolveupstream@gmail.com>
 <20260120125036.2203995-2-tessolveupstream@gmail.com>
 <3f3c47ea-1660-4bd4-ab89-3bdf58217995@kernel.org>
 <54d156ba-e177-4059-a808-2505983b4e2e@gmail.com>
 <500b603d-5abc-4c45-8d56-bbc88fc85b83@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <500b603d-5abc-4c45-8d56-bbc88fc85b83@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6781-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[riscstar-com.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspen.lan:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riscstar-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: B6D69A03BA
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 11:11:33AM +0100, Krzysztof Kozlowski wrote:
> On 23/01/2026 12:11, tessolveupstream@gmail.com wrote:
> >
> >
> > On 20-01-2026 20:01, Krzysztof Kozlowski wrote:
> >> On 20/01/2026 13:50, Sudarshan Shetty wrote:
> >>> Update the gpio-backlight binding to support configurations that require
> >>> more than one GPIO for enabling/disabling the backlight.
> >>
> >>
> >> Why? Which devices need it? How a backlight would have three enable
> >> GPIOs? I really do not believe, so you need to write proper hardware
> >> justification.
> >>
> >
> > To clarify our hardware setup:
> > the panel requires one GPIO for the backlight enable signal, and it
> > also has a PWM input. Since the QCS615 does not provide a PWM controller
> > for this use case, the PWM input is connected to a GPIO that is driven
> > high to provide a constant 100% duty cycle, as explained in the link
> > below.
> > https://lore.kernel.org/all/20251028061636.724667-1-tessolveupstream@gmail.com/T/#m93ca4e5c7bf055715ed13316d91f0cd544244cf5
>
> That's not an enable gpio, but PWM.
>
> You write bindings for this device, not for something else - like your
> board.

Sudarshan: I believe at one point the intent was to model this hardware
as a pwm-backlight (using enables GPIOs to drive the enable pin)
attached to a pwm-gpio (to drive the PWM pin). Did this approach work?


Daniel.

