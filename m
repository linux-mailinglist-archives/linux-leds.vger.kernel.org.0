Return-Path: <linux-leds+bounces-3556-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1359EAABD
	for <lists+linux-leds@lfdr.de>; Tue, 10 Dec 2024 09:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE3C2188AA39
	for <lists+linux-leds@lfdr.de>; Tue, 10 Dec 2024 08:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88183230D10;
	Tue, 10 Dec 2024 08:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkIaCSTG"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD11230982;
	Tue, 10 Dec 2024 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733819541; cv=none; b=MfZZm4N+ASZOUXvjfD2XgyB/ouazgJ1FDhcv2Ej1Pvg2TkaNZ/7L51BoQVDCivZte+rKotEpFIqHEtY3z+WSw0+bHQBS4zjd/oS//NHuMJoSsv08fvP7hj2BMv6Fh3UPheEBejOJaKCZ4zvHE5fv4YNKyN6EKxkca39GL8A1YfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733819541; c=relaxed/simple;
	bh=vMDpWY8p1Mqt7CgYt7jryIgWQ2wJWWPZrL2HtUX3z2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8l7FOLbvrD++EHSG9XBwzLckoYfnjyEoFlL5zDJN9oBdu4zJ8tEHIfTjTlOfqKUFo+hAH6XGfcPx5Ds6M8JbRB+cRDUvkpLGq9noylW4eqCLVmPdVXqOqWeepySUW+DohKvV8FEOS6N64O8cVB2udx8d/ItJSeEsAXq8RE4haA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkIaCSTG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B399C4CED6;
	Tue, 10 Dec 2024 08:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733819538;
	bh=vMDpWY8p1Mqt7CgYt7jryIgWQ2wJWWPZrL2HtUX3z2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lkIaCSTGYzo4zU95T5u+1DqU8HhBs53wnUxKl5n9cSwEPeuxdcjlvJI1sCYKGBXJd
	 v61HLwDBs1fbBsowu9sMe8o1QTXCHX8cm1N8GvJE4gsLEewzBH43uil/aziCkVXaxz
	 3yl/M2l9dJvVhZG8tOPBbWc9om0xtmE2LtGFvn3oceS0YtqMDRRxPetRAGoHs/gAKQ
	 5IvAEZBzFoJqNY+f8vGN+cl/UrMxXO8cALywzuBjfINN39BkvZnv7Xz/J4BF8/M4ek
	 7fle9PAGaBe4lvN9xmXJFKWQjmCf1masNH/wOMGDlAnVeCuVw54Bj1wajCyGCvIXUS
	 6nXp4psFP6BbQ==
Date: Tue, 10 Dec 2024 09:32:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Message-ID: <w5niokvjfwajnzz3muccb45jsvqzg7lql7g5tg5s6iat3mtqkk@qu2a5zcp3rs7>
References: <20241209075908.140014-1-towinchenmi@gmail.com>
 <20241209075908.140014-3-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241209075908.140014-3-towinchenmi@gmail.com>

On Mon, Dec 09, 2024 at 03:58:34PM +0800, Nick Chan wrote:
> Add driver for backlight controllers attached via Apple DWI 2-wire
> interface, which is found on some Apple iPhones, iPads and iPod touches
> with a LCD display.
> 

Nothing improved here.

> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  drivers/video/backlight/Kconfig  |  12 +++
>  drivers/video/backlight/Makefile |   1 +
>  drivers/video/backlight/dwi_bl.c | 126 +++++++++++++++++++++++++++++++
>  3 files changed, 139 insertions(+)
>  create mode 100644 drivers/video/backlight/dwi_bl.c
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 3614a5d29c71..e64cc3d51ac5 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -166,6 +166,18 @@ config BACKLIGHT_EP93XX
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called ep93xx_bl.
>  
> +config BACKLIGHT_APPLE_DWI
> +	tristate "Apple DWI 2-Wire Interface Backlight Driver"
> +	depends on ARCH_APPLE || COMPILE_TEST
> +	default y
> +	help
> +          Say Y to enable the backlight driver for backlight controllers
> +          attached via the Apple DWI 2-wire interface which is found in some
> +          Apple iPhones, iPads and iPod touches.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called dwi_bl.
> +
>  config BACKLIGHT_IPAQ_MICRO
>  	tristate "iPAQ microcontroller backlight driver"
>  	depends on MFD_IPAQ_MICRO
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index 8fc98f760a8a..0a569d7f0210 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
>  obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
>  obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
>  obj-$(CONFIG_BACKLIGHT_DA9052)		+= da9052_bl.o
> +obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= dwi_bl.o

Nothing improved here.

Best regards,
Krzysztof


