Return-Path: <linux-leds+bounces-3430-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0404B9D6B1C
	for <lists+linux-leds@lfdr.de>; Sat, 23 Nov 2024 20:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66F6BB215D4
	for <lists+linux-leds@lfdr.de>; Sat, 23 Nov 2024 19:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960F415575D;
	Sat, 23 Nov 2024 19:31:10 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FF534545
	for <linux-leds@vger.kernel.org>; Sat, 23 Nov 2024 19:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732390270; cv=none; b=OaRUFnhro7bnI7VOyAhpPANHhJom9Y12R6LepmbDPnYNQ24qZxGIWeg54uuqbNP7AtzrPpael9tPsDq4P8Ul7wVaEz/DyI8fAafM3jZ5b9hBgctAz6NlpJJuWYzL+0LpC7d1LV4G02h/MbBvz1D1HA0eBgbiEMxMgCR1M7R+aio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732390270; c=relaxed/simple;
	bh=P1KP/fPFkvXX93KvT9oa5A3AdRz2S6c4UvfDgvXUOI4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rf1SryQu6TXkZnIkJ0BTYsochdWpVe29C2K0ZvZzdxD7GHey7oWpVIPmKCiv07VmzSp+MyGiNT8qlBcI+mcfnPQbYte7sosg2E6BJk4T/qkpk8KeimDX7YSJl30ipaxt2M9+rtib9w9QXMScdKtEMGIXBjUIjiqVrI+SzQaceuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 79edaa06-a9d1-11ef-a0f6-005056bdfda7;
	Sat, 23 Nov 2024 21:31:05 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 21:31:02 +0200
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
Subject: Re: [PATCH 05/18] leds: cr0014114: switch to
 device_for_each_child_node_scoped()
Message-ID: <Z0ItdptZujS97zKl@surfacebook.localdomain>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-5-95c0614b38c8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-5-95c0614b38c8@gmail.com>

Fri, Sep 27, 2024 at 01:20:56AM +0200, Javier Carrasco kirjoitti:
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error paths.
> 
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().

...

>  		if (ret) {
>  			dev_err(priv->dev,
>  				"failed to register LED device, err %d", ret);
> -			fwnode_handle_put(child);
>  			return ret;

Now it can be
			return dev_err_probe(..., ret, "failed to register LED device");

>  		}

-- 
With Best Regards,
Andy Shevchenko



