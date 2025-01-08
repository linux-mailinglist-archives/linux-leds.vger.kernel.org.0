Return-Path: <linux-leds+bounces-3720-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA4FA058BA
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jan 2025 11:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 331CA164059
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jan 2025 10:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854C61F868E;
	Wed,  8 Jan 2025 10:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPyZgo07"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A041A0BF8;
	Wed,  8 Jan 2025 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736333565; cv=none; b=aszW+ka15yVNVaCc8x8TscOcDlbRbFW7Kbc3L8BYmEryLMDBXtVTzPVqdtkA70xBtqxDfWpTPjEvEERB3SYppyrYwLRrA3tC5DG+F/Cfp7XaUwc98+oH0LxmhBB49Dq6y9XH49X1+sPnBHQwoEoOUoTFvtsnDbYAo7fgoeVlIfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736333565; c=relaxed/simple;
	bh=BUkcEIZO72zG0bmSzzrHuBtmboN5338uqDoQVUVBraU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/C8Q29EH+bZE2LbYZXAG699HHgij/bnJ8p9KS6uw4eqnr87uLRstewRgNnB3d37HHBNpzZ91aZp3r+3Q0mUWGRQALeF2n0ReIZvBEpwc561Ky9+7Lh7gt3Sj2DwyximepgNCfiSRIl1W66B1yMGaoJcy4XXwqomXq9e7GPAegI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPyZgo07; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61BD8C4CEDD;
	Wed,  8 Jan 2025 10:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736333564;
	bh=BUkcEIZO72zG0bmSzzrHuBtmboN5338uqDoQVUVBraU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPyZgo075e0ivgTjrIrZ1ezJszqrsrblWv3plRZKkE7lDx5MBcl6MxAlahkjMIsFN
	 BZQdSDHwj/yC1EKNXJhsqVGT978YcXPP0IJ5UlgxsTSm28EgPXjEKQv68E6R78SOVc
	 5izTa3NcOTbULgiLpQXfBqMbOTYiw1nhQw+XpfO92YbBHsqubxE1GEppQ1yJiWACCd
	 GSHsQ+P47ZH3cMpBRMFrwjDg1O9+Y2XCtri32i3MEsjBJYHlk6bhasiKf1h/VytRra
	 KOSBaY6mWyPa6ptojEl/+dolGsARtVPVcvPjWp49IG7HnRBTdUOx43gTcDcA8NIgl4
	 RGG7hTZqWBRzg==
Date: Wed, 8 Jan 2025 10:52:38 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Message-ID: <Z35Y9rzS6tLVgsRo@aspen.lan>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
 <20241211113512.19009-3-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211113512.19009-3-towinchenmi@gmail.com>

On Wed, Dec 11, 2024 at 07:34:38PM +0800, Nick Chan wrote:
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
>  drivers/video/backlight/Kconfig  |  12 +++
>  drivers/video/backlight/Makefile |   1 +
>  drivers/video/backlight/dwi_bl.c | 122 +++++++++++++++++++++++++++++++

I'd rather this was called apple_dwi_bl.c to match that config options,
etc.

> diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
> new file mode 100644
> index 000000000000..59e5cad0fbd8
> --- /dev/null
> +++ b/drivers/video/backlight/dwi_bl.c
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Driver for backlight controllers attached via Apple DWI 2-wire interface
> + *
> + * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/bitfield.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
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
> +	dwi_bl = devm_kzalloc(&dev->dev, sizeof(*dwi_bl), GFP_KERNEL);
> +	if (!dwi_bl)
> +		return -ENOMEM;
> +
> +	dwi_bl->base = devm_platform_get_and_ioremap_resource(dev, 0, &res);
> +	if (IS_ERR(dwi_bl->base))
> +		return PTR_ERR(dwi_bl->base);
> +
> +	memset(&props, 0, sizeof(struct backlight_properties));
> +	props.type = BACKLIGHT_RAW;
> +	props.max_brightness = DWI_BL_MAX_BRIGHTNESS;

There should be something to indicate whether the backlight controls are
linear or logarithmic here.


> +static struct platform_driver dwi_bl_driver = {
> +	.driver		= {
> +		.name	= "dwi-bl",

Again, I'd rather see apple here too (although, to be clear, I'm
perfectly happy with all the static functions and variables being
prefixed only with dwi_bl).


Daniel.

