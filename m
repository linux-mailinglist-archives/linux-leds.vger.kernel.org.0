Return-Path: <linux-leds+bounces-2124-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E9291861E
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 17:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A237A2834CC
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 15:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17BD18C35D;
	Wed, 26 Jun 2024 15:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tyY2b6VM"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B497F18C355;
	Wed, 26 Jun 2024 15:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719416580; cv=none; b=mzaB223W6xBj12urQlZswqdZCPE3TLWvEF2SfOXnYec1pkVBej12NzXnucY4HMmGwtu+vSmWyG/+m+dcKboDiN53qCLz6vQGA1CBKxzpHCpTe5MVio9tuipLH8mZQkqLLZvrOo/JhsHw7LoxO0iak+t5mP5RY0plDt3KSr16vT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719416580; c=relaxed/simple;
	bh=CpQt0/nezvz6yjM0TSMKFmO70MvqCYKmLYQM5eitJyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvO4ogr7MxY94zMgRVxsw8iLFzMpb/p+mVeQXQ9tKtTx2ypkzvoMZsyUR2+cReUBUkLyqtJwRuBFW1g9TGGv2UW+z5sNgsKNGoUw7a/OdUwvw66dkAxoncJI4u+r7oS297Ha2UHrEMngeaxJNiyeDSy1UsqmIKBp5Qa+dXmeCYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tyY2b6VM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63250C116B1;
	Wed, 26 Jun 2024 15:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719416580;
	bh=CpQt0/nezvz6yjM0TSMKFmO70MvqCYKmLYQM5eitJyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tyY2b6VM7D/S7eoBcyi4ksyFtbmenVsqVbtfVTpT4P/akkyBgCmLOq9ZWkz+xjmOz
	 h+Uy8a+uleRvUdsVGMQOC7Cl2beOd6ppt4PjhboxPh9bYyhlCrTKLH7Ixd5h/zQJJQ
	 C+zg3DUobDA0UfpDO/ieEB2DxiUNX8lHAoGEl40KeRTJa+86i0TG5yDD4wwlLjs4/2
	 Ma4dp3C8PGPrP5QD2eGNYiK/xag48BZNQb+zkcyxxC1rlKQb6s77TltgpyyzmKA8pQ
	 9V5WqN6chKG9h0W09nEF6kj5SH4I/9bdgwsqTwOd68lqBsn5VrTuLPwTcx77BN6wXy
	 wQdZ229zGihRg==
Date: Wed, 26 Jun 2024 16:42:55 +0100
From: Lee Jones <lee@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/20] leds: leds-lp55xx: overhaul driver
Message-ID: <20240626154255.GC2504017@google.com>
References: <20240620210401.22053-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620210401.22053-1-ansuelsmth@gmail.com>

On Thu, 20 Jun 2024, Christian Marangi wrote:

> This long series is (as requested) a big overhaul of the lp55xx based
> LED driver.
> 
> As notice for these kind of LED chip there was the bad habit of copy
> the old driver and just modify it enough to make it work with the new
> model. Till v4 I was also doing the same by following the pattern and
> the code format of previous driver.
> 
> Since Lee didn't like this, here is the BIG series that generalize
> pretty much anything in the 4 model currently supported.
> 
> Indeed, although the LED chip have fundamental difference (page
> support), things can be generalized and produce slimmer drivers by
> putting everything in the lp55xx-common shared module.
> 
> This result in the new model lp5569 being very small with only the
> selftest portion to be custom.
> 
> Lee also wasn't clear by the meaning of ENGINE in these LED driver,
> so here some simple explaination. This is very common on these TI LED
> chip. The ENGINE (there are always 3) is just some kind of processor
> that execute a program (precompiled code ASM like) loaded in the SRAM.
> Sysfs is used to load the pattern, and to start and stop the engine.
> 
> These pattern can do all kind of complex thing with LEDs. Old LED chip
> had 32bytes of space for the pattern but newer one (like lp5569) have
> pages and if correctly configured can have massive pattern.
> These pattern can do all kind of magic like loops that make the LED
> pulse, change color and all kind of stuff.
> 
> (For Lee, sorry if you will have to repeat some review that I might
>  have missed in the lp5569 driver)
> 
> Changes v7:
> - Add Suggested-by tag
> - Fix checkpatch error for complex macro (rework define)
> - Add missing values for fader conversion
> - Align some function with redundant new line
> - Capitalize every commit title
> Changes v6:
> - Fix compilation warning for ret unused in read_poll_timeout
>   (no idea why this is flagged only on some particular arch...)
> - Fix missing bitfield.h in lp55x-common.c (again it seems this
>   header gets included in the flow if the arch use them or not...)
> Changes v5:
> - Big generalization patch
> - Rework lp5569 driver with new generalized functions
> - Drop all copyright header in lp5569 as the driver got reworked
>   entirely and it's not based on previous one anymore.
> Changes v4:
> - Fix reported buffer overflow due to a copypaste error
> - Add comments to describe fw size logic
> Changes v3:
> - Add ACK tag to DT patch
> - Enlarge and support program size up to 128bytes
> Changes v2:
> - Add ACK tag to DT patch
> - Fix compilation error with target that doesn't
>   include bitfield.h
> 
> Christian Marangi (20):
>   dt-bindings: leds-lp55xx: Limit pwr-sel property to ti,lp8501
>   dt-bindings: leds-lp55xx: Add new ti,lp5569 compatible
>   leds: leds-lp55xx: Generalize stop_all_engine OP
>   leds: leds-lp55xx: Generalize probe/remove functions
>   leds: leds-lp55xx: Generalize load_engine function
>   leds: leds-lp55xx: Generalize load_engine_and_select_page function
>   leds: leds-lp55xx: Generalize run_engine function
>   leds: leds-lp55xx: Generalize update_program_memory function
>   leds: leds-lp55xx: Generalize firmware_loaded function
>   leds: leds-lp55xx: Generalize led_brightness function
>   leds: leds-lp55xx: Generalize multicolor_brightness function
>   leds: leds-lp55xx: Generalize set_led_current function
>   leds: leds-lp55xx: Generalize turn_off_channels function
>   leds: leds-lp55xx: Generalize stop_engine function
>   leds: leds-lp55xx: Generalize sysfs engine_load and engine_mode
>   leds: leds-lp55xx: Generalize sysfs engine_leds
>   leds: leds-lp55xx: Generalize sysfs master_fader
>   leds: leds-lp55xx: Support ENGINE program up to 128 bytes
>   leds: leds-lp55xx: Drop deprecated defines
>   leds: leds-lp5569: Add support for Texas Instruments LP5569
> 
>  .../devicetree/bindings/leds/leds-lp55xx.yaml |  11 +
>  drivers/leds/Kconfig                          |  16 +-
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/leds-lp5521.c                    | 405 +---------
>  drivers/leds/leds-lp5523.c                    | 734 ++---------------
>  drivers/leds/leds-lp5562.c                    | 261 +-----
>  drivers/leds/leds-lp5569.c                    | 544 +++++++++++++
>  drivers/leds/leds-lp55xx-common.c             | 743 +++++++++++++++++-
>  drivers/leds/leds-lp55xx-common.h             | 163 ++--
>  drivers/leds/leds-lp8501.c                    | 313 +-------
>  10 files changed, 1540 insertions(+), 1651 deletions(-)
>  create mode 100644 drivers/leds/leds-lp5569.c

For whatever reason, this no longer applies.

Please rebase it on Linux -next or for-leds-next and resubmit.

-- 
Lee Jones [李琼斯]

