Return-Path: <linux-leds+bounces-3433-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E90E29D6B29
	for <lists+linux-leds@lfdr.de>; Sat, 23 Nov 2024 20:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F4DF161D12
	for <lists+linux-leds@lfdr.de>; Sat, 23 Nov 2024 19:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3BB34545;
	Sat, 23 Nov 2024 19:37:21 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB36189B86
	for <linux-leds@vger.kernel.org>; Sat, 23 Nov 2024 19:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732390641; cv=none; b=BvUr+5ff4zL4q0jJud5gGcZN5VxURaN/JYV3DZzeGdk5nas08ucizryckVGTlJMSAcXAvUR89CGacn3RkT8LEdz/vqIaJAN1zkD+3tMa16I0im191DwJDiowKsuHOgLXvMXAH8vEx1geyw1SZYVE67qxAPuiW+wRCNAIxRWaQCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732390641; c=relaxed/simple;
	bh=4InhN3EJV5HAmDBFzgegujCf8BENyWDwohjfcGHHi1M=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYVWej+WCJVMpL40x6PykeR7+Rc40zyWLje+a/VMYMDISPVpWpkhVkRHKcspJjWz2QixK+CIVJXoudIsoN9OA380HqJKLyAgiltg/74XwfrS+8khuidWagnkpsMFuKDY+Ve/B7KNIdAS6VmNQdw4QsNCZpV6Aq84M3LARDD2qRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 541681c2-a9d2-11ef-9b92-005056bd6ce9;
	Sat, 23 Nov 2024 21:37:09 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 21:37:08 +0200
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
Subject: Re: [PATCH 08/18] leds: lm3532: switch to
 device_for_each_child_node_scoped()
Message-ID: <Z0Iu5Noc_-hTmNLE@surfacebook.localdomain>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-8-95c0614b38c8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-8-95c0614b38c8@gmail.com>

Fri, Sep 27, 2024 at 01:20:59AM +0200, Javier Carrasco kirjoitti:
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error paths.
> 
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().
> 
> After switching to the scoped variant, there is no longer need for a
> jump to 'child_out', as an immediate return is possible.

...

>  		if (ret) {
>  			dev_err(&priv->client->dev, "reg property missing\n");
> -			goto child_out;
> +			return ret;

return dev_err_probe(...);

>  		}

...

>  		if (ret) {
>  			dev_err(&priv->client->dev, "ti,led-mode property missing\n");
> -			goto child_out;
> +			return ret;
>  		}

...

>  		if (ret) {
>  			dev_err(&priv->client->dev, "led-sources property missing\n");
> -			goto child_out;
> +			return ret;
>  		}

...

>  		if (ret) {
>  			dev_err(&priv->client->dev, "led register err: %d\n",
>  				ret);
> -			goto child_out;
> +			return ret;
>  		}
>  
>  		ret = lm3532_init_registers(led);
>  		if (ret) {
>  			dev_err(&priv->client->dev, "register init err: %d\n",
>  				ret);
> -			goto child_out;
> +			return ret;
>  		}

Ditto for all above.

-- 
With Best Regards,
Andy Shevchenko



