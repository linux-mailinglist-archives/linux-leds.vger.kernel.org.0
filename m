Return-Path: <linux-leds+bounces-3747-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D872EA07C86
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jan 2025 16:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EA97188C38D
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jan 2025 15:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8D721D5BD;
	Thu,  9 Jan 2025 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFVMxILX"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6462D2185B3;
	Thu,  9 Jan 2025 15:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736437983; cv=none; b=VbaDOZWzpalN7QqYuDqnaHulCwWNFCT4TAXM0GpN6HbLgIqt43326O1jnpxJva/5LJ11EFcd8q7VEW2E1ksfIFpztMbhMToW29cErGs0Qf5ObDowMYEV7gf+maRocwZ40Ea++BdUZRyeQeIOLshyIbEUg1HcgOLmf3R9XaJF8IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736437983; c=relaxed/simple;
	bh=8o974i+x1r6BuA58so3JnbqP3rd68UaZm2Od16lBMGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8K5QjKnBY5fHLq2UIesI8RAcduQRSWhqEDO7v11LBPDB8iqZA3ZXfIE8IivbelOvl+25uy3/YMv67ht4A6SZOAQ42eAX1HkkYGoIdPR9kRah/prX+X4aBzedGGGgvuKwUKtOVWRKQ2BdlFoTfpN0GIexQ+94r5aqBfh0vsuj/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFVMxILX; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2165cb60719so19433565ad.0;
        Thu, 09 Jan 2025 07:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736437982; x=1737042782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yLjaNLw0xnbIzxsGtzqJhd8aEd4Ru1RCayYPC8m3MbY=;
        b=WFVMxILX/ganw5kHxsmxP6CHzkXz7XtIuoYGnxVj3Rn44o3XzSkTlmeh+e5znGnG3a
         IHiEW1PYVjq12ghtQfcQbHNAisXIlLn5akZs+613oL+7HLZ5vF6tGgAoB39iK0ZO9ROk
         12qFBsptEdwrbtxmwuNX7kQ3LazwKr6rpU1KFl7HxpXrrFbLicX2ZVTWsarau2EoKyVa
         B7ITSGAavThthdtRQOZyvLQogja5V+irkoRVkYQSqDmFi/CtfDXbkRNEel7ikLHoSgqo
         5qmB8ctLzeS9xguALfUBOKYqY00vYEzpoq1VVrBQH5YCfjz2QOjGaXgLTvHNtLpwKsVm
         7XRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437982; x=1737042782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLjaNLw0xnbIzxsGtzqJhd8aEd4Ru1RCayYPC8m3MbY=;
        b=cvDAq/9JzsxKqvJGbOaHBtK6TLJQJYma4Pgifr92l/WRvon/1pQdZCWwzy3x4U/SWp
         oJico1Hw0N8lx8mmGo5LAnWjw/828EITpUhBFpCPQlyNeuw4IK+WyUc1qlmlLAYrGZD1
         uxhCFC4htuHUH9nosDEWXEwOLfHm6ZhsGyEIfO3j7jFlTbACFz47zOdVTtdKc4wplgxB
         ++Yq+f138xXJfxyTT4EHFySBnZydrRHBd42EDG1QNKTLo/pfHtWuKPxTdaa37j1UitXd
         MHq++oOoDJq2J7dQYmOy/pMezg+W3VgtqD0UtND0Vz9wgROdMVEpAB4l2iJ1dJeWeCGG
         09Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUN0rusck2yMdwK+ufrZHPdeaNBg+35NOW6AmBKgLhQIWlOcp/2YgQc1VXekt3WgW4uwe02Vv7V5lufwQ==@vger.kernel.org, AJvYcCUT4JvsUlQ+1YCzC32MzJtMjykZAcJQXvhgMtSu9UEB6jj5KOtRtmEyQ7i/KJk81F9JPehphzY4X5iB@vger.kernel.org, AJvYcCUkEHNsYJ2m7/XVnZesrH3Xx/cXadCG2wKhUfvXwoxPD/Mz9OXgmv9EWin/E/G1Toph05nMAje6713uuLDd@vger.kernel.org, AJvYcCWGF9KLR9QQnuebF3Nh2NMz1pYU3QJRCHG1bccO8uFW+9DizZKPSoHmWCSKhV6CTeNyrr4gLpGJIphUo34=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQAydYOyrhngZdnk+rhVDC3uHm681ncYglrLN8x6TD2tRJXq6A
	8z7cyp4dLqd2aFBtWKwyTm9u18avG55s/Mqq8nUxW2qrppGubJ4x
X-Gm-Gg: ASbGncv+tDCfuiteeUlsq8EqI93TEDenjlWtBcirKPxKEJmSAYtM7sbuaRvn0g4ZyAY
	oIG3beN4SyRQlbBghxdb2L9pV1GRCjhJpoB9zisu3bQkc/1rYyiEBryrdSUd1DAeqDc8knSgbyK
	nSZjKLnvpHKrHFq7iafe9swz2386fSM0ax2aMtNLUjCI0pkXZgpD5RHhpPpTiiTytjDlOPwHkGA
	rwYKmL28u0LYWXeekRGTtsw9xdTv8UDARjwYlGgBkOCmjkOO81W4eWxPDTxnLw1OEKnrkDi9As=
X-Google-Smtp-Source: AGHT+IHDn1Y3xt05c3sartTSXwHA9erKjixGfU399kRuKIVN2pSlgvUAIoFBG/VDgJvH9iN34Uy6+g==
X-Received: by 2002:a17:903:1248:b0:216:2dc5:2330 with SMTP id d9443c01a7336-21a83fd2400mr106271905ad.36.1736437981642;
        Thu, 09 Jan 2025 07:53:01 -0800 (PST)
Received: from [192.168.0.101] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a91768ca2sm14337555ad.45.2025.01.09.07.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 07:53:01 -0800 (PST)
Message-ID: <ad3cbf5a-6322-4256-9284-f739d4c3aa45@gmail.com>
Date: Thu, 9 Jan 2025 23:52:56 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241211113512.19009-1-towinchenmi@gmail.com>
 <20241211113512.19009-3-towinchenmi@gmail.com> <Z35Y9rzS6tLVgsRo@aspen.lan>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <Z35Y9rzS6tLVgsRo@aspen.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Daniel Thompson 於 2025/1/8 下晝6:52 寫道:
> On Wed, Dec 11, 2024 at 07:34:38PM +0800, Nick Chan wrote:
>> Add driver for backlight controllers attached via Apple DWI 2-wire
>> interface, which is found on some Apple iPhones, iPads and iPod touches
>> with a LCD display.
>>
>> Although there is an existing apple_bl driver, it is for backlight
>> controllers on Intel Macs attached via PCI, which is completely different
>> from the Samsung-derived DWI block.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  drivers/video/backlight/Kconfig  |  12 +++
>>  drivers/video/backlight/Makefile |   1 +
>>  drivers/video/backlight/dwi_bl.c | 122 +++++++++++++++++++++++++++++++
> I'd rather this was called apple_dwi_bl.c to match that config options,
> etc.
Still trying to determine the type of the backlight control, I think it is linear however and I will send a new
version when I am more certain.


>
>> diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
>> new file mode 100644
>> index 000000000000..59e5cad0fbd8
>> --- /dev/null
>> +++ b/drivers/video/backlight/dwi_bl.c
>> @@ -0,0 +1,122 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Driver for backlight controllers attached via Apple DWI 2-wire interface
>> + *
>> + * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
>> + */
>> +
>> +#include <linux/backlight.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/device.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
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
>> +	dwi_bl = devm_kzalloc(&dev->dev, sizeof(*dwi_bl), GFP_KERNEL);
>> +	if (!dwi_bl)
>> +		return -ENOMEM;
>> +
>> +	dwi_bl->base = devm_platform_get_and_ioremap_resource(dev, 0, &res);
>> +	if (IS_ERR(dwi_bl->base))
>> +		return PTR_ERR(dwi_bl->base);
>> +
>> +	memset(&props, 0, sizeof(struct backlight_properties));
>> +	props.type = BACKLIGHT_RAW;
>> +	props.max_brightness = DWI_BL_MAX_BRIGHTNESS;
> There should be something to indicate whether the backlight controls are
> linear or logarithmic here.
>
>
>> +static struct platform_driver dwi_bl_driver = {
>> +	.driver		= {
>> +		.name	= "dwi-bl",
> Again, I'd rather see apple here too (although, to be clear, I'm
> perfectly happy with all the static functions and variables being
> prefixed only with dwi_bl).
Alright, I will rename the file and and the name of the driver to have apple, the functions
and variables will still not have apple though to not make the lines too long.


>
>
> Daniel.

