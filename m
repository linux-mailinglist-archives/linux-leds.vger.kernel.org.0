Return-Path: <linux-leds+bounces-4606-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 916A1AAFE08
	for <lists+linux-leds@lfdr.de>; Thu,  8 May 2025 17:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1495516EC61
	for <lists+linux-leds@lfdr.de>; Thu,  8 May 2025 14:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49142798F5;
	Thu,  8 May 2025 14:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlHhKS0w"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD742797A0;
	Thu,  8 May 2025 14:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716253; cv=none; b=Shu9n/gIj4PtMtEq0iAXYjmwcVIBqM7hXePLIV10YfH0P01MxLtbTw0wAclyjtNz75f1fR+nYpFxwr2VdTtFyfQP0DW93C4jTatGfcX5ql4Ft60lC1X+VdUC46skoGTLGKcGr/ZiXvf97vN6GUlEPKjEqZuZfk5r7MkAor1zNkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716253; c=relaxed/simple;
	bh=6iHhw5qFT/tUA3m1akQE4BAydwJFznjhgGJU3QAL6ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WaPeSzQCyyc2zf3luulOJeyOu6odehNpzi2ncP/HmKAc1s6lPoqiUWmjp2ZANIe504gqPWqHBWBZzTnYXFaWqvBNyO5Au7rm/LEq1CgE1xLoKM/rIwZAKvhTPcTFxdma7dYlDPC65Mj1fAKp8HqIB4gxUvBH9HiWOME84b8BMao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlHhKS0w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA32DC4CEEF;
	Thu,  8 May 2025 14:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746716253;
	bh=6iHhw5qFT/tUA3m1akQE4BAydwJFznjhgGJU3QAL6ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SlHhKS0wdh1rO5+aBOBNJAGvvHuvASSuFyJJAvEKq59Yo90yNzSmciNTXSZbcoopU
	 rwYGoMjQnrQaAYrMJY6u57Z2qMuTbPK9+HZPX613hqQRlmRqhNw6G1zx+SFY09mmwW
	 ErXC9bcqRol73azhn9rAZfgR9GG3yJFVy5qETy0gg1CvC24c0uxVeApjewy44KIW9s
	 YIWhTm0lBFa/hKv0now+gl8E8l4qritWLbfF/HIpdCGgYsxGal11FNjFql3kRE7rps
	 aiPqc27ke+Fqj27wDeYjgRMvYLTCpZ6egAuBtsp/9/zRKyzI5vximbyrqnmmxjNm8H
	 2tlewhWR4zmig==
Date: Thu, 8 May 2025 15:57:29 +0100
From: Lee Jones <lee@kernel.org>
To: Johan Adolfsson <johan.adolfsson@axis.com>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct
 multi_index
Message-ID: <20250508145729.GR3865826@google.com>
References: <20250506-led-fix-v1-1-56a39b55a7fc@axis.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506-led-fix-v1-1-56a39b55a7fc@axis.com>

On Tue, 06 May 2025, Johan Adolfsson wrote:

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
>  drivers/leds/leds-lp50xx.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index 02cb1565a9fb..48db024081f5 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -476,6 +476,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>  			return -ENOMEM;
>  
>  		fwnode_for_each_child_node(child, led_node) {
> +			int multi_index = num_colors;
>  			ret = fwnode_property_read_u32(led_node, "color",
>  						       &color_id);
>  			if (ret) {
> @@ -483,8 +484,15 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>  				dev_err(priv->dev, "Cannot read color\n");
>  				return ret;
>  			}
> +			ret = fwnode_property_read_u32(led_node, "reg", &multi_index);
> +			if (ret) {
> +				multi_index = num_colors;

Didn't we already initialise this?

> +			} else if (multi_index >= LP50XX_LEDS_PER_MODULE) {
> +				dev_warn(priv->dev, "reg %i out of range\n", multi_index);

This should probably fail outright.

> +				multi_index = num_colors;
> +			}
>  
> -			mc_led_info[num_colors].color_index = color_id;
> +			mc_led_info[multi_index].color_index = color_id;
>  			num_colors++;
>  		}
>  
> 
> ---
> base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
> change-id: 20250225-led-fix-444fb544584a
> 
> Best regards,
> -- 
> Johan Adolfsson <johan.adolfsson@axis.com>
> 

-- 
Lee Jones [李琼斯]

