Return-Path: <linux-leds+bounces-6059-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 246D1C45C74
	for <lists+linux-leds@lfdr.de>; Mon, 10 Nov 2025 10:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3A8D188EAE4
	for <lists+linux-leds@lfdr.de>; Mon, 10 Nov 2025 09:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC71301475;
	Mon, 10 Nov 2025 09:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CU4X2lut"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5680024BBE4
	for <linux-leds@vger.kernel.org>; Mon, 10 Nov 2025 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762768744; cv=none; b=a1fyky4wHk8I0RzIoqgPBBs8Hi8Znx/ZFsg7m5aomPHRj+OlGh0n7addPBham2CcEw9jB4jAO59HOL4y2zJAJMwCaEV+0sWZodHaTRyodI15H9Hsh8q24WWJpITIewD043ISxDFW2JBw8Uy/Zubxsf0VJOeWam9ZhxsinMGB8p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762768744; c=relaxed/simple;
	bh=Ldxb3xiosslpoOJubQchwtbD2Q0t8Tiz2RiN7Ya71NU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpV/j4d7qEij7fI406kbmP/wJ0Bdc04dJf4yPqEl8UYaqgjDEArGPzqez4JDcxBD3nwUb4ykWFv3kiUBSW03JnYXQQ3NsdjdFLyLzJ7TFzRgbjYHAXdYJUU8TCukifQ8u4FdVfx+yjYKyo6zWhqSFHbZ7NF/Dcw0CHZM1kUtYvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CU4X2lut; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b31507ed8so1414175f8f.1
        for <linux-leds@vger.kernel.org>; Mon, 10 Nov 2025 01:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762768741; x=1763373541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wKdtCn/XoTBMU0W91zbNyyVRdCbCwPGBIxEuE5k5q+8=;
        b=CU4X2lutMaoMp7050vNzWAMZ+EMXpJt11Kci27RsnTIl2yDssByHkBj8jMTgXdJ7dc
         Pi35qWLiOt36vrj4uZGBBRCDvasuLEpJqHQYRoGN+WkhCWagOO2/EvZc/TZy6zBEUOgU
         dOseGOeC5P200rjflSAm7dyWMNiR3jRjYfiiWLOcLf+KqSiURh+hOB8DP587ztAzqgxp
         WpJTeth0Ay0n7WnKSLb2/E9qPQYUEwlNgsGqcDlx4kfd5jfN7zcl212Is8Rz2OSvigRG
         zcAZwSUMNe/W4U8Mj/XLqoLjmUpYRk9LIfSLo9jagpd8NsIexgbap3qnq30iXiB0tUdu
         ZqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762768741; x=1763373541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKdtCn/XoTBMU0W91zbNyyVRdCbCwPGBIxEuE5k5q+8=;
        b=AkWjSAADPGPgpTX8UJKXMvAotsMb//VXKOb1Clu5uOQtqWNpuEMDurzuVg3vA/GlBu
         /NLjtnqQfakwg0hJQcWRboh1GRtOHj15s+0L8OopRsscNOAgOanfT0ss7Mb2neEQCP+z
         MsjG5rZiRTftBNGd3I3ts1v1XsKvA7xrNV0xdrqwzsE4DSxfxqt6sv1jC0w0brr3JMe5
         JZLf5J6TyiSoX9QhcVeh7Mmj1quKgIq8O0DTOpnm3IcCJJJKuRlosIZ+M3HYSGFehqrR
         j2gF4pqJEXBR/7fTAwYSCQSP/tkbiCAtgLOGi/A8WJpTLpqicaNEABMOsIbZyXrMZyw2
         DHfA==
X-Forwarded-Encrypted: i=1; AJvYcCUe0eKTUbTVgBsNsxJU2tHfdk1mu5w2UK/+Ku3l9SJDC4ojIGILqQeBoOzWq5BTQ1h96cUrJMZYeP9M@vger.kernel.org
X-Gm-Message-State: AOJu0YwDDLVZqGuYTO4JPbyiYsjfPYTv9V7EgRBYfgt1TOwiGM8pnYBP
	qQcJKNKpZODwn7GbTb33LlbU30VwEmFvMI9TW0Y3et01p1kxSnAUcpqdpLN98JWOlHo=
X-Gm-Gg: ASbGnctRBocHO5oSt0b9W3GZB9MHOrFSKy5yILXxy9swor1tit/H4UExdR4t+9MoiQ2
	s7KdWoWkLvKJrrEVLaxrfjq2maTPHFEnJWltRgHO88SGOs4YwVfyb/9gOTdYFQ9+sOemnD9PzNq
	fc/OMv1lUQZTynjoM3KjB7/a4sbJitfsqsfsueaquT9MFaHCzaGep2sKekt/sE7XStU3437MS5t
	2rF/mwHXke2vFvZYehL31feWt4fV2XhIsF+xSVhp5zZo2Mhu21myIzppalzzA5eiUox7i3kfZJk
	Ul0Jl9iMrIwRm5bg177Mey7d+18iBLB75+KlbjlX9F0qWKUrg6Yrqjt3FRS2JYsVT9Xs/8a3L5r
	EqmXishxeVbPKMlJCS3D4yW80QAA8Kzg5Fd/ISMSN3iYkqLPwPb27NTS9Qh3eUTlXFKwT/rLR4L
	EcfXlN4C0SEQZHCCC5dFw4Up0TZhsqw4BIiVSozJCV3uDIDxvTEIFOGOjXlTU=
X-Google-Smtp-Source: AGHT+IESDCHlcbXRXRa2TG5aApGtSH2moJB6JVIAkSw02ybwWPI2qmXCnmEZcdOIcRiKJ320ee1qvg==
X-Received: by 2002:a5d:5885:0:b0:429:d19f:d959 with SMTP id ffacd0b85a97d-42b2dc1ab24mr7071023f8f.15.1762768740534;
        Mon, 10 Nov 2025 01:59:00 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm9799000f8f.45.2025.11.10.01.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 01:58:59 -0800 (PST)
Date: Mon, 10 Nov 2025 10:01:11 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/4] backlight: add max25014atg backlight
Message-ID: <aRG359gIeP48V2ZZ@aspen.lan>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
 <aQ4a2SBDldYgQb56@aspen.lan>
 <f4e52cc1-9c5f-4069-9079-83be794ab2b3@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4e52cc1-9c5f-4069-9079-83be794ab2b3@gocontroll.com>

On Mon, Nov 10, 2025 at 09:40:07AM +0100, Maud Spierings wrote:
> On 11/7/25 17:14, Daniel Thompson wrote:
> > On Fri, Nov 07, 2025 at 01:49:59PM +0100, Maud Spierings via B4 Relay wrote:
> > > +/**
> > > + * @brief control the brightness with i2c registers
> > > + *
> > > + * @param regmap trivial
> > > + * @param brt brightness
> > > + * @return int
> > > + */
> > > +static int max25014_register_control(struct regmap *regmap, uint32_t brt)
> >
> > This isn't a good name for a function. It doesn't really say what it
> > does. Please find a more descriptive name.
>
> Having a lot of difficulties find a succinct name that fits better,
> max25014_register_brightness_control()?
> max25014_i2c_brightness_control()?

I'd focus on what it does rather than how it does it meaning something
like max25014_update_brightness() would work.

However, at present, this code is only called from
max25014_update_status() so the simplest thing to do is to move the
code into max25014_update_status() and remove this function entirely
(then it doesn't matter what it is called ;-) ).


> > > +/*
> > > + * 1. disable unused strings
> > > + * 2. set dim mode
> > > + * 3. set initial brightness
> >
> > How does this code set the initial brightness? It doens't set the
> > MAX25014_TON* registers.
>
> Yep forgot to remove that, I discovered the backlight core takes care of the
> default brightness, so I removed it from here.

What do you mean by this? Are you sure you aren't relying on another
driver to enable the backlight rather than the backlight core?

> > > + * 4. set setting register
> > > + * 5. enable the backlight
> > > + */
> > > +static int max25014_configure(struct max25014 *maxim)


> > > +static int max25014_probe(struct i2c_client *cl)
> > > <snip>
> > > +
> > > +	/* Enable can be tied to vin rail wait if either is available */
> > > +	if (maxim->enable || maxim->vin) {
> > > +		/* Datasheet Electrical Characteristics tSTARTUP 2ms */
> > > +		usleep_range(2000, 2500);
> > > +	}
> >
> > If you really want to keep the devm_regulator_get_optional() I guess
> > maybe you could persuade me it's need to avoid this sleep... although
> > I'd be fairly happy to remove the NULL checks here too!
>
> Just wait unconditionally?

If you think it will be unusual for the driver to be used without enable
or regulator then it's ok to wait unconditionally (all examples you
have added so far have an enable pin).


Daniel.

