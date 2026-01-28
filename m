Return-Path: <linux-leds+bounces-6780-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HtQGcLreWkF1AEAu9opvQ
	(envelope-from <linux-leds+bounces-6780-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jan 2026 11:58:10 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3BC9FCF4
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jan 2026 11:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DABC300C27E
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jan 2026 10:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7052C2DC798;
	Wed, 28 Jan 2026 10:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="k4qADME/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E71672612
	for <linux-leds@vger.kernel.org>; Wed, 28 Jan 2026 10:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769597886; cv=none; b=a9bYzGKEFJJd0WrFEG9xbvDb1Ira+6etILH9cZ2HRzynHFkhUdff1KCcEPMvFC3Hpisx/8qCB8KyoTJWGC3TbsE1zhnFofJrlpGLMr3g0hfFootw3Nc75n9VR5LJoxK+CMW1AVEu3zsy8ThGRGOQzNKCIWNCAkKTWMaB+VFfjtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769597886; c=relaxed/simple;
	bh=uFAzZ5CAPjtHAT6gvLI6Vg4+PXSvGLUnJQPv3sHGCsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzM1xn0LYIdNhyeGCPR0i14+fys8Su/7kczmNW9TL793Q/Sc+pV0zDEy1zBuSqLKs5OOmo4RdWUvC4zDGsLpxzs0FLDtwa21cAy+OtdCyxu9edg/lBtKf7mC+0Uts72gvzLoT1Q1ftvSN6vW61FkPc9gV0jFw1cTFb9iKS1D9fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=k4qADME/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806bf03573so7222355e9.2
        for <linux-leds@vger.kernel.org>; Wed, 28 Jan 2026 02:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769597883; x=1770202683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ePwSV9uQcaY+n4jv1Q2W+vhnTy8c0WhUgXTMl4Q9tqw=;
        b=k4qADME/LVM7ExuUtz1KHFmMvXX8q8HB1UzNLyWKhJdjPzOZLLL+xtXmVg7yINe6ZD
         YVE2xWMaiDndOl8jIuidkc0k8Yxg0Tnou29OaDFTqzSPG7s1GSeeKImmgk62cjP6uUtg
         auHd16eAq1Nff4vJdOHuW7vOQ7KfJlmfkwNeU4QhIY2oSLAsmq7tXacz7b2nipgc5haO
         /VxLF+PTLTXZsHqBLhXLEYuBq3tufOSJ/84d9xXp/LpFsXsnkEF3GUkALeOdFQc9+GUq
         LHiFIvH+7oQ3vxOs6r9Z01QiGFiVZhFEPqxIvv5N02rHeqZ0eFOCv9s7NtZE4g0PcC+F
         OctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769597883; x=1770202683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ePwSV9uQcaY+n4jv1Q2W+vhnTy8c0WhUgXTMl4Q9tqw=;
        b=Fq9oy6ohdLQb+rrOkwdPCdGvMdN1XuU7meJIbXmEUgvhb1m6KV+sm1vT1BSB83HbZq
         BuRO0oxcacHKwB5AXUsrdni3P6Pltb8n8iK3ovfBvefqO3246TGWi2CQd1wnoVd3G+mI
         zFbmqR6oUoViee5NlXFOnLF0eD9WDWZhOYuL5vjovumSjxci3ebP3v+q0J8/e4Nukp7R
         TeD8bRAwv2JdCAg5M5TTphP0Ue9DZsi28CwRC0mbq9QUNKBsZoHtcCzCXGVH5kQ3vm+K
         /rCyVF9bZBGvjfQ777mwbVxpzlbKR9qg+lhVQHdlWehMVbnU/xx0w+aSIOxqhEGBUHth
         bd7A==
X-Forwarded-Encrypted: i=1; AJvYcCX3opJpq7Kb2qHJ7pOcx9vq7ebaA2XaVdVC2oPa7N/6VA6TVG15QYb4OT2RotVmygN6DfAB5kw2XXar@vger.kernel.org
X-Gm-Message-State: AOJu0YzbIOwb+bUQdvJG0xd1l+A4qUZQ4RcLbp3yeZUnydE6IKIE7DSo
	4VF7GwOMhyyxFeiNbU1pp+JhNTkO3fjACJL4jIOePCFQBtYLsnRQ4R5xOWNGZfvt0fM=
X-Gm-Gg: AZuq6aIgE+odFX1PSAjBIOs73fT93QlyaIHItqFYlxFB8yQE6VVpVaGu6RGXgBqmFD9
	Rk/wej2QCzDYGYFeXShPHrrD9R4z2gh87zj261Bn1WcdLuwiqgp9E01OJB/2HZh8/l9QunNPXHr
	aMaNlgnpjGp80sd4enOJPKtcarHOj/BTYOR4DEVdkbjFOjHcT24Lrn2OKG8Zr4rjnaIsIICzWed
	iJtx42LkWmtbd2n6pRHPnVlQ305cq9wRTub081Dc18YpnwggvP48/zU/Dnbba0wcWYByVr86iJ6
	UWP8JQUpPfkUZlrxckjyluvbQYWT3k/Vvw+jciyq+UOo9/JYasF9wXhtub+KO3HW2uRhAMAxugf
	ud4mS8+zjp3R821uNOnb4Ghf5fF62idZ0WgXZXgYCoyCzPzCPqalrgQYDjAg10Nsbzm2S9sTWK8
	ewaIwtiNPfA4NVccBL2lnEK5xKLajinP1d8l2YwxACKxSHX419oUuaNfQR1+pgacoELO8m1qO/r
	4lY7jx/dS3aKRcOB1gpV1VeQSACHafnpobGKunz7njlbn08ebHjkRzuRHH8mDjunuOu8K35
X-Received: by 2002:a05:600c:450b:b0:47d:25ac:3a94 with SMTP id 5b1f17b1804b1-48069c788a3mr59622875e9.17.1769597882839;
        Wed, 28 Jan 2026 02:58:02 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdd79c7sm54470645e9.2.2026.01.28.02.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 02:57:59 -0800 (PST)
Date: Wed, 28 Jan 2026 10:57:55 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] backlight: gpio: add support for multiple GPIOs
 for backlight control
Message-ID: <aXnrs-RWWYC2q4O_@aspen.lan>
References: <20260120125036.2203995-1-tessolveupstream@gmail.com>
 <20260120125036.2203995-3-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120125036.2203995-3-tessolveupstream@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6780-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[riscstar-com.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspen.lan:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CF3BC9FCF4
X-Rspamd-Action: no action

On Tue, Jan 20, 2026 at 06:20:36PM +0530, Sudarshan Shetty wrote:
> The gpio-backlight driver currently supports only a single GPIO to
> enable or disable a backlight device. Some panels require multiple
> enable GPIOs to be asserted together.
>
> Extend the driver to support an array of GPIOs for a single backlight
> instance. All configured GPIOs are toggled together based on the
> backlight state.
>
> Existing single-GPIO Device Tree users remain unaffected.
>
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  drivers/video/backlight/gpio_backlight.c | 66 ++++++++++++++++--------
>  1 file changed, 45 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 728a546904b0..11d21de82cf5 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -14,17 +14,29 @@
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
> +#include <linux/bitmap.h>
>
>  struct gpio_backlight {
>  	struct device *dev;
> -	struct gpio_desc *gpiod;
> +	struct gpio_descs *gpiods;
> +	unsigned long *bitmap;
>  };
>
>  static int gpio_backlight_update_status(struct backlight_device *bl)
>  {
>  	struct gpio_backlight *gbl = bl_get_data(bl);
> +	unsigned int n = gbl->gpiods->ndescs;
> +	int br = backlight_get_brightness(bl);
>
> -	gpiod_set_value_cansleep(gbl->gpiod, backlight_get_brightness(bl));
> +	if (br)
> +		bitmap_fill(gbl->bitmap, n);
> +	else
> +		bitmap_zero(gbl->bitmap, n);
> +
> +	gpiod_set_array_value_cansleep(n,
> +				       gbl->gpiods->desc,
> +				       gbl->gpiods->info,
> +				       gbl->bitmap);
>
>  	return 0;
>  }
> @@ -48,26 +60,43 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
>  	struct device_node *of_node = dev->of_node;
> -	struct backlight_properties props;
> +	struct backlight_properties props = { };

This change is unrelated to the patch description. Do not "hide"
changes like this. It you want to replace the memset() it's better to
send a separate patch.


>  	struct backlight_device *bl;
>  	struct gpio_backlight *gbl;
> -	int ret, init_brightness, def_value;
> +	bool def_value;
> +	enum gpiod_flags flags;
> +	unsigned int n;
> +	int words;
>
> -	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
> -	if (gbl == NULL)
> +	gbl = devm_kcalloc(dev, 1, sizeof(*gbl), GFP_KERNEL);
> +	if (!gbl)

Again, this change is unrelated to the patch description. Do not include
changes that are not described in the patch description.


>  		return -ENOMEM;
>
>  	if (pdata)
>  		gbl->dev = pdata->dev;
>
>  	def_value = device_property_read_bool(dev, "default-on");
> +	flags = def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
> +
> +	gbl->gpiods = devm_gpiod_get_array(dev, NULL, flags);

How is it safe to transition from GPIOD_ASIS to GPIOD_OUT_LOW
here?

Forcing the backlight off if the default-on property is not present
will prevent the backlight state being properly inherited from the
bootloader.


> +	if (IS_ERR(gbl->gpiods)) {
> +		if (PTR_ERR(gbl->gpiods) == -ENODEV)
> +			return dev_err_probe(dev, -EINVAL,
> +			"The gpios parameter is missing or invalid\n");
> +		return PTR_ERR(gbl->gpiods);
> +	}
>
> -	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
> -	if (IS_ERR(gbl->gpiod))
> -		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
> -				     "The gpios parameter is missing or invalid\n");
> +	n = gbl->gpiods->ndescs;
> +	if (!n)
> +		return dev_err_probe(dev, -EINVAL,
> +			"No GPIOs provided\n");
> +
> +	words = BITS_TO_LONGS(n);
> +	gbl->bitmap = devm_kcalloc(dev, words, sizeof(unsigned long),
> +				   GFP_KERNEL);
> +	if (!gbl->bitmap)
> +		return -ENOMEM;
>
> -	memset(&props, 0, sizeof(props));
>  	props.type = BACKLIGHT_RAW;
>  	props.max_brightness = 1;
>  	bl = devm_backlight_device_register(dev, dev_name(dev), dev, gbl,
> @@ -81,21 +110,16 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	if (!of_node || !of_node->phandle)
>  		/* Not booted with device tree or no phandle link to the node */
>  		bl->props.power = def_value ? BACKLIGHT_POWER_ON
> -					    : BACKLIGHT_POWER_OFF;
> -	else if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
> +						    : BACKLIGHT_POWER_OFF;
> +	else if (gpiod_get_value_cansleep(gbl->gpiods->desc[0]) == 0)

This logic is broken. This code path needs to be taken is *any* GPIO is
low (and, as mentioned, the initial GPIO state must be GPIOD_ASIS).


>  		bl->props.power = BACKLIGHT_POWER_OFF;
>  	else
>  		bl->props.power = BACKLIGHT_POWER_ON;
>
> -	bl->props.brightness = 1;
> -
> -	init_brightness = backlight_get_brightness(bl);
> -	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
> -	if (ret) {
> -		dev_err(dev, "failed to set initial brightness\n");
> -		return ret;
> -	}
> +	bl->props.brightness = def_value ? 1 : 0;
>
> +	gpio_backlight_update_status(bl);
> +
>  	platform_set_drvdata(pdev, bl);
>  	return 0;
>  }


Daniel.

