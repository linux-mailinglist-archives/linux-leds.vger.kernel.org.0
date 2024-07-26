Return-Path: <linux-leds+bounces-2333-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F015C93CEE4
	for <lists+linux-leds@lfdr.de>; Fri, 26 Jul 2024 09:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D1841C20A63
	for <lists+linux-leds@lfdr.de>; Fri, 26 Jul 2024 07:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0EB313C80A;
	Fri, 26 Jul 2024 07:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4RZBNx4"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9752B548EE;
	Fri, 26 Jul 2024 07:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721979332; cv=none; b=p/tL5Qw944PYNZtu6v5LNObhHjCM/9g3FPM9CDT87KqjPX9DqG69MH6hW0I1I01WTbrmraFdgNmQvg+2sF87ww7TmG6ggRLPxJE4i0F8QxF5XeYn91ON+9LqM9ctLTash/X1JV2ipdLLM+KL6chLpvkDhSb7bWaSHiZn6yI/+hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721979332; c=relaxed/simple;
	bh=GP7Fq6eI6OXmFtc/BTYihKrVtWU4428IyPtackZcyp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ymcq8GjbNKMNABaivdnWmVA8GtvlTmuxIxLkzzJxh+xxmGd5pMc7J554igxfiEiOBzCAZhrGOshebIHbkn0agxBLOQ7lm6nJJX3D0AJaAQKrVbP5DUk66hwFBG2lsTlba/cnsOU5hl+yi+xF4ukAi9MsiIXWnQB9MIBM0gKgGfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4RZBNx4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC7EC32782;
	Fri, 26 Jul 2024 07:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721979332;
	bh=GP7Fq6eI6OXmFtc/BTYihKrVtWU4428IyPtackZcyp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4RZBNx4Rn5ME5akrrcH2lyBA4U7M2v9M7dAEfQK+XH+xxDbwDZd4kCGvVz33xIP/
	 7WwtZbKb/9rQe0V+DLz7bZsICY4c7Tannj1n/hMiwAhmal5MLIlIUDEPLqJcoJjsgK
	 tnFvZf7QG3zKItM2XwX49PUUpoSOmYCrKdaweC4LHYDXVwCnrfREF5tV4WeGcF+dE1
	 ula4lh6zUOv6bD9X/OnES2lc0ZOfU8e7cgKWbLFao8BmCJEODohMZGGFZYk283DC41
	 y5XDO1/h2xEde0F13pa8nzHAaUaCC8dmCJSjGOaTyVCqorfV1cUITn8ot+wZ5YmkFc
	 oahc9A/qJcSFA==
Date: Fri, 26 Jul 2024 09:35:28 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: pavel@ucw.cz, lee@kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: ns2: add missing check for
 fwnode_property_read_u32_array
Message-ID: <hg5gxn3ck3muwix5fgapdwxrqt7jkaqsv6qsiyanntulfjr2fw@lptgumpwbhqp>
References: <20240725081537.3247339-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725081537.3247339-1-nichen@iscas.ac.cn>

On Thu, Jul 25, 2024 at 04:15:37PM +0800, Chen Ni wrote:
> Add check for the return value of fwnode_property_read_u32_array() and
> return the error if it fails in order to catch the error.
> 
> Fixes: 940cca1ab5d6 ("leds: ns2: convert to fwnode API")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/leds/leds-ns2.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
> index f3010c472bbd..0713f7e9d1af 100644
> --- a/drivers/leds/leds-ns2.c
> +++ b/drivers/leds/leds-ns2.c
> @@ -202,8 +202,12 @@ static int ns2_led_register(struct device *dev, struct fwnode_handle *node,
>  	if (!modval)
>  		return -ENOMEM;
>  
> -	fwnode_property_read_u32_array(node, "modes-map", (void *)modval,
> -				       nmodes * 3);
> +	ret = fwnode_property_read_u32_array(node, "modes-map", (void *)modval,
> +					     nmodes * 3);
> +	if (ret) {
> +		dev_err(dev, "Missing modes-map property for %pfw\n", node);
> +		return ret;
> +	}

Please use
  return dev_err_probe()

also maybe in other parts of the driver probe where
  dev_err();
  return ret;
is being done.

The device_for_each_child_node() can be changed to
device_for_each_child_node_scoped() and you can drop the fwnode_handle_put()
from
  if (ret) {
    fwnode_handle_put(child);
    return ret;
  }

Marek

