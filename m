Return-Path: <linux-leds+bounces-2418-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5962294AF9D
	for <lists+linux-leds@lfdr.de>; Wed,  7 Aug 2024 20:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6AC5B259F7
	for <lists+linux-leds@lfdr.de>; Wed,  7 Aug 2024 18:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5702F535D4;
	Wed,  7 Aug 2024 18:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VlkB8rQb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF966F30B;
	Wed,  7 Aug 2024 18:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723055044; cv=none; b=G5WSSzkff+NaMWiZZESD3I7GNgGdG9PSKaeJ2EYpAU+QackjvuRme9AVg6Fve3m0ny5TMNPi+F9FwJuYryGopX53AcZ6LvdBhg/JeklafDy1TKM4r5b7Oq5VPpBdJGyeq/zXy3y1+rGuBErPaq81mxtKQ/p/EbAL86a7nwkOmaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723055044; c=relaxed/simple;
	bh=Jk9pxI/6HuOUteaoSMwb9uGlyFSlPinlGUcnnyRuWzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NdDUuVZ8BrfCgAQ8s0WzHZDc6ASVU56DYjMQ2Mei7Daa3YwURppyyx6twTKrV16VMEFXV+K1QohnQfaUtRgdArlDFs3H/UBx93efw+r+m0PTHt9rCyE6uSe3PiARFUFcxDtH154eyRNh5T7c6Ta6yJDqgzH/KPHTh3GC4DIwT5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VlkB8rQb; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4WfJH440Kpz9sys;
	Wed,  7 Aug 2024 20:14:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1723054480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7mSsGllVs5ehpw0hucYxsiuO4/Qnn03cmHd4Fnmz4Zg=;
	b=VlkB8rQbY2O0fevsBNB6nKHk7JGMpMoBz8TswzLzck88xfbnsak2zHlzt+0zeEv3mz5ozw
	smNAewB+QD+dsOuuvNGWAMES3GZCwJU5gz+yBV2hoDefXBJ0s9Dv/HUnM9MGXUFhUkcrRx
	OJwKC6qJrSw1BXzJTyuH3bXdWWiwLDne4bpnVorQs9lfXG0OjTp5JNznDvpaw1rd071UqR
	RXt6tXq74cRWape4xd53PALDIOrHHgC/44YVRJiMbt50dJKjZJYTlSqwvUQcH/iSXVP5DY
	/Ll3EbiKnux+JOycTcv9WQ3b8Wys/EItvedJZxHvKuqhADU3UW5CzNXcyO++5g==
Date: Wed, 7 Aug 2024 13:14:34 -0500
From: Joseph Strauss <jstrauss@mailbox.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: pavel@ucw.cz, lee@kernel.org, andriy.shevchenko@linux.intel.com,
	jernej.skrabec@gmail.com, duje.mihanovic@skole.hr,
	linux@weissschuh.net, ansuelsmth@gmail.com,
	patrick.rudolph@9elements.com, gnstark@salutedevices.com,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: blinkm: fix CONFIG_LEDS_CLASS_MULTICOLOR dependency
Message-ID: <20240807181434.qzzydzc4xkckw4vf@libretux>
References: <20240807075614.2118068-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807075614.2118068-1-arnd@kernel.org>
X-MBO-RS-META: cuwt6xgwg467diggpm9q4duyxbeqx3qu
X-MBO-RS-ID: cd8ec5e281628e23590

On 24/08/07 09:55AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With CONFIG_LEDS_CLASS_MULTICOLOR=m, a builtin leds-blinkm driver causes
> a link failure:
> 
> arm-linux-gnueabi-ld: drivers/leds/leds-blinkm.o: in function `blinkm_set_mc_brightness':
> leds-blinkm.c:(.text.blinkm_set_mc_brightness+0xc): undefined reference to `led_mc_calc_color_components'
> 
> Add a more specific dependency that only allows multicoler mode to
> be enabled for blinkm if it can build and link.
> 
> Fixes: 56e8c56c9af0 ("leds: Add multicolor support to BlinkM LED driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/leds/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 41214c9b93ba..818c8bdd047e 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -838,7 +838,7 @@ config LEDS_BLINKM
>  config LEDS_BLINKM_MULTICOLOR
>  	bool "Enable multicolor support for BlinkM I2C RGB LED"
>  	depends on LEDS_BLINKM
> -	depends on LEDS_CLASS_MULTICOLOR
> +	depends on LEDS_CLASS_MULTICOLOR=y || LEDS_CLASS_MULTICOLOR=LEDS_BLINKM
>  	help
>  	  This option enables multicolor sysfs class support for BlinkM LED and
>  	  disables the older, separated sysfs interface
> -- 
> 2.39.2
> 
Hi,

I was able to reproduce the issue and the fix works. Thank you!

Acked-by: Joseph Strauss <jstrauss@mailbox.org>

