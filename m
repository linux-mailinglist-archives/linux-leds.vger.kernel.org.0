Return-Path: <linux-leds+bounces-2154-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC74D918706
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 661C6289174
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E3918F2DD;
	Wed, 26 Jun 2024 16:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djufCClh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC1918F2D1;
	Wed, 26 Jun 2024 16:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719418268; cv=none; b=XSNYitEIHv35hcLpqzYaeG6x/p5rueeARTUn2DoU7mD9Ib4Y87iz9hkw5Z4AAklDYKd+7VTrdLQPHvbD56dVNdMK/JRymCSe2RvgL6TRh9t0/1fw7hWocdzntjJAdvQp8iIk5N1oE/0PMyoHR0VtUcLfn4bFCnbu9dIkQIU3K58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719418268; c=relaxed/simple;
	bh=XR7SYoNhkqHhd7Z5ATEMmRYYWe/VtYf+pVwA9DlsRMY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9KnKpOYDz2YSIcsjfpB4aqVQvxbSkAWdT77uIzbdoegyA+mWSeZmv/5yaZgjUvDuu3Eh1iaANngRmvcyb1AwBuh0F7AIAEGpm75FbTvJkS9vOkkyR/W3Ne2JWsVi4iCJxXIo6VhM9EYA1VRvWKk+3CMPgGPxCNsIC+mckP9uls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djufCClh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-424acfff613so11925565e9.0;
        Wed, 26 Jun 2024 09:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719418264; x=1720023064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sjRZYwFavIYWbYjzLahAAbqxJl7rknz5A6NG0Yl2g20=;
        b=djufCClh0V7shuyV23YPsXsCjVW9XIBm5VrRWoqJP2Hsy9BvrdSdFEg0Cd0cxquRzj
         kyJzGfyNFVuOuBJzSn2auB0I7Fw9rMrvFN6ph0G8BJrAITGhvLPFXnt2EwqPAksdI6fU
         FCqM708J5MJ6zMPOyfrZ0XXjDRHGSiwDCTImJqtGqG+RVnRe6AyrHCcxnMXJI3Q1Geu4
         2vkAF/cYhwxn/vYd4lxtzOJc6JFuF9PqjnE7DiUFVNxC7srDDRekwxmAxLIdkN/U3Cpz
         4stpNoEnIUlJ8swxxfJOCuv4IdSfD+EOPHGhl36QbO33LNXvkScDQMvPJ477iUgM8zT+
         /lrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719418264; x=1720023064;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjRZYwFavIYWbYjzLahAAbqxJl7rknz5A6NG0Yl2g20=;
        b=NtDdMEZojhF7YbNur9koac6yPPqmayQrh0NXoH/gQTRHYtK8i5CUuPLIlNjLxo08H/
         QllxjIqWhj9bQxFtRT2KThCE+HIcq20D6dO+zqSvYMEXPUf2gFQHGMGJRjjZXCUn/kuI
         W+OTqDIOXJW6RKlmVQaE8IjdldxrllYjptXp/Qda/i3Xw4Of6mdthsaP5U/GhTLFL6ym
         4An8P3qhMhmdA6tuJK/MzEvUPArzeqd65ZgHM0geVb9teN8+TF3jSWMw4BRnuI2X/rip
         734mN1vgskeJ4uy5DsglVmO4ZZR2n8WesA8zhrm5w0bRfOhetfQdHJG2PDTFPAZc8wpX
         FcgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfjGzEX73QoDqlfAfQMJmFRIQMMFRIdWZ9WvjdMNbEIznW/ohmhwAyUt5ORowZ8bXh0Nnjh4mac8nswxcWGtUP1hLRuJ/nWsPi17NyLemwBYD6tTCIdm2ULPAbigsdc40h3p23hiWNDsCfrPF7YXXpREI7mUVV8OxfkrvUgafWt58gKRs=
X-Gm-Message-State: AOJu0YzGWXwm+j/QgqVD97Ajm08G4EA70J2ylV3D3dn7taVcb7KlHPKN
	FgPfFCkxXY/RfWqbMfJOdaAhMfhybQD7Jd3TeB1ja9HSv/VZkqzMRC8BoA==
X-Google-Smtp-Source: AGHT+IE/8Z/7o0ZxzaOoP6F5WeGc+7czwjJsyh4NR3XAP7fy9BBieLnHsp2NiU6pcbIinPhglkjlCA==
X-Received: by 2002:a05:6000:1847:b0:366:eba0:8d8c with SMTP id ffacd0b85a97d-366eba08d93mr11309202f8f.54.1719418264359;
        Wed, 26 Jun 2024 09:11:04 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f693fsm16205254f8f.69.2024.06.26.09.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:11:03 -0700 (PDT)
Message-ID: <667c3d97.050a0220.bdb34.0813@mx.google.com>
X-Google-Original-Message-ID: <Znw9ncPJR8GX30Vi@Ansuel-XPS.>
Date: Wed, 26 Jun 2024 18:11:09 +0200
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
 <667c3a4a.5d0a0220.bf738.7cca@mx.google.com>
 <20240626160735.GA2532839@google.com>
 <20240626160926.GB2532839@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626160926.GB2532839@google.com>

On Wed, Jun 26, 2024 at 05:09:26PM +0100, Lee Jones wrote:
> On Wed, 26 Jun 2024, Lee Jones wrote:
> 
> > On Wed, 26 Jun 2024, Christian Marangi wrote:
> > 
> > > On Wed, Jun 26, 2024 at 04:42:55PM +0100, Lee Jones wrote:
> > > > On Thu, 20 Jun 2024, Christian Marangi wrote:
> > > > 
> > > > > This long series is (as requested) a big overhaul of the lp55xx based
> > > > > LED driver.
> > > > > 
> > > > > As notice for these kind of LED chip there was the bad habit of copy
> > > > > the old driver and just modify it enough to make it work with the new
> > > > > model. Till v4 I was also doing the same by following the pattern and
> > > > > the code format of previous driver.
> > > > > 
> > > > > Since Lee didn't like this, here is the BIG series that generalize
> > > > > pretty much anything in the 4 model currently supported.
> > > > > 
> > > > > Indeed, although the LED chip have fundamental difference (page
> > > > > support), things can be generalized and produce slimmer drivers by
> > > > > putting everything in the lp55xx-common shared module.
> > > > > 
> > > > > This result in the new model lp5569 being very small with only the
> > > > > selftest portion to be custom.
> > > > > 
> > > > > Lee also wasn't clear by the meaning of ENGINE in these LED driver,
> > > > > so here some simple explaination. This is very common on these TI LED
> > > > > chip. The ENGINE (there are always 3) is just some kind of processor
> > > > > that execute a program (precompiled code ASM like) loaded in the SRAM.
> > > > > Sysfs is used to load the pattern, and to start and stop the engine.
> > > > > 
> > > > > These pattern can do all kind of complex thing with LEDs. Old LED chip
> > > > > had 32bytes of space for the pattern but newer one (like lp5569) have
> > > > > pages and if correctly configured can have massive pattern.
> > > > > These pattern can do all kind of magic like loops that make the LED
> > > > > pulse, change color and all kind of stuff.
> > > > > 
> > > > > (For Lee, sorry if you will have to repeat some review that I might
> > > > >  have missed in the lp5569 driver)
> > > > > 
> > > > > Changes v7:
> > > > > - Add Suggested-by tag
> > > > > - Fix checkpatch error for complex macro (rework define)
> > > > > - Add missing values for fader conversion
> > > > > - Align some function with redundant new line
> > > > > - Capitalize every commit title
> > > > > Changes v6:
> > > > > - Fix compilation warning for ret unused in read_poll_timeout
> > > > >   (no idea why this is flagged only on some particular arch...)
> > > > > - Fix missing bitfield.h in lp55x-common.c (again it seems this
> > > > >   header gets included in the flow if the arch use them or not...)
> > > > > Changes v5:
> > > > > - Big generalization patch
> > > > > - Rework lp5569 driver with new generalized functions
> > > > > - Drop all copyright header in lp5569 as the driver got reworked
> > > > >   entirely and it's not based on previous one anymore.
> > > > > Changes v4:
> > > > > - Fix reported buffer overflow due to a copypaste error
> > > > > - Add comments to describe fw size logic
> > > > > Changes v3:
> > > > > - Add ACK tag to DT patch
> > > > > - Enlarge and support program size up to 128bytes
> > > > > Changes v2:
> > > > > - Add ACK tag to DT patch
> > > > > - Fix compilation error with target that doesn't
> > > > >   include bitfield.h
> > > > > 
> > > > > Christian Marangi (20):
> > > > >   dt-bindings: leds-lp55xx: Limit pwr-sel property to ti,lp8501
> > > > >   dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
> > > > >   leds: leds-lp55xx: Generalize stop_all_engine OP
> > > > >   leds: leds-lp55xx: Generalize probe/remove functions
> > > > >   leds: leds-lp55xx: Generalize load_engine function
> > > > >   leds: leds-lp55xx: Generalize load_engine_and_select_page function
> > > > >   leds: leds-lp55xx: Generalize run_engine function
> > > > >   leds: leds-lp55xx: Generalize update_program_memory function
> > > > >   leds: leds-lp55xx: Generalize firmware_loaded function
> > > > >   leds: leds-lp55xx: Generalize led_brightness function
> > > > >   leds: leds-lp55xx: Generalize multicolor_brightness function
> > > > >   leds: leds-lp55xx: Generalize set_led_current function
> > > > >   leds: leds-lp55xx: Generalize turn_off_channels function
> > > > >   leds: leds-lp55xx: Generalize stop_engine function
> > > > >   leds: leds-lp55xx: Generalize sysfs engine_load and engine_mode
> > > > >   leds: leds-lp55xx: Generalize sysfs engine_leds
> > > > >   leds: leds-lp55xx: Generalize sysfs master_fader
> > > > >   leds: leds-lp55xx: Support ENGINE program up to 128 bytes
> > > > >   leds: leds-lp55xx: Drop deprecated defines
> > > > >   leds: leds-lp5569: Add support for Texas Instruments LP5569
> > > > > 
> > > > >  .../devicetree/bindings/leds/leds-lp55xx.yaml |  11 +
> > > > >  drivers/leds/Kconfig                          |  16 +-
> > > > >  drivers/leds/Makefile                         |   1 +
> > > > >  drivers/leds/leds-lp5521.c                    | 405 +---------
> > > > >  drivers/leds/leds-lp5523.c                    | 734 ++---------------
> > > > >  drivers/leds/leds-lp5562.c                    | 261 +-----
> > > > >  drivers/leds/leds-lp5569.c                    | 544 +++++++++++++
> > > > >  drivers/leds/leds-lp55xx-common.c             | 743 +++++++++++++++++-
> > > > >  drivers/leds/leds-lp55xx-common.h             | 163 ++--
> > > > >  drivers/leds/leds-lp8501.c                    | 313 +-------
> > > > >  10 files changed, 1540 insertions(+), 1651 deletions(-)
> > > > >  create mode 100644 drivers/leds/leds-lp5569.c
> > > > 
> > > > For whatever reason, this no longer applies.
> > > > 
> > > > Please rebase it on Linux -next or for-leds-next and resubmit.
> > > >
> > > 
> > > Hi Lee.,
> > > 
> > > I just checked and yes there is to rebase the series due to
> > > c0e3d2beeb03 ("leds: Drop explicit initialization of struct
> > > i2c_device_id::driver_data to 0")
> > > 
> > > But I notice that something went bad in reverting some commits from the
> > > v7 series and in for-leds-next there are still 3 commit to drop
> > > 
> > > mainly 
> > > - 3bed6364ffd0057bd10c081d2e24aa7e8555e0a8
> > > - 3bcc6d6ad7821aa459826592f830d76a3dc6f79f
> > > - 5a402b40c651baf758ad884aed36c0ea70cd8b1e
> > > 
> > > I'm sending v8 with everything rebased but please keep in mind that
> > > those commits needs to be reverted as the leds one also somehow got half
> > > applied (no idea what happen)
> > 
> > This must be related to the tooling error that happened recently.
> > 
> > I have removed those 3 patches from the tree and re-pushed the branch.
> > 
> > If you need to rebase again for-leds-next is now up-to-date.
> 
> Okay v8 applied without issues.
> 
> Thank you.
>

Happy to have this finally merged and sorry for the big series and for
the mess.

Again thank to you for review and accept the changes!

-- 
	Ansuel

