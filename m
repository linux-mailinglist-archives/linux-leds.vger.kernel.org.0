Return-Path: <linux-leds+bounces-8127-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGHsHppSB2pIygIAu9opvQ
	(envelope-from <linux-leds+bounces-8127-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 15 May 2026 19:06:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A885546DD
	for <lists+linux-leds@lfdr.de>; Fri, 15 May 2026 19:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F325C3242531
	for <lists+linux-leds@lfdr.de>; Fri, 15 May 2026 16:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6EB477E23;
	Fri, 15 May 2026 16:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQrWa2oN"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A91E3F58CD;
	Fri, 15 May 2026 16:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778862500; cv=none; b=oUdQYo5OH2MWsoj+mzknLYTQtVncr+x6hRl9kasNwlCVUVpjkFhGU9XOzhhrZg1LvMwmYiQjw7US9SozmGWnFnVsT2VYX2CHFDTAxj4mKwmzT8qywwEPx8boB36emBwqitA/ab7wNFWOTNM23tWWuvxRNYe6zn8U7l7zd5ChoBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778862500; c=relaxed/simple;
	bh=fevXNOMD2wqSxfojs9FldeJgBr0Sp/Q5mbdpF+ByygA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njVs0wLWkojoToP7BX3BM2IMezF5wKO407mGNrUHm8aA0PGpXrgSnemKRhnrJtw7FVUsN/meAkG4k+mXieeaEraWovt0inzEshtBb5H9h/CjqMmEV2pELZeZaUaZWUTKA8dVsGTzA9wQ4tjzF0AGY0jQ0C+BW/lt+uApmaI7ewA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQrWa2oN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC9CC2BCF5;
	Fri, 15 May 2026 16:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778862500;
	bh=fevXNOMD2wqSxfojs9FldeJgBr0Sp/Q5mbdpF+ByygA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQrWa2oNCgb6cyENrUHkmbLCtQl2opci189wPhgJ0aXRcJPBsjgEdHbZYtGu03OeM
	 ZmqrbV+Bpotd6rlwGLZvoIROgWLXDMK9c+zBvvu+yRam4SRNocCX4yYXWIw1dOjUlb
	 7g8vi25C8aV0gGVYYKWzreSgCyYVdwk982rH3OP6RK00rULGKjJ0locZj7+iAzKzbG
	 EKsHXKEX0Wk3075Wd4InovCyadkG9Yyg1qTvkSIXTrkQoilUoY2Na9HYK+MqZITNGy
	 atHED3uLIk58X/0D5LNKotSeh27RnQbm/kAgJ4MDMVeESERuc0xqRFiFm0zz9ubfRM
	 NzrGTEdH9RgyQ==
Date: Fri, 15 May 2026 17:28:14 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
Subject: Re: [PATCH v2 2/2] backlight: Add SY7758 6-channel High Efficiency
 LED Driver support
Message-ID: <agdJnpz9O00lywRm@aspen.lan>
References: <20260430-topic-sm8650-ayaneo-pocket-s2-sy7758-v2-0-308140640de9@linaro.org>
 <20260430-topic-sm8650-ayaneo-pocket-s2-sy7758-v2-2-308140640de9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430-topic-sm8650-ayaneo-pocket-s2-sy7758-v2-2-308140640de9@linaro.org>
X-Rspamd-Queue-Id: 17A885546DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8127-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,lists.freedesktop.org,vger.kernel.org,outlook.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielt@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspen.lan:mid,outlook.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Action: no action

On Thu, Apr 30, 2026 at 11:47:16AM +0200, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
>
> Implement support for the Silergy SY7758 6-channel High Efficiency LED
> Driver used for backlight brightness control in the Ayaneo Pocket S2
> dual-DSI panel.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> ---
>  drivers/video/backlight/Kconfig  |   8 +
>  drivers/video/backlight/Makefile |   1 +
>  drivers/video/backlight/sy7758.c | 311 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 320 insertions(+)
> <snip>
> diff --git a/drivers/video/backlight/sy7758.c b/drivers/video/backlight/sy7758.c
> new file mode 100644
> index 000000000000..9b2d3bbb4ded
> --- /dev/null
> +++ b/drivers/video/backlight/sy7758.c
> @@ -0,0 +1,311 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Silergy SY7758 6-channel High Efficiency LED Driver
> + *
> + * Copyright (C) 2025 Kancy Joe <kancy2333@outlook.com>
> + * Copyright (C) 2026 Linaro Limited
> + * Author: Neil Armstrong <neil.armstrong@linaro.org>

I'm a bit confused by this comment. The git author and the
MODULE_AUTHOR() is Kancy Joe. What does this comment signify?


> + */
> <snip>
> +/* OTP memory */
> +#define REG_OTP_CFG98 0x98
> +#define REG_OTP_CFG9E 0x9E
> +#define REG_OTP_CFG0 0xA0
> +#define REG_OTP_CFG1 0xA1
> +#define REG_OTP_CFG2 0xA2
> +#define REG_OTP_CFG3 0xA3
> +#define REG_OTP_CFG4 0xA4
> +#define REG_OTP_CFG5 0xA5
> +#define REG_OTP_CFG6 0xA6
> +#define REG_OTP_CFG7 0xA7
> +#define REG_OTP_CFG9 0xA9
> +#define REG_OTP_CFGA 0xAA
> +#define REG_OTP_CFGE 0xAE

There seems to be a lot of unused macros here, especially
combined with the unused bitfields that tell us how to interpret
the values.

Do we need them?


> <snip>
> +static int sy7758_probe(struct i2c_client *client)
> +{
> +	struct backlight_properties props = { };
> +	struct device *dev = &client->dev;
> +	struct sy7758 *sydev;
> +	unsigned int dev_id;
> +	int ret;
> +
> +	sydev = devm_kzalloc(dev, sizeof(*sydev), GFP_KERNEL);
> +	if (!sydev)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, sydev);
> +
> +	/* Initialize regmap */
> +	sydev->client = client;
> +	sydev->regmap = devm_regmap_init_i2c(client, &sy7758_regmap_config);
> +	if (IS_ERR(sydev->regmap))
> +		return dev_err_probe(dev, PTR_ERR(sydev->regmap),
> +				     "failed to init regmap\n");
> +
> +	/* Get and enable regulators */
> +	ret = devm_regulator_get_enable(dev, "vddio");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get regulator\n");
> +
> +	usleep_range(100, 200);

Any reason not to use fsleep() here?


> +	/* Get enable GPIO and set to high */
> +	sydev->gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
> +	if (IS_ERR(sydev->gpio))
> +		return dev_err_probe(dev, PTR_ERR(sydev->gpio),
> +				     "failed to get enable GPIO\n");
> +
> +	/* Let some time for HW to settle */
> +	usleep_range(10000, 11000);

And here?


> +
> +	/* try read and check device id */
> +	ret = regmap_read(sydev->regmap, REG_DEV_ID, &dev_id);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to read device id\n");
> +	if (dev_id != 0x63) {
> +		dev_err(dev, "unexpected device id: 0x%02x\n", dev_id);
> +		return -ENODEV;
> +	}
> +
> +	/* Initialize and set default brightness */
> +	ret = sy7758_init(sydev);
> +	if (ret)
> +		return ret;
> +
> +	props.type = BACKLIGHT_RAW;
> +	props.max_brightness = MAX_BRIGHTNESS;
> +	props.brightness = DEFAULT_BRIGHTNESS;
> +	props.scale = BACKLIGHT_SCALE_LINEAR;
> +
> +	sydev->bl = devm_backlight_device_register(dev, "sy7758-backlight",
> +						   dev, sydev, &sy7758_backlight_ops,
> +						   &props);
> +	if (IS_ERR(sydev->bl))
> +		return dev_err_probe(dev, PTR_ERR(sydev->bl),
> +				     "failed to register backlight device\n");
> +
> +	return backlight_update_status(sydev->bl);
> +}


Daniel.

