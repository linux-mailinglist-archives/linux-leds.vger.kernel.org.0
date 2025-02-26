Return-Path: <linux-leds+bounces-4083-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC50A456D2
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 08:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22B3F177044
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 07:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999B726B095;
	Wed, 26 Feb 2025 07:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQ20Uxle"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D00226A0A6;
	Wed, 26 Feb 2025 07:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740555646; cv=none; b=TOEGa+r6MGdC30OnAo0wjso9ll4MyCRX+RUYR/2o6eDs1sm92Fx5s1Tj2XX/6Cj7NCatj8WlsQ8gefzggYHU707AcJFkXCYEChoYQIqpdP8nQzczZ5w+/qjxJcH6bMQ3PM1KBd7kW9dEO61ulSGiBzq35WShvgz4Vcb5IYrlWRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740555646; c=relaxed/simple;
	bh=8GQOo0rBG1mgEOsm9mN1R6BOr1JZbArnDprAbSoG9aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsFREMLgkABazWtcDTvclTNkvFiSN5WjngCOTBvMcAwoccjs0iZkAz9wOF/iVp33fFY5nHneGu4AyiwItZTGh0rVHKqSuF2KgVRJ18UPgWv/BdlfRoME0gGDUMhi/lgcbkz8YGOhyOFLgkjar2GtVfWAyo6pnwKxbSKJcO0GVhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQ20Uxle; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35AAEC4CED6;
	Wed, 26 Feb 2025 07:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740555645;
	bh=8GQOo0rBG1mgEOsm9mN1R6BOr1JZbArnDprAbSoG9aA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YQ20Uxle0m6QokQ87mndqg3GWYPCqmAr2N3Lbxkfabd5oi+Vw+O6pIxci5BeKjple
	 DKHymOuhrTtODr6T7WslUvU0awMKjdLcFR4tCp9SdXjjgg5lAS37JLIEtPXZDno8zn
	 HnyySce+2V0VcToArB1v7klZnfK0ElEj9pUCMd9Gi2c9olYdTNKF4tWDgCOwDODsT8
	 /H2DhyjA9AU7HUX1F29j3Zcvt5gyde71+G0xw0BfxpQkkqsjWTojVxX9aPBzAFAc3O
	 yi63alginBFUmKUGYBZJMsNFeTAZmZFKsHa7S181lV7hY76i14f2stP+IOjsHgt3IR
	 z/S/x6/EaSKzQ==
Date: Wed, 26 Feb 2025 08:40:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: pavel@kernel.org, lee@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] leds: add new LED driver for TI LP5812
Message-ID: <20250226-lovely-bald-rabbit-08ce5b@krzk-bin>
References: <20250225170601.21334-1-trannamatk@gmail.com>
 <20250225170601.21334-3-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250225170601.21334-3-trannamatk@gmail.com>

On Wed, Feb 26, 2025 at 12:06:01AM +0700, Nam Tran wrote:
> The chip can drive LED matrix 4x3.
> This driver uses I2C to communicate with the chip.

You decided to ignore my previous question, but it still valid. Respond
to it.

Sorry, if you keep ignoring reviewers, you will not get anywhere.

> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  MAINTAINERS                                   |    6 +
>  .../arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts |    7 +

No, DTS is not part of LED. You cannot combine it in the same patch.


>  drivers/leds/Kconfig                          |   13 +
>  drivers/leds/Makefile                         |    2 +
>  drivers/leds/leds-lp5812-common.c             | 1097 ++++++++
>  drivers/leds/leds-lp5812-common.h             |  323 +++
>  drivers/leds/leds-lp5812-regs.h               |   96 +
>  drivers/leds/leds-lp5812.c                    | 2317 +++++++++++++++++
>  8 files changed, 3861 insertions(+)
>  create mode 100644 drivers/leds/leds-lp5812-common.c
>  create mode 100644 drivers/leds/leds-lp5812-common.h
>  create mode 100644 drivers/leds/leds-lp5812-regs.h
>  create mode 100644 drivers/leds/leds-lp5812.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 32312959d595..fabd09eb6c0b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23499,6 +23499,12 @@ M:	Nam Tran <trannamatk@gmail.com>
>  L:	linux-leds@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> +F:	drivers/leds/Kconfig
> +F:	drivers/leds/Makefile
> +F:	drivers/leds/leds-lp5812-common.c
> +F:	drivers/leds/leds-lp5812-common.h
> +F:	drivers/leds/leds-lp5812-regs.h
> +F:	drivers/leds/leds-lp5812.c
>  
>  TEXAS INSTRUMENTS' SYSTEM CONTROL INTERFACE (TISCI) PROTOCOL DRIVER
>  M:	Nishanth Menon <nm@ti.com>
> diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
> index 353bb50ce542..0d01c6b6a5ba 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
> @@ -270,3 +270,10 @@ &vec {
>  &wifi_pwrseq {
>  	reset-gpios = <&expgpio 1 GPIO_ACTIVE_LOW>;
>  };
> +
> +&i2c1 {
> +	lp5812@1b {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +		compatible = "ti,lp5812";
> +		reg = <0x1b>;
> +	};
> +};
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 2b27d043921c..e43dbd5a4d8c 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -483,6 +483,19 @@ config LEDS_LP5569
>  	  Driver provides direct control via LED class and interface for
>  	  programming the engines.
>  

...

> +	pr_info("[DEBUG]: sysfs_create_group successfully\n");
> +
> +	ret = lp5812_init_dev_config(chip, "tcmscan:4:0:1:2:3", 0);
> +	if (ret) {
> +		pr_info("[DEBUG]: %s: lp5812_init_dev_config failed\n",
> +			__func__);
> +		return ret;
> +	}
> +	pr_info("[DEBUG]: lp5812_init_dev_config successfully\n");
> +	/* initialize lp5812 chip */
> +	ret = lp5812_initialize(chip);
> +
> +	/* code to verify i2c read/write ok or not */
> +	lp5812_read(chip, (u16)DEV_CONFIG2, &val);
> +	pr_info("[DEBUG]: DEV_CONFIG2 value: 0x%02X\n", val);
> +
> +	lp5812_write(chip, (u16)LED_A1_AUTO_BASE_ADRR, 0x14);
> +	lp5812_read(chip, (u16)LED_A1_AUTO_BASE_ADRR, &val);
> +	pr_info("[DEBUG]: LED_A1_AUTO_BASE_ADRR value: 0x%02X\n", val);

So entire driver is full of such debug code, looking straight from some
Android vendor tree.

No, that's not how upstreaming works. You now copy all bad habits, all
poor code and all the issues we fixed. Start from scratch from latest
mainline driver and customize it to your needs.


Best regards,
Krzysztof


