Return-Path: <linux-leds+bounces-3806-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A52A15361
	for <lists+linux-leds@lfdr.de>; Fri, 17 Jan 2025 17:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4FFE1882DEE
	for <lists+linux-leds@lfdr.de>; Fri, 17 Jan 2025 16:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91CB199FA4;
	Fri, 17 Jan 2025 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="feKTpmFB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E670E15696E;
	Fri, 17 Jan 2025 16:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129644; cv=none; b=O1/6AttBBegWh5ukppM3wGVqE84yd813894Uc+vYa8Q7uggQ/mi1azN97AaTav1C4Z+bxnI54pZgvHRwgOTNVMN1/Ks7yFjmn7JvP0iK9ZHX9pvUbGaHSzJqA4gkCDVCpI/4B4c759x5WxRhozcdTosQO2voP3jFYs7aqzZa5/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129644; c=relaxed/simple;
	bh=LBFaQTfD5DTAgyjiAdLRHuZ4RflZefRGoM6YNvU/hoQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROPbMdx8gaQ9vPB0+ZpGkIQ/zOWS9IsLFJ3Wc0FZElHEFRjx0EXpP+2TwvJ3gmIhVtYy48Pj1sRRmaUf8ibUk67p5hzIVG1FJ2OmlKuMyAe7xqZaoLJRY/puBydDF93DCAkQcK5J6/eU9fCQOIusE4oeyzTk5ILHZxw6vEz4bUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=feKTpmFB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38be3bfb045so2088013f8f.0;
        Fri, 17 Jan 2025 08:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737129641; x=1737734441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g/Y851uQNwHgtptI04bOzErBC0DlLJs+YWGXr5rKylc=;
        b=feKTpmFBrvQhOZbRmwUi9PxMHeaGqoFRPg+hNhwsUnsHKXSzQiQO3d1WdsFqcS++Qh
         a0hBGNQ99zFohZG58D6CbWWbMU52V5Yaq6WtHxPyi/fgI9WBAaCS+/NlVyHQD/BQw3Sq
         Mivo+E1BuulcrIyKNhIVHIWqjT2OHAnGw11IKHmwAY7bQj2PuV/qyaNXU/mqrMlwawmD
         HyoH1SXm/T2OyhO2k+GV40ARYc5QvAzn6jmR8gt4fAvbYG/II3zPwqmtnujD9UpEV+Z9
         jvfO6QK/38Qfn9C7L4mtSlGHWgF/J9SHLM4ilpt5NV84X2nOSexeORtn3ucuUkKwphrU
         eM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129641; x=1737734441;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/Y851uQNwHgtptI04bOzErBC0DlLJs+YWGXr5rKylc=;
        b=d5FPhC3uSBrC+iT6Rt0WH9e74E57t5eiioYC+hOEagwMniLmPsMePlourfl4Pm2Qud
         vzdB5PfSQ2NidXfYFi6Yay8h1K2mAPhMAYcNKwJ6OBqFEASU4l0np4OOmw1V/N85qyEA
         L9x+EbAKvKqqDGpNDr7TG/kYXP4Z02mzQyJbGouBgVylFu2FeSXmVAoFGeqMhJJN1BnR
         TN5rg2ZVV9nekQGpaZuDovSe5k7Kel9DIUQphvzh3Hk3ltj7/1qbQLAfDz+TfJ1E57gS
         6z1hdRUIzoqF+j5SFJLAFo7MXMdvQJFfu0IBM4QWx5lALEohJfHOddgJ9JuB4FDXWWKk
         lh9w==
X-Forwarded-Encrypted: i=1; AJvYcCUcgKhXodD/voaByhF1/pZpfsAvoYhkFPUIC0V6cYb7V1rwVGC88OHVj+MsksBXtrTMjBA9yguUgFHLWw==@vger.kernel.org, AJvYcCVHIdicgc9mTdpMCHSbfSnPiyeAtcPDw0720+1NdIShIfwQBAiYs37aNLHu15nx0tpzAqgYvv2J4wSF@vger.kernel.org
X-Gm-Message-State: AOJu0YznoCIYmy/kuUyK3CxESlEXOYoBNyaIILICl7l9esJern432XFE
	wxDtgd7R/xiZPmoED3UJHzUhuXecBNsxZNmj4Fd5ZRT1heMa8qo3
X-Gm-Gg: ASbGncueXEexqO0oS7Q9sSE69WjkY7V1xJWiE1qhvW8PUttXwJM1vUS+a69J6FzO5Kq
	zhQQH9w81nsAQw7BHPyBDDHlXCVCDXc86edX4WMk1mfeXlQZ6ecX/TRXRfSpBiUbMBcHWB/81BI
	gGoa5U8Y3scU+rD8Cn3bHq8jdOcq4/WobNyJG2EaMmAU+6SzNth7PJEOHxMSLIytDv0nhBgvdh+
	PmPMd6EPv/gStus0wbtPKBAlGLmY0z68DhBMUBnikUT0aoraDz71asmYf+fBDVriPyHaiCoeJbf
	eneHXnOKOTi7
X-Google-Smtp-Source: AGHT+IFJUW7oTwy0Dy0k5noj8V0K33epGo6WV1CyRYagfFJy8bA/GYrcIK5DCCzYImUxwmdK9pLwCg==
X-Received: by 2002:a05:6000:1acd:b0:38a:8d32:272d with SMTP id ffacd0b85a97d-38bf5b0b894mr2394481f8f.28.1737129640916;
        Fri, 17 Jan 2025 08:00:40 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322aa40sm2840159f8f.45.2025.01.17.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:00:40 -0800 (PST)
Message-ID: <678a7ea8.df0a0220.126ab6.dd54@mx.google.com>
X-Google-Original-Message-ID: <Z4p-peMU7Ujg77_B@Ansuel-XPS.>
Date: Fri, 17 Jan 2025 17:00:37 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Marek Vasut <marex@denx.de>, linux-leds@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, Lukasz Majewski <lukma@denx.de>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: Document netdev trigger
 netdev-trigger-mode property
References: <20250113002346.297481-1-marex@denx.de>
 <ad334b1b-a4e5-426d-a801-3e1d72455304@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad334b1b-a4e5-426d-a801-3e1d72455304@lunn.ch>

On Thu, Jan 16, 2025 at 02:32:13PM +0100, Andrew Lunn wrote:
> On Mon, Jan 13, 2025 at 01:23:37AM +0100, Marek Vasut wrote:
> > Document netdev trigger specific netdev-trigger-mode property which
> > is used to configure the netdev trigger mode flags. Those mode flags
> > define events on which the LED acts upon when the hardware offload is
> > enabled. This is traditionally configured via sysfs, but that depends
> > on udev rules which are available either too late or never in case of
> > non-Linux systems.
> > 
> > For each LED with linux,default-trigger = "netdev" described in DT, this
> > optional netdev-trigger-mode property supplies the default configuration
> > of the PHY LED mode via DT. This property should be set to a subset of
> > TRIGGER_NETDEV_* flags.
> > 
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > ---
> > Cc: Andrew Lunn <andrew@lunn.ch>
> > Cc: Christian Marangi <ansuelsmth@gmail.com>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Heiner Kallweit <hkallweit1@gmail.com>
> > Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Lee Jones <lee@kernel.org>
> > Cc: Lukasz Majewski <lukma@denx.de>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-leds@vger.kernel.org
> > ---
> >  Documentation/devicetree/bindings/leds/common.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> > index 3e8319e443392..1f1148fdf20c0 100644
> > --- a/Documentation/devicetree/bindings/leds/common.yaml
> > +++ b/Documentation/devicetree/bindings/leds/common.yaml
> > @@ -233,6 +233,12 @@ properties:
> >        Maximum timeout in microseconds after which the flash LED is turned off.
> >        Required for flash LED nodes with configurable timeout.
> >  
> > +  # Requires netdev trigger
> > +  netdev-trigger-mode:
> > +    description:
> > +      The netdev LED trigger default mode flags, use TRIGGER_NETDEV_ * flags.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> >  allOf:
> >    - if:
> >        required:
> > -- 
> 
> An example would be good.
> 
> In order to be able to use TRIGGER_NETDEV_* i assume you are doing an
> include which is outside of the usual dt-bindings directory. I don't
> know of the DT Maintainers opinion on that.
>

Well I think we can just move those include to dt-bindings or at worst
define new one (maybe less driver specific) and reference the internal
one... Should not be a problem in theory.

-- 
	Ansuel

