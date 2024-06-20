Return-Path: <linux-leds+bounces-2063-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3BB910BB1
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 18:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACDD81C22FA8
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 16:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57EB1AF6A3;
	Thu, 20 Jun 2024 16:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rkscq9RF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6611CD3D;
	Thu, 20 Jun 2024 16:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718900130; cv=none; b=lwPuU1YdtweQs/hEgpuypQol/udHnF/Mf1gKmcxg9ULJcmyZSXP3Bj4rAjKdG28hu8E1KOXphKGySWGBmrqCAHJV8BZrOh4mqOoE66N3xeXhdY+mcZ4XJ/20kWcLX+gGjin2xIXAMIfzTjZVl0eZoLUR0/xEQYjfNW6SZhLka/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718900130; c=relaxed/simple;
	bh=iblHSi10AuILwtDWFYWrNs420fLs8WQLdO1dzegU+mo=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAW7w1ENINCCtMpXoCcGopCF/C3iouL5m/CutkaHip2kveT//D1mZFbfiJCuQovWfznbC/eIw8D5zSM9CvkyRhUnqFKQF1TPKO6BPUFKDHBwyCXHmU+Gu7ukcCRjBDNGrsE8+6t0NbvhLfeufCkvyrvrbxYSBf9egNwipb9pqK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rkscq9RF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42121d27861so10849425e9.0;
        Thu, 20 Jun 2024 09:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718900127; x=1719504927; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BstTnchL1g9WNRv1yB6FmVexKMDI5/7ZXs3DFkUlV0E=;
        b=Rkscq9RFNY4H1IZ7DPejsdIf3HO0DWQ8pHm8oI6EJFGONyLQQPeEN6o4lzZwjx/aHJ
         7Las/rIgwOGnwufDO/s4JZcxncVm6Y1ExzU0kcqExmP2uxkAxTM71f0b61S8Xi3CMZ3F
         UKldZxEhvKELx/dfAwxTXcnU0IkLP9/Jy86OhkxlqUgwytZZwCgE5LKv0cbCP2XKMInl
         tua/2Q0IkkkcUEDDsL1E3D5V/+gt3LESmLqv2D3EWg/8meXi/JfcIDqgQ1bxnbkCUyQ/
         LsGeYzbiWpBtNi+l8yIBJH38x80B/b9d20P2l3LxB+SNUL7o4KuFEUBfgP8+s1T3kbDv
         PvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718900127; x=1719504927;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BstTnchL1g9WNRv1yB6FmVexKMDI5/7ZXs3DFkUlV0E=;
        b=kbqR1URhvret1N7a1g+Khz7k5kwefrNb1lhKEoZDeXZXTtXUTWyHC9Dl8JmH3UOg4y
         0UO7cRJ8wLnz/Xb2Jf27SWFKyz4GQtvYpdK1UiOHtl5hg97YFjpFuJWq4SAqUGHb4iDa
         bbPzseXQ5gkPCNEX7SsmP/lhYrEo6D9OJSPjyaB8bDRc/XRM3I94MUt/PdtAfjH1ty/r
         zICkxEeNj8re/uoujxsUdUJV0WTjvB9Sqq0GSPs6ykTaxG0rbqyRsGh6+UDD19hFpQX1
         y+x6fEtKiwnT5Mx81TbOrcX1sxGdMsjzCu1VtQnhUBekoas0Lyqo2PTaCNJhd7PIW2g5
         2BCw==
X-Forwarded-Encrypted: i=1; AJvYcCVNpC3Is+oshgKiSu7MW2dqkan0FV8uWIqkJsaoG6cQOJyZpnEY0vxHctOgzIzCkhlCFynEGPAWsS1nOAr3fiIDP9Ynd97gUa6+MZ4Wy7K+FQkTQF84teK/FNMQMxHCT526DpXhXQZm/XlNlbnNKEM3hx8823L5wCG+Fl5RqAsD1zcINkY=
X-Gm-Message-State: AOJu0YwU2sbvOFJ9AfvlAUOCF7jujs+lTfhQUUe0d7p0TtbwnADxCzwt
	ZZHSVd4xOMuCKQloYs9CLYYU7eY8zSv8ygx0p0BbEzIjINpbDzlC
X-Google-Smtp-Source: AGHT+IHotOeTmi3cx/hKnhyyOXPzVz9w8/VmYgvuqZQkugAEyPeKDfhQGXLD4K9BaiGXtaQxTTH11A==
X-Received: by 2002:a05:600c:314b:b0:421:7fe5:12a with SMTP id 5b1f17b1804b1-4247529a9c1mr49600905e9.35.1718900126775;
        Thu, 20 Jun 2024 09:15:26 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d1f6dbasm29676695e9.43.2024.06.20.09.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 09:15:26 -0700 (PDT)
Message-ID: <6674559e.050a0220.14848.cb8f@mx.google.com>
X-Google-Original-Message-ID: <ZnRHm5eF6P2VCoiz@Ansuel-XPS.>
Date: Thu, 20 Jun 2024 17:15:39 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/20] leds: leds-lp55xx: overhaul driver
References: <20240616215226.2112-1-ansuelsmth@gmail.com>
 <20240620160907.GP3029315@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620160907.GP3029315@google.com>

On Thu, Jun 20, 2024 at 05:09:07PM +0100, Lee Jones wrote:
> On Sun, 16 Jun 2024, Christian Marangi wrote:
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
> >   dt-bindings: leds-lp55xx: limit pwr-sel property to ti,lp8501
> >   dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
> >   leds: leds-lp55xx: generalize stop_all_engine OP
> >   leds: leds-lp55xx: generalize probe/remove functions
> >   leds: leds-lp55xx: generalize load_engine function
> >   leds: leds-lp55xx: generalize load_engine_and_select_page function
> >   leds: leds-lp55xx: generalize run_engine function
> >   leds: leds-lp55xx: generalize update_program_memory function
> >   leds: leds-lp55xx: generalize firmware_loaded function
> >   leds: leds-lp55xx: generalize led_brightness function
> >   leds: leds-lp55xx: generalize multicolor_brightness function
> >   leds: leds-lp55xx: generalize set_led_current function
> >   leds: leds-lp55xx: generalize turn_off_channels function
> >   leds: leds-lp55xx: generalize stop_engine function
> >   leds: leds-lp55xx: generalize sysfs engine_load and engine_mode
> >   leds: leds-lp55xx: generalize sysfs engine_leds
> >   leds: leds-lp55xx: generalize sysfs master_fader
> >   leds: leds-lp55xx: support ENGINE program up to 128 bytes
> >   leds: leds-lp55xx: drop deprecated defines
> >   leds: leds-lp5569: Add support for Texas Instruments LP5569
> > 
> >  .../devicetree/bindings/leds/leds-lp55xx.yaml |  11 +
> >  drivers/leds/Kconfig                          |  16 +-
> >  drivers/leds/Makefile                         |   1 +
> >  drivers/leds/leds-lp5521.c                    | 405 +---------
> >  drivers/leds/leds-lp5523.c                    | 728 ++---------------
> >  drivers/leds/leds-lp5562.c                    | 261 +------
> >  drivers/leds/leds-lp5569.c                    | 542 +++++++++++++
> >  drivers/leds/leds-lp55xx-common.c             | 730 +++++++++++++++++-
> >  drivers/leds/leds-lp55xx-common.h             | 133 +++-
> >  drivers/leds/leds-lp8501.c                    | 313 +-------
> >  10 files changed, 1523 insertions(+), 1617 deletions(-)
> >  create mode 100644 drivers/leds/leds-lp5569.c
> 
> Generally, I love it - what a difference!
> 
> Couple of small things within the patches and few general points.
> 
> * Ensure scripts/checkpatch.pl is happy before resubmitting.

Eh I always run patch with checkpatch.pl --strict but this time is quite
problematic to fix the single error for the complex macro.

I will check what I can do but I think I'm really stretching the C
precompiler there... That is really one of the very few case where error
might be acceptable.

If I manage to mute that error, it might result in very bad code...

If you are referring to other warning and check just tell me.

> * Please place my Suggested-by in all of the consolidation patches.

Ok will add the suggested in all the generalization patch

> * Subject titles should always match that of the subsystem
>   - In our case the first letter of the description should be uppercase

Ok missed that.

> 
> Thanks for doing this, it's great work.
> 
> -- 
> Lee Jones [李琼斯]

-- 
	Ansuel

