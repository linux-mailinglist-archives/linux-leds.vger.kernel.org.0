Return-Path: <linux-leds+bounces-5287-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 366E7B31024
	for <lists+linux-leds@lfdr.de>; Fri, 22 Aug 2025 09:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2D6F1CE0B14
	for <lists+linux-leds@lfdr.de>; Fri, 22 Aug 2025 07:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0289A2E62DC;
	Fri, 22 Aug 2025 07:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CzrCEgtp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964452E7657
	for <linux-leds@vger.kernel.org>; Fri, 22 Aug 2025 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755847257; cv=none; b=ZkOk1N9wN8+vHCy4TW3mEhgE1crE2eQAx8nYamKzg1V3BN6m9x/zENB0BIPb4PTbPdOqrygjw3LGk4H2P40MnEA8IY2vVsZZAAVEQq9rnZVfHfa8FoLtkxuWM4FbWv/sibsqvB6UqWlwPogAk2VYk7PDC5wn5j3e1TwIDRm8awg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755847257; c=relaxed/simple;
	bh=Wqi2mO2fmQYFGAwZhuS4EvTXv9c8e4vGOynXydsCYEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7VpuqfsU5QMXe7bMLvfgGYXS8KDrCA7lEQdyZotwVSqoL7TjkVTefCD5eK3LIGfNRCOeuFyWaz4g/ZQ+BD9KnusKkFTdEhnBafxrO7TVt64IBbBSirGgAUDs6oOpixZhsdgcj7qEs6Wu4+aHO4eloiuijc3xsgNeCpLYjb4mX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CzrCEgtp; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9e7437908so1194932f8f.3
        for <linux-leds@vger.kernel.org>; Fri, 22 Aug 2025 00:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755847254; x=1756452054; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IvJwbcOsjvAx4Cb95HKEUrId4UgDZ83tfHPDy6XNbLM=;
        b=CzrCEgtpdoGkqnoFgd3BDRMQ2P/eQhCKG4Z0wkSUWcnLPt1vgcTCwf9zdi6p2aBpn8
         VL1Pwp52zWpuBdNhKhgTgRVKmkCSbU/9DNoleP+RBHNhZdW9XSVosePCGKsFvgQR+LL1
         2sDzg3Iub364w8hWEyuPXhF4CYwMK8tiuqW+X2KccwWuE0FHvxLDpAUTwiTYmjv1TwBw
         Rysft3BvN4jEh2qSjaZ97wcE7EMngwGILnucCnRNhJkqgQGxFt6ox/d2oIN1zfzfqahV
         nI4VviJ6iWybgjVU9uI0SzAFZkcToWpjpXmnlJoxSjLuRCgLaOK9IiH52C399oVODUzZ
         jmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755847254; x=1756452054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvJwbcOsjvAx4Cb95HKEUrId4UgDZ83tfHPDy6XNbLM=;
        b=RENSonz61JLPuczAr13KdLIspy4f3VzdkOCvAJ7Oo6r4aE8zgrEZyBjOu7bHkG6Sz0
         4W2foJDqw9zxSr076K1qHMoepgjkr9VYAeHZdb+8TYV0rp6qU3JZpd6pqnfS4od2WWBx
         ifFFhd0C1uema8+ojm+UDhzQW+6coCvliNc10ZGHAhZLf5Lyp9HWzmZCCVuC6kI0gLFs
         +TikJrOifNAimPz0eYQT6HLH8sPAFfAUYoMnd+9FuThKGnsT/Lmc97WtWjJGCUxlLLxy
         I21U1jYNqrdJyh9sOZY83btgy7SbRKf0J0JmBI+EzoHSiSH/iEiwvqN5Rb9IbDHzjfiH
         HUJg==
X-Forwarded-Encrypted: i=1; AJvYcCUH8eUALH3iG3kDOjBvw8Hzldk5PPjx800P4fV6Ozmj7Bi9jnMzgZZRa8UGQY89VaHSja884NAGwPrk@vger.kernel.org
X-Gm-Message-State: AOJu0YzM7Tc27N0uxTekAkMTja/m2NK1aVWNhugPfoOZTz8zszOmVTJL
	BYCsfPittXDJko6uGqtqYNB40jbdRQdDY7FoE0ZYkc97SH2jgt2+5Mpm8UGWxcweBts=
X-Gm-Gg: ASbGncu+eMQayiSOduejrWcc9Q2U+RPqeflSWoWAJ/qaw0IfEO3CDlQqDyMYZpqn+9c
	1itOmusWc5zzGhdY8VziW26gGBwu2yYlHQbpiDw/K6UCWr+WAFobxZ4wtgai/KdmDAHUg4L4eBs
	2O5KOTph5zaOz9KLhkGtcFO69wALbOENZUOKm1wqM/Cj1JWpgBckWH2Ba0VbXIypBXcU9y2cbSh
	L8VLanF5R0IQZdzfHlAm7MgesRClq3bq/xM1gjsR5JnZMGA0SXWl5913hm+cx7CXRq5eeyh8q6L
	d01HOldpZaMA2pJJE1bKFWhRsBpA36fLClkeeilCxCBUjFEoUwz//c/EIze0oMqPTa5ZxG1tI+y
	rwXlgEB4SiSy1ag8LixxFFRNei7cBtUw2kg3oSdXf9eF+xLRefNHh1hXW1Lrx/YlXf28W3kM6Ax
	harze42A==
X-Google-Smtp-Source: AGHT+IFLbHL5Jfp1HiEMgBzb/cWVZllJl0fqqVCyRz90kU9u6d+rKWlXzqxgMmKXZyGMMiOGZn0oyA==
X-Received: by 2002:a5d:5f4e:0:b0:3c0:7e02:67b9 with SMTP id ffacd0b85a97d-3c5dcefeda4mr1234311f8f.61.1755847253747;
        Fri, 22 Aug 2025 00:20:53 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077c576b7sm14060427f8f.63.2025.08.22.00.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 00:20:53 -0700 (PDT)
Date: Fri, 22 Aug 2025 08:20:50 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	MaudSpieringsmaudspierings@gocontroll.com
Subject: Re: [PATCH v2 2/4] backlight: add max25014atg backlight
Message-ID: <aKgaUtcNoOsga6l7@aspen.lan>
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
 <20250819-max25014-v2-2-5fd7aeb141ea@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-max25014-v2-2-5fd7aeb141ea@gocontroll.com>

On Tue, Aug 19, 2025 at 12:59:00PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.
>
> Signed-off-by: Maud Spierings maudspierings@gocontroll.com

Looking good but still a few small comments (below).


> diff --git a/drivers/video/backlight/max25014.c b/drivers/video/backlight/max25014.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..fe5e0615cf6d151868b56ebb9544b175b09dfcee
> --- /dev/null
> +++ b/drivers/video/backlight/max25014.c
> @@ -0,0 +1,395 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Backlight driver for Maxim MAX25014
> + *
> + * Copyright (C) 2025 GOcontroll B.V.
> + * Author: Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#define MAX25014_ISET_DEFAULT_100 11
> +#define MAX_BRIGHTNESS (100)
> +#define MIN_BRIGHTNESS (0)
> +#define TON_MAX (130720) /* @153Hz */
> +#define TON_STEP (1307) /* @153Hz */
> +#define TON_MIN (0)
> +
> +#define MAX25014_DEV_ID         (0x00)
> +#define MAX25014_REV_ID         (0x01)
> +#define MAX25014_ISET           (0x02)
> +#define MAX25014_IMODE          (0x03)
> +#define MAX25014_TON1H          (0x04)
> +#define MAX25014_TON1L          (0x05)
> +#define MAX25014_TON2H          (0x06)
> +#define MAX25014_TON2L          (0x07)
> +#define MAX25014_TON3H          (0x08)
> +#define MAX25014_TON3L          (0x09)
> +#define MAX25014_TON4H          (0x0A)
> +#define MAX25014_TON4L          (0x0B)
> +#define MAX25014_TON_1_4_LSB    (0x0C)
> +#define MAX25014_SETTING        (0x12)
> +#define MAX25014_DISABLE        (0x13)
> +#define MAX25014_BSTMON         (0x14)
> +#define MAX25014_IOUT1          (0x15)
> +#define MAX25014_IOUT2          (0x16)
> +#define MAX25014_IOUT3          (0x17)
> +#define MAX25014_IOUT4          (0x18)
> +#define MAX25014_OPEN           (0x1B)
> +#define MAX25014_SHORT_GND      (0x1C)
> +#define MAX25014_SHORT_LED      (0x1D)
> +#define MAX25014_MASK           (0x1E)
> +#define MAX25014_DIAG           (0x1F)

There is no need to put raw numbers in brackets.


> +
> +#define MAX25014_IMODE_HDIM     BIT(2)
> +#define MAX25014_ISET_ENABLE    BIT(5)
> +#define MAX25014_ISET_PSEN      BIT(4)
> +#define MAX25014_DIAG_HW_RST    BIT(2)
> +#define MAX25014_SETTING_FPWM   GENMASK(6, 4)
> +
> +struct max25014 {
> +	struct i2c_client *client;
> +	struct backlight_device *bl;
> +	struct regmap *regmap;
> +	struct max25014_platform_data *pdata;

This appears to be unused.


> +	struct gpio_desc *enable;
> +	struct regulator *vin; /* regulator for boost converter Vin rail */
> +	uint32_t initial_brightness;

It is important to keep the initial_brightness for the lifetime of the
driver?

> +	uint32_t iset;
> +	uint8_t strings_mask;
> +};
> +


Daniel.

