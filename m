Return-Path: <linux-leds+bounces-4812-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3B8ADBBF3
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 23:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6265B188A961
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 21:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270A021882F;
	Mon, 16 Jun 2025 21:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jiyJ9D4I"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BD91E9B08;
	Mon, 16 Jun 2025 21:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750109400; cv=none; b=rNT5lLOxhj2CiJmUV3oAUBsBBV+o14RpBBquFa0GxPX5xtwNY+3FYg+2nQXHC9YyEHh6vpGAs2wSruiFtWiHNuRL3VJMKv0Z3x9xb3AmIS/jgJQFmv2zCWM6vD1HM6n2KLw4uG9kcRU7hB+rInRmgGypkN7oT1I14evl8FDOG+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750109400; c=relaxed/simple;
	bh=5VNEAsouBPOdh+XbkYS939nzg7JPX/5s9z7ACizdbBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q5+annkF8wmBGxm344GxBAbijAIVqMSwk9b/5CXBVCIQEW8NNJVBCrAcJqUmbwFijb1LohAi26yvv2OVBLISiTeHQWet2g7t1+74+2XVyqlDDsyD/w8whTMDzjjp4MFNAHSVrvTzkOudIQeEkzhxb1aCqzI58coHMianx6pEaZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jiyJ9D4I; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55351af2fc6so5534055e87.0;
        Mon, 16 Jun 2025 14:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750109396; x=1750714196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Do1hnaS0CtOsHIBnhi/95bfarKr7zXabMa9k9C0FL1k=;
        b=jiyJ9D4IHVCLjtzlMyijudRVRx+fUz1mxS4wdCCIG6v4O0+ZIChu1b0t6Fub6AMRpn
         U8xElmIoXvjftpSHUIanOgAM2bR/3i4381wKCf5YP1rw+LQ+ARS7eQAHLe5giSRbUUdh
         V++oK/cfr/oWqKY/rYoPiwelVd4+jT3nFTPFak9lGmuO2P5tdgqAOP7uEb2IaL0s8pEm
         LA+tcYLtrbblyP+XNfBzeXSfgGQAK3L9ydigvCTyFrrbWOCpLDoIBdQd1uERqIIxNNMe
         tW0tzwH3UAIvzhc2hqG+5z1xAxTujoD3viT6gcc8PffMhQtiiuTvXl02sy0a3aL/+bRO
         AOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750109396; x=1750714196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Do1hnaS0CtOsHIBnhi/95bfarKr7zXabMa9k9C0FL1k=;
        b=Qwi3yBOXoH+Ys3Yw7hBsD8aVrwv2l6wRpcfTjKtit3k8oxWxTlIwM8r/kBegXbFBKu
         qEwDQJZyDNqDhIm1rqYzrjykZaxJp/1jUhNcGIcsGr59kB3F7J4qdaOKjJhuYBNrxU3b
         azJ3lw7K4YjltrBHk8sPK8SashCJFNUGiDxnkmaV3aSB2v/Zx4fCQR8CFPvjHxoam6fM
         gKY8BlPsK1vpJKu71zkfqwIW+kcteZwKnB1k1eZz8Etm7EnTXDCuj2zG4hhpCJZ9jjAE
         kjDfHzwgiQ5StdMq0IkavUy0tdmyk9y0AuwtVQzNW/plAwklfXNK9vauQmFkD2HLydQN
         bELw==
X-Forwarded-Encrypted: i=1; AJvYcCV4TWv9FSpqEPJjxGWqCIP2f5JiQ6uin2MVEdrTCZOQV7VTcJCUbxf0Su9Uy7Jq0goZmNEbqnS4FcWR8Z6y@vger.kernel.org, AJvYcCXsXFU9YmuynY5NOoxr+APOIgh9lv9Ovpq+B9DwByemuCUJbBdM6oN88XUsAbRKoxAagWhyr0UGevMX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Ow6jkycZEBMmcOxv8cfGXLONwxE4P7P+YRr+vp+oNO4nZAXC
	B4t2fGpqs4IadIoHvkElPcZtsupKM0d6JJnlPkDu6ijxwZrg1VUOwACv5EXcrg==
X-Gm-Gg: ASbGncvl6/FZw5zo/XB5p6lse4L9DoqBOeGV8KdiVEItEJcsjfqFSOfNZngbVh2Z2p7
	LBLGFRApqSW7CecZCiGubG3TluyGRfcCqR4/o9OxQWN1qaQn0dgaa0erjwxONNs+2xSUfffcpUh
	kywq3KzQ7amMX4QLrCww5zAQjeG1ZKrXjIunczvva8CKuQZbzC+Y95i2zsrQIW0Z68OmLgrNPKg
	YBrYimNxsiU0DhG0EtEVqbzz/zmy9ItPj3651TIzvEEEzBBcA6Ezw8SKz3VbXRX2x+gxmcz3PZx
	rNTRlPdpLpAkfOY7drxqjaus8oVwF23gWb/Og7mlkANjrNeyZl+NwRjkPpNyNB3+iKhMmhtBTtI
	=
X-Google-Smtp-Source: AGHT+IGhwIZMcrkhFiRHEIrnrhxRgJNzXCaRo1/fa29XUEToVqntPMdQrO6BrBhWFHdNRTJJyM8K2g==
X-Received: by 2002:a05:6512:3092:b0:549:8675:c388 with SMTP id 2adb3069b0e04-553b6f5fa33mr2870026e87.52.1750109396075;
        Mon, 16 Jun 2025 14:29:56 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11ff47sm1671073e87.25.2025.06.16.14.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 14:29:54 -0700 (PDT)
Message-ID: <eb8c858d-fde8-4916-b36c-f386242b10c4@gmail.com>
Date: Mon, 16 Jun 2025 23:29:52 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] leds: leds-lp50xx: Handle reg to get correct
 multi_index
To: Johan Adolfsson <johan.adolfsson@axis.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@axis.com
References: <20250616-led-fix-v6-0-b9df5b63505d@axis.com>
 <20250616-led-fix-v6-1-b9df5b63505d@axis.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20250616-led-fix-v6-1-b9df5b63505d@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Johan,

On 6/16/25 13:25, Johan Adolfsson wrote:
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
> index 02cb1565a9fb..344791b6c575 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -476,6 +476,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>   			return -ENOMEM;
>   
>   		fwnode_for_each_child_node(child, led_node) {
> +			int multi_index = num_colors;

Any specific reason for initializing this to num_colors?

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


