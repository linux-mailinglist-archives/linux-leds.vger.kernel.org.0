Return-Path: <linux-leds+bounces-8362-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMEEBqRiGWrDvwgAu9opvQ
	(envelope-from <linux-leds+bounces-8362-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 11:55:48 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 693056004B9
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 11:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44608301FD75
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 09:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F29B3C1989;
	Fri, 29 May 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="l2x5qOnh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4743BED06
	for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048273; cv=none; b=hxU5pYiSz9ZNOVTSULh4+/k1ibLtGNYLmD1pFVcp4kORq8N6yyLvUVxR2EMS6UppLRMM5539Qe6f38JVd+0iKuAWqpLoxm82sTpfxD5J1NlgG9r6s5Bo+5eg5+sa28rnk8fDin8fz/tSTswQ2p+BYSi5kx4RCMlaxZlYUmDxCYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048273; c=relaxed/simple;
	bh=ZfaOPPNYNFKKgWBQ0CjGxfImqDjPcW4gKYAlO7OIXQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciox5WCx7nbDjYWOFOZjshO9R9bQWJO4V7xG51Dj64UyADvUtuPfg1h2km7T1k/eq6YWXVRh+9waZo3hIk1WwSEIyYpgG8SKlb/sbU2NDxMtwzpJvcXdmV5ZROvwHF9z/m8Q7kaXZIk1b76Kg+quxb9gOm/UYxhgI/SA7z3kqJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=l2x5qOnh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ee6d32402so879447f8f.1
        for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 02:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780048270; x=1780653070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qf1xsznGow3Mq8kqI6r2C6YXYEYFaDdBn6M5Ic+GMxw=;
        b=l2x5qOnhQAeQWbCt0fRrLXN5kKMUm2CiyrjUh/s2Fj8zHvf2xij7eSMCUhxE3lQDEd
         qIGJUaAzDLsNapuDn0LXCbJJYcNv64DsJ7db394VhYzB2B0eqV/GgDg74iineSIgwDEp
         Y/iKr4C0+HYEblMJxqm9qVgJMo2V5u3J/UVVrzdvF6sqeImXcrrcSgbhDvGQhvKL2wXJ
         z/cBT/TMUy37AKq9QwM5ucGgZmguqgt0Gs26bRyEGBovXnXu1VyuVhOWxzfCAry4ejMf
         0Jw/ymcCd9bViXEbuRshUd2rQeM5aDi7+Ej96/n8vWfoIHisfgedD2Yejcr/RggzWX4i
         lu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780048270; x=1780653070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qf1xsznGow3Mq8kqI6r2C6YXYEYFaDdBn6M5Ic+GMxw=;
        b=Ee6BG2qHMO1o2qAFlhOJivOTO61DGF28BC7rX82UWKY89z9fyTG7PTUOj+yKbIzBuQ
         Tzr8dbnPu28MalcwBabSvCPkVwydy5xMeDHxADE1d+fA/UvO3UHbu2soCQDexAq9+dZv
         zCmaJnYM1slE/zr69HkUkGLDSY83vs83inYZL9Ggi4DX94QIB68fGwir8Ao6+Us8/Rnq
         mcCaJVhTDWhexMntUxQaCDQw/VPa6iSmTPXvzekiz2T9wpuxJbnsY3AXT1r3MfW/prYY
         PEeqqpBB/cgkD8CfvkwMrK+PlBI7dYwx3ZztA65xAxoiKRDJmBh0bTt4+f3L4Lh5hf+q
         BvTg==
X-Forwarded-Encrypted: i=1; AFNElJ8v4MzjwnH44O+vNYFLVDglc5cetk7pOZ/i23RuQVkF0rQqkdjct6XtHMGQNQtt4B3z0b5OyyyFX+5x@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8cJE1hgXEkX2fMNkO54JUC7Y8roAhmDkx8x46XQ5m9vWcm2Un
	63N1f1FA1Da0j4LuccB5BAir3sp0IdrlEQMnA7uItfDMGdelAUZqHBpK0CclBbaj4Jg=
X-Gm-Gg: Acq92OHGJ0dck33bHQceEsJtTBoF6PlXtjFIVr0QN3WAwON5/EOT1eD3we4eEIoMz8v
	ovOibSuK1CrtKcNBn4amMKQUq68XkRCXnPahogrvYtg/gh6rXz2/B8WWHZVx+LHXIrE3pXNo0rz
	tD0L2iI1uKAXSj3heoBvUF5q8sblQQ1PEq5RuwZrHV1wR95gg0h3eb8UksDiEfTojFofMy7kGb8
	GMMpU6bXHJeWBOuly10zS7wk3/5ztsHD/HRPp51nqoz3XshTIA0paEe2kdGF8cejgE0H0XTYrW4
	Zwj21ABEdGVkn5R+5ZTCj814TvdNil72X1lRBuqV74/ggBQPBrVGNmdSiesKi5ZZVtG12GVvUpp
	wKIwezVnsMezkILHH5PSTT5i2WY1Lgt7XSA6wbVy2D+jSc8juuRg5zYAHE9+3aO6YdEZDFD1lkx
	gDkW1soZmBKutuACGURSA2k+Sxla9rS8LV5bamH66nCxYKfp9IWzgk2OC3moFXlgb7EI6KAnLdi
	FnAyDGYUZhXD0Pmsey+0l2aiVyUhjmPsY7hV8ekcFvzcVLY5SQhA3lO87fshjLKbtswlqxitRLf
	ByCr9undlukOFCq0jis=
X-Received: by 2002:a05:600c:12d1:b0:48a:5970:1fe1 with SMTP id 5b1f17b1804b1-4909c091fd2mr22900055e9.4.1780048269850;
        Fri, 29 May 2026 02:51:09 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef3563cb9sm2337806f8f.29.2026.05.29.02.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 02:51:08 -0700 (PDT)
Date: Fri, 29 May 2026 10:51:06 +0100
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
Message-ID: <ahlhinOh3NxB7FY_@aspen.lan>
References: <20260528135123.103745-1-clamor95@gmail.com>
 <20260528135123.103745-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528135123.103745-2-clamor95@gmail.com>
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8362-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar-com.20251104.gappssmtp.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,aspen.lan:mid]
X-Rspamd-Queue-Id: 693056004B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 04:51:18PM +0300, Svyatoslav Ryhel wrote:
> Document the LM3533 - a complete power source for backlight, keypad and
> indicator LEDs in smartphone handsets. The high-voltage inductive boost
> converter provides the power for two series LED strings display backlight
> and keypad functions.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../leds/backlight/ti,lm3533-backlight.yaml   |  68 +++++++
>  .../bindings/leds/ti,lm3533-leds.yaml         |  66 +++++++
>  .../devicetree/bindings/leds/ti,lm3533.yaml   | 170 ++++++++++++++++++
>  3 files changed, 304 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533.yaml
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
> new file mode 100644
> index 000000000000..866b0fb8ed04
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/ti,lm3533-backlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI LM3533 high voltage series LED strings
> +
> +description:
> +  This is part of the TI LM3533 MFD device. It represents two high voltage series
> +  LED strings for display backlight controlled by the TI LM3533.
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/leds/backlight/common.yaml#
> +
> +properties:
> +  compatible:
> +    const: ti,lm3533-backlight
> +
> +  reg:
> +    description: Control bank selection (0 = bank A, 1 = bank B).
> +    maximum: 1
>    <snip>
> +  ti,pwm-config-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Control Bank PWM Configuration Register mask that allows to configure
> +      PWM input in Zones 0-4
> +      BIT(0) - PWM Input is enabled
> +      BIT(1) - PWM Input is enabled in Zone 0
> +      BIT(2) - PWM Input is enabled in Zone 1
> +      BIT(3) - PWM Input is enabled in Zone 2
> +      BIT(4) - PWM Input is enabled in Zone 3
> +      BIT(5) - PWM Input is enabled in Zone 4

This is optional and the drive implements a default (zero) that is not
documented here.

Is zero a sane default from a DT binding point of view?


Daniel.

