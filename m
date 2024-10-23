Return-Path: <linux-leds+bounces-3148-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8009ACF8D
	for <lists+linux-leds@lfdr.de>; Wed, 23 Oct 2024 17:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5926AB246D7
	for <lists+linux-leds@lfdr.de>; Wed, 23 Oct 2024 15:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9031B4F24;
	Wed, 23 Oct 2024 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuuxVjt1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B6D211C
	for <linux-leds@vger.kernel.org>; Wed, 23 Oct 2024 15:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729698724; cv=none; b=D0jpuG13F+IOK2b8uYPYHaF8ts2QCkaEZH1mqUqNv8qsDfrLgdu4In4hvtmDpYV9hVN6cdpswYM9UGoRbVsIV8f7OoPLbC0LcnXtfkT+OWrUeaS3x3bM/piUaZL/K3ktf3kR8dD3umUM7ZxNdbPpVukhU0gGCBDQZ92g9ZAwbyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729698724; c=relaxed/simple;
	bh=rne0eEPm2xyVjtUC21vExdglK61begdu6SQt3aNwJuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DXb3//lmSHdlrvDcZl8x7Yf4JmnrUxGKxbtgVz2jj+mtt43L1OM3tOUW4RvbT0G7yjHddCg8m0XasVsywFOxoESAlQ8CdyuZPJ4hZNaHVuQORa5/dWQbtpEAJ+znSFdjSwAZLjvXdVxDzTMxqe3Xa4QlnFtdVZb6p9U/+nwy2Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuuxVjt1; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9a2209bd7fso923558166b.2
        for <linux-leds@vger.kernel.org>; Wed, 23 Oct 2024 08:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729698721; x=1730303521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsNdBmmi2GBnJjGhMjleJ56TvN4wdiB9Ugm4Ov4GQtc=;
        b=LuuxVjt1Ex/QtHt1Rori5+6Xi8s9MTgm2R3iPjNmE154ozFP9RuqIfUUux2fLQdA7z
         nUpvF3gl/dGQoXYlcChBnhvy8IIgKD0tCZG0KZzex4KAePrAP6kNwLPpPdFkE17xybF1
         mY+eqfW4VtTAaSW8APdFr7u6Rgoxe5yxIORbjA0b0I8UmyZfsTtXenoqWrE/EQVEk9Xe
         /9sodB2TXSUWLu8YCYylE2y3L5xLIWB8lAW7T4dtl/2OpAelJcRh8hoFhMmmoHQHtH2U
         BnoEkdx0/156QGaMD9URB5JdI49YBqDzO89zUQIN8XTmvMDgZgNYxV/A+BXFMW8cN7JL
         8NXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729698721; x=1730303521;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsNdBmmi2GBnJjGhMjleJ56TvN4wdiB9Ugm4Ov4GQtc=;
        b=ifv0nU53aWk7HaHEuxFsTsDYcRcgnI7bosxMYuG9EmLmH1gc/swZ45Cjp1JNL0zGe0
         LTrOYUitO3fo2q/EvhQphkDzIoT2/iL6O95OMdSmLYsP1FykcQGN6uBFHbFvsQWy/GKJ
         /3DhvsT9XLzw1tAVFyWRB1gvZL587ua6/Kv9ULUER8tOXRmqLsxN/RjXQdtGuWckDNYu
         U+KpRFYWcGI+32WrsWXKWUFumQ7+dWv1PxrNy/TK0Gwn7FWOx7s37czt6XNOjNLWT5V7
         Szn6InUyVkJ83/KGqL3bmrQWWlTq2ZPVDMYDTSQE+rXEoVWuz6gDTi2kVd+y6P2sDdZQ
         jdNA==
X-Forwarded-Encrypted: i=1; AJvYcCVuDrT79sAbf0XJSM8FTk1OX8t7fpXQp8dp3lp3aTXxuAWOncvDNZZ61D3Glk1DqBFIvAtbjO4a6GSb@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx1TuEROHnir1/Etq7/xpthKThc27bub0lNTQcfji2jWd52qX0
	bGb6WCvLQLIeSVI+CBIoesOrNjlzcz9VHBhBNqqFImDj+h7iIv38oQKlqg==
X-Google-Smtp-Source: AGHT+IExR60eYa61aPFzSUArgeB+kz/9zXu1VivjmJGBJimfhJeeInOf0dozPWxfTY7PYFgzI4BnBQ==
X-Received: by 2002:a17:907:97c7:b0:a99:ee4e:266d with SMTP id a640c23a62f3a-a9abf84abd7mr216528366b.1.1729698721284;
        Wed, 23 Oct 2024 08:52:01 -0700 (PDT)
Received: from [192.168.0.31] (80.224.71.185.static.user.ono.com. [80.224.71.185])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91370739sm490877266b.109.2024.10.23.08.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 08:52:00 -0700 (PDT)
Message-ID: <01dec1e4-a3de-4d6b-8670-664add92488b@gmail.com>
Date: Wed, 23 Oct 2024 17:51:58 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: mt6360: Fix error path in
 device_for_each_child_node()
To: Zhang Zekun <zhangzekun11@huawei.com>, pavel@ucw.cz, lee@kernel.org,
 linux-leds@vger.kernel.org
Cc: chenjun102@huawei.com
References: <20241023120628.15944-1-zhangzekun11@huawei.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20241023120628.15944-1-zhangzekun11@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/10/2024 14:06, Zhang Zekun wrote:
> When break out from device_for_each_child_node(), the child node
> is refcount added, and requires calls to fwnode_handle_put().
> Use scoped fwnode_handle_put() to put child node automatically in
> error path.
> 
> Fixes: 679f8652064b ("leds: Add mt6360 driver")
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/leds/flash/leds-mt6360.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
> index 4c74f1cf01f0..676236c19ec4 100644
> --- a/drivers/leds/flash/leds-mt6360.c
> +++ b/drivers/leds/flash/leds-mt6360.c
> @@ -784,7 +784,6 @@ static void mt6360_v4l2_flash_release(struct mt6360_priv *priv)
>   static int mt6360_led_probe(struct platform_device *pdev)
>   {
>   	struct mt6360_priv *priv;
> -	struct fwnode_handle *child;
>   	size_t count;
>   	int i = 0, ret;
>   
> @@ -811,7 +810,7 @@ static int mt6360_led_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>   
> -	device_for_each_child_node(&pdev->dev, child) {
> +	device_for_each_child_node_scoped(&pdev->dev, child) {
>   		struct mt6360_led *led = priv->leds + i;
>   		struct led_init_data init_data = { .fwnode = child, };
>   		u32 reg, led_color;

