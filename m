Return-Path: <linux-leds+bounces-8850-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vkpWKbWMRmqUYQsAu9opvQ
	(envelope-from <linux-leds+bounces-8850-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 18:07:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2016F9EBC
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 18:07:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=tsV5SVtQ;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8850-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8850-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C608C3028C5F
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 16:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB5D30C366;
	Thu,  2 Jul 2026 16:01:23 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6789A30C354
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 16:01:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008083; cv=none; b=DqIvbSjBR9FDNwS13O00263pzITZCSNOJlgdGuwc6apiK8kfF/xfx20blDJIvQJ8jajrVJ3JXGt6wG7wlWl32JPnlmvl8wgResQOQof7Gna3F8Na5S/9DISUrvqwuzNWN+qR0AGYLztUGme1im5+GgKkh7I2NXe3B90YXkml/S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008083; c=relaxed/simple;
	bh=Wi7FTA7/FWqXYIGy0SyezV0+LAlg4PCtYmH5TCN9lNQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LQRgLku5q0miLPa9N/he5593V+35cTul9LZJ0rmjChg5K9QhafZIPL8z1iqgmdnJ2tZ8UCPuUOeTPSzct3fyJLKJqyVA+z2rmBgAH7B+PQRhZyiQAwnuTopruxbeFvzq3hLyDNvV8yYDLxYYAZYUgLEDuaWazybHlwHFH22vQmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tsV5SVtQ; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-470174001a0so1471229f8f.0
        for <linux-leds@vger.kernel.org>; Thu, 02 Jul 2026 09:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783008080; x=1783612880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyBy6M8pfJIet42O2HWF6w856c4etTz6bW2vlxGM7bE=;
        b=tsV5SVtQgNldWwlVG8r3fEvrzerNKDY/ewiq+4+ro2hxuG/WzQ/55ZekIPZT/YoUR4
         RJNWna5LjvBMfEwW7KJlDnuno97SvJmFgxXvcRurLg8KgTVAuf+DJpe3EE70CJ4YsbNe
         CmvEefleOEpJj3DxMiO9/JDe8FhL9ygPy3DeaMnJX9UPnxzgUUGe6WKsRYvGv5+MQu2Q
         eAOsINE6YlEtpo2IrPdO1m8qNmCvLBl+aGy4SmnFz3F6/2OmdlohM6XTZPbjNJkVhUzw
         y/rKmBAWTJdOyrngcmj8fc2FolzzCqPT9vPULGwA6IqLKGv7FyvBMp0RpHmZ2a2b1BxE
         IWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783008080; x=1783612880;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hyBy6M8pfJIet42O2HWF6w856c4etTz6bW2vlxGM7bE=;
        b=GLSrpcicTOEfEMPVZOGNpIYfBz4h3EV/4rjwBhlJribS42Hc+Ytd+p1NTJ6RL7DAcW
         fsJxO32FPYL8WLx2WrGXrViglWJmS6ezU8MqXeQS974Ix/C645GCK77ZHkcRanI/571R
         JZwSKDyfCtBxC1MEgTh+3d9FsNSYVfZy++lHUv9lnGa7LVtUi0vqDNTw8fBrAj71nSxp
         7LugYIG4I/vtQRTq3LHAubWa9sndfRyE7EIqLgonmeIpfh0hkHUI7hUYd375F7miIL4X
         21BYzlwUmcK7AqI+CCIoVeeazpzTF2FgK+P8IIDlTt+2uaQmz6uwxrxF6GlwbEmg0wpi
         bETQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpc2eQtPtFzq3ZHr9ngIN9CIAoCfUMTHCQtFIJvtn6MrR0S5mzp2rqz4R4egtXlYyoUwXQ91TMK5Gr6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6aNRzlbcm+qwSesY/VEULlYCNNHxevzC/ZbXdnM1vzB22DkHn
	pGmHQaLfIHjAcVqSo6v8FzMaEBK7H7ZygDPmPX8/H2Da+ehLBd3OGfvHWylKvgVS6a0=
X-Gm-Gg: AfdE7cmChb0IDmZh/yKsZMzaeG/v5nLRTxNF6QJsXtqoKOCxxv3VHLDAfOsCzlV0vJr
	VNukewXFm9Ldluzkxl6IaRB1JGqARFYiLcC4aeuKcvN9T0Ly0NFwvZ9oW0W9fSDD52M/ZEM53iS
	FomaJUSSnau4pt3SF2aaGJ0xckke1EdjdVbpl8cj7fA9g9gjUyw+50XWVx9wtP18d4LMzFGHTZZ
	Jp1GYMV2Qze0EmB2LdguSZmTVnhbYa7Qg2v75nx4JZ4oD5mQT599FqkYyT4hD34LEGletKxNuQn
	QaKFK5TDH7hU/ZdLd2j5Q/gjjCZXB6jKn3CtuOF2ohzGEXyYgphI5LYBlwvphe6rD/PLgwNHD6v
	aIdTz4xnLatmVkvpo5JZhTnT06iv4Ix5dFBW69TtRbVQE4y/1rhzg6KbV75gA3uwyi8Jmxd6wKx
	0t746aZZ6QrF8Qv/B1C+CFEFCJxP7xCURPYvr8eLEpiAfyePhl+SOcAikX1qLX/0WJkAlL
X-Received: by 2002:a05:6000:2c0d:b0:460:3234:4472 with SMTP id ffacd0b85a97d-477b5487cb9mr8516113f8f.40.1783008079349;
        Thu, 02 Jul 2026 09:01:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:bbc2:d1c5:84fa:44fb? ([2a01:e0a:106d:1080:bbc2:d1c5:84fa:44fb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4b73sm10118644f8f.15.2026.07.02.09.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 09:01:17 -0700 (PDT)
Message-ID: <a3c69349-2be8-486e-adba-55df32c291db@linaro.org>
Date: Thu, 2 Jul 2026 18:01:14 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 2/2] backlight: Add SY7758 6-channel High Efficiency
 LED Driver support
To: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
References: <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-0-03aacd49747c@linaro.org>
 <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-2-03aacd49747c@linaro.org>
 <20260702155157.GX2108533@google.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260702155157.GX2108533@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,lists.freedesktop.org,vger.kernel.org,outlook.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8850-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:from_mime,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:deller@gmx.de,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F2016F9EBC

Hi Lee,

On 7/2/26 17:51, Lee Jones wrote:
> Please consider these:
> 
> /* Sashiko Automation: Issues Found (4 Findings) */
> 
> On Fri, 29 May 2026, Neil Armstrong wrote:
> 
>> From: KancyJoe <kancy2333@outlook.com>
>>
>> Implement support for the Silergy SY7758 6-channel High Efficiency LED
>> Driver used for backlight brightness control in the Ayaneo Pocket S2
>> dual-DSI panel.
>>
>> Signed-off-by: KancyJoe <kancy2333@outlook.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/video/backlight/Kconfig  |   8 ++
>>   drivers/video/backlight/Makefile |   1 +
>>   drivers/video/backlight/sy7758.c | 259 +++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 268 insertions(+)
>>
>> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
>> index a7a3fbaf7c29..a1f70a2bae99 100644
>> --- a/drivers/video/backlight/Kconfig
>> +++ b/drivers/video/backlight/Kconfig
>> @@ -207,6 +207,14 @@ config BACKLIGHT_KTZ8866
>>   		Say Y to enable the backlight driver for the Kinetic KTZ8866
>>   		found in Xiaomi Mi Pad 5 series.
>>   
>> +config BACKLIGHT_SY7758
>> +	tristate "Backlight Driver for Silergy SY7758"
>> +	depends on I2C
>> +	select REGMAP_I2C
>> +	help
>> +	  Say Y to enable the backlight driver for the Silergy SY7758
>> +	  backlight controller found in Ayaneo Pocket S2.
>> +
>>   config BACKLIGHT_LM3533
>>   	tristate "Backlight Driver for LM3533"
>>   	depends on MFD_LM3533
>> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
>> index 794820a98ed4..39ef588b1cf2 100644
>> --- a/drivers/video/backlight/Makefile
>> +++ b/drivers/video/backlight/Makefile
>> @@ -56,6 +56,7 @@ obj-$(CONFIG_BACKLIGHT_PWM)		+= pwm_bl.o
>>   obj-$(CONFIG_BACKLIGHT_QCOM_WLED)	+= qcom-wled.o
>>   obj-$(CONFIG_BACKLIGHT_RT4831)		+= rt4831-backlight.o
>>   obj-$(CONFIG_BACKLIGHT_SAHARA)		+= kb3886_bl.o
>> +obj-$(CONFIG_BACKLIGHT_SY7758)		+= sy7758.o
>>   obj-$(CONFIG_BACKLIGHT_SKY81452)	+= sky81452-backlight.o
>>   obj-$(CONFIG_BACKLIGHT_TPS65217)	+= tps65217_bl.o
>>   obj-$(CONFIG_BACKLIGHT_WM831X)		+= wm831x_bl.o
>> diff --git a/drivers/video/backlight/sy7758.c b/drivers/video/backlight/sy7758.c
>> new file mode 100644
>> index 000000000000..786589cb8df9
>> --- /dev/null
>> +++ b/drivers/video/backlight/sy7758.c
>> @@ -0,0 +1,259 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Silergy SY7758 6-channel High Efficiency LED Driver
>> + *
>> + * Copyright (C) 2025 Kancy Joe <kancy2333@outlook.com>
>> + * Copyright (C) 2026 Linaro Limited
>> + * Author: Neil Armstrong <neil.armstrong@linaro.org>
>> + */
>> +#include <linux/backlight.h>
>> +#include <linux/module.h>
>> +#include <linux/i2c.h>
>> +#include <linux/of.h>
>> +#include <linux/err.h>
>> +#include <linux/bits.h>
>> +#include <linux/delay.h>
>> +#include <linux/regmap.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/regulator/consumer.h>
>> +
>> +#define DEFAULT_BRIGHTNESS	1024
>> +#define MAX_BRIGHTNESS		4080
>> +#define REG_MAX			0xAE
>> +
>> +/* Registers */
>> +#define REG_DEV_CTL		0x01
>> +#define REG_DEV_ID		0x03
>> +#define REG_BRT_12BIT_L		0x10
>> +#define REG_BRT_12BIT_H		0x11
>> +
>> +/* OTP memory */
>> +#define REG_OTP_CFG0		0xA0
>> +#define REG_OTP_CFG1		0xA1
>> +#define REG_OTP_CFG2		0xA2
>> +#define REG_OTP_CFG5		0xA5
>> +#define REG_OTP_CFG9		0xA9
>> +
>> +/* Fields */
>> +#define BIT_DEV_CTL_FAST	BIT(7)
>> +#define MSK_DEV_CTL_BRT_MODE	GENMASK(2, 1)
>> +#define BIT_DEV_CTL_BL_CTLB	BIT(0)
>> +
>> +#define MSK_BRT_12BIT_L		GENMASK(7, 0)
>> +#define MSK_BRT_12BIT_H		GENMASK(3, 0)
>> +
>> +#define MSK_CFG0_CURRENT_LOW	GENMASK(7, 0)
>> +
>> +#define BIT_CFG1_PDET_STDBY	BIT(7)
>> +#define MSK_CFG1_CURRENT_MAX	GENMASK(6, 4)
>> +#define MSK_CFG1_CURRENT_HIGH	GENMASK(3, 0)
>> +
>> +#define BIT_CFG2_UVLO_EN	BIT(5)
>> +#define BIT_CFG2_UVLO_TH	BIT(4)
>> +#define BIT_CFG2_BL_ON		BIT(3)
>> +#define BIT_CFG2_ISET_EN	BIT(2)
>> +#define BIT_CFG2_BST_ESET_EN	BIT(1)
>> +
>> +#define BIT_CFG5_PWM_DIRECT	BIT(7)
>> +#define MSK_CFG5_PS_MODE	GENMASK(6, 4)
>> +#define MSK_CFG5_PWM_FREQ	GENMASK(3, 0)
>> +
>> +#define MSK_CFG9_VBST_MAX	GENMASK(7, 5)
>> +#define BIT_CFG9_JUMP_EN	BIT(4)
>> +#define MSK_CFG9_JUMP_TH	GENMASK(3, 2)
>> +#define MSK_CFG9_JUMP_VOLTAGE	GENMASK(1, 0)
>> +
>> +struct sy7758 {
>> +	struct i2c_client *client;
>> +	struct regmap *regmap;
>> +	struct gpio_desc *gpio;
>> +	struct backlight_device *bl;
>> +};
>> +
>> +static const struct regmap_config sy7758_regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +	.max_register = REG_MAX,
>> +};
>> +
>> +static int sy7758_backlight_update_status(struct backlight_device *backlight_dev)
>> +{
>> +	struct sy7758 *sydev = bl_get_data(backlight_dev);
>> +	unsigned int brightness = backlight_get_brightness(backlight_dev);
>> +	int ret;
>> +
>> +	ret = regmap_write(sydev->regmap, REG_BRT_12BIT_L,
>> +			   FIELD_PREP(MSK_BRT_12BIT_L,
>> +				      brightness & 0xff));
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(sydev->regmap, REG_BRT_12BIT_H,
>> +			   FIELD_PREP(MSK_BRT_12BIT_H,
>> +				      (brightness >> 8) & 0xf));
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct backlight_ops sy7758_backlight_ops = {
>> +	.options = BL_CORE_SUSPENDRESUME,
>> +	.update_status = sy7758_backlight_update_status,
>> +};
> 
> [Severity: High]
> This driver sets the BL_CORE_SUSPENDRESUME option, which relies on the
> backlight core to blank and unblank the brightness on suspend and resume.
> However, if the system's power management cuts power to the vdd regulator
> during suspend, won't the device lose all the configuration state established
> in sy7758_init()?

This will never happen, if we don't disable the regulators they will stay on during system suspend.

> 
> Because there are no standard pm_ops to re-apply this initialization sequence
> upon resume, it seems the backlight might operate with incorrect parameters or
> fail to turn on. Should this driver implement a resume callback to restore the
> volatile hardware configuration?
> 
> 
> 
>> +
>> +static int sy7758_init(struct sy7758 *sydev)
>> +{
>> +	int ret = 0;
>> +
>> +	ret = regmap_write(sydev->regmap, REG_DEV_CTL,
>> +			   BIT_DEV_CTL_FAST | BIT_DEV_CTL_BL_CTLB |
>> +			   FIELD_PREP(MSK_DEV_CTL_BRT_MODE, 2));
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(sydev->regmap, REG_BRT_12BIT_L,
>> +			   FIELD_PREP(MSK_BRT_12BIT_L,
>> +				      DEFAULT_BRIGHTNESS & 0xff));
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(sydev->regmap, REG_BRT_12BIT_H,
>> +			   FIELD_PREP(MSK_BRT_12BIT_H,
>> +				      (DEFAULT_BRIGHTNESS >> 8)));
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(sydev->regmap, REG_OTP_CFG5,
>> +			   FIELD_PREP(MSK_CFG5_PS_MODE, 6) |
>> +			   FIELD_PREP(MSK_CFG5_PWM_FREQ, 4));
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(sydev->regmap, REG_OTP_CFG0,
>> +			   FIELD_PREP(MSK_CFG0_CURRENT_LOW, 85));
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(sydev->regmap, REG_OTP_CFG1,
>> +			   BIT_CFG1_PDET_STDBY |
>> +			   FIELD_PREP(MSK_CFG1_CURRENT_MAX, 1) |
>> +			   FIELD_PREP(MSK_CFG1_CURRENT_HIGH, 10));
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(sydev->regmap, REG_OTP_CFG9,
>> +			   FIELD_PREP(MSK_CFG9_VBST_MAX, 4));
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(sydev->regmap, REG_OTP_CFG2,
>> +			   BIT_CFG2_BL_ON | BIT_CFG2_UVLO_EN);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int sy7758_probe(struct i2c_client *client)
>> +{
>> +	struct backlight_properties props = { };
>> +	struct device *dev = &client->dev;
>> +	struct sy7758 *sydev;
>> +	unsigned int dev_id;
>> +	int ret;
>> +
>> +	sydev = devm_kzalloc(dev, sizeof(*sydev), GFP_KERNEL);
>> +	if (!sydev)
>> +		return -ENOMEM;
>> +
>> +	i2c_set_clientdata(client, sydev);
>> +
>> +	/* Initialize regmap */
>> +	sydev->client = client;
>> +	sydev->regmap = devm_regmap_init_i2c(client, &sy7758_regmap_config);
>> +	if (IS_ERR(sydev->regmap))
>> +		return dev_err_probe(dev, PTR_ERR(sydev->regmap),
>> +				     "failed to init regmap\n");
>> +
>> +	/* Get and enable regulator */
>> +	ret = devm_regulator_get_enable(dev, "vdd");
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to get regulator\n");
>> +
>> +	fsleep(100);
>> +
>> +	/* Get enable GPIO and set to high */
>> +	sydev->gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(sydev->gpio))
>> +		return dev_err_probe(dev, PTR_ERR(sydev->gpio),
>> +				     "failed to get enable GPIO\n");
> 
> [Severity: Medium]
> Is it possible for the enable pin to be hardwired to a power rail on some
> hardware designs? Using devm_gpiod_get() makes this GPIO strictly mandatory
> and fails the probe if the enable-gpios property is absent in the Device Tree.
> Would devm_gpiod_get_optional() be more appropriate here?
> 

This makes no sense, the enable gpio is required per the spec, and is required in the bindings.

> 
> [Severity: High]
> The enable GPIO is asserted high here, but is there a mechanism to ensure it
> is explicitly driven low during driver removal or if the probe fails later?

This is not an issue, the enable is required to be high when operating the IC
which depends on vdd to be on. No need to put it back.

> 
> If devres automatically disables the vdd regulator while the host is still
> driving the GPIO high, couldn't this back-power the chip through its internal
> ESD protection diodes and cause hardware damage? Using
> devm_add_action_or_reset() to drive the GPIO low before the regulator is
> disabled might prevent this.

No, spec says this won't happen and is safe.

> 
> 
> 
>> +
>> +	/* Let some time for HW to settle */
>> +	fsleep(10000);
>> +
>> +	/* try read and check device id */
>> +	ret = regmap_read(sydev->regmap, REG_DEV_ID, &dev_id);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "failed to read device id\n");
>> +	if (dev_id != 0x63) {
>> +		dev_err(dev, "unexpected device id: 0x%02x\n", dev_id);
>> +		return -ENODEV;
>> +	}
>> +
>> +	/* Initialize and set default brightness */
>> +	ret = sy7758_init(sydev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	props.type = BACKLIGHT_RAW;
>> +	props.max_brightness = MAX_BRIGHTNESS;
>> +	props.brightness = DEFAULT_BRIGHTNESS;
>> +	props.scale = BACKLIGHT_SCALE_LINEAR;
>> +
>> +	sydev->bl = devm_backlight_device_register(dev, "sy7758-backlight",
>> +						   dev, sydev, &sy7758_backlight_ops,
>> +						   &props);
>> +	if (IS_ERR(sydev->bl))
>> +		return dev_err_probe(dev, PTR_ERR(sydev->bl),
>> +				     "failed to register backlight device\n");
>> +
>> +	return backlight_update_status(sydev->bl);
>> +}
>> +
>> +static void sy7758_remove(struct i2c_client *client)
>> +{
>> +	struct sy7758 *sydev = i2c_get_clientdata(client);
>> +
>> +	backlight_disable(sydev->bl);
>> +}
> 
> [Severity: Medium]
> Since the backlight was registered using devm_backlight_device_register(),
> devres will unregister the sysfs interface after sy7758_remove() returns.

this will never happen.

> 
> Does this leave a race window where userspace could concurrently write to the
> sysfs brightness file and re-enable the hardware right after
> backlight_disable() turns it off?
> 
>> +
>> +static const struct i2c_device_id sy7758_ids[] = {
>> +	{ "sy7758" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(i2c, sy7758_ids);
>> +
>> +static const struct of_device_id sy7758_match_table[] = {
>> +	{ .compatible = "silergy,sy7758", },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, sy7758_match_table);
>> +
>> +static struct i2c_driver sy7758_driver = {
>> +	.driver = {
>> +		.name = "sy7758",
>> +		.of_match_table = sy7758_match_table,
>> +	},
>> +	.probe = sy7758_probe,
>> +	.remove = sy7758_remove,
>> +	.id_table = sy7758_ids,
>> +};
>> +
>> +module_i2c_driver(sy7758_driver);
>> +
>> +MODULE_DESCRIPTION("Silergy SY7758 Backlight Driver");
>> +MODULE_AUTHOR("Kancy Joe <kancy2333@outlook.com>");
>> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
>> +MODULE_LICENSE("GPL");
>>
>> -- 
>> 2.34.1
>>
> 

Thanks,
Neil

