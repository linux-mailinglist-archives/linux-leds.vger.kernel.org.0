Return-Path: <linux-leds+bounces-8034-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKiFGryd/Gn3RwAAu9opvQ
	(envelope-from <linux-leds+bounces-8034-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 16:12:12 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E9C4E9E19
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 16:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C724730053F3
	for <lists+linux-leds@lfdr.de>; Thu,  7 May 2026 14:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D13F3E92AC;
	Thu,  7 May 2026 14:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WyXm0ofp"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B103016E1;
	Thu,  7 May 2026 14:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162840; cv=none; b=Uh4GOCAuUdFQURhDM89K0gHgLLy8AwA0X3qWulML78MDOmnEqSelSNGxjSIgbfbVSw62t928hrvhDrIps7Pho9ahRKRPSXwj35ks2VldxsbIMoQRkXNacrxq412b6UvqjxQgKrMo078af0V6GXhX7IDDpSIpW3fTP13ppvoElnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162840; c=relaxed/simple;
	bh=pTMxLDrZz7nbJf0OLiiLZzXvyB1HOQt6Ac5PIcErcNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+IFbaVvOiGbQBzl0T2umTC/V7vzXPnHJ4d1j+AHiWHwS43lFx33EVQUJEr0HBtyDlmObxXgPOQR/ulxD7P4WvF0OTAs8d3RG9JgbUrd9PZqMMom++KNWCQ1XvJQfX6n7O4qXXgLYWg7BoH1ZEkl9j+lUnsS5Akgx3isW3jPC/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WyXm0ofp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0FEBC2BCB2;
	Thu,  7 May 2026 14:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778162840;
	bh=pTMxLDrZz7nbJf0OLiiLZzXvyB1HOQt6Ac5PIcErcNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WyXm0ofp2fO4W3QRw2XT9UpoD1txpFjO2IIy0k4NO61lW95r3StjALXJoJPEiGlRN
	 38LbKtZV8XHMTI2u/k/8Muqs5MTPZxiwMEfzglqX5fU+HEvYj2NlyLqBwZZEsqPOOp
	 X9fmwbzLEdIGcOaBx5DWWT4IHPoQT4wrODRZOfmQ3gBBauiPK+XdldzgOUQLl0/In4
	 MT9pODmpo1NxGYhJGlIE4rl8jBfLnh58ZOK8tR9p8yH3UxEAJqFkvukLnVMaAKqUyM
	 QPWq6XlcwLQgrHGNN6rP6vbE6tOSlbzFJ9MgVw3ZSXhFGZxoB6R9r19SrOuYu07Yy3
	 V7y7wjfhd2IMg==
Date: Thu, 7 May 2026 15:07:15 +0100
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
Subject: Re: [PATCH v4 6/6 RESEND] mfd: motorola-cpcap: add support for Mot
 CPCAP composition
Message-ID: <20260507140715.GP305027@google.com>
References: <20260428153611.142816-1-clamor95@gmail.com>
 <20260428153611.142816-7-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428153611.142816-7-clamor95@gmail.com>
X-Rspamd-Queue-Id: B3E9C4E9E19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8034-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, 28 Apr 2026, Svyatoslav Ryhel wrote:

> Add a MFD subdevice composition used in Tegra20 based Mot board
> (Motorola Atrix 4G and Droid X2).
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/mfd/motorola-cpcap.c | 50 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
> index 516d1e33affa..fdec92f5c6b0 100644
> --- a/drivers/mfd/motorola-cpcap.c
> +++ b/drivers/mfd/motorola-cpcap.c
> @@ -335,6 +335,54 @@ static const struct cpcap_chip_data cpcap_mapphone_data = {
>  	.num_devices = ARRAY_SIZE(cpcap_mapphone_mfd_devices),
>  };
>  
> +/*
> + * The Mot board features a USB-PHY and charger similar to the ones in
> + * Mapphone; however, because Mot is based on Tegra20, it is incompatible
> + * with the existing implementation, which is tightly interconnected with
> + * the OMAP USB PHY.
> + */
> +static const struct mfd_cell cpcap_mot_mfd_devices[] = {
> +	{
> +		.name          = "cpcap_adc",
> +		.of_compatible = "motorola,mot-cpcap-adc",
> +	}, {
> +		.name          = "cpcap_battery",
> +		.of_compatible = "motorola,cpcap-battery",
> +	}, {
> +		.name          = "cpcap-regulator",
> +		.of_compatible = "motorola,mot-cpcap-regulator",
> +	}, {
> +		.name          = "cpcap-rtc",
> +		.of_compatible = "motorola,cpcap-rtc",
> +	}, {
> +		.name          = "cpcap-pwrbutton",
> +		.of_compatible = "motorola,cpcap-pwrbutton",
> +	}, {
> +		.name          = "cpcap-led",
> +		.id            = 0,
> +		.of_compatible = "motorola,cpcap-led-red",
> +	}, {
> +		.name          = "cpcap-led",
> +		.id            = 1,
> +		.of_compatible = "motorola,cpcap-led-green",
> +	}, {
> +		.name          = "cpcap-led",
> +		.id            = 2,
> +		.of_compatible = "motorola,cpcap-led-blue",
> +	}, {
> +		.name          = "cpcap-led",
> +		.id            = 3,
> +		.of_compatible = "motorola,cpcap-led-adl",

MFD_CELL_OF() for all.

> +	}, {
> +		.name          = "cpcap-codec",
> +	},

MFD_CELL_NAME()

> +};
> +
> +static const struct cpcap_chip_data cpcap_mot_data = {
> +	.mfd_devices = cpcap_mot_mfd_devices,
> +	.num_devices = ARRAY_SIZE(cpcap_mot_mfd_devices),
> +};
> +
>  static int cpcap_probe(struct spi_device *spi)
>  {
>  	struct cpcap_ddata *cpcap;
> @@ -389,6 +437,7 @@ static int cpcap_probe(struct spi_device *spi)
>  static const struct of_device_id cpcap_of_match[] = {
>  	{ .compatible = "motorola,cpcap", .data = &cpcap_default_data },
>  	{ .compatible = "motorola,mapphone-cpcap", .data = &cpcap_mapphone_data	},
> +	{ .compatible = "motorola,mot-cpcap", .data = &cpcap_mot_data },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, cpcap_of_match);
> @@ -396,6 +445,7 @@ MODULE_DEVICE_TABLE(of, cpcap_of_match);
>  static const struct spi_device_id cpcap_spi_ids[] = {
>  	{ .name = "cpcap", .driver_data = (kernel_ulong_t)&cpcap_default_data },
>  	{ .name = "mapphone-cpcap", .driver_data = (kernel_ulong_t)&cpcap_mapphone_data },
> +	{ .name = "mot-cpcap", .driver_data = (kernel_ulong_t)&cpcap_mot_data },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
> -- 
> 2.51.0
> 

-- 
Lee Jones

