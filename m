Return-Path: <linux-leds+bounces-3438-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE989D6B44
	for <lists+linux-leds@lfdr.de>; Sat, 23 Nov 2024 20:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 711B8161D03
	for <lists+linux-leds@lfdr.de>; Sat, 23 Nov 2024 19:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6BD166F25;
	Sat, 23 Nov 2024 19:47:50 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8F019DF66
	for <linux-leds@vger.kernel.org>; Sat, 23 Nov 2024 19:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732391270; cv=none; b=HfFmXcgX+sGlBG0M19BhpC+0UFEBcSAdxcOlXZYc86b9BwgGRcFjQkPw0WgH3e7GrP4SYJrG7SGvtfl4KoFnIPlnnqiveGyCgumwOGhyLvTsu8vTWw4YNACyMVOgpgSyEKihmhPgHE7Uzj8Y+oAToNsb7EVqqsVXFFYKCYZwh+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732391270; c=relaxed/simple;
	bh=m2qLnqDWjiQs3VDlXncJpshue+oltGe7BCDFQj8lFzc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8UjVcSwyVySRjXPNKD6VOa22lPuW58YhDVS+9c9YK8mEN9IRJpntSn1e7D0ULlLFsLkMZ6WFYuF80qtn91qPaceOGGW8UOBOFzgmj4r4Ck64yv2X9/WQuTIhUhwfe/Ajzr911NNizwMDayq3uSp0gMzZdnf24BUpfXDjDXe3CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id cada6636-a9d3-11ef-a0f6-005056bdfda7;
	Sat, 23 Nov 2024 21:47:38 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 21:47:37 +0200
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
Subject: Re: [PATCH 11/18] leds: max77650: switch to
 device_for_each_child_node_scoped()
Message-ID: <Z0IxWdV8ZWhJ5Pp4@surfacebook.localdomain>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-11-95c0614b38c8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-11-95c0614b38c8@gmail.com>

Fri, Sep 27, 2024 at 01:21:02AM +0200, Javier Carrasco kirjoitti:
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error paths.
> 
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().
> 
> After switching to the scoped variant, there is no longer need for a
> jump to 'err_node_out', as an immediate return is possible.

...

>  		rv = fwnode_property_read_u32(child, "reg", &reg);
> -		if (rv || reg >= MAX77650_LED_NUM_LEDS) {
> -			rv = -EINVAL;
> -			goto err_node_put;
> -		}
> +		if (rv || reg >= MAX77650_LED_NUM_LEDS)
> +			return -EINVAL;

Again (yes, I know that is original issue, but with your series applied
it may be nicely resolved), shadowing error code. Should be

		if (rv)
			return rv;
		if (reg >= MAX77650_LED_NUM_LEDS)
			return -EINVAL;

-- 
With Best Regards,
Andy Shevchenko



