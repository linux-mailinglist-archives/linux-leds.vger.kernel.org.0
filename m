Return-Path: <linux-leds+bounces-4625-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20815AB5D6C
	for <lists+linux-leds@lfdr.de>; Tue, 13 May 2025 21:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F72F4A7859
	for <lists+linux-leds@lfdr.de>; Tue, 13 May 2025 19:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA09B2BF974;
	Tue, 13 May 2025 19:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2jjEciC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA98E1F0E50;
	Tue, 13 May 2025 19:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747165927; cv=none; b=NL7DnVB9aPz1AR/yTAbOe/23fSU5wZH2Eiy5jhvEW0g8aL4c17mS55+aThHWr5+82JfX2VFWZlf21suhmsLiU8p0nqVtRreObZMYeBuXKGbry6o+1pHIrSVPky7EJ//NgYHjc1kM8UexptFYPhf09Ye7OZgm2Vl74BHm9IQ8Jp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747165927; c=relaxed/simple;
	bh=wDKLVHcaFWJvD80XRm4s+U6HKYt0lP4FyZVjvthChIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=flBeC576sCfShOwIYbLNAPR+3T9OKZl8RKZbPval4m/MBVPJRrheq2DDgQPbcZmo0SBTvk1TjZEcRwEujSwzUani95bVEXfKWS/Thi81VLWdwUTohxdJO08E9DuDL/NiXSsWQl/nBFVjBuCa+rRQlR9mjejj7mVYSU5vFUaoToE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2jjEciC; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5fcc96b6a64so7482203a12.0;
        Tue, 13 May 2025 12:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747165924; x=1747770724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EPKRGQ6ZTLCpIXOor5B3gE08zTZPi+lkFI2gMZtKNWQ=;
        b=S2jjEciCRcR5vGjRSz1i1EpchiOGa4+Zr6MbpeTHvMqW9OMSEjDLPaoQbMzypOepOw
         VIy2XVGKPD2cznwfOOsFFvmpLeFXCNW9CSIW+aOgy+nfCssYO0vowEOPdFj1Ghy8Qd3D
         6vBZQxyI9m/NRa8ADSWwbLNMnbFtI9cQ2aIn9z2CLKoEhtlZAiN8/PrTli6/ybhu2Y67
         tBxeWECnvMuM8XRnz0LXs1shWV+lik4LbJcaPo7ap1eQMPMz9KLafcbjpDNp8+ofYTs1
         /yLG0x+5KRqvCRSwFoXDLQL9irwJwyGjNoIpAwQ1XhBZAFSnr7RGRFwlnzobsPViqhnY
         R4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747165924; x=1747770724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPKRGQ6ZTLCpIXOor5B3gE08zTZPi+lkFI2gMZtKNWQ=;
        b=ELrmI26FFG6X5Q9SfxAsLB989iAj797OxtP3D2wp0/cfDAEJEmCCTA0HApQG8aCf5Q
         Ajq94/BA+NV7UVG8n8MQGSEHF9BLAzPSQM7Z0+yBalV4viFqbwi0JQq4U5fVu7VYBslh
         kIeTVMtF10zvkPDSwnqzOQ5ieJ43qWXVrhhNiZhRBeVlsFgyhD+uFAzlixyh3793/pL4
         bR1j2uWAA8hiI6VKkFgYboM+ixRHJXBZDc3qFjHmMcei7WEONjFM2L5fqa/Y+rBduv83
         Vy2jcBLpw747chryrfFLGg+DRpu5YPLh4Lak8wu0iKWo8n6OKpR7/s1KNk+GIZtzuDER
         It4A==
X-Forwarded-Encrypted: i=1; AJvYcCWWojO3vvemmqKWx6P3I+q8fQQg8gxe8M1qpG7RQ02x8xQEDJdw3GENJ+PcaDRV9BqDAIEzFZOy6nk0eQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVg9G/wpKiH5OiCCqxOng0jKYrlBpBCCEgZHPe95VxKt+QWcF7
	hUtOo2c1Ok7rlCDoEJLNpU+TXLxGeiAPsloqN/8hhOr/IkS997Sb
X-Gm-Gg: ASbGncvG5aTbjIJ/L+Nf6J1KmXVsGb6zCaHVd668f9YsgoIAa+I6iSDnHbkRA1Sep4k
	6a3Ik198Jf2GWUUIUhVDetSubENNKlaGxbU5xPR/fsf6+jPNry11mLMXsT0zOm9SiMlI4h46kE3
	viHYhFPJmINDsh2iVoSKXmgySKMaQ55qxWFiHdfQwKomvnLHLf5zCiZn0fbfCSmyuAY3S1WJM2U
	Gk4+zPIT4Jh+MYQHponBTN85AnEU+JSglcf6XAsJC77N4Db7Ug9/4UUKvEDwjgnrhGIipSu4aeW
	79qVhcDX944w4vTaGKJZvJJm8WulBYveggN1x/YFEP0pW/JhbYID84bE5lolCjv1
X-Google-Smtp-Source: AGHT+IEiFRYEfLJINFIWkhwduyVSeg0GKORGlrbshmeJjh33oH/QgGIMWgxSku3B+cM7D1WHcVI98Q==
X-Received: by 2002:a05:6402:4309:b0:5de:39fd:b2f5 with SMTP id 4fb4d7f45d1cf-5ff986a68aamr343658a12.1.1747165923761;
        Tue, 13 May 2025 12:52:03 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cbe4993sm7626580a12.9.2025.05.13.12.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 12:52:03 -0700 (PDT)
Message-ID: <5d34aec7-5027-4575-b860-afdf7b2c0757@gmail.com>
Date: Tue, 13 May 2025 21:52:01 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct
 multi_index
To: Johan Adolfsson <johan.adolfsson@axis.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@axis.com
References: <20250506-led-fix-v1-1-56a39b55a7fc@axis.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20250506-led-fix-v1-1-56a39b55a7fc@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Johan,

On 5/6/25 12:39, Johan Adolfsson wrote:
> mc_subled used for multi_index needs well defined array indexes,
> to guarantee the desired result, optionally use reg for that.
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
> If reg is not set, the previous behavior is kept, index will be in
> the order nodes are processed.
> 
> Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
> ---
> Since devicetree nodes are (sometimes?) processed in reverse order,
> support reg as the actual multi_index index so yo get well defined
> color order presented in the multi_index file.
> Not sure if reusing reg for this is the correct way or if another
> property such as "multi_index" or similar should be used instead.
> Looks like reg is used for similar things at least.
> Or should the whole "reverse the devicetree" problem be fixed instead?
> ---
>   drivers/leds/leds-lp50xx.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index 02cb1565a9fb..48db024081f5 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -476,6 +476,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>   			return -ENOMEM;
>   
>   		fwnode_for_each_child_node(child, led_node) {
> +			int multi_index = num_colors;
>   			ret = fwnode_property_read_u32(led_node, "color",
>   						       &color_id);
>   			if (ret) {
> @@ -483,8 +484,15 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>   				dev_err(priv->dev, "Cannot read color\n");
>   				return ret;
>   			}
> +			ret = fwnode_property_read_u32(led_node, "reg", &multi_index);
> +			if (ret) {
> +				multi_index = num_colors;

Why not to fail if 'reg' parsing fails?
It is marked required in DT bindings [0].

> +			} else if (multi_index >= LP50XX_LEDS_PER_MODULE) {
> +				dev_warn(priv->dev, "reg %i out of range\n", multi_index);
> +				multi_index = num_colors;
> +			}
>   
> -			mc_led_info[num_colors].color_index = color_id;
> +			mc_led_info[multi_index].color_index = color_id;
>   			num_colors++;
>   		}
>   
> 
> ---
> base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
> change-id: 20250225-led-fix-444fb544584a
> 
> Best regards,

[0] Documentation/devicetree/bindings/leds/leds-lp50xx.yaml

-- 
Best regards,
Jacek Anaszewski


