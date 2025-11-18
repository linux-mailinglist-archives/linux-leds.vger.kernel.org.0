Return-Path: <linux-leds+bounces-6187-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A276C6B83C
	for <lists+linux-leds@lfdr.de>; Tue, 18 Nov 2025 21:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id B1277290F0
	for <lists+linux-leds@lfdr.de>; Tue, 18 Nov 2025 20:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A0927E05A;
	Tue, 18 Nov 2025 20:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MCzoprNy"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C636E1624C5;
	Tue, 18 Nov 2025 20:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763496123; cv=none; b=CrtBWMHUEfbHS8Qqco6bi0yuAG5ytpAGIBlHWXmVT9TH8GxrkK0gnwluxQdGTrpWWz77wAoj9b20x6xfnvUrxF3FtQUQ5hUYrQA1xdwZOTvc91sg5B8Uqt+ZqWA6XxxHbGGTG49O2NwjLKFF0UTky2yxCTpG4clPL+FwCpOpG6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763496123; c=relaxed/simple;
	bh=gjSVuV0VvRb+v7MfFoe3CamAEnrmlYsG/ud4Md5QYHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQ7Xn7nMLYgTh0BIE7aJ2eTo6ttyARdbMQTpfhSTQhbY6td3r0BaXzpJ0mQbmDAgV1PFoxvIi6Z6GxBkKpAi4dXE0sd+rb6EyeTbY+0vghiTZzfFFi3PzOG68To8+6jTpOetKpoNaSFruMN+P9F3FzSdKEHS7GODvVTHYIY4eJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MCzoprNy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763496122; x=1795032122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gjSVuV0VvRb+v7MfFoe3CamAEnrmlYsG/ud4Md5QYHw=;
  b=MCzoprNyWAp/Wf1mRoVseLA1pQO3HATHRhcX75DpIinAOKwui1cbrOPc
   GMsd2x9yOyZpUjXmnBHHfgHhRsGTXTi7BD69YeFPTW7AieUtE2yns50pC
   KSkQmOwraXLG+QONDA9FJU3Dpg56rEH5HVYS3jtFGzbvxymXa1rjr1OEo
   6wTb+9/dbgrnPe25FKsxIvKOQ4lEmj79+OL/2hsTqPd8kj1rbQpSlbyCA
   b4Qk5OmnAO+vHOqMXIEHRqkxWXrKZGOEPJ5EmZBkRTnJaRiGNUVqEUBS5
   nBFYOQXMQNiQ0KN8LgR2En1xBnZcF1w/i4OP264B/xSFiKoWi69Fwe78y
   w==;
X-CSE-ConnectionGUID: 3Xc0IoNWT2eUrAfkr3m7NA==
X-CSE-MsgGUID: GPZqNUA+Q/Gwp3XZcVtG4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="69399318"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="69399318"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 12:02:01 -0800
X-CSE-ConnectionGUID: DujWrKGRSAmwqMn2wsYZ4w==
X-CSE-MsgGUID: HnrqYlIxSdKcayAaDHpdFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="191639949"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 18 Nov 2025 12:02:00 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C70E196; Tue, 18 Nov 2025 21:01:58 +0100 (CET)
Date: Tue, 18 Nov 2025 21:01:58 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Markus.Elfring@web.de, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] leds: netxbig: fix GPIO descriptor leak in error paths
Message-ID: <aRzQtvOhYRaWCiFA@black.igk.intel.com>
References: <20251028082117.276-1-vulab@iscas.ac.cn>
 <20251031021620.781-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031021620.781-1-vulab@iscas.ac.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 31, 2025 at 10:16:20AM +0800, Haotian Zhang wrote:
> The function netxbig_gpio_ext_get() acquires GPIO descriptors but
> fails to release them when errors occur mid-way through initialization.
> The cleanup callback registered by devm_add_action_or_reset() only
> runs on success, leaving acquired GPIOs leaked on error paths.
> 
> Add goto-based error handling to release all acquired GPIOs before
> returning errors.

...

>  	data = devm_kcalloc(dev, num_data, sizeof(*data), GFP_KERNEL);
> +	if (!data) {
> +		ret = -ENOMEM;
> +		goto err_free_addr;
> +	}
> +
> +	gpio_ext->data = data;
> +	gpio_ext->num_data = 0;
>  
>  	for (i = 0; i < num_data; i++) {
>  		gpiod = gpiod_get_index(gpio_ext_dev, "data", i,
>  					GPIOD_OUT_LOW);
>  		if (IS_ERR(gpiod))
> +			goto err_free_data;
>  		gpiod_set_consumer_name(gpiod, "GPIO extension data");
>  		data[i] = gpiod;
> +		gpio_ext->num_data++;
>  	}

While fixing one issue, this brings wrong order of the devm_ and non-devm
resource cleaning. This may lead in some cases to the crash at ->remove() or on
error path at ->probe().

I think this needs much deeper refactoring, and rethinking. Easiest approach is
to get rid of devm_ allocations altogether with a huge comment why.

That said, NAK to it in _this_ form.
(However I see it is already applied, so perhaps it will be fixed by some
 followups)

-- 
With Best Regards,
Andy Shevchenko



