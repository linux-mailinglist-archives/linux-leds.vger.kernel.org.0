Return-Path: <linux-leds+bounces-41-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D297F1261
	for <lists+linux-leds@lfdr.de>; Mon, 20 Nov 2023 12:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD6EEB217BF
	for <lists+linux-leds@lfdr.de>; Mon, 20 Nov 2023 11:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F88D14F82;
	Mon, 20 Nov 2023 11:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dyYjdRth"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 447CB93;
	Mon, 20 Nov 2023 03:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700480876; x=1732016876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jbtw7pYryYp9+t0lLmAoefZD3Kt+UKSmDRWQZvGm1R8=;
  b=dyYjdRthFGvE1pRAfNHln1Zc45ue8ieAlZx6Ab0tCgfUXZUp2O13eMBM
   jBIkd+gLXKWdLZXaqgWT6Q+SC0esnAlKaElvepDFlIwpSfzGe8dIeuFeb
   sBoaiO4aaiZUcaxjZRqKmSQJdC9ko+zdA0B0579Vg5E1b8hUxMzEvjHqp
   OZ0NXveQU7aZlXvPMOptqajnwtW/ZsyemUWz2fO+sXygbpSvJUpQ1GCNy
   +FOiGXRzqdhZPE9Ty1Q7bdLi/lMSLzsdNLUPsLWL1RuuGwAqhwE9WCH7M
   Ofe8S+nDVxzjSK/a6kb8ts1iOpaRFp3/PFhYePeY+wyzkahnutbfcsgDP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="390461932"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="390461932"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 03:47:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="716185590"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="716185590"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 03:47:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r52kn-0000000FXRk-2wKz;
	Mon, 20 Nov 2023 13:47:49 +0200
Date: Mon, 20 Nov 2023 13:47:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH V2 1/2] leds: gpio: Add kernel log if
 devm_fwnode_gpiod_get fails
Message-ID: <ZVtHZWYl2skpn1Bg@smile.fi.intel.com>
References: <20231118124252.14838-1-wahrenst@gmx.net>
 <20231118124252.14838-2-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231118124252.14838-2-wahrenst@gmx.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Nov 18, 2023 at 01:42:51PM +0100, Stefan Wahren wrote:
> In case leds-gpio fails to get the GPIO from the DT (e.g. the GPIO is
> already requested) the driver doesn't provide any helpful error log:
> 
>     leds-gpio: probe of leds failed with error -16
> 
> So add a new error log in case devm_fwnode_gpiod_get() fails.

...

>  		led.gpiod = devm_fwnode_gpiod_get(dev, child, NULL, GPIOD_ASIS,
>  						  NULL);
>  		if (IS_ERR(led.gpiod)) {
> +			dev_err_probe(dev, PTR_ERR(led.gpiod), "Failed to get gpio '%pfw'\n",
> +				      child);
>  			fwnode_handle_put(child);
>  			return ERR_CAST(led.gpiod);
>  		}

Thinking more about it. GPIO library already issues bunch of messages.

	"using DT ... for ... GPIO lookup"
	"using lookup tables for GPIO lookup"
	"No GPIO consumer ... found"

Isn't it enough?

-- 
With Best Regards,
Andy Shevchenko



