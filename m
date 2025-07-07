Return-Path: <linux-leds+bounces-5005-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E481FAFB9B2
	for <lists+linux-leds@lfdr.de>; Mon,  7 Jul 2025 19:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2377B3BAE8B
	for <lists+linux-leds@lfdr.de>; Mon,  7 Jul 2025 17:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D91D2882AD;
	Mon,  7 Jul 2025 17:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mL7TC9+l"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F93C246770
	for <linux-leds@vger.kernel.org>; Mon,  7 Jul 2025 17:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751908499; cv=none; b=SatIyQ5NpWRWHXFrnK7NKn1c8IuNlmyuFpzfZP+eNbJs5K4oJZgCDhj6f/QfzXfKcnUK2dmmwl37VjkbvY9qzjtKyaMxVWPxp1Br5OL+vbq9L+aHrRxS+kE01dvVqYpjo3rqMpK7iK7+fPwmWrLknWM0eDoB3yeTI3g/JoJ58nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751908499; c=relaxed/simple;
	bh=BvTl82WfdPpuJRUWNqGM9stPafmMGHiaNAI0e6polYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tdYDCUraAt4nenQy85RVNCMdQWvQjbjxCPPLP1MKzPPGxNCH5+A1nbLBOVwvRkc0WqIygENR92vyR4NWgImvkpQ2dAdPfvQmWNGewRm+06oRYe07VqT+OSfgrczHZXjwa38qIqjnGq6UCaccpwc8wd3yHv2oxE4t30IzaffGHu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mL7TC9+l; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74af4af04fdso3389578b3a.1
        for <linux-leds@vger.kernel.org>; Mon, 07 Jul 2025 10:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751908497; x=1752513297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47QcBpnfyums+ctmfuh5pe+LIWV2zKiMo3LlIfQo4Wo=;
        b=mL7TC9+lVTYXeBjNpQVZr1Gcmyy/pPs4pDM4DfmymGUGuhHVTfulvQdYTf47+a46PC
         MMjYVDHWLLqX0P3/IQ+G09b7wgE0O9F994PDrdK/HQAWym8EdmqZJrI8ARhyqC0CyWMv
         LLRZz7Q/0nGVbrr8dp+WRyMS0Gi/a2tzsuxRykE0sQupjEZZshKitJyEJwQSt0DriM5v
         1T/A3wIhoFMCowSuDum27+j3mpmpuWkNSmszBkvmGgs+OS6BW29zyKE8ESeHstSUbPJx
         3OSr1k+pI8ecKQDKizzoaLHtdCUbE4US6NHRQKKtQtoCXOVifzA1nkTjTdvLtiJ1GIxx
         XBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751908497; x=1752513297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=47QcBpnfyums+ctmfuh5pe+LIWV2zKiMo3LlIfQo4Wo=;
        b=Ez5MJFZjbaNOXmGxKX2LPllXuhqpuWMNs1NGAwI6iZ+8cegBUbQzH7wEOE3WXmG0im
         2MPXbrM0iavvTgVvFQCEk9G8fJuixNLdW1PYZYxwAHUtnaH4Fmbqi/yM9UNuYkBXuoYt
         Q+8f79Y26GMrCTVd9pCw6pbMHxJKhmsHMBiTS/0N9+a7EiWDC70e1emWwOqFsKidBbja
         nxl5yYiQGnJujAgWuXAKdiclNz1aq2lVsR2iR6nnvUmdqL+GDU5tiSWn7fff6nN+Kk0Y
         6fVWRSijeHvp2qC34XUsERAeLPdiQ338vLZGlhzR9/+Z5D0i02fdQVySI1Z1HmmsTvMP
         BgUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjezWIN0Jk8St9zArA45m6iXi6CytELQOdsaMf9n77myrbkERD4+PjBk+g/uvVfcLvY0GNZD4UY0ke@vger.kernel.org
X-Gm-Message-State: AOJu0YwUw+SFW9e6d3YqreP0X0SnBWpTCKzjCyVx+SyvAj61ujgVlIbD
	CvLmUFTFjWj8tidMjdo4rITSahG1efscdTo+2W+0hoP60ro/Xnug+jG5
X-Gm-Gg: ASbGnct97WRKdwWvjuy+QzuEwNE8FVtoKrxi/JAW0QN58GWyvxU/dw7pucRPzKLIL6I
	VbdDklNGDXQOo4hzz0+ZHUORyy8IpQmG+REkqpmp30wzLXHZF+uRh4s1tj2cEKc/8AyD13R1SkP
	XFmiqJ3CEpRaEaW88KRJOHqJiw5TeKOFizBMljV5RkHXAlDEvZdYItWXfIFnueC9YlvGqIiPZPQ
	rapO7vQyyU5mvHPJad00jLPwlqf+AcAarFKjaPOeGXPGp4rRwQdHNy+hHlzy+hI+mwhvxuv7235
	LNZN5Xb8lN55kC5s9p6VMunONmLaPzg1sfO2WYuO89KFL22+33m2i7ND4s4QXF9cygRVex7tkov
	lJmdtUpY=
X-Google-Smtp-Source: AGHT+IHwKeOoWdD//kTHURWW7pJnq911y1bpqPbj29+aGNKsWabEUZJ9RiBfmQDnl8NLncPdcuCx6A==
X-Received: by 2002:a05:6a20:7294:b0:215:e02f:1eb8 with SMTP id adf61e73a8af0-22b24b3b771mr446529637.14.1751908496420;
        Mon, 07 Jul 2025 10:14:56 -0700 (PDT)
Received: from [192.168.2.136] ([123.117.234.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee62c615sm9257453a12.60.2025.07.07.10.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 10:14:55 -0700 (PDT)
Message-ID: <2f0af25c-0360-4bb2-bf01-4c1587c6fd3c@gmail.com>
Date: Tue, 8 Jul 2025 01:14:52 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: trigger: netdev: Configure LED blink interval for
 HW offload
To: Marek Vasut <marex@denx.de>, linux-leds@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Christian Marangi <ansuelsmth@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>,
 Lukasz Majewski <lukma@denx.de>, Pavel Machek <pavel@ucw.cz>
References: <20250120113740.91807-1-marex@denx.de>
From: nyanmisaka <nst799610810@gmail.com>
In-Reply-To: <20250120113740.91807-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/20/2025 7:36 PM, Marek Vasut wrote:
> In case a PHY LED implements .blink_set callback to set LED blink
> interval, call it even if .hw_control is already set, as that LED
> blink interval likely controls the blink rate of that HW offloaded
> LED. For PHY LEDs, that can be their activity blinking interval.
> 
> The software blinking is not affected by this change.
> 
> With this change, the LED interval setting looks something like this:
> $ echo netdev > /sys/class/leds/led:green:lan/trigger
> $ echo 1 > /sys/class/leds/led:green:lan/brightness
> $ echo 250 > /sys/class/leds/led:green:lan/interval
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Christian Marangi <ansuelsmth@gmail.com>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Lukasz Majewski <lukma@denx.de>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: linux-leds@vger.kernel.org
> ---
>   drivers/leds/trigger/ledtrig-netdev.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
> index 20dfc9506c0a6..47c44620ba585 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -69,6 +69,7 @@ struct led_netdev_data {
>   	unsigned int last_activity;
>   
>   	unsigned long mode;
> +	unsigned long blink_delay;
>   	int link_speed;
>   	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_link_modes);
>   	u8 duplex;
> @@ -87,6 +88,10 @@ static void set_baseline_state(struct led_netdev_data *trigger_data)
>   	/* Already validated, hw control is possible with the requested mode */
>   	if (trigger_data->hw_control) {
>   		led_cdev->hw_control_set(led_cdev, trigger_data->mode);
> +		if (led_cdev->blink_set) {
> +			led_cdev->blink_set(led_cdev, &trigger_data->blink_delay,
> +					    &trigger_data->blink_delay);
> +		}
>   
>   		return;
>   	}
> @@ -463,10 +468,11 @@ static ssize_t interval_store(struct device *dev,
>   			      size_t size)
>   {
>   	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
> +	struct led_classdev *led_cdev = trigger_data->led_cdev;
>   	unsigned long value;
>   	int ret;
>   
> -	if (trigger_data->hw_control)
> +	if (trigger_data->hw_control && !led_cdev->blink_set)
>   		return -EINVAL;
>   
>   	ret = kstrtoul(buf, 0, &value);
> @@ -475,9 +481,13 @@ static ssize_t interval_store(struct device *dev,
>   
>   	/* impose some basic bounds on the timer interval */
>   	if (value >= 5 && value <= 10000) {
> -		cancel_delayed_work_sync(&trigger_data->work);
> +		if (trigger_data->hw_control) {
> +			trigger_data->blink_delay = value;
> +		} else {
> +			cancel_delayed_work_sync(&trigger_data->work);
>   
> -		atomic_set(&trigger_data->interval, msecs_to_jiffies(value));
> +			atomic_set(&trigger_data->interval, msecs_to_jiffies(value));
> +		}
>   		set_baseline_state(trigger_data);	/* resets timer */
>   	}
>   

Hi there, a while ago OpenWRT 24.10 was updated to linux kernel 6.6.93 
[1] which contains the backport of this commit. Unfortunately this 
caused the LAN and WAN port LEDs on some MediaTek based routers to not 
work properly, they just kept blinking.

According to a comment [2] by an experienced OpenWRT developer and from 
my understanding this is a breaking change. Could you please take some 
time to review the issue in the link and help revert the commit if 
necessary. Thanks in advance.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=3648ddabcdc25aad8af95778d7f87225272815e9
[2] https://github.com/openwrt/openwrt/issues/19263#issuecomment-3032228022

