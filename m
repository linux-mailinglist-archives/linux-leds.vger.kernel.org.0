Return-Path: <linux-leds+bounces-1899-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7738D907590
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 16:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6294D1C23CA2
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 14:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B6C7E76D;
	Thu, 13 Jun 2024 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2lu45o+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD7512C528;
	Thu, 13 Jun 2024 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718290027; cv=none; b=a//e2RUNG4dbT45MUbI1tUNy5aWeNtktebvXTCafVFZrP+a2XVQoM5RILDyWGpjvQVnQBrFrJUaWdMQJzt8NP3lnTd1sfC0eCZZ99ZmV0jfEh+pp6noKjyW4kpWPvJGRSr9IBCFEHDmzg6LV5mi/Yg5AwpRlIi87tAklOojekho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718290027; c=relaxed/simple;
	bh=jK2gdUjoj+cRxhdeg1jZhUoCifthBXqPUWejNjj10lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVX8M0CPxldZ92nGgA4AchC9sD7rinW5LhVk+MdPL6uWVdh9DMi1MwpX39bklSYeJuCtXGWIB4+IM4RYL4zwnucZUZ/jUU7kqSxAmGxJyl3Yirb2z/ft26DL28dqRrNZ4OujQC9wnEJmP1ucayrmCWH4PB9+BEDNF3KIhAdkcFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2lu45o+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16AC4C2BBFC;
	Thu, 13 Jun 2024 14:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718290027;
	bh=jK2gdUjoj+cRxhdeg1jZhUoCifthBXqPUWejNjj10lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d2lu45o+Ydw/jwlGxUhNdagLzTCqMGvgZd941PPMvvteZ/RajSIUxk7FJmLFDObr3
	 qbZ9QyJtSMHJPIchfTnzuXBhgtArPmUK0cQJMJt4RdTNVDAktbNW7PmL0zUzmTVeoT
	 oe8A9WQgjwavflaTb0RXNfK+1/qYAJMx6DSd4zBED+fHvqdgExsQBTVX9Pgy38ynNm
	 FaADpUWVNR6cChGRf/XQSjgZc0sQeX2xw/jcxl2+v8ITNjVOmiAZ+vGzbIJs57TJRc
	 gcJsOFiIbKHmpORDouMn93VI1TFlDO6et+ruxgKor2SEpgY4h/0LLT74SNUiO+65oG
	 X7yCt2z4yfymg==
Date: Thu, 13 Jun 2024 15:47:03 +0100
From: Lee Jones <lee@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-leds@vger.kernel.org, Abdel Alkuor <alkuor@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] leds: ncp5623: Use common error handling code in
 ncp5623_probe()
Message-ID: <20240613144703.GH2561462@google.com>
References: <5faec5de-fc36-4b38-abcb-c61954a824cd@web.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5faec5de-fc36-4b38-abcb-c61954a824cd@web.de>

On Wed, 05 Jun 2024, Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 5 Jun 2024 16:19:26 +0200
> 
> Add a label so that a bit of exception handling can be better reused
> at the end of this function implementation.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/leds/rgb/leds-ncp5623.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-ncp5623.c b/drivers/leds/rgb/leds-ncp5623.c
> index 2be4ff918516..f18156683375 100644
> --- a/drivers/leds/rgb/leds-ncp5623.c
> +++ b/drivers/leds/rgb/leds-ncp5623.c
> @@ -183,16 +183,12 @@ static int ncp5623_probe(struct i2c_client *client)
> 
>  	fwnode_for_each_available_child_node(mc_node, led_node) {
>  		ret = fwnode_property_read_u32(led_node, "color", &color_index);
> -		if (ret) {
> -			fwnode_handle_put(led_node);
> -			goto release_mc_node;
> -		}
> +		if (ret)
> +			goto release_led_node;
> 
>  		ret = fwnode_property_read_u32(led_node, "reg", &reg);
> -		if (ret) {
> -			fwnode_handle_put(led_node);
> -			goto release_mc_node;
> -		}
> +		if (ret)
> +			goto release_led_node;
> 
>  		subled_info[ncp->mc_dev.num_colors].channel = reg;
>  		subled_info[ncp->mc_dev.num_colors++].color_index = color_index;
> @@ -223,6 +219,10 @@ static int ncp5623_probe(struct i2c_client *client)
>  	fwnode_handle_put(mc_node);
> 
>  	return ret;
> +
> +release_led_node:
> +	fwnode_handle_put(led_node);
> +	goto release_mc_node;

No, we're not bouncing around the function like that.

Only use gotos to skip _down_ to error handling code please.

>  }
> 
>  static void ncp5623_remove(struct i2c_client *client)
> --
> 2.45.1
> 

-- 
Lee Jones [李琼斯]

