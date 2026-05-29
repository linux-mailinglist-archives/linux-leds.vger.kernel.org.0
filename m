Return-Path: <linux-leds+bounces-8367-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBdFF4pvGWqNwggAu9opvQ
	(envelope-from <linux-leds+bounces-8367-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 12:50:50 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B7D6011DF
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 12:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A9841308323B
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 10:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2C53BED26;
	Fri, 29 May 2026 10:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="zwU9yVft"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E3136E49B
	for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 10:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051578; cv=none; b=YAETs3NJBUoJe/z3CGVeRi7+il/MdaIOQCBerS/OE/kWxjLUU/H9yU4vXWHW61RXpJ4iwHyhwvJAh4uphMNgZM2Ta0PnyOhSfsaoEO5PY07Av+BI4uTITIG1rGLW/3dIW8P6e4tvcfWHEBmgCiGXiiWkoj89J2A1WRB3rtgPVQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051578; c=relaxed/simple;
	bh=PC7iK9ghcLxujaYe1sBYImcNs1M2UD/XwoVRZxYo8jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIEnA9HRbhmiAiF10UPloa6gjeHR//r0xqv1hqbkIKru6GBG6/oyujMfa3tbSTqPkP/DuKlpseJLF5sbqIN4MWe36QaYpoRkhA+2daPFmzZPv7pCFyBNJwAWIr6V07dtn+K2xVXGGOH/LQw2vFIK57n+dDl5GCD/Nxs2zt9o8xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=zwU9yVft; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef29c5561so260333f8f.0
        for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 03:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780051575; x=1780656375; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=REK62I331lUwouEMVLLpq3kmjZ7SBSD27YX0AVRlIss=;
        b=zwU9yVftHiw7UtVLWMcHYevsKEfqZYAWigwYheqPhdYZlvm8e4msra+RbQhd4mI+ol
         G78DepAsFnn//3X4TY0w6AmZJxVwiGdxDsB+nGPh7iYo08LgaO34zGp/B3hciSq8sfjd
         GHgT9hxe/ain3P82qfGvV91ElkJ4tShBbGV6fZVIv9SVORF9TPur7HVvLaBKOPTfLtjS
         VYbeAAN8NZ93SAm1LZbX4yniFkfxBqw19pGpeMcLdVtqCLcbl9RJvbnpfeCjO02kqWz4
         B9LEk0PlssblBjTypvJ1BCPNHxueCsdR+KpvgjAm9EpTdvWgQNibqiYjVIVZjoJwIh7I
         YnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051575; x=1780656375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=REK62I331lUwouEMVLLpq3kmjZ7SBSD27YX0AVRlIss=;
        b=KuvFXkjGF5DJPSlxWZ3TNmEzZA0FJ3/Za0tNYSb2AzG5Ac70Xgs9xBZjuPrZjfo+Bb
         8HHISA5uHZybMozknja6cYhOMNK7kJGF8ReCrqb0+dOdCOUcjDMYDEeBh9aeEpTiNnH2
         J0kqPynR+8D7jCzWPjfS1s7ntIupJcQbh0GqwJxvkY+oLBUFP6Qvg5XHS0A60blIHCvN
         Iwhv0+Q/wxHmE0EZbHi7zPzpcy2PoU5pqVNOHbZryA9b1V+QqtgyHCIJbMp/kc4rZ1SR
         8YnjcedDBiViEiFl4kdW8u4wQoWyMO7Ji8y7U4nMnw0OMe8W2x75qGxw1xxr2U2sL488
         n7Pg==
X-Forwarded-Encrypted: i=1; AFNElJ9q/6MZlLet2zoMqRMb7A68Ro3Y29YZsVPfOQlBtPVKBx/cRpqAugxCapEs56B73/MpcvjWe6vmbAml@vger.kernel.org
X-Gm-Message-State: AOJu0YzFJUa8eVj5oxgNTWdtZVWx6JtzxOu3ipFbEQ/p4WefQEda4xj4
	1RnMqcHtYJuiyRiVHbWSwxOD/9lokf1STO+34G3U7Skj7Q0LkzZh6I2dnlJFsoYZpC8=
X-Gm-Gg: Acq92OEfcEtKmD2Hqkjr2LyeZJZOjcOLCeT1dbYTNThNCqg+6Y2MS877zsSdelEbKUp
	IzZKHLsdic+AatBWVznjnbj1nOeAcpP+t2yn6t0UDzi415SLFPmirOBTy71W3bhZIy9TmCnLKMF
	yPigdF0DxRXSiAw3WAjVGaaFSPqkCBgv9raxptbnjft8Kqc9NXSL6V4G5AYyi03bBfXXCHGYgUW
	Hzs95CckZA0NiFWG3jcidbLDPzC0NacnjD1tsBhtFHM8PxiynYX2UosXmHVXLGwFe2SK/UMa26B
	S5+wfI4KuVDmyIhiTsJieMTwN/v/L3W7+0qqMX9zpUgEhwGPSb4n9wCEls4hTnjndPZcf0jaemT
	kPDqBre3nG5OmPSKbCFLxe7wMCfd6j/rdHLeK973CWlIG6cB8q0mac7YJBAceuBkjxWqSfdzx6Z
	1NxJ9p3uVuR83uedObSv1c295B2iuMB8D3lyw7h1T+xqDGZSPVbGwZpFJ6s4mJ/dlauL3zr8BfZ
	Pd7IF4GF4a6IGVndsn291Wv+k0qlaL0EY4OZfiDvxpf6rw/7bmWpXuKlxNzYydMcwq4MBXWLdEt
	R5I7zIJiFU4/niWD4QmaPgFGh5bB+A==
X-Received: by 2002:a05:600c:574d:b0:490:778:4fe8 with SMTP id 5b1f17b1804b1-4909c0ba8c9mr28839315e9.25.1780051575110;
        Fri, 29 May 2026 03:46:15 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d68980csm41024205e9.1.2026.05.29.03.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:46:14 -0700 (PDT)
Date: Fri, 29 May 2026 11:46:12 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: leds: Document TI LM3533 LED
 controller
Message-ID: <ahludIZPMUlPDTG_@aspen.lan>
References: <20260528135123.103745-1-clamor95@gmail.com>
 <20260528135123.103745-2-clamor95@gmail.com>
 <ahlhinOh3NxB7FY_@aspen.lan>
 <CAPVz0n3C8D+amSRkF=Koj6Niu6u8uz4LbMoRYEX32_ECm5-tSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n3C8D+amSRkF=Koj6Niu6u8uz4LbMoRYEX32_ECm5-tSQ@mail.gmail.com>
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8367-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 56B7D6011DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 01:07:50PM +0300, Svyatoslav Ryhel wrote:
> пт, 29 трав. 2026 р. о 12:51 Daniel Thompson <daniel@riscstar.com> пише:
> >
> > On Thu, May 28, 2026 at 04:51:18PM +0300, Svyatoslav Ryhel wrote:
> > > Document the LM3533 - a complete power source for backlight, keypad and
> > > indicator LEDs in smartphone handsets. The high-voltage inductive boost
> > > converter provides the power for two series LED strings display backlight
> > > and keypad functions.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../leds/backlight/ti,lm3533-backlight.yaml   |  68 +++++++
> > >  .../bindings/leds/ti,lm3533-leds.yaml         |  66 +++++++
> > >  .../devicetree/bindings/leds/ti,lm3533.yaml   | 170 ++++++++++++++++++
> > >  3 files changed, 304 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
> > > new file mode 100644
> > > index 000000000000..866b0fb8ed04
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
> > > @@ -0,0 +1,68 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/leds/backlight/ti,lm3533-backlight.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: TI LM3533 high voltage series LED strings
> > > +
> > > +description:
> > > +  This is part of the TI LM3533 MFD device. It represents two high voltage series
> > > +  LED strings for display backlight controlled by the TI LM3533.
> > > +
> > > +maintainers:
> > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/leds/backlight/common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: ti,lm3533-backlight
> > > +
> > > +  reg:
> > > +    description: Control bank selection (0 = bank A, 1 = bank B).
> > > +    maximum: 1
> > >    <snip>
> > > +  ti,pwm-config-mask:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: |
> > > +      Control Bank PWM Configuration Register mask that allows to configure
> > > +      PWM input in Zones 0-4
> > > +      BIT(0) - PWM Input is enabled
> > > +      BIT(1) - PWM Input is enabled in Zone 0
> > > +      BIT(2) - PWM Input is enabled in Zone 1
> > > +      BIT(3) - PWM Input is enabled in Zone 2
> > > +      BIT(4) - PWM Input is enabled in Zone 3
> > > +      BIT(5) - PWM Input is enabled in Zone 4
> >
> > This is optional and the drive implements a default (zero) that is not
> > documented here.
> >
> > Is zero a sane default from a DT binding point of view?
> >
>
> Yes, if property is missing then PWM input is disabled which is
> equivalent to setting all bits to 0.

So the default should be documented in the bindings?


Daniel.

