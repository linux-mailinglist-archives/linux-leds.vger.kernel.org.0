Return-Path: <linux-leds+bounces-3011-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD957996635
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 11:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E1FF28AB5F
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 09:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10D318C024;
	Wed,  9 Oct 2024 09:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="ZV3E5gOO"
X-Original-To: linux-leds@vger.kernel.org
Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B0A18DF83;
	Wed,  9 Oct 2024 09:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728467795; cv=none; b=HegLEOfbr8ravf2I/scANprpDcUVkMiPcQLIMK0zNFuxbg202BXMI8Njp+SYUapW0ieArOh2hBeH47hgowO5NF4XK5pW9qaE+lFEKHfCrgv+FQrlYXEPJQbo1f0hHUHMeMWM+/trE8s87kCwvtTKwpI92uHOjwbHespWSZW+TNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728467795; c=relaxed/simple;
	bh=owP3Jvn5HxzUDxs8qawtViaDOGXnf1RIfNHw8e27wEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hn0YSVUbozwQv0C3a8sMYFmEBfR9fVVwbbW+sYF0PhIthzqS9oz9VuNVC8kC7cDoM5ekBXC6aiHUaIcuO8BVK5tVaAFrvlfhQ/GlQD9vv0l8Xy+NfMkrJFPd6WOt1KR8D9eoxQQtHWzaVqwx6dxJmBwqoHWBlpdTgMKXb+qBZBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=ZV3E5gOO; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1728467792;
	bh=e2NBim9PwvK2VTyvEOHjdLsVYEkH/6NAqieskfn/za0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZV3E5gOO0l8dSWO6UceoHD/u5R0DDf9SGn/6BcrMVYK4kB4WPXzvtYx1VDyXJVXBC
	 zwJTHay73DelIJlsOJcHZQyAuzbYjpyucBA1JWYs/TNS4hE6VwS96JQR8N8yNlYOXJ
	 lHy1BJ5V6+voaR+LQPHeF+RK88ecbyBUXPER8uIQ=
Received: from [10.1.8.111] (unknown [10.1.8.111])
	by uho.ysoft.cz (Postfix) with ESMTP id E0144A021E;
	Wed,  9 Oct 2024 11:56:31 +0200 (CEST)
Message-ID: <cb3550f1-06c8-4e22-ae23-a738b61192fd@ysoft.com>
Date: Wed, 9 Oct 2024 11:56:31 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: lp55xx: Fix check for invalid channel number
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: Dan Murphy <dmurphy@ti.com>, Jacek Anaszewski
 <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Christian Marangi <ansuelsmth@gmail.com>
References: <1728464547-31722-1-git-send-email-michal.vokac@ysoft.com>
Content-Language: en-US
From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
In-Reply-To: <1728464547-31722-1-git-send-email-michal.vokac@ysoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

+Cc Christian Marangi as I see he contributed a lot to this driver recently.

I also see that Dan Murphy can not be reached on the ti.com e-mail as he
works for Abbott since 2021 according to linkedin..

On 09. 10. 24 11:02, Michal Vokáč wrote:
> Prior to commit 92a81562e695 ("leds: lp55xx: Add multicolor framework
> support to lp55xx") the reg property (chan_nr) was parsed and stored
> as it was. Then, in lp55xx_init_led() function, it was checked if it
> is within valid range. In case it was not, an error message was
> printed and the driver probe failed.
> 
> With the mentioned commit the reg property is checked right after it
> is read from the device tree. Comparison to the upper range is not
> correct though. Valid reg values are 0 to (max_channel - 1). So in
> case the parsed value is out of this (wrong) range the probe just
> fails and no error message is shown.
> 
> Fix it by using proper comparison and print a message in case of
> an error. The check that is done in lp55xx_init_led() function is now
> redundant and can be removed.
> 
> Fixes: 92a81562e695 ("leds: lp55xx: Add multicolor framework support to lp55xx")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> ---
>   drivers/leds/leds-lp55xx-common.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
> index 5a2e259679cf..055ee77455f9 100644
> --- a/drivers/leds/leds-lp55xx-common.c
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -512,12 +512,6 @@ static int lp55xx_init_led(struct lp55xx_led *led,
>   	led->max_current = pdata->led_config[chan].max_current;
>   	led->chan_nr = pdata->led_config[chan].chan_nr;
>   
> -	if (led->chan_nr >= max_channel) {
> -		dev_err(dev, "Use channel numbers between 0 and %d\n",
> -			max_channel - 1);
> -		return -EINVAL;
> -	}
> -
>   	if (pdata->led_config[chan].num_colors > 1)
>   		ret = devm_led_classdev_multicolor_register(dev, &led->mc_cdev);
>   	else
> @@ -1132,8 +1126,11 @@ static int lp55xx_parse_common_child(struct device_node *np,
>   	if (ret)
>   		return ret;
>   
> -	if (*chan_nr < 0 || *chan_nr > cfg->max_channel)
> +	if (*chan_nr < 0 || *chan_nr >= cfg->max_channel) {
> +		dev_err(dev, "Use channel numbers between 0 and %d\n",
> +			cfg->max_channel - 1);
>   		return -EINVAL;
> +	}
>   
>   	return 0;
>   }

