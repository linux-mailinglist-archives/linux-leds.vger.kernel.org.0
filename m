Return-Path: <linux-leds+bounces-4721-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBD3AC4502
	for <lists+linux-leds@lfdr.de>; Mon, 26 May 2025 23:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA8D5189DBD5
	for <lists+linux-leds@lfdr.de>; Mon, 26 May 2025 21:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D53240604;
	Mon, 26 May 2025 21:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0hoZhLG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92E13C465;
	Mon, 26 May 2025 21:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748296467; cv=none; b=OoPfqyM6lw6ownINqjIB2ibrJjxEM2JFmZHCIOo+FwmESrVYLc0ddpogC82OWPCua3QL0A1lkhhmDmVgFV8+zWHJkY6T6+r1JRutKLfcWgg3CxJJQJ7d3R7K/3eITboYwx47A7c7Wh6KlJNOAIz2k9VzPP0jMKFaP1x2qlWgeHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748296467; c=relaxed/simple;
	bh=wM2RVoV5PeQJuBONoCyEKLP9gwI/gzEx3XOUbDgN27c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kwoX3SdOh+5CpCF5WV0hu2ipEta6v6PLNIpGH/erwjQELuULBQxaR5RaenqO6A2y4/DKKPg4Xf7zWEPXz1W8g8sKiRDWb3c+xRsvdZT8o1xC0S6nAceBsJwMRFywWmuDFVMfjQwZF3xHBNHo4DwacEUHttAGlzsO24Wa/SGq6Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0hoZhLG; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6045a8a59c5so3342818a12.1;
        Mon, 26 May 2025 14:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748296464; x=1748901264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fRO5OSJpgjMod/7ANe8AmG9ngge68ETrJtkbxthmkuM=;
        b=H0hoZhLGQwVDszrz0Lz79pDZEPKGrXuE1bVBmWSC+PguZpAaw3v9Jf6shaGZtjhxda
         XX2HpnrZKpUeeaJUOTjFZ8QXsy+kM1lFTYDK1y1aSbJuCcWFojSHreDjjaPeK4esC722
         wj9wFnJxwfFjUcchFqm3ZRunEoKRJP2XEwlmxTPpD+v3hctZgn6kNljaRDS0QeP3KAG8
         8zwotY+niK8IAVVaSgB6gp7fDcT9/hZ6bM1Jx9In1uJBA/w1IyryaZRAAwFk8cwOf5ym
         NbicpH/UHjzLBz/D1geqK2RJwcHHxnw31dqPTl4TkpYd+Qj/nAmENxp8puQYAVida2u2
         e/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748296464; x=1748901264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fRO5OSJpgjMod/7ANe8AmG9ngge68ETrJtkbxthmkuM=;
        b=R9jwhSw0TZp65MxPxtyVzDgFqdKuG47yXZZJH4z6kS63P97KltkhkuML++bjaIr6aT
         Wpz0KDc+cD0iz4pX0yMlZ+VWocd3PMTXZUnIJG6vvDr2lm5ju9wCQgzKoSvM4lRrZPob
         QPrxQ9B13aew3g4iSiluL2KexRAcBA0k8WCb8zxp+NUN0NrWPPhJozKUb+24MvjDcU1X
         Qu01FFUos8myTsrorQsRQMYzQmjj9AEBSLJLF6wLPqm1yFcsz36ZEXx4yBDtGXROF0wV
         QaWRoouRMEwff3H9mwpPi3yp8Skj2Ew1PrCCeDm2qR9sEFqfcsBjde5C/nGbcagQ5N2K
         SwMA==
X-Forwarded-Encrypted: i=1; AJvYcCV4jKBE/QHUz7uugS9o8QFXGSq6OmeKHA8KsRnZIO1XF56UHdUxaKGY7nUA20w6CPFhtVN/ZEG/xQiP@vger.kernel.org, AJvYcCVMAuAEmSaYSwLtn4JBzyY9NmYwQ+YZGXMaMiiDUUQ8hu5LbFj66FqE+yH3vcwvDB0TnrPEw1brpco9Mx2r@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr8KTtwllde97M+zMtraFEELAOosDvUtU53V/m26C1rtW6DPri
	5gkIGIxvxNcPRmDUd2xM2jgF6rwDQ6Ys+hS6g9c8EIS0S+2LP7Nf4c8C
X-Gm-Gg: ASbGncsNdLb5/CtS2NBLlQIA2wFzOyugF9HIegrE4aNyg5vUmFkoWIOjmCY5QZkHdHY
	FDcTNneFRvt3sPL4ug8xdyaOEjxRrLG/pLGUT7KB7QqjnGFpK+PPnsoV/IURZaXRAnfi9+h4N2P
	mfdht2NB5pTsPp/FaASQh/xXM498p9IwkMkotnxzmTckugsRw6kp6mYAIXPH9m18VxmrCWlu4vW
	efGiMU2/2EEaf37rU8C31KquUzPNjziEUFiNCg4shoH78BAcrU3JXotII3CZ7/6GxAitXJK1Zv/
	moXrJcZxKN2gjcCHZiWtZgbsSa5jBBlxgtrhMf5r59VZo/w+uT+c+aVx9Q9jubFZ
X-Google-Smtp-Source: AGHT+IGq7BSWVS2uzAdvuw507TsKTYNDL6q4SDe7LSbons5DqTVWcYb+fw0FzYdiJsed/ZB3d6o1kQ==
X-Received: by 2002:a17:907:7faa:b0:ad1:8f1f:6961 with SMTP id a640c23a62f3a-ad85b3071a2mr1003392566b.43.1748296464003;
        Mon, 26 May 2025 14:54:24 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4ca827sm1731141366b.163.2025.05.26.14.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 14:54:23 -0700 (PDT)
Message-ID: <2bb62450-df35-4063-ac5e-60bc1ef8f5e7@gmail.com>
Date: Mon, 26 May 2025 23:54:21 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 1/2] leds: leds-lp50xx: Handle reg to get correct
 multi_index
To: Johan Adolfsson <johan.adolfsson@axis.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@axis.com
References: <20250526-led-fix-v4-0-33345f6c4a78@axis.com>
 <20250526-led-fix-v4-1-33345f6c4a78@axis.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20250526-led-fix-v4-1-33345f6c4a78@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Johan,

On 5/26/25 16:54, Johan Adolfsson wrote:
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

This is a bug and I don't see any value in keeping buggy code.
Just expect reg to be present and make sure that all in-tree
dts files using these bindings use them in a proper way.

To not break existing users of stable releases, if any of them
implement DT subnodes without 'reg' property, we can just not mark this
commit with "Fixed" tag, so that it wasn't applied to stable releases.
Although I am not sure if we should not fix it there as well.
I'm leaving it to Lee.

> If reg is out of range, an error is returned.
> reg within led child nodes starts with 0, to map to the iout in each bank.
> 
> Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
> ---
>   drivers/leds/leds-lp50xx.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index 02cb1565a9fb..8067aaa916bf 100644
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
> @@ -483,8 +484,13 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>   				dev_err(priv->dev, "Cannot read color\n");
>   				return ret;
>   			}
> +			ret = fwnode_property_read_u32(led_node, "reg", &multi_index);
> +			if (ret == 0 && multi_index >= LP50XX_LEDS_PER_MODULE) {
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

-- 
Best regards,
Jacek Anaszewski


