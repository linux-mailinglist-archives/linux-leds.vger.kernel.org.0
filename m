Return-Path: <linux-leds+bounces-2126-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B11A5918666
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 17:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B231282290
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 15:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFCC18E745;
	Wed, 26 Jun 2024 15:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgwNudZx"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27A418A92C;
	Wed, 26 Jun 2024 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417422; cv=none; b=TqafCAN+DoHDB1GuVurmx94XWZUd/H/tXzta1z+lAmUsQccfVotUt7EFBJNnX7OyfXeRTaAe6nF5k3G4bkIUbpiM5L4bs2wOUQh87HcbfxYE4d6/oi5RNJQO8FHq7Ab6HB7g1X/5bJYd3W6wdnNRbC0r3JpaIUTmSKn5yNGyWWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417422; c=relaxed/simple;
	bh=f4jHXaEA6SI0Vlzjhm+Jlk9L8MQ7pFNa5OyIVSkFEiU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jd+sz8dUjVD1su4R6mMdFzo2UGTzJRyd8WcAaHjnLh6j6552WFScrib1oC4KXjyoi6KiQTGPUfiulJwkwCNnfIUeh4AyelXJh2zdYoEIxHEnFlvgQh1I5dEQ5kUufGD/npPx/THDWbMfHvuUMRuGZt34QENQeFtt5PHzoc/4cRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgwNudZx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3608e6d14b6so4361349f8f.0;
        Wed, 26 Jun 2024 08:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417419; x=1720022219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RLXq/EvnBR21pbUC8uZl7lH7uGiINZ8Pt/d+SvQg+jY=;
        b=YgwNudZxZMFKebA0gHRZ4riSnZ2N7rZmF7FQtJ8Xkka0Bt+LA3KDK3N2mMfPtwjcan
         0yb6B0N6hPgng2CAlJvNCcWrAw5xrSie1Ow4LWiUPGwOqH0nm3jcpSU2RRFqynO4tlzF
         K6SEgEwKKNspD/Kn9oGtgYiLQhzimil40qEV3qvx/69GeNlNaUYm8Kq1Gec7TtNbYhHA
         rgRYX1LEoba11h5XQClHTH1jrbKT1Lat/LxAaEGN7/Q1JPl2EYkRjIN39tQv+7vveH/T
         qvLEY4vqBEKiYHVvj7amzTKdhfeDEaWYKE38/ufqtka2fHsQZE/HmeLFM5nGUb0gM0zF
         /fig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417419; x=1720022219;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLXq/EvnBR21pbUC8uZl7lH7uGiINZ8Pt/d+SvQg+jY=;
        b=Z/YnuyjJaRB8joHKp3toS7wVucp7vOY+CbvwEafreeWKvPLBBTxjtwmXWZHq74T2zb
         JQvgQm46FLvWYRk8wdrHFOAF+73e5KE2HmlcxU4AdW/GxNZ9Y+J5ECdRScxamtErOUle
         wxHMHWIRXGHNffLliAkNCsM6caEPBQMVefSWwxvgLvlpT9Sn5LDA9+M+83RNbXMuqcYg
         9OZZuHuS8Lg5A2B03SP2n2ktiDOwmZ8BkI9clJe4USk1ZArg/xLncHH2TFioQ+OnW6ZY
         vvhZK1yo4KcsAuzisw1wr/rKX8LJFJXcejfjr+4vsLqlG3Wpe2Xa6OQGwkw2XnN3Kjq0
         l89g==
X-Forwarded-Encrypted: i=1; AJvYcCV7J4BtiilQkeeBO4Pq31eKxCdB98yacvKYYwI0wrWc8uBF5Cc0VOJTZiHRETWl46/7Xp2jHTKf6muq2W9/UvbXqB9qUmD2O2E0ez56/bU8vaSx51pqvCdYdeoYSX+px6WgaD2mstW4zbAxiRcboTNXc7LcjyuDP1qLCNBlmAUHdykk5Gc=
X-Gm-Message-State: AOJu0YzUPPBu5G1f1apqd2+R2coKYSRI/C20cphzR2jpPemP+ApNVEk2
	sLPnGl/fygJ6K+xg+UA2rxEtIAsHz1KdKpTFRdY1gg4StAvpjx0u
X-Google-Smtp-Source: AGHT+IHk07ewtmbFYKlj0KrsF+estPj9pQ7fLr+ge3laRYNUrOU3n5f4b1FuHC6AvtksUxf/ZD0QFA==
X-Received: by 2002:a05:6000:2a7:b0:366:eb61:b45 with SMTP id ffacd0b85a97d-366eb610bc7mr8486655f8f.1.1719417418840;
        Wed, 26 Jun 2024 08:56:58 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366e0750e41sm13863465f8f.97.2024.06.26.08.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 08:56:58 -0700 (PDT)
Message-ID: <667c3a4a.5d0a0220.bf738.7cca@mx.google.com>
X-Google-Original-Message-ID: <Znw6UGpeJbV8YpmI@Ansuel-XPS.>
Date: Wed, 26 Jun 2024 17:57:04 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/20] leds: leds-lp55xx: overhaul driver
References: <20240620210401.22053-1-ansuelsmth@gmail.com>
 <20240626154255.GC2504017@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626154255.GC2504017@google.com>

On Wed, Jun 26, 2024 at 04:42:55PM +0100, Lee Jones wrote:
> On Thu, 20 Jun 2024, Christian Marangi wrote:
> 
> > This long series is (as requested) a big overhaul of the lp55xx based
> > LED driver.
> > 
> > As notice for these kind of LED chip there was the bad habit of copy
> > the old driver and just modify it enough to make it work with the new
> > model. Till v4 I was also doing the same by following the pattern and
> > the code format of previous driver.
> > 
> > Since Lee didn't like this, here is the BIG series that generalize
> > pretty much anything in the 4 model currently supported.
> > 
> > Indeed, although the LED chip have fundamental difference (page
> > support), things can be generalized and produce slimmer drivers by
> > putting everything in the lp55xx-common shared module.
> > 
> > This result in the new model lp5569 being very small with only the
> > selftest portion to be custom.
> > 
> > Lee also wasn't clear by the meaning of ENGINE in these LED driver,
> > so here some simple explaination. This is very common on these TI LED
> > chip. The ENGINE (there are always 3) is just some kind of processor
> > that execute a program (precompiled code ASM like) loaded in the SRAM.
> > Sysfs is used to load the pattern, and to start and stop the engine.
> > 
> > These pattern can do all kind of complex thing with LEDs. Old LED chip
> > had 32bytes of space for the pattern but newer one (like lp5569) have
> > pages and if correctly configured can have massive pattern.
> > These pattern can do all kind of magic like loops that make the LED
> > pulse, change color and all kind of stuff.
> > 
> > (For Lee, sorry if you will have to repeat some review that I might
> >  have missed in the lp5569 driver)
> > 
> > Changes v7:
> > - Add Suggested-by tag
> > - Fix checkpatch error for complex macro (rework define)
> > - Add missing values for fader conversion
> > - Align some function with redundant new line
> > - Capitalize every commit title
> > Changes v6:
> > - Fix compilation warning for ret unused in read_poll_timeout
> >   (no idea why this is flagged only on some particular arch...)
> > - Fix missing bitfield.h in lp55x-common.c (again it seems this
> >   header gets included in the flow if the arch use them or not...)
> > Changes v5:
> > - Big generalization patch
> > - Rework lp5569 driver with new generalized functions
> > - Drop all copyright header in lp5569 as the driver got reworked
> >   entirely and it's not based on previous one anymore.
> > Changes v4:
> > - Fix reported buffer overflow due to a copypaste error
> > - Add comments to describe fw size logic
> > Changes v3:
> > - Add ACK tag to DT patch
> > - Enlarge and support program size up to 128bytes
> > Changes v2:
> > - Add ACK tag to DT patch
> > - Fix compilation error with target that doesn't
> >   include bitfield.h
> > 
> > Christian Marangi (20):
> >   dt-bindings: leds-lp55xx: Limit pwr-sel property to ti,lp8501
> >   dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
> >   leds: leds-lp55xx: Generalize stop_all_engine OP
> >   leds: leds-lp55xx: Generalize probe/remove functions
> >   leds: leds-lp55xx: Generalize load_engine function
> >   leds: leds-lp55xx: Generalize load_engine_and_select_page function
> >   leds: leds-lp55xx: Generalize run_engine function
> >   leds: leds-lp55xx: Generalize update_program_memory function
> >   leds: leds-lp55xx: Generalize firmware_loaded function
> >   leds: leds-lp55xx: Generalize led_brightness function
> >   leds: leds-lp55xx: Generalize multicolor_brightness function
> >   leds: leds-lp55xx: Generalize set_led_current function
> >   leds: leds-lp55xx: Generalize turn_off_channels function
> >   leds: leds-lp55xx: Generalize stop_engine function
> >   leds: leds-lp55xx: Generalize sysfs engine_load and engine_mode
> >   leds: leds-lp55xx: Generalize sysfs engine_leds
> >   leds: leds-lp55xx: Generalize sysfs master_fader
> >   leds: leds-lp55xx: Support ENGINE program up to 128 bytes
> >   leds: leds-lp55xx: Drop deprecated defines
> >   leds: leds-lp5569: Add support for Texas Instruments LP5569
> > 
> >  .../devicetree/bindings/leds/leds-lp55xx.yaml |  11 +
> >  drivers/leds/Kconfig                          |  16 +-
> >  drivers/leds/Makefile                         |   1 +
> >  drivers/leds/leds-lp5521.c                    | 405 +---------
> >  drivers/leds/leds-lp5523.c                    | 734 ++---------------
> >  drivers/leds/leds-lp5562.c                    | 261 +-----
> >  drivers/leds/leds-lp5569.c                    | 544 +++++++++++++
> >  drivers/leds/leds-lp55xx-common.c             | 743 +++++++++++++++++-
> >  drivers/leds/leds-lp55xx-common.h             | 163 ++--
> >  drivers/leds/leds-lp8501.c                    | 313 +-------
> >  10 files changed, 1540 insertions(+), 1651 deletions(-)
> >  create mode 100644 drivers/leds/leds-lp5569.c
> 
> For whatever reason, this no longer applies.
> 
> Please rebase it on Linux -next or for-leds-next and resubmit.
>

Hi Lee.,

I just checked and yes there is to rebase the series due to
c0e3d2beeb03 ("leds: Drop explicit initialization of struct
i2c_device_id::driver_data to 0")

But I notice that something went bad in reverting some commits from the
v7 series and in for-leds-next there are still 3 commit to drop

mainly 
- 3bed6364ffd0057bd10c081d2e24aa7e8555e0a8
- 3bcc6d6ad7821aa459826592f830d76a3dc6f79f
- 5a402b40c651baf758ad884aed36c0ea70cd8b1e

I'm sending v8 with everything rebased but please keep in mind that
those commits needs to be reverted as the leds one also somehow got half
applied (no idea what happen)

-- 
	Ansuel

