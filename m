Return-Path: <linux-leds+bounces-6673-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EDED7D3AD55
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jan 2026 15:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 37398300B35F
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jan 2026 14:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B36C3644BE;
	Mon, 19 Jan 2026 14:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="h7vBvgXn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3349235E548
	for <linux-leds@vger.kernel.org>; Mon, 19 Jan 2026 14:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768833745; cv=none; b=TsnyTGdbhPp9tJElt1D73Pyn6+EN+0NFVoDprah5eu0qi+dLTrp3HyOnjrs3XTANGBftTU+UNMwXbRi909dDFGBgvAKE4fohZ0U5PYdzkJki51OKz/4A3K9QreQn/OJznS+cDZAauQ40ZSLQIyYoKzQ+gUmsc2RXxhKt02sEhgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768833745; c=relaxed/simple;
	bh=afV6H9ksp+j0F3QSTrjV2ykIVls2yG3qd1BHRd1y/fU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQLfDduhR9lIxwAby0Xuv1Cr6ie7I/sXVJa4VyiIBR4CUcFiOgIVVSSJT7urLPWowOOJiBm6iKc4u+l5ktsg6F+BC+2VeBh5RHn/paXVZRcSU6PZrJWbGdMr230yMieluR15accgdcGLsrrOD0QcA3Bge0Z5s0GeejL1wRy/aNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=h7vBvgXn; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43246af170aso2527746f8f.0
        for <linux-leds@vger.kernel.org>; Mon, 19 Jan 2026 06:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768833741; x=1769438541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TvnwX7iYJXUTTPGbmFJMfKYn4PnTqwC1sbs2t7QZU9Q=;
        b=h7vBvgXnClc4BISfxuNlt/S6fnTXIcyoqCxSMnQadnq/q0XIR5mABcC56zzpZ6YS+s
         u77KdT29rZ21vHPgHTg03OyyQqttj8M+8l8zsDUo2RBRFBMhfV2NV53YjNtmm4lzQSH4
         2Q1Acw+CjFMJvLxO0X1Kz/kXRfOhqY1L9llLWvQH7j+j3YUucT0uFGCymcSYZzagXsVp
         kKPLPHzHo3cik2E3tnFdce9+TKZBxT1N6CjGhZKwHqXvuB8wV3oPR2jYOG3jPMEFWIZh
         N+qyP6uObHWfzV5/ZpWxhVy13yKmxsu6ExZpYkA7rLoEjv64gzGmdpLMmHX1H04E52eI
         oU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768833742; x=1769438542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvnwX7iYJXUTTPGbmFJMfKYn4PnTqwC1sbs2t7QZU9Q=;
        b=P7hNZYqlEWTXrCv20GBnliGQ0rnij20h02uqGz+sARCgQDgUC3eykymz9X+EkEfkbM
         SsjdLhG/1faKgTxA7Gdp0hMzqB4TRX4MasTie2ePpYukLvEgUffZ0KKQ9gax8p5HQAVh
         5VGSXQiAVBLjRT2PDGjP1/w9qmugH1Vj0K/FmEjPj1AZpv5fucYo9QdVyE6gTJ3eobKj
         SUUoSHw8keg//TGjRA422K2CX1TAG6GNVSl+9Ts9gjDMCQWM5A2M04jlL05JU9Um2n1J
         /nt/2MP9EXNDdBoGNl0T7mkr8nI1M3bR7sAEw7cFFMbYU2eqExkGCLIulOt9csL+29t+
         aTJw==
X-Forwarded-Encrypted: i=1; AJvYcCWNoweR49L5jYHMSPu0dkYE1C/XJpwFdjn0hk0c2tm+5pe94RLQP5n+9WL/Jjnbx4APXh++2lfBcx7c@vger.kernel.org
X-Gm-Message-State: AOJu0YwB7gJJqsvJVizSHOB/pl/BPTzsUMicvL8P5EYQ4t2wEYWijBB3
	B5dJXrZbaqSGgssrnDwRxyXJAOnc8YqLgEEe5iOIgY+2VTv6krcvWpNL74viI3MpmPgLUrZKFkS
	yWBdi
X-Gm-Gg: AZuq6aKDprfXyIa6F0vupQnf15IbY2cEdpsolGylne5pFD6pARTwwWKA7jjLhpUhpiJ
	vUFLe9mwMgfWQdKx52zLPoCHbGhO6SOliE+ZYmrMmnXKGPdV5p2UNHolVYHvVH/8GPNkbKMdPXy
	Q2ZXHlp25pcoO70eE2c5dQetoSXQqa+ebq+kqG00lh98XNJK+W5m8awdYPhJiOaFE1G1EZS3dqQ
	FSJpLmtT0bTGFP+wXwBcJrVbYIno/tlyNIg5iYM6A8WYMNiecdH/jnZawjrE9szvHEKCuG1OnzQ
	35n81sZrdPfQ20gyABVI4o+Obr3qPClHHfJobFKyBpBGIjP3+nGLQSQfoGkCwrVV2fzIVLFYG4J
	eLNfGQ7uRHzFotto+6L3h0DkUpCbBCAczr7R9s7zZzy0yc95hcDKX3wrkFKBmtechYGMpWL0Juj
	wwksbNEn/8Ic9OV8Sznx1vtHWXLILKjgqbHWAjZzDQ2QtP9LJEItD47/5l4nSxK6OZdR3afLNho
	YLCA/YLv2eeGJQckeY5b8I2SeR2evJNEAF/2UiYUX2f9BisBQ/RAnRV15zbTCCR8uIo/YW5PNAn
	gEbi2jo=
X-Received: by 2002:a05:6000:4203:b0:432:d9ef:3bef with SMTP id ffacd0b85a97d-4356953f7d4mr17422902f8f.2.1768833741613;
        Mon, 19 Jan 2026 06:42:21 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435699271dfsm22939388f8f.15.2026.01.19.06.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 06:42:21 -0800 (PST)
Date: Mon, 19 Jan 2026 14:42:19 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: tessolveupstream@gmail.com
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: backlight: gpio-backlight: allow
 multiple GPIOs
Message-ID: <aW5CywUjbr6eCPI_@aspen.lan>
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
 <20260105085120.230862-2-tessolveupstream@gmail.com>
 <aVuKdAyXfWLs-WJI@aspen.lan>
 <c182df66-8503-49cf-8d1d-7da17214b843@gmail.com>
 <aWe7_hFpmO0E2sJe@aspen.lan>
 <95a49665-f379-48a7-a2b5-d288cdfdc0a8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95a49665-f379-48a7-a2b5-d288cdfdc0a8@gmail.com>

On Sun, Jan 18, 2026 at 10:18:32PM +0530, tessolveupstream@gmail.com wrote:
> On 14-01-2026 21:23, Daniel Thompson wrote:
> > On Tue, Jan 13, 2026 at 10:15:53AM +0530, tessolveupstream@gmail.com wrote:
> diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> index 1483ce4a3480..82698519daff 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> @@ -16,9 +16,11 @@ properties:
>      const: gpio-backlight
>
>    gpios:
> -    description: The gpio that is used for enabling/disabling the backlight.
> +    description: |
> +      The gpio that is used for enabling/disabling the backlight.
> +      Multiple GPIOs can be specified for panels that require several
> +      enable signals.
>      minItems: 1
> -    maxItems: 2
>
>    default-on:
>      description: enable the backlight at boot.
>
> Does this approach work for you?

I think so... but I'd rather just review a v2 patch than this kind of
meta-patch.


Daniel.

