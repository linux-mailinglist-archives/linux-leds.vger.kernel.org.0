Return-Path: <linux-leds+bounces-3436-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA129D6B33
	for <lists+linux-leds@lfdr.de>; Sat, 23 Nov 2024 20:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE54B282539
	for <lists+linux-leds@lfdr.de>; Sat, 23 Nov 2024 19:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D089170A37;
	Sat, 23 Nov 2024 19:42:07 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2490199384
	for <linux-leds@vger.kernel.org>; Sat, 23 Nov 2024 19:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732390927; cv=none; b=VieL+6XaLtpDAKNnpIGg4iSQ3q5j/xdcTGDcCy7l9a0gcfZz/RGClcPHU1obUi51udPyGmsncr8GZmQ4wQAs+rXRmN7t2Ass0TPg7ySmbp60PFZkvl299FWayTMalpFTVhRDNhLL6dnH8zmWMCiBZ7TdP7ZS9EaVmIkfnfrp53o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732390927; c=relaxed/simple;
	bh=aoQY2AU7Sy7wBQvaEt255nidnwU9PNtGmfIdrAuRdOM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYeJ/tnO6wA9MOn/CKU1qjMUP9XPFzLrHpAxpEsJehAqpOc0LOfMfpVo7wT95Ou2PcukJZmd84NS21bkQ+xK3k23Ws0kh08+xM16IdAirZcjQWRQUyfxc1eVBrK5bwX9UC4boV/oQUxtuMkR9s7H7kAr10JGMJJLal0HG47bqFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id fe29a33f-a9d2-11ef-827a-005056bdf889;
	Sat, 23 Nov 2024 21:41:54 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 21:41:54 +0200
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gene Chen <gene_chen@richtek.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 15/18] leds: sun50i-a100: switch to
 device_for_each_child_node_scoped()
Message-ID: <Z0IwAug906PT4Db_@surfacebook.localdomain>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-15-95c0614b38c8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-15-95c0614b38c8@gmail.com>

Fri, Sep 27, 2024 at 01:21:06AM +0200, Javier Carrasco kirjoitti:
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error paths.
> 
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().
> 
> The error handling after 'err_put_child' has been moved to the only goto
> that jumps to it (second device_for_each_child_node()), and the call to
> fwnode_handle_put() has been removed accordingly.

...

>  		ret = fwnode_property_read_u32(child, "reg", &addr);
> -		if (ret || addr >= LEDC_MAX_LEDS) {
> -			fwnode_handle_put(child);
> +		if (ret || addr >= LEDC_MAX_LEDS)
>  			return dev_err_probe(dev, -EINVAL, "'reg' must be between 0 and %d\n",
>  					     LEDC_MAX_LEDS - 1);
> -		}

This is a misleading message, what should be done is to split them:

		if (ret)
			reutrn ret;
		if (addr >= LEDC_MAX_LEDS)
			return dev_err_probe(dev, -EINVAL, "'reg' must be between 0 and %d\n",
					     LEDC_MAX_LEDS - 1);


>  		ret = fwnode_property_read_u32(child, "color", &color);
> -		if (ret || color != LED_COLOR_ID_RGB) {
> -			fwnode_handle_put(child);
> +		if (ret || color != LED_COLOR_ID_RGB)
>  			return dev_err_probe(dev, -EINVAL, "'color' must be LED_COLOR_ID_RGB\n");
> -		}

Ditto.

-- 
With Best Regards,
Andy Shevchenko



