Return-Path: <linux-leds+bounces-3978-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EF5A34FF3
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 21:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 249EB16BC8D
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 20:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09F524BC18;
	Thu, 13 Feb 2025 20:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rOQzpPjr"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A2320766C;
	Thu, 13 Feb 2025 20:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739479879; cv=none; b=TxEeD1CNzS5Q3vOL8gjNwjn0+wHRHQETfW43DJ0+OBw5yFilxD1qdWHHP3HHgWflqs9R/GSI4j0e1rtZYL8Tg4/vq7zqwkW9OSfP/5rTzl/toSzIrOsCjslomai4kF2pyqDKfMtW6/uaG3pnjFoxAp7EwWBPJrfu8njFLHl8xEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739479879; c=relaxed/simple;
	bh=512cv4Hj1Kz9k8u6r5KTAHRKubmEdQ2373KIf+8y/nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zi/tShUgRT+F4gfD8pV+Uqrh6niTcM17Q9cfPUOAvyB+fWWgLF7QCAYUUIkkcBKFOfxMMGN9g527R3OZU1SoLFdK/tDISUIR3a7i+09ZzuAs0dOU+2tqQQYRVq97HoxzE39VQt+4fQzQvYoAzD5gxGqXkTLryZC+PLcW67C1FCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rOQzpPjr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED96C4CED1;
	Thu, 13 Feb 2025 20:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739479879;
	bh=512cv4Hj1Kz9k8u6r5KTAHRKubmEdQ2373KIf+8y/nQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rOQzpPjrf+SK50+lfxnvf1j6ydyFhRq+h3/1SS37zqLNdyguRVlBObbP1/wRV0at/
	 +cca9LNWhv8GMr4NpXlWyHwjN2EsM3Zze84WS+MnVfh5DDswhAOygzmSDUKi4RNEMw
	 W9XTcRCyXaqAiS0YlOjJ93ByT9I6kNGLTbYgKNCFtL2uFjH6E3cpzuaQHLZrq5Fh43
	 meI4vmlfv8CvQzjCMKOzSD9/HcXIvAWoRS+Zs0aZLI5YIsWmaBcg8f/mx+LgeXocUJ
	 GwMtsdYdGuWko8E5Vr4XkKGEcj8pddoYRhOHKbgd6vfPEcY5H+KykSlOKqAoh7HEqH
	 nTNI4vN7xs7jQ==
Date: Thu, 13 Feb 2025 20:51:13 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v5 RESEND 2/3] backlight: apple_dwi_bl: Add Apple DWI
 backlight driver
Message-ID: <Z65bQeITMp1mpHp8@aspen.lan>
References: <20250203115156.28174-1-towinchenmi@gmail.com>
 <20250203115156.28174-3-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203115156.28174-3-towinchenmi@gmail.com>

On Mon, Feb 03, 2025 at 07:50:33PM +0800, Nick Chan wrote:
> Add driver for backlight controllers attached via Apple DWI 2-wire
> interface, which is found on some Apple iPhones, iPads and iPod touches
> with a LCD display.
>
> Although there is an existing apple_bl driver, it is for backlight
> controllers on Intel Macs attached via PCI, which is completely different
> from the Samsung-derived DWI block.
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  drivers/video/backlight/Kconfig        |  12 +++
>  drivers/video/backlight/Makefile       |   1 +
>  drivers/video/backlight/apple_dwi_bl.c | 123 +++++++++++++++++++++++++
>  3 files changed, 136 insertions(+)
>  create mode 100644 drivers/video/backlight/apple_dwi_bl.c
>
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 3614a5d29c71..c6168727900a 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -290,6 +290,18 @@ config BACKLIGHT_APPLE
>  	  If you have an Intel-based Apple say Y to enable a driver for its
>  	  backlight.
>
> +config BACKLIGHT_APPLE_DWI
> +	tristate "Apple DWI 2-Wire Interface Backlight Driver"
> +	depends on ARCH_APPLE || COMPILE_TEST
> +	default y

Sorry to pick this up late and on a resend but... I can't come up with
any justification for "default y" in this driver.

Other than that this is a really tidy driver so with that changed please
add:
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

