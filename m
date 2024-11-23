Return-Path: <linux-leds+bounces-3431-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A09839D6B20
	for <lists+linux-leds@lfdr.de>; Sat, 23 Nov 2024 20:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 660E0281FC7
	for <lists+linux-leds@lfdr.de>; Sat, 23 Nov 2024 19:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA1234545;
	Sat, 23 Nov 2024 19:34:23 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7D317C2
	for <linux-leds@vger.kernel.org>; Sat, 23 Nov 2024 19:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732390463; cv=none; b=lLbNK2dYdtpspDNAmk2uCI95hOJZKNw8RveNQQWFmR0AAnJ7ZIyKTc/+/yT0vGYw20TDhzVIc8cX/QxqYLzWWzzJ6m3DKK4ORsd3s+GX+JCjP8IQ8rwqn2zh6sNs3JB7ppazwaqruSg6vCV8fItfjJTPQI48PruB+erg/+mp6nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732390463; c=relaxed/simple;
	bh=Bkz/cNpEJ9t9QnwiuZfv7m6p4TlZpRbwPIxkTGiaAMs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAC34GOUVhbephl8aHoMva2XvCR9gXo8Mrz3upmgI0D2EtcfhX7JbXxWDpdccbS86E2Am+TvmYeuIteNgaRKe/aDaq6xhdf/LsPoE8NgNh+Ol4JJaneSqvm1eEyUdRtMlSaY4aywQGd1PErjK4ILmhdeXWEKB5mQeCPsrD8MF4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id eb92df3f-a9d1-11ef-9b92-005056bd6ce9;
	Sat, 23 Nov 2024 21:34:14 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 21:34:13 +0200
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
Subject: Re: [PATCH 06/18] leds: el15203000: switch to
 device_for_each_child_node_scoped()
Message-ID: <Z0IuNZq3g_0q0TkU@surfacebook.localdomain>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-6-95c0614b38c8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-6-95c0614b38c8@gmail.com>

Fri, Sep 27, 2024 at 01:20:57AM +0200, Javier Carrasco kirjoitti:
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error paths.
> 
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().
> 
> After switching to the scoped variant, there is no longer need for a
> jump to 'err_child_out', as an immediate return is possible.

...

>  		if (ret) {
>  			dev_err(priv->dev, "LED without ID number");
> -			goto err_child_out;
> +			return ret;

Now

			return dev_err_probe(...);

>  		}
>  
>  		if (led->reg > U8_MAX) {
>  			dev_err(priv->dev, "LED value %d is invalid", led->reg);
> -			ret = -EINVAL;
> -			goto err_child_out;
> +			return -EINVAL;

Ditto.

>  		}

>  			dev_err(priv->dev,
>  				"failed to register LED device %s, err %d",
>  				led->ldev.name, ret);
> -			goto err_child_out;
> +			return ret;

Ditto.

			return dev_err_probe(priv->dev, ret, "failed to register LED device %s\n",
				led->ldev.name);

...

Also notice missed '\n' at the end of the strings (and yes, I know
that it's not a problem for dev_*() macros, but still...).

-- 
With Best Regards,
Andy Shevchenko



