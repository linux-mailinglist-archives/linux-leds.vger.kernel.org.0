Return-Path: <linux-leds+bounces-6538-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EB2CF8352
	for <lists+linux-leds@lfdr.de>; Tue, 06 Jan 2026 13:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7587A30402BB
	for <lists+linux-leds@lfdr.de>; Tue,  6 Jan 2026 12:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8B3329E53;
	Tue,  6 Jan 2026 12:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PejtpBFd"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F77F326D70
	for <linux-leds@vger.kernel.org>; Tue,  6 Jan 2026 12:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767701005; cv=none; b=b8V5Jv37so2kXs0AewINJ1wziuOHz1FbwWOmSRxS7rT0FLZBAp/86W52Lp11Ztk3s5cuevbfwQx79VRlDJBqM5FUgd+bhUxS2t3yJrDVaB1iepawRNNs8LWi7bdu2Tpatw4gjNX/t0HjwA0eSoDtrJZOje+gyjg82AZ7g8rgaxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767701005; c=relaxed/simple;
	bh=Uv82Eud2+qQYekf4jOxXEpCdWv9RuoIFOpRsSZ7Vu0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EW7pBZBRGn+WgKlhOwc/KPXHst2XbM+mbSGfhQ6p1DuZhz2Zlk1bpmrQx/mlan78TCj0RIl7fTmk5pwLV0/5pSZJ9hUM3wD8/saEy0MrAFOcmTicLSOz29sLODEy6fG4hWIAetr0yRfp9BkkBDQ2LWcJL0wfLx6Q1XBZwQv0R7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PejtpBFd; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59577c4c7c1so2899792e87.1
        for <linux-leds@vger.kernel.org>; Tue, 06 Jan 2026 04:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767701002; x=1768305802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R24kDi7ycrD9dY59pwPxZ5h8zPUnSHdzoVoXCvf0GVU=;
        b=PejtpBFdiyV86Oves1GoWsI2WIRx67M3gJiMJIh4YWlDKjwPDOhmLyWfE9FodWY05c
         Fna3T+5wOBPZDjfZLRv1b6mvSLurqBu5nigCxivFY8ArbrNd0MLkPuUA7GIErI/7syLA
         iXfMoWePdJHHExFyPBoJ92aMYL01C03RnyeqUcgCgvogo6rT9cHJXur9sEc8v4s21L/B
         6owfpOf36fZM7r1LHSfrj6UU53jxzIkDAkbT6pyNq41hDbLVVAy3P1w03lJoNumQgJLq
         +B/Cd4VcxLj7eyXxutuR2HDHDKJEBnS2pUU/+uEBlFGkm5MO+tS3lS8E1f0sldupGhV6
         gUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767701002; x=1768305802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R24kDi7ycrD9dY59pwPxZ5h8zPUnSHdzoVoXCvf0GVU=;
        b=NRLheJavLhg1nl6Hr7m59KVO40y7Zs7QYRitmz2NOJDeC1+KV3Y9xiP2EH3hhARTx2
         nzymb2r7guxR0iGK/sosWbB/MPieSBPl0eN6eTvZ/RjbD9v+4fEeVA4mZ0EWm6v7iA2r
         fueGqu6ItYXzum+oRfBrj4zikawdOj8ZNDlmywWapHw5lAdrHyArL1n5qfv4TFeCmoY3
         J54jwQFwO3DooVUfLHvKsvaRJyEh9Q5zWElf07BDu1ji0+5ChZjKvB3KpbsjdgaCG0p+
         j4q9j+FDXB/8ZR/uoGKYkBkDC01BOVeBxhnhdMEQ8+ZyUwQ/HWeU1ajaQHb+rmN7SQUf
         SiNw==
X-Gm-Message-State: AOJu0Yx4QsK+VTt6CoxPywRh4c1eZFeah/2oi476ZW2Mhg1OSGjBaJvX
	7qzGiaQq7MGNu2Jy3sWDsaSQqH7gRRp9pTuiqddgYCr+MMjHk5lmCAUBTKS/CQ==
X-Gm-Gg: AY/fxX4NHWy4roP8ClaYDedeMdRGygQ2RGjEdcvSWCSIs4pIPj6KA24sVAnERQrSuDj
	066Yy9RMJimjSPmfRghiPtcON/Z2o7DQ3avTEMw8cvsu818kcMmy7Dh0OwX+0DPQ+o6HXE43oAp
	ckZR5YvhUxiONx4AgKApEororE2uW6F3oZFJ/P8hpH3Yma7ou+TzQiLg5d6NBhCQVn+Ch96UUoV
	ZogdlBd3vT31VtNjaCJYlA/u2Xu04BJmQHlGlzYsDs09zthuSEhGCDqFBJHOnYYzXQICcMunOaW
	wK0iLZwomJhUY96dkxF4eBKIETJ1U3H0nfMEJtMPMNFnllEQjHO5S1lAQRywCiXazgkwAjGP15B
	HmGTr4fynRvLgkGvTnXunSd7daU3uhQp7nV6W1mH0ui+G7IVxl1tXlkyZHgBvlsnvZuX2AcfFQL
	IlK0FXnS/1UUDtkC2AJESYnUc=
X-Google-Smtp-Source: AGHT+IFQ34mkfMwuZtHPU+EK43Z3U18GgFyWPUtQcLuGBqEmE4MawbvUoM0v/a/8F9LW9CHZvBDqvw==
X-Received: by 2002:ac2:4c06:0:b0:595:7d7c:59a9 with SMTP id 2adb3069b0e04-59b65878424mr688495e87.22.1767701001878;
        Tue, 06 Jan 2026 04:03:21 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6addaab0sm185546e87.28.2026.01.06.04.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 04:03:21 -0800 (PST)
Message-ID: <3fe2eb05-f45d-4910-a9e5-8472c5c7f43f@gmail.com>
Date: Tue, 6 Jan 2026 13:03:18 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] leds: ltc3220: add driver
To: Edelweise Escala <edelweise.escala@analog.com>, Lee Jones
 <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260106-ltc3220-driver-v1-0-73601d6f1649@analog.com>
 <20260106-ltc3220-driver-v1-2-73601d6f1649@analog.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20260106-ltc3220-driver-v1-2-73601d6f1649@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/26 06:27, Edelweise Escala wrote:
> Add driver for ltc3220. LTC3220 18 Channel LED Driver
> 
> Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
> ---
>   MAINTAINERS                 |   1 +
>   drivers/leds/Kconfig        |  10 +
>   drivers/leds/Makefile       |   1 +
>   drivers/leds/leds-ltc3220.c | 465 ++++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 477 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d640c35d1f93..fda0d2963c4f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14961,6 +14961,7 @@ L:	linux-leds@vger.kernel.org
>   S:	Maintained
>   W:	https://ez.analog.com/linux-software-drivers
>   F:	Documentation/devicetree/bindings/leds/leds-ltc3220.yaml
> +F:	drivers/leds/leds-ltc3220.c
>   
[...]
> +				     "Failed to set command\n");
> +
> +	device_for_each_child_node_scoped(&client->dev, child) {
> +		struct led_init_data init_data = {};
> +		struct ltc3220_uled_cfg *led;
> +		u32 source;
> +
> +		ret = fwnode_property_read_u32(child, "reg", &source);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret,
> +					     "Couldn't read LED address\n");
> +
> +		if (!source || source > LTC3220_NUM_LEDS)
> +			return dev_err_probe(&client->dev, -EINVAL,
> +					     "LED address out of range\n");
> +
> +		init_data.fwnode = child;
> +		init_data.devicename = "ltc3220";
> +		init_data.devname_mandatory = true;

Why? Please get acquainted with the section "LED Device Naming" in [0],
and the documentation of this property in [1].

> +
> +		/* LED node reg/index/address goes from 1 to 18 */
> +		i = source - 1;
> +		led = &ltc3220_state->uled_cfg[i];
> +		led->led_index = i;
> +		led->reg_value = 0;
> +		led->ltc3220_state = ltc3220_state;
> +		led->led_cdev.brightness_set_blocking = ltc3220_set_led_data;
> +		led->led_cdev.brightness_get = ltc3220_get_led_data;
> +		led->led_cdev.max_brightness = 255;
> +		led->led_cdev.blink_set = ltc3220_blink_set;
> +		led->led_cdev.pattern_set = ltc3220_pattern_set;
> +		led->led_cdev.pattern_clear = ltc3220_pattern_clear;
> +
> +		ret = devm_led_classdev_register_ext(&client->dev,
> +						      &led->led_cdev,
> +						      &init_data);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret,
> +					     "Failed to register LED class device\n");

[0] Documentation/leds/leds-class.rst
[1] include/linux/leds.h

-- 
Best regards,
Jacek Anaszewski


