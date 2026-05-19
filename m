Return-Path: <linux-leds+bounces-8202-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJQ0GAYeDGpJWQUAu9opvQ
	(envelope-from <linux-leds+bounces-8202-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 10:23:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A6033579EF7
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 10:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 74A5630727A5
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 08:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406213E1225;
	Tue, 19 May 2026 08:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p0S7z2rH"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FDC3E121B
	for <linux-leds@vger.kernel.org>; Tue, 19 May 2026 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178451; cv=none; b=OuI+OkLRVKcs5zLFBxpouReOASCwNUyYrAi1uFDleaEtfxOLmd2/odcEcWxRcsZVKRDOH8T9L54Glhkx1KuixCLbBtjcqViGxTKv1P03wstgwiDoFgCTVB5LauW8ZJ4yqWe7Ch4LCl5Nl+4Vi5UJB/wQp1HvijrbuLcwM5z2dyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178451; c=relaxed/simple;
	bh=dWLZe7QiX/lxLNJ9otbW4tMkazrMFLCdXjJlemEBlwE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oiaPUxDoXTldgdyE3XZdTYBLAegWjNySL+y7NE8IElBVTB2Hni0myIzgZviUz3U9mMgdgTnQBybBCzCo0is0imU9ZHMMLDafrjM+KUVcyF0IQHXEFKVcyONqadwLBmxHoTthz7HfVNzlNZpTUR6ClZ2TE8TAUtADHXOkaOGdcc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p0S7z2rH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48ff4f8ef0dso36408185e9.3
        for <linux-leds@vger.kernel.org>; Tue, 19 May 2026 01:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779178447; x=1779783247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vTT0TEmFoUeONXI3O0UhC63GEEGa26mb7fZ2wgQ6t/A=;
        b=p0S7z2rHYfLMg5v1g8NyX7YB6Dji3dP34clONs9LA2P3KE1RdSG0L8Jo7mPUPhpl/G
         Cy7b8+zwIUozhNbAUgg98W3ktKenLgSiDBbFrbcDIz21VJtaPUd4/rx7lSN/IXrHS3JY
         TKw4o6dYrHBB7lgMXN/oN8d3/aBV6kaPRmMWjITGuqhcIpelW4/OVmPM0K4YUgIi2cMp
         lvfN8ThVoqWkWhaTv6HiP8H6xTa/UXVOQO8ixf7Se4kAC6Atdxzr3FK1jZbKvETlaHJt
         sS22a1J5GEogMgvPlJ0ngqbAItMJWwW27avG97YE3PF0CjtfQWEeWSlzvcjDm/tfli1O
         0f8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779178447; x=1779783247;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTT0TEmFoUeONXI3O0UhC63GEEGa26mb7fZ2wgQ6t/A=;
        b=bj6PBldqpKEp3XtGhzVEvUuD47Bb4vGrshlKfCARA+v4R2q5kkJyEC2vjTnF4tIGXL
         uvnixepZQOt7L3kXUgzvwuiXT93i8By8UFLMokMbBir+kXn6bLNd9vLKZXnEKVnRg32I
         YjCpS5qfVVT84vOmD5dmyotzP2sqnzsPOenRCC7qusZ2BM6It9Rl3I4cHdpHvuIj3Ela
         Qb3FLPUZBLWzr2uF+aSxsG7OGfomakte7+lahnbEuOsBT3++LPQfXUtNRNRS4F/czN+e
         EnVxLOBlx64OHdu80dhq8+ddaA35Za+tN23WxTgCki20QqqHsX91OmLgBMOCKPTpymlp
         7qCg==
X-Forwarded-Encrypted: i=1; AFNElJ8P+TavzwgTzy1RG3EI3DPPvb3cWnnZC8hax3p/oCOqRkZ+2Y3krV3tlOhtZk2d06PQmPBwCZLSSOkU@vger.kernel.org
X-Gm-Message-State: AOJu0YxlXHy3vF5uJ2A5Q/Cf0ngPQ6bYEWIxbbZ2SuvvGDyY/tEh3tmZ
	8ymt/BuXpd2PfEbn96D5grEwB7n8phDrxkjgZMsBhfH0GzDmgK2LkrRLG10LGmfW+TE=
X-Gm-Gg: Acq92OFqiSUGwjG3jy01JYmMQSRXA89Tzbb4mlBeLnEAuRgVukkzecEG5hn+mBGEJZ9
	eCV+vAwWj4mjx3b2WtgxOrbgoFlJJzM9bIwtHvk6xXELPQtQzg4ZDUhUIQlTh+j9o41OV7G1Vib
	/h3NLslZiWnCDZDo/bs4IVBGxJv2B6jb4DS04Vtn/oivG6A2yWznPe8jgUQrEHKMPddnImfGVx5
	6jx3wSEDdwE7/GiWpm1BBtRtrNBkoSUwdMi0xxhleshRfak47ChisomuH/f1aA7n1SELZIQwock
	BAoZcu8qTfmaHA38qoO2b2YdM2ZaxkLsLE1reSdXNOSQLzVvH9S7/PgmwikqkH4YlMtUU607FHN
	xhgcQZwxbmFKs+5PZLt3m4p4xU3/nbIQCtNtyG4T13HC6bA2oqxGUDJCRHPLIQMgqm+y6+bbGl2
	b4fNX8er7IgNW100gyMBpUH22DBrVqV7IkgGF3L7/BR1IqBLezgKUSr1ISfehuMeMvY5PDo+/ek
	8Aw
X-Received: by 2002:a05:600c:3506:b0:48f:e44c:e058 with SMTP id 5b1f17b1804b1-48fe60e13e7mr274947375e9.1.1779178447146;
        Tue, 19 May 2026 01:14:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1d4b:274c:94d:a69f? ([2a01:e0a:106d:1080:1d4b:274c:94d:a69f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm189230825e9.4.2026.05.19.01.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 01:14:06 -0700 (PDT)
Message-ID: <bc61221c-f517-4c35-8fb0-265a0c34b442@linaro.org>
Date: Tue, 19 May 2026 10:14:05 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] backlight: Add SY7758 6-channel High Efficiency
 LED Driver support
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
References: <20260430-topic-sm8650-ayaneo-pocket-s2-sy7758-v2-0-308140640de9@linaro.org>
 <20260430-topic-sm8650-ayaneo-pocket-s2-sy7758-v2-2-308140640de9@linaro.org>
 <agdJnpz9O00lywRm@aspen.lan>
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
In-Reply-To: <agdJnpz9O00lywRm@aspen.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,lists.freedesktop.org,vger.kernel.org,outlook.com];
	TAGGED_FROM(0.00)[bounces-8202-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:replyto,linaro.org:email,linaro.org:mid,linaro.org:dkim,outlook.com:email];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: A6033579EF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 5/15/26 18:28, Daniel Thompson wrote:
> On Thu, Apr 30, 2026 at 11:47:16AM +0200, Neil Armstrong wrote:
>> From: KancyJoe <kancy2333@outlook.com>
>>
>> Implement support for the Silergy SY7758 6-channel High Efficiency LED
>> Driver used for backlight brightness control in the Ayaneo Pocket S2
>> dual-DSI panel.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: KancyJoe <kancy2333@outlook.com>
>> ---
>>   drivers/video/backlight/Kconfig  |   8 +
>>   drivers/video/backlight/Makefile |   1 +
>>   drivers/video/backlight/sy7758.c | 311 +++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 320 insertions(+)
>> <snip>
>> diff --git a/drivers/video/backlight/sy7758.c b/drivers/video/backlight/sy7758.c
>> new file mode 100644
>> index 000000000000..9b2d3bbb4ded
>> --- /dev/null
>> +++ b/drivers/video/backlight/sy7758.c
>> @@ -0,0 +1,311 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Silergy SY7758 6-channel High Efficiency LED Driver
>> + *
>> + * Copyright (C) 2025 Kancy Joe <kancy2333@outlook.com>
>> + * Copyright (C) 2026 Linaro Limited
>> + * Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> I'm a bit confused by this comment. The git author and the
> MODULE_AUTHOR() is Kancy Joe. What does this comment signify?

I'll fix this in v3

> 
> 
>> + */
>> <snip>
>> +/* OTP memory */
>> +#define REG_OTP_CFG98 0x98
>> +#define REG_OTP_CFG9E 0x9E
>> +#define REG_OTP_CFG0 0xA0
>> +#define REG_OTP_CFG1 0xA1
>> +#define REG_OTP_CFG2 0xA2
>> +#define REG_OTP_CFG3 0xA3
>> +#define REG_OTP_CFG4 0xA4
>> +#define REG_OTP_CFG5 0xA5
>> +#define REG_OTP_CFG6 0xA6
>> +#define REG_OTP_CFG7 0xA7
>> +#define REG_OTP_CFG9 0xA9
>> +#define REG_OTP_CFGA 0xAA
>> +#define REG_OTP_CFGE 0xAE
> 
> There seems to be a lot of unused macros here, especially
> combined with the unused bitfields that tell us how to interpret
> the values.
> 
> Do we need them?

I'll drop those

> 
> 
>> <snip>
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
>> +	/* Get and enable regulators */
>> +	ret = devm_regulator_get_enable(dev, "vddio");
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to get regulator\n");
>> +
>> +	usleep_range(100, 200);
> 
> Any reason not to use fsleep() here?

Thanks, I'll switch to fsleep

> 
> 
>> +	/* Get enable GPIO and set to high */
>> +	sydev->gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(sydev->gpio))
>> +		return dev_err_probe(dev, PTR_ERR(sydev->gpio),
>> +				     "failed to get enable GPIO\n");
>> +
>> +	/* Let some time for HW to settle */
>> +	usleep_range(10000, 11000);
> 
> And here?
> 
> 
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
> 
> 
> Daniel.

Thanks,
Neil


