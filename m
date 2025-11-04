Return-Path: <linux-leds+bounces-5973-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FA0C2FA32
	for <lists+linux-leds@lfdr.de>; Tue, 04 Nov 2025 08:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7557D3A6B8D
	for <lists+linux-leds@lfdr.de>; Tue,  4 Nov 2025 07:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D649D309EFE;
	Tue,  4 Nov 2025 07:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JSOsP/b/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35FE3093BB;
	Tue,  4 Nov 2025 07:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762241769; cv=none; b=RO6Y+Nh4RknszYLqIIV7Hy34lxIfC6QalKUq9z18b8EnccLH8acCg7mvGSiLSlyF4BLnWJsp9GG+IzzycuKMjgH7XHi2Nsaf8Gc4nh4a9XQ2fqBtOlMJ63Bc2X7SKQGZ5hycYsg4F5rzp7EWeWkDTpuPjqfhH8MmmvaXU3prTns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762241769; c=relaxed/simple;
	bh=dTh7uimuP+1HLMgpMWUL0kWi3PgDJrHfNJi+05SCrXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLpO85rB7icejgCdwVV3HBuRT3J9MgsNcNQQMI1bnZ7EmZb19lSoLCUPpnK9kGaXF18Da0u6tXcjkPEI45uQsjPfvTUsV2l0hvo1yvyGqUuEjWM8MNuHwk1DH/H/Xe/mZfVisZjc+PjUvL0mRJKfByD/EQaw4WjViYuudOkJTiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JSOsP/b/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BDFC4CEF8;
	Tue,  4 Nov 2025 07:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762241767;
	bh=dTh7uimuP+1HLMgpMWUL0kWi3PgDJrHfNJi+05SCrXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JSOsP/b/wFTdryqmS4RRLFMFoTGlDjVc8A2BgC7sDJayzpLsvh7QWaWOLMTYXMNkc
	 zZFmUdkf2HpN4fqUlVCuhzhNuoNNJBSIyGhXvZ7FHSeitj1LkwGt3UsvopH5ritr91
	 bY7+76qoqs7T+W6Cg7Ls93UTAs0P1xhrvJwsDx9KbYLmIfdwR58C49czLU6KPpmldU
	 Ds5iT83syzYNE35dA4qWJiCEuoI8fgD3K1SOZgityNpzjNyMi/RoxsZZ55eIFxiuNI
	 Jo23ze5M69sb5hruBZ+ws4Dp87MDODFuN2ajKcjFpEZvBB6LFuNzGcdP9xXn8D4Ztx
	 4YKM2ZO5wQRtg==
Date: Tue, 4 Nov 2025 08:36:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH v2 2/2] backlight: aw99706: Add support for Awinic
 AW99706 backlight
Message-ID: <20251104-attractive-dragonfly-of-perspective-0d52d6@kuoka>
References: <20251103110648.878325-1-caojunjie650@gmail.com>
 <20251103110648.878325-3-caojunjie650@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103110648.878325-3-caojunjie650@gmail.com>

On Mon, Nov 03, 2025 at 07:06:48PM +0800, Junjie Cao wrote:
> +struct reg_init_data;
> +
> +struct aw99706_device {
> +	struct i2c_client *client;
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct backlight_device *bl_dev;
> +	struct gpio_desc *hwen_gpio;
> +	struct reg_init_data *init_tbl;
> +	int init_tbl_size;
> +	bool bl_enable;
> +};
> +
> +enum reg_access {
> +	REG_NONE_ACCESS	= 0,
> +	REG_RD_ACCESS	= 1,
> +	REG_WR_ACCESS	= 2,
> +};
> +
> +const u8 aw99706_regs[AW99706_REG_MAX + 1] = {

Why isn't this static?

> +	[AW99706_CFG0_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFG1_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFG2_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFG3_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFG4_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFG5_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFG6_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFG7_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFG8_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFG9_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFGA_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFGB_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFGC_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFGD_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_FLAG_REG]		= REG_RD_ACCESS,
> +	[AW99706_CHIPID_REG]		= REG_RD_ACCESS,
> +	[AW99706_LED_OPEN_FLAG_REG]	= REG_RD_ACCESS,
> +	[AW99706_LED_SHORT_FLAG_REG]	= REG_RD_ACCESS,
> +
> +	/*
> +	 * Write bit is dropped here, writing BIT(0) to MTPLDOSEL will unlock
> +	 * Multi-time Programmable (MTP).
> +	 */
> +	[AW99706_MTPLDOSEL_REG]		= REG_RD_ACCESS,
> +	[AW99706_MTPRUN_REG]		= REG_NONE_ACCESS,
> +};
> +

...

> +	aw = devm_kzalloc(dev, sizeof(*aw), GFP_KERNEL);
> +	if (!aw)
> +		return -ENOMEM;
> +
> +	aw->client = client;
> +	aw->dev = dev;
> +	i2c_set_clientdata(client, aw);
> +
> +	aw->regmap = devm_regmap_init_i2c(client, &aw99706_regmap_config);
> +	if (IS_ERR(aw->regmap))
> +		return dev_err_probe(dev, PTR_ERR(aw->regmap),
> +				     "Failed to init regmap\n");
> +
> +	ret = aw99706_chip_id_read(aw);
> +	if (ret != AW99706_ID)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to validate chip id\n")

Why are you exiting the probe with a positive value like 4 or 8? This
makes no sense. Registers do not coontain Linux return codes.

Best regards,
Krzysztof


