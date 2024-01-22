Return-Path: <linux-leds+bounces-651-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AF1836DBA
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jan 2024 18:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8E101C27C22
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jan 2024 17:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F1F5A7AA;
	Mon, 22 Jan 2024 16:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wKiw9W9B"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C3C5A79D
	for <linux-leds@vger.kernel.org>; Mon, 22 Jan 2024 16:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705942217; cv=none; b=o2Z2h6M86BjGStW1mGqCdm+idlsxEYjatTiJGnIZnQzXjhiBFb0iVoE5ZWw0pfFNC4oTcYVTh/CIr0+BUnr9HomWcu4clVOc9N0SJfiJDbKeRtnGJDe023y/miNR0Ztr8ZcaTogM4axM9rXT0o6qooicnb7CPYvmiVMj1IODmic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705942217; c=relaxed/simple;
	bh=0ruM/gNibJeJfXSYwhoWuQgAeyRU3c7XqXfVEhgtTGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WiI4NUMPLX/cVi5DWvnjH/yBewoHnDwGk0EDrFV3iAq8pmkcAVK67OPQtGaEWyOZSIz4Hm1MqmvTjoVg0qioztTWfLRkNkvBbgbLgsDQ7Jl7l5tLA/t2+8eckeXBw9nNB13jnoU11KxCNWc4xl1e9rtocPu1LfTl++ZBZKrQMGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wKiw9W9B; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3392ba29845so1867472f8f.2
        for <linux-leds@vger.kernel.org>; Mon, 22 Jan 2024 08:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705942213; x=1706547013; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U2u02dHyzXh8Z7GhixGdPG0+iHyMzaUZy8vA0Gln640=;
        b=wKiw9W9B+puVyaMaPiGE8nyIDzniCMcSewRBP5z/d00eWzqCz4fprSuzR0Bj4Iw3q+
         4Cn8EjXyJUi1OYdqQE8IfBkKF1GuISf9LS9IRpZnETdjt2NvmPu1GxSCbsFCeGGhtUew
         XXQqzuqcyDyZy4jja6A8GTVHmevgSmNs9ruLS33mGFpCjdk5DHoPGEpFz1DrYwrLayUC
         wnp5I1LYEN07hr42G2LtMUGNkPwKLhm27Sm/6DxC1tFkiNasyj++oTABjdsVtef6n5VZ
         5dIUtpYXmwDuCdFG0HiebbiVg8gkuilRLhQo5b9hWGadBRdCjJcsya0E5YuqyaNahjTK
         fG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705942213; x=1706547013;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U2u02dHyzXh8Z7GhixGdPG0+iHyMzaUZy8vA0Gln640=;
        b=Q1RsSWp5ObagdQ4jYQJf2SN+LYru1SMcP7jrbUjGvcSohTBSR9hxjW5D5Jme8u0A/L
         mR/JSsgk1rVaZXjLwkw0xopAxxIRzA32aFmZbVH3oB2NU7mT3Pfq8xUFWETvVDDttNLl
         JAbKJP4RzR6oDe6cGbQAwGp8B6OBcfn9NzSemmK9w/Vq8m6GbUk/8RhWfgZwuTLaUcCe
         dZtDe21WImKyezVGZKcmVIesca18An14WddGW38SZ9MKjSjPtNtbncnbeQI/5BkB0wOG
         adLbtGSCFfcHyC8COYBVxjb9xrJpaWMlgB1hDVjci04XOAPcgoq8fpHQ1kTZp38fHQ3s
         Klyw==
X-Gm-Message-State: AOJu0Yycm2LHNd8oHH+ghYye/mMguhemFJXZkPrxj0ZXxrKBG58BeL15
	ywA1sgY8iO8NOoaYAspOJYGdW1nOq9vrku8/ZOsUWEl/TCkhqSsCQWGthJKPqbY=
X-Google-Smtp-Source: AGHT+IH9kUc+oTorubUMxmQGsHzNDlOEembJL7z3hBRj9dGgCGiiPfSpDD3ONpdmGFYg9O2W5PgfHw==
X-Received: by 2002:a05:600c:310e:b0:40e:5186:7ed1 with SMTP id g14-20020a05600c310e00b0040e51867ed1mr1744941wmo.25.1705942213558;
        Mon, 22 Jan 2024 08:50:13 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id g7-20020a7bc4c7000000b0040d5c58c41dsm38655169wmk.24.2024.01.22.08.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 08:50:13 -0800 (PST)
Date: Mon, 22 Jan 2024 16:50:11 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Karel Balej <balejk@matfyz.cz>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 1/3] leds: ktd2692: move ExpressWire code to library
Message-ID: <20240122165011.GA8815@aspen.lan>
References: <20240120-ktd2801-v3-0-fe2cbafffb21@skole.hr>
 <20240120-ktd2801-v3-1-fe2cbafffb21@skole.hr>
 <20240122101926.GA8596@aspen.lan>
 <5907190.MhkbZ0Pkbq@radijator>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5907190.MhkbZ0Pkbq@radijator>

On Mon, Jan 22, 2024 at 05:24:51PM +0100, Duje Mihanović wrote:
> On Monday, January 22, 2024 11:19:26 AM CET Daniel Thompson wrote:
> > On Sat, Jan 20, 2024 at 10:26:43PM +0100, Duje Mihanović wrote:
> > > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > > index 6292fddcc55c..d29b6823e7d1 100644
> > > --- a/drivers/leds/Kconfig
> > > +++ b/drivers/leds/Kconfig
> > > @@ -181,6 +181,9 @@ config LEDS_EL15203000
> > >
> > >  	  To compile this driver as a module, choose M here: the module
> > >  	  will be called leds-el15203000.
> > >
> > > +config LEDS_EXPRESSWIRE
> > > +	bool
> > > +
> >
> > Shouldn't there be a "select GPIOLIB" here? It seems odd to make the
> > clients responsible for the dependencies.
> >
> > BTW there seems to be very little consistency across the kernel between
> > "depends on GPIOLIB" and "select GPIOLIB".. but select is marginally
> > more popular (283 vs. 219 in the kernel I checked).
>
> I believe a "select" would be more appropriate here unless these backlights
> should be hidden if GPIOLIB is disabled. The catch with "select" is that there
> seems to be no way to throw in the "|| COMPILE_TEST" other GPIO-based
> backlights have and I'm not sure what to do about that.

I think the "|| COMPILE_TEST" might just be a copy 'n paste'ism (in fact I
may even have been guilty off propagating it in reviews when checking
for inconsistencies).

AFAICT nothing will inhibit setting GPIOLIB so allyes- and allmodconfig
builds will always end up with GPIOLIB enabled. If we are happy to
select it then I think that is enough!


Daniel.

