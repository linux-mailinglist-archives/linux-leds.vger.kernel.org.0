Return-Path: <linux-leds+bounces-3533-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B85A9E8FB7
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 11:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9124280EA5
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 10:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA92216614;
	Mon,  9 Dec 2024 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmRKl4G1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C2F214A74;
	Mon,  9 Dec 2024 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733738883; cv=none; b=bCOYSG5xAZudW9ANnpPO4lCn9atA/jVdBRNTwo2iMGt7hXsi/BD8ZSGpiCJdG8f9i3jFUYdQrA0efM/D8fmQkZZRR+OFzYL6NPvWUj6gRbHoZWpva6N/fDSktzpNGFPIKSWW3AhyPk3itZIYFeF7wPVLE3qWKOS8KzYaHZUwmOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733738883; c=relaxed/simple;
	bh=fU0JFCK9xqBNnAEfWCALQQcXBFQd2+mLyQO4TWjbXnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0l7hPIQT70hWEa9x1nt4IJYeJS4p+HiKEUj0UHWt8Vo8JtjG4tgdXgCVWffywWQQbXeadf6zutVH4+D/sYG8tF3BvTTx8srhrMdmK9Ia5U4hUkPiK7EmPuebA4J3mUvOnUvRTuH2/GtlvaOSd9627YwJRpLz8g3DJdqOsbGDH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmRKl4G1; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-725c0dd1fbcso2705136b3a.0;
        Mon, 09 Dec 2024 02:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733738881; x=1734343681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fZp+CFP7K7kOAlodAUCSCzM6XqjZQS3FtVdgKB9HjIU=;
        b=NmRKl4G1KcNNWxnnIzyTG4zT4+mruz9DO70ibdd8CCb/LSX3NIbJLoEqaaQy5sOCIH
         I3ho68CSKin3OJDHh63cXNxQkFDSqiH0Rzw4HRwYovhL8zKDKz8loPyBJNOaQ92OaifR
         Y609ppgSWChmQ0N6hMKVTfcd90QekyclEFMO1OxBDhu5hDT95YBPTBVFnuJrly7v3fHD
         54M0vLoBlcZSJ0EqY6sCi4x23SSlyScVQrfSm6/THAc8kg9gJ4FN3NsO/GVvMGBMdEJv
         4im+gsbb3ZApKGEe32qpQXbk5ma09+7DSKhxcf1rYd0YYz5YHldbNnwcuseDPGcSCq/a
         zW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733738881; x=1734343681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZp+CFP7K7kOAlodAUCSCzM6XqjZQS3FtVdgKB9HjIU=;
        b=PSqOQQKSIKX/BywqILJueKlYi/W+ldTPRx1nFsUwNK74w6+YVmrHUUw3rNGHzsL/tj
         38jNF+J/iVQR62vHIAnch0OCaISfU4zEHATHmn3U18eds0oEp500YtS8yLVnOQRpV0Ng
         wzXrKXBvgy5qRL22CSjK+A1o4Y4JYJXm3GPGpB0iyKZ7IkzL4PZrJJDCgI/BUhbqz0nF
         I65UcV8mWKuAPyqf2ghl2ttvkk4h8Mi5PZmyja4dS0r1IvXRzTEfH7qqiIk+DB2abTvC
         YVTSGXvgKv11TFBpD01UssZTgVZz8tkrNF8qkWpgn1mAfDC4Vy3PuRVXfZUsMfLgq9hw
         0vLA==
X-Forwarded-Encrypted: i=1; AJvYcCUokxy1peM772iY3a/bYshIdLnEQDlDEh2TZJWMIdecLatVSpv7ungctt0+naE6rqu6pjd07w5v/K5Zfg==@vger.kernel.org, AJvYcCVBHCzS1floGXkVa12EHyVtWnOc/6rJbz+LnXdOanRtg9PXGUszD3kB5qK8VDWXSnX79tW7f672TBpiBzY=@vger.kernel.org, AJvYcCVTy6IAwGFp1E9HG+MoteeImk4a5+qzw8Lmcge54XeDtkv0JiaVL/rSVoAAnp/AN8pjuD+gXKzINRQl@vger.kernel.org, AJvYcCXvdZhHMBaXFCmB8UsoyLNU6eM1FVmI+Zt8TFMD1/jFsrAX0a/CF2YjA/B3m39GLlBldJugH6j47GFPk17j@vger.kernel.org
X-Gm-Message-State: AOJu0YzgHTyswp3TNkpWy5L4VhIV6BKR++/x9nuxlMskIi9Tz9IPLSMq
	X1+RI3nlH4T5YlxPQCTPlYHA7WvObuTO3SsHNETR+bZuc0P18M/0
X-Gm-Gg: ASbGncuCBBSnuEiikOsCmsThZjv//mLST7Q89Flc2Our86DtTj/QsXi+PJ0CIsqnACH
	yBvK6GoOb7I/GZsCXFUADfJPYfc0BqeK1hCQGlIO7OrfAQ8sQw0uFe5I/NTdkFrm7qcOkQatRwM
	CyFldC4iJiR3ig3n9qHgI8y+/OUrf3Q6rAJABiIqXUrjpUPHOXfPYGe+BskzUmtaomneYve6lOz
	Em3n3GmSNqHEbFCTAwpG7MeWQy8q6Zrz7zAA8PDD/PwE3H0FwaiyPgrR3s8mccx1Y07
X-Google-Smtp-Source: AGHT+IE2AAunC8wmSSoVHJwvOzFoZYPvX4c5A5ejLO9bR6TnjihE9dezvHIlPn7G9UQ6/5A3kkQW9g==
X-Received: by 2002:a05:6a00:a8c:b0:725:24c2:b794 with SMTP id d2e1a72fcca58-725b8188090mr18378334b3a.23.1733738881124;
        Mon, 09 Dec 2024 02:08:01 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725d9b98eb2sm3567122b3a.148.2024.12.09.02.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 02:08:00 -0800 (PST)
Message-ID: <551941de-b9a4-4353-8bb2-0bfc3304ef87@gmail.com>
Date: Mon, 9 Dec 2024 18:07:55 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
	y@krzk-bin.smtp.subspace.kernel.org
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241207130433.30351-1-towinchenmi@gmail.com>
 <20241207130433.30351-3-towinchenmi@gmail.com>
 <bqn4tddl3kgle7zlamgaqlh45pizw6gf5qjwlmcsbkb6fx343l@tf5w63xursi2>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <bqn4tddl3kgle7zlamgaqlh45pizw6gf5qjwlmcsbkb6fx343l@tf5w63xursi2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Krzysztof Kozlowski 於 2024/12/9 下午5:22 寫道:
> On Sat, Dec 07, 2024 at 09:03:15PM +0800, Nick Chan wrote:
>> Add driver for backlight controllers attached via Apple DWI 2-wire
>> interface, which is found on some Apple iPhones, iPads and iPod touches
>> with a LCD display.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  drivers/video/backlight/Kconfig  |  12 +++
>>  drivers/video/backlight/Makefile |   1 +
>>  drivers/video/backlight/dwi_bl.c | 124 +++++++++++++++++++++++++++++++
>>  3 files changed, 137 insertions(+)
>>  create mode 100644 drivers/video/backlight/dwi_bl.c
>>
>> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
>> index 3614a5d29c71..e64cc3d51ac5 100644
>> --- a/drivers/video/backlight/Kconfig
>> +++ b/drivers/video/backlight/Kconfig
>> @@ -166,6 +166,18 @@ config BACKLIGHT_EP93XX
>>  	  To compile this driver as a module, choose M here: the module will
>>  	  be called ep93xx_bl.
>>  
>> +config BACKLIGHT_APPLE_DWI
>> +	tristate "Apple DWI 2-Wire Interface Backlight Driver"
>> +	depends on ARCH_APPLE || COMPILE_TEST
>> +	default y
>> +	help
>> +          Say Y to enable the backlight driver for backlight controllers
>> +          attached via the Apple DWI 2-wire interface which is found in some
>> +          Apple iPhones, iPads and iPod touches.
> 
> Mixed/messed indentation. Some spaces?
Ack. Will be fixed for v4.

> 
>> +
>> +	  To compile this driver as a module, choose M here: the module will
>> +	  be called dwi_bl.
>> +
>>  config BACKLIGHT_IPAQ_MICRO
>>  	tristate "iPAQ microcontroller backlight driver"
>>  	depends on MFD_IPAQ_MICRO
>> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
>> index 8fc98f760a8a..0a569d7f0210 100644
>> --- a/drivers/video/backlight/Makefile
>> +++ b/drivers/video/backlight/Makefile
>> @@ -28,6 +28,7 @@ obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
>>  obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
>>  obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
>>  obj-$(CONFIG_BACKLIGHT_DA9052)		+= da9052_bl.o
>> +obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= dwi_bl.o
> 
> Please do not introduce other sorting way - it is sorted by config name.
> Which will also point you to apple_bl.o and need of explaining the
> differences, e.g. why this cannot be one driver.

apple_bl is a driver backlight controllers on a PCI bus on Intel Macs,
which is
completely different from the Samsung-derived DWI block this driver
deals with.
This will be explained in the commit message for v4.

> 
> 
>>  obj-$(CONFIG_BACKLIGHT_EP93XX)		+= ep93xx_bl.o
>>  obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
>>  obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
>> diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
>> new file mode 100644
>> index 000000000000..d4bfd74b3129
>> --- /dev/null
>> +++ b/drivers/video/backlight/dwi_bl.c
>> @@ -0,0 +1,124 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Driver for backlight controllers attached via Apple DWI 2-wire interface
>> + *
>> + * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/io.h>
>> +#include <linux/backlight.h>
>> +
>> +#define DWI_BL_CTL			0x0
>> +#define DWI_BL_CTL_SEND1		BIT(0)
>> +#define DWI_BL_CTL_SEND2		BIT(4)
>> +#define DWI_BL_CTL_SEND3		BIT(5)
>> +#define DWI_BL_CTL_LE_DATA		BIT(6)
>> +/* Only used on Apple A9 and later */
>> +#define DWI_BL_CTL_SEND4		BIT(12)
>> +
>> +#define DWI_BL_CMD			0x4
>> +#define DWI_BL_CMD_TYPE			GENMASK(31, 28)
>> +#define DWI_BL_CMD_TYPE_SET_BRIGHTNESS	0xa
>> +#define DWI_BL_CMD_DATA			GENMASK(10, 0)
>> +
>> +#define DWI_BL_CTL_SEND			(DWI_BL_CTL_SEND1 | \
>> +					 DWI_BL_CTL_SEND2 | \
>> +					 DWI_BL_CTL_SEND3 | \
>> +					 DWI_BL_CTL_LE_DATA | \
>> +					 DWI_BL_CTL_SEND4)
>> +
>> +#define DWI_BL_MAX_BRIGHTNESS		2047
>> +
>> +struct apple_dwi_bl {
>> +	void __iomem *base;
>> +};
>> +
>> +static int dwi_bl_update_status(struct backlight_device *bl)
>> +{
>> +	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
>> +
>> +	int brightness = backlight_get_brightness(bl);
>> +
>> +	u32 cmd = 0;
>> +
>> +	cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
>> +	cmd |= FIELD_PREP(DWI_BL_CMD_TYPE, DWI_BL_CMD_TYPE_SET_BRIGHTNESS);
>> +
>> +	writel(cmd, dwi_bl->base + DWI_BL_CMD);
>> +	writel(DWI_BL_CTL_SEND, dwi_bl->base + DWI_BL_CTL);
>> +
>> +	return 0;
>> +}
>> +
>> +static int dwi_bl_get_brightness(struct backlight_device *bl)
>> +{
>> +	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
>> +
>> +	u32 cmd = readl(dwi_bl->base + DWI_BL_CMD);
>> +
>> +	return FIELD_GET(DWI_BL_CMD_DATA, cmd);
>> +}
>> +
>> +static const struct backlight_ops dwi_bl_ops = {
>> +	.options = BL_CORE_SUSPENDRESUME,
>> +	.get_brightness = dwi_bl_get_brightness,
>> +	.update_status	= dwi_bl_update_status
>> +};
>> +
>> +static int dwi_bl_probe(struct platform_device *dev)
>> +{
>> +	struct apple_dwi_bl *dwi_bl;
>> +	struct backlight_device *bl;
>> +	struct backlight_properties props;
>> +	struct resource *res;
>> +
>> +	dwi_bl = devm_kzalloc(&dev->dev, sizeof(struct apple_dwi_bl), GFP_KERNEL);
> 
> sizeof(*)
> 
>> +	if (!dwi_bl)
>> +		return -ENOMEM;
>> +
>> +	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
>> +	if (!res)
>> +		return -ENXIO;
>> +
>> +	dwi_bl->base = devm_ioremap_resource(&dev->dev, res);
> 
> Use helper for these two, devm_platform_get_and_ioremap_resource() or
> similar.
Ack. Will be fixed for v4.

> 
> Best regards,
> Krzysztof
> 

Nick Chan

