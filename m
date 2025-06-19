Return-Path: <linux-leds+bounces-4856-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C3CAE082F
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 16:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D9941883BF1
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 14:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB89265614;
	Thu, 19 Jun 2025 14:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmzAl6H+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F2A23372C;
	Thu, 19 Jun 2025 14:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341778; cv=none; b=SbTNLGCD9pDva3YJY1rG2fqErWCypU7rdZfv4gcxwlqVYKFF8lGEVso2QvdPrJqLYsddnSM15W0wmjjc7XbjcPqiXw9q0f3D916dOsMYJG2/S9yNIYt5VY600Gpv/DphIcuhtlySKwgmy4uLY9kEtr4t0ouxwXwBJiCp6JrZi5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341778; c=relaxed/simple;
	bh=3e3S/B+Lo+0ooZVmjslQCDK2j7DWBBYC6bwFQPws7Tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IcjksEw0Vi+C6wZ0pZBjU6MUxQCxzNVKSOjtVwc9aoM8u2x7OjyLViEgM6AcwzlpyhO9V/VCMpsJCF0fX/Y3zu9CxxZk0FE52sZ/WGtyKBYJGLz19CycXdqlC7Yv4Fa4HnRMccOiM+B7k0+6WvwZWZhtbnfLzqAgxqyRwXc2luk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmzAl6H+; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32ac42bb4e4so7379351fa.0;
        Thu, 19 Jun 2025 07:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750341775; x=1750946575; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DOiYCUaJqVL7oOoPj8WwnheVYrU3C3XFKxEcsRVkH+E=;
        b=YmzAl6H+u9NIKMb3tA+4F4dIuHVtekoMICNJq4dsI3UdAhvrt3qleW3oBVH3tw8ZhU
         PG4Gaong3Bw8GwWTcUQHy5x8KpI/xHVf3LPLMupktxiu/4yBcYvsovhkTaV2I5fgIn9L
         097pOSRM8EAfRuVM53wqQDs+X2ECA1e56TpWlw0gnPJ1opC9MlSNcEp+ksPcEZveUtHN
         1Ab6Rj081TGazWEvyTtYH/ccG8Ab8vzxCgBCHSD21cYJqVywIKrH82zfUcxqqplBFyYt
         2tWrUeBfR2AuqjP5OgRJ/glRKdSeVqPKV3GbZsMIATmG9G6O5yduxFdzfi7XzIDqWbun
         BcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341775; x=1750946575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DOiYCUaJqVL7oOoPj8WwnheVYrU3C3XFKxEcsRVkH+E=;
        b=A3881TZ+OywbkytYKvqlnpTDy0E3jHLaKScaAbq9M85QKl1eBKT2kqCSwLkAmPL0+u
         7a93mRLrdUxjO3NIeiPt1dlIt8CO9KasPfwaY9ZyotjHR5MXZjGAkv4cT8R2mZL5NElA
         ozNBq0UYNdMDxfcOj1Cok0YqG6Bbgtme0zeeZ80iyq0LQOvtwPUpRsTdf5Hy8WPNSrVK
         bxJHczELmiQn2XzxvUC2MhweMrF2RLV518ZB1YWX5ztI1XxfWY7yAIBHMWbzt4Jn4hN/
         NZlopSXBLLUJUdVK6Sqgf9tQTo0F2SnIr83gaspK3UM9lRZhCQxk/TwWy97FThy5sPSW
         p2cA==
X-Forwarded-Encrypted: i=1; AJvYcCUMo93uKGJuc8ZdrM/pp9mrnUyHJ47ZeufvougHm4GKjWXvGRDiHYCLSodiTAWvbSBFLCnPOHZa3E5w@vger.kernel.org, AJvYcCXkORerTaoyYdQugedw+T6WIusNbFPVDaIoAR8+8oElNGx7taRRze3XNV9Trc8LOb9/pykx+Ijlr6fpoGt2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr4FqhcmjH/tnPrZWOdpGlOn7/T5+nK84aQDUnUlCLvdmpAcia
	dm4qH/jDD73YcGgMn9prc2sbHmkOSdDVBNRW2u2O/A0EKP0lnMr3PrSN
X-Gm-Gg: ASbGncsQybRI0uBTJs545lFR9lW5ozpPdv042gHF5l2mAklPP71TF8CUT9ri4RpGhfF
	z1i3+6PCewqsiEL2N4xI7GY4coTUwTTT2/IYGMRT6QzFv+lM5C0vH54dhAe1xBDMPNaQAswk9Es
	KHyAijXwg51SuyzrVR9ogLVB18uKXZJ4+0hTGRk7G5/GaWNwrjuJYMRi6WYYdoXh82Whg/y3Adz
	K4X/g196X8lhcWnt5/yLdEB9X7XB8/hY9gdbhrNHoNCBDRrvK6Pm6WKIb2V0bt1n6WgqlDgYFFe
	FnrHR+01jTKOeLByRuD6fTeYJRDEbQ2rLdA3CfYKAoYI/zgh5eOGv6kvVyzDprTxS1PCNlwQmQ6
	WiYRb72WTDw==
X-Google-Smtp-Source: AGHT+IGp1NUeg+816mXAax1teL5ReTrAP7OS3FBTjTgN1u2YG6hgq1XFC8Ai4fzEz0TXggnBvHVGoA==
X-Received: by 2002:a2e:b888:0:b0:32a:7270:5c29 with SMTP id 38308e7fff4ca-32b4a2d8acdmr77421941fa.2.1750341774422;
        Thu, 19 Jun 2025 07:02:54 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b8b3aabd4sm2062391fa.79.2025.06.19.07.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 07:02:53 -0700 (PDT)
Message-ID: <5348356c-0ca4-46c3-879c-ecbfc04778bf@gmail.com>
Date: Thu, 19 Jun 2025 16:02:51 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] leds: leds-lp50xx: Handle reg to get correct
 multi_index
To: Johan Adolfsson <johan.adolfsson@axis.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@axis.com
References: <20250617-led-fix-v7-0-cdbe8efc88fa@axis.com>
 <20250617-led-fix-v7-1-cdbe8efc88fa@axis.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20250617-led-fix-v7-1-cdbe8efc88fa@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Johan,

Thanks for the update.

On 6/17/25 12:23, Johan Adolfsson wrote:
> mc_subled used for multi_index needs well defined array indexes,
> to guarantee the desired result, use reg for that.
> 
> If devicetree child nodes is processed in random or reverse order
> you may end up with multi_index "blue green red" instead of the expected
> "red green blue".
> If user space apps uses multi_index to deduce how to control the leds
> they would most likely be broken without this patch if devicetree
> processing is reversed (which it appears to be).
> 
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts has reg set
> but I don't see how it can have worked without this change.
> 
> If reg is not set, an error is returned,
> If reg is out of range, an error is returned.
> reg within led child nodes starts with 0, to map to the iout in each bank.
> 
> Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
> ---
>   drivers/leds/leds-lp50xx.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index 02cb1565a9fb..94f8ef6b482c 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -476,6 +476,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>   			return -ENOMEM;
>   
>   		fwnode_for_each_child_node(child, led_node) {
> +			int multi_index;
>   			ret = fwnode_property_read_u32(led_node, "color",
>   						       &color_id);
>   			if (ret) {
> @@ -483,8 +484,16 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>   				dev_err(priv->dev, "Cannot read color\n");
>   				return ret;
>   			}
> +			ret = fwnode_property_read_u32(led_node, "reg", &multi_index);
> +			if (ret != 0) {
> +				dev_err(priv->dev, "reg must be set\n");
> +				return -EINVAL;
> +			} else if (multi_index >= LP50XX_LEDS_PER_MODULE) {
> +				dev_err(priv->dev, "reg %i out of range\n", multi_index);
> +				return -EINVAL;
> +			}
>   
> -			mc_led_info[num_colors].color_index = color_id;
> +			mc_led_info[multi_index].color_index = color_id;
>   			num_colors++;
>   		}
>   
> 

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski


