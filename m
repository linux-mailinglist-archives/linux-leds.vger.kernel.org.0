Return-Path: <linux-leds+bounces-3531-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 862669E8E99
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 10:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65BBF18816C9
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 09:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C22F215F4F;
	Mon,  9 Dec 2024 09:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzrHPMOX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DD51EB3D;
	Mon,  9 Dec 2024 09:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733736142; cv=none; b=kmKXbBaOuFhekRdC6G/OAs5BDIsSaDJzcUUSxKl+csuqMXfz84jk1tTSrV7DKq6nuGAluVKfd/QIU/WsJuBgUXmKZWgSGCSaXmw/AW7iQOk2KfWQJS6OMNRA9XEzJWrQnoRMFdlUHvp+jaCWl/sY7qOMUFUOGAPx66jiAA2nvmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733736142; c=relaxed/simple;
	bh=y4qWf57LvAAFe4m8BlvFFvxUPawjnJVFQg2SuHEoOW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVy65zDk/YxY8TRPYpUOfVSCB3950GO1MDXy0wBulpQSf+HvprYxnZEx6SESBleAnc0J9FZp4LRzbdniDZNtGFVBzS6g+mafNPibKi7Pgj7NTpO0BlbQWF5rajz8EE/upSpTgu/xMfytcWynAZwwMTsJDOVLB09gCD9IyTNbcdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzrHPMOX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266EFC4CED1;
	Mon,  9 Dec 2024 09:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733736141;
	bh=y4qWf57LvAAFe4m8BlvFFvxUPawjnJVFQg2SuHEoOW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RzrHPMOXfNrjB31QWk35WWoGqza4GiNx+L0Ce7gAja7Eh2TKu4l1uswCzkxeXC7km
	 s2dw/bIeFqhNiH4U49DA8xVxl7VQFtRz5pk09r70MDqPMq3zQaTdkM8/wWdtOLolFj
	 DpOuZdigVGk0DSkTRtt84dTdpZgFgQYCMpsM8df/7nClaHzI62T9tL+WbQTrISifn6
	 WwDDJCJoLPgOJCJfZxzZLduJ3mhUZ8KNdau4vVwXoANGm5pl7o3SgzTPJAjATPBVJv
	 HYDgzfxzt9qUaP6gfsbC30Zb8x+O6A/AmTOjf8PIHDTTbEvJCPPus6sUV/8GX2Hjx1
	 cXi1QIf+jVYlA==
Date: Mon, 9 Dec 2024 10:22:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>,
	y@krzk-bin.smtp.subspace.kernel.org
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Message-ID: <bqn4tddl3kgle7zlamgaqlh45pizw6gf5qjwlmcsbkb6fx343l@tf5w63xursi2>
References: <20241207130433.30351-1-towinchenmi@gmail.com>
 <20241207130433.30351-3-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241207130433.30351-3-towinchenmi@gmail.com>

On Sat, Dec 07, 2024 at 09:03:15PM +0800, Nick Chan wrote:
> Add driver for backlight controllers attached via Apple DWI 2-wire
> interface, which is found on some Apple iPhones, iPads and iPod touches
> with a LCD display.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  drivers/video/backlight/Kconfig  |  12 +++
>  drivers/video/backlight/Makefile |   1 +
>  drivers/video/backlight/dwi_bl.c | 124 +++++++++++++++++++++++++++++++
>  3 files changed, 137 insertions(+)
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

Mixed/messed indentation. Some spaces?

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

Please do not introduce other sorting way - it is sorted by config name.
Which will also point you to apple_bl.o and need of explaining the
differences, e.g. why this cannot be one driver.


>  obj-$(CONFIG_BACKLIGHT_EP93XX)		+= ep93xx_bl.o
>  obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
>  obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
> diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
> new file mode 100644
> index 000000000000..d4bfd74b3129
> --- /dev/null
> +++ b/drivers/video/backlight/dwi_bl.c
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Driver for backlight controllers attached via Apple DWI 2-wire interface
> + *
> + * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/backlight.h>
> +
> +#define DWI_BL_CTL			0x0
> +#define DWI_BL_CTL_SEND1		BIT(0)
> +#define DWI_BL_CTL_SEND2		BIT(4)
> +#define DWI_BL_CTL_SEND3		BIT(5)
> +#define DWI_BL_CTL_LE_DATA		BIT(6)
> +/* Only used on Apple A9 and later */
> +#define DWI_BL_CTL_SEND4		BIT(12)
> +
> +#define DWI_BL_CMD			0x4
> +#define DWI_BL_CMD_TYPE			GENMASK(31, 28)
> +#define DWI_BL_CMD_TYPE_SET_BRIGHTNESS	0xa
> +#define DWI_BL_CMD_DATA			GENMASK(10, 0)
> +
> +#define DWI_BL_CTL_SEND			(DWI_BL_CTL_SEND1 | \
> +					 DWI_BL_CTL_SEND2 | \
> +					 DWI_BL_CTL_SEND3 | \
> +					 DWI_BL_CTL_LE_DATA | \
> +					 DWI_BL_CTL_SEND4)
> +
> +#define DWI_BL_MAX_BRIGHTNESS		2047
> +
> +struct apple_dwi_bl {
> +	void __iomem *base;
> +};
> +
> +static int dwi_bl_update_status(struct backlight_device *bl)
> +{
> +	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
> +
> +	int brightness = backlight_get_brightness(bl);
> +
> +	u32 cmd = 0;
> +
> +	cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
> +	cmd |= FIELD_PREP(DWI_BL_CMD_TYPE, DWI_BL_CMD_TYPE_SET_BRIGHTNESS);
> +
> +	writel(cmd, dwi_bl->base + DWI_BL_CMD);
> +	writel(DWI_BL_CTL_SEND, dwi_bl->base + DWI_BL_CTL);
> +
> +	return 0;
> +}
> +
> +static int dwi_bl_get_brightness(struct backlight_device *bl)
> +{
> +	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
> +
> +	u32 cmd = readl(dwi_bl->base + DWI_BL_CMD);
> +
> +	return FIELD_GET(DWI_BL_CMD_DATA, cmd);
> +}
> +
> +static const struct backlight_ops dwi_bl_ops = {
> +	.options = BL_CORE_SUSPENDRESUME,
> +	.get_brightness = dwi_bl_get_brightness,
> +	.update_status	= dwi_bl_update_status
> +};
> +
> +static int dwi_bl_probe(struct platform_device *dev)
> +{
> +	struct apple_dwi_bl *dwi_bl;
> +	struct backlight_device *bl;
> +	struct backlight_properties props;
> +	struct resource *res;
> +
> +	dwi_bl = devm_kzalloc(&dev->dev, sizeof(struct apple_dwi_bl), GFP_KERNEL);

sizeof(*)

> +	if (!dwi_bl)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENXIO;
> +
> +	dwi_bl->base = devm_ioremap_resource(&dev->dev, res);

Use helper for these two, devm_platform_get_and_ioremap_resource() or
similar.

Best regards,
Krzysztof


