Return-Path: <linux-leds+bounces-8231-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ASpClrSDWpP3gUAu9opvQ
	(envelope-from <linux-leds+bounces-8231-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 17:25:14 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 941E3590C2C
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 17:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE9F2331BEA7
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 15:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524C43F4DC2;
	Wed, 20 May 2026 15:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFwE8lvh"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19AF10F2;
	Wed, 20 May 2026 15:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289685; cv=none; b=nvp+7O/f/PI4lw/0Zqdg4Og7z1dz+FcnH69vcGsDUQHOE586wnCsz1nrJk/mFJxK9sCJVGYphqVnFhqV/V5r50GCOt1S7vdS5WSPrgwksUuu+EnM1v/7pq4ACVy3JkjiJ01bcFCXQOdjNd+F/s2Nv2hwB15LUjv49JLweDH7Fa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289685; c=relaxed/simple;
	bh=WKzZhkxSD2vjx19jSDYx0VUqsCI8L+jsxSncyjMjA2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDrlVwidBPdRxsjwaqDw5xCm6bHeOHsLt+iH0rhLy03P2t2dh0YHp7GdA89b1Sgd3h3NJn9B+1vjYCN4yj4IfyJXJwosA2ahEb4gEJISYN4proPjAcKa4o+kOH/0Mp8568T3X91FQrxFnwIFrmkZLSbCcxk4vQ4rnLvyZcTsjUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFwE8lvh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3461F000E9;
	Wed, 20 May 2026 15:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779289683;
	bh=IKmMpMg4DrMfxRhRBYRMJ99H/RQUX43Fsv/O/+DPp24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HFwE8lvh0+WnNx2yTmxrCZxwz30Egm8oBS+3cKp+XCh0DNDwsgq0z+yGwNO2SH3gi
	 +gEOBVoPNHgvfCJ5sV5DIUVGa0sh3z4YXCB9wzTkIsORLepcWJnJ5BPFNlu5W2FARO
	 wCyHArTD7ZWFcIxDcy0kP70jJwzbsgK0ke/YtWmZUCNsGrR/IqNkHRv7E4z2iLg6D6
	 Yi++zPeTNRL19mawv4vZAMOjR5Svyr1+anPCdtC93Y8LcKDeGNyjhLKgWvdPN6Oy95
	 s1/Wr/FoASRV1Yuu8AEocgI+snWaK18Z4MvEdTeSXgxloaEVs8tanj5LZMOgpl3xXu
	 1sI2k9qROO2Ig==
Date: Wed, 20 May 2026 16:07:58 +0100
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 5/6] mfd: motorola-cpcap: diverge configuration
 per-board
Message-ID: <20260520150758.GG2767592@google.com>
References: <20260510110804.33045-1-clamor95@gmail.com>
 <20260510110804.33045-6-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510110804.33045-6-clamor95@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8231-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 941E3590C2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 10 May 2026, Svyatoslav Ryhel wrote:

> MFD have rigid subdevice structure which does not allow flexible dynamic
> subdevice linking. Address this by diverging CPCAP subdevice composition
> to take into account board specific configuration.
> 
> Create a common default subdevice composition, rename existing subdevice
> composition into cpcap_mapphone_mfd_devices since it targets mainly
> Mapphone board.
> 
> Removed st,6556002 as it is no longer applicable to all cases and
> duplicates motorola,cpcap, which is used as the default composition.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/mfd/motorola-cpcap.c       | 142 ++++++++++++++++-------------
>  include/linux/mfd/motorola-cpcap.h |   6 ++
>  2 files changed, 87 insertions(+), 61 deletions(-)

Looking much better, thanks.

Nit: A patch-level changelog really is much more helpful to reviewers.

> diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
> index d8243b956f87..f5a7fdd89dd5 100644
> --- a/drivers/mfd/motorola-cpcap.c
> +++ b/drivers/mfd/motorola-cpcap.c
> @@ -12,6 +12,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/sysfs.h>
>  
> @@ -30,6 +31,7 @@ struct cpcap_ddata {
>  	struct regmap_irq_chip_data *irqdata[CPCAP_NR_IRQ_CHIPS];
>  	const struct regmap_config *regmap_conf;
>  	struct regmap *regmap;
> +	enum cpcap_variant variant;
>  };
>  
>  static int cpcap_sense_irq(struct regmap *regmap, int irq)
> @@ -195,20 +197,6 @@ static int cpcap_init_irq(struct cpcap_ddata *cpcap)
>  	return 0;
>  }
>  
> -static const struct of_device_id cpcap_of_match[] = {
> -	{ .compatible = "motorola,cpcap", },
> -	{ .compatible = "st,6556002", },
> -	{},
> -};
> -MODULE_DEVICE_TABLE(of, cpcap_of_match);
> -
> -static const struct spi_device_id cpcap_spi_ids[] = {
> -	{ .name = "cpcap", },
> -	{ .name = "6556002", },
> -	{},
> -};
> -MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
> -
>  static const struct regmap_config cpcap_regmap_config = {
>  	.reg_bits = 16,
>  	.reg_stride = 4,
> @@ -241,62 +229,76 @@ static int cpcap_resume(struct device *dev)
>  
>  static DEFINE_SIMPLE_DEV_PM_OPS(cpcap_pm, cpcap_suspend, cpcap_resume);
>  
> -static const struct mfd_cell cpcap_mfd_devices[] = {
> -	{
> -		.name          = "cpcap_adc",
> -		.of_compatible = "motorola,mapphone-cpcap-adc",
> -	}, {
> -		.name          = "cpcap_battery",
> -		.of_compatible = "motorola,cpcap-battery",
> -	}, {
> -		.name          = "cpcap-charger",
> -		.of_compatible = "motorola,mapphone-cpcap-charger",
> -	}, {
> -		.name          = "cpcap-regulator",
> -		.of_compatible = "motorola,mapphone-cpcap-regulator",
> -	}, {
> -		.name          = "cpcap-rtc",
> -		.of_compatible = "motorola,cpcap-rtc",
> -	}, {
> -		.name          = "cpcap-pwrbutton",
> -		.of_compatible = "motorola,cpcap-pwrbutton",
> -	}, {
> -		.name          = "cpcap-usb-phy",
> -		.of_compatible = "motorola,mapphone-cpcap-usb-phy",
> -	}, {
> -		.name          = "cpcap-led",
> -		.id            = 0,
> -		.of_compatible = "motorola,cpcap-led-red",
> -	}, {
> -		.name          = "cpcap-led",
> -		.id            = 1,
> -		.of_compatible = "motorola,cpcap-led-green",
> -	}, {
> -		.name          = "cpcap-led",
> -		.id            = 2,
> -		.of_compatible = "motorola,cpcap-led-blue",
> -	}, {
> -		.name          = "cpcap-led",
> -		.id            = 3,
> -		.of_compatible = "motorola,cpcap-led-adl",
> -	}, {
> -		.name          = "cpcap-led",
> -		.id            = 4,
> -		.of_compatible = "motorola,cpcap-led-cp",
> -	}, {
> -		.name          = "cpcap-codec",
> -	}
> +static const struct mfd_cell cpcap_default_mfd_devices[] = {
> +	MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,cpcap-adc"),
> +	MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0,
> +		    "motorola,cpcap-battery"),
> +	MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0,
> +		    "motorola,cpcap-regulator"),
> +	MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rtc"),
> +	MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0,
> +		    "motorola,cpcap-pwrbutton"),
> +	MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0,
> +		    "motorola,cpcap-usb-phy"),
> +	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-led-red"),
> +	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-led-green"),
> +	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-led-blue"),
> +	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-led-adl"),
> +	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp"),
> +	MFD_CELL_NAME("cpcap-codec"),
> +};

Nit: I wouldn't complain if you wanted to have all of these on a single
line for neatness.

> +static const struct mfd_cell cpcap_mapphone_mfd_devices[] = {
> +	MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0,
> +		    "motorola,mapphone-cpcap-adc"),
> +	MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0,
> +		    "motorola,cpcap-battery"),
> +	MFD_CELL_OF("cpcap-charger", NULL, NULL, 0, 0,
> +		    "motorola,mapphone-cpcap-charger"),
> +	MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0,
> +		    "motorola,mapphone-cpcap-regulator"),
> +	MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rtc"),
> +	MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0,
> +		    "motorola,cpcap-pwrbutton"),
> +	MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0,
> +		    "motorola,mapphone-cpcap-usb-phy"),
> +	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-led-red"),
> +	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-led-green"),
> +	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-led-blue"),
> +	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-led-adl"),
> +	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp"),
> +	MFD_CELL_NAME("cpcap-codec"),
>  };

A lot of these are duplicated, right?

I would have a comment set, then the differences in separate containers.

>  static int cpcap_probe(struct spi_device *spi)
>  {
>  	struct cpcap_ddata *cpcap;
> +	const struct mfd_cell *cells;
> +	unsigned int num_cells;
>  	int ret;
>  
>  	cpcap = devm_kzalloc(&spi->dev, sizeof(*cpcap), GFP_KERNEL);
>  	if (!cpcap)
>  		return -ENOMEM;
>  
> +	cpcap->variant = (enum cpcap_variant)spi_get_device_match_data(spi);
> +	if (!cpcap->variant)
> +		return -ENODEV;

Isn't this covered in the 'default' below?


> +	switch (cpcap->variant) {
> +	case CPCAP_DEFAULT:
> +		cells = cpcap_default_mfd_devices;
> +		num_cells = ARRAY_SIZE(cpcap_default_mfd_devices);
> +		break;
> +	case CPCAP_MAPPHONE:
> +		cells = cpcap_mapphone_mfd_devices;
> +		num_cells = ARRAY_SIZE(cpcap_mapphone_mfd_devices);
> +		break;
> +	default:
> +		return dev_err_probe(&spi->dev, -EINVAL,
> +				     "Unknown device %d\n", cpcap->variant);

This should be -ENODEV.

> +	}
> +
>  	cpcap->spi = spi;
>  	spi_set_drvdata(spi, cpcap);
>  
> @@ -331,10 +333,28 @@ static int cpcap_probe(struct spi_device *spi)
>  	spi->dev.coherent_dma_mask = 0;
>  	spi->dev.dma_mask = &spi->dev.coherent_dma_mask;
>  
> -	return devm_mfd_add_devices(&spi->dev, 0, cpcap_mfd_devices,
> -				    ARRAY_SIZE(cpcap_mfd_devices), NULL, 0, NULL);
> +	return devm_mfd_add_devices(&spi->dev, 0, cells, num_cells, NULL, 0, NULL);
>  }
>  
> +static const struct of_device_id cpcap_of_match[] = {
> +	{
> +		.compatible = "motorola,cpcap",
> +		.data = (void *)CPCAP_DEFAULT

Single line should be fine.

> +	}, {
> +		.compatible = "motorola,mapphone-cpcap",
> +		.data = (void *)CPCAP_MAPPHONE
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, cpcap_of_match);
> +
> +static const struct spi_device_id cpcap_spi_ids[] = {
> +	{ "cpcap", CPCAP_DEFAULT },
> +	{ "mapphone-cpcap", CPCAP_MAPPHONE },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
> +
>  static struct spi_driver cpcap_driver = {
>  	.driver = {
>  		.name = "cpcap-core",
> diff --git a/include/linux/mfd/motorola-cpcap.h b/include/linux/mfd/motorola-cpcap.h
> index 981e5777deb7..1a85b06272c8 100644
> --- a/include/linux/mfd/motorola-cpcap.h
> +++ b/include/linux/mfd/motorola-cpcap.h
> @@ -25,6 +25,12 @@
>  #define CPCAP_REVISION_2_0	0x10
>  #define CPCAP_REVISION_2_1	0x11
>  
> +enum cpcap_variant {
> +	CPCAP_DEFAULT = 1,
> +	CPCAP_MAPPHONE,
> +	CPCAP_MAX
> +};
> +
>  /* CPCAP registers */
>  #define CPCAP_REG_INT1		0x0000	/* Interrupt 1 */
>  #define CPCAP_REG_INT2		0x0004	/* Interrupt 2 */
> -- 
> 2.51.0
> 

-- 
Lee Jones

