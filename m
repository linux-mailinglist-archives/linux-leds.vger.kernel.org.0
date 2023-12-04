Return-Path: <linux-leds+bounces-240-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9798035CF
	for <lists+linux-leds@lfdr.de>; Mon,  4 Dec 2023 15:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D991F1C20B49
	for <lists+linux-leds@lfdr.de>; Mon,  4 Dec 2023 14:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA9A2576C;
	Mon,  4 Dec 2023 14:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KH4huRNS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591E0F2
	for <linux-leds@vger.kernel.org>; Mon,  4 Dec 2023 06:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701698606; x=1733234606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hc3GDWAuiWFVq4OPHL/bpZJQWt8nhUFwuxno2A4bz/Q=;
  b=KH4huRNSQayz+aeQrA7Dueva6be1vkDqKlXugfLWsuoBAEo9Y5+AMGrP
   tUpqwLeMv7XQyhAhQkcF2YRYr6vwKup4Sbko9dBJyMBNCClsnNMxkd4AC
   88R+CeS4OdQNN8RWD6KWov8JvzfPtqklOtdvroa8OjVWwo9SOsffhyn89
   wXmXlhmfZiyZZdjkH8KN0TEpbNq+4bXx7cyySdK8kXD8gwzTtXHkyWJTq
   6DIgkW3aSPYELwCnl3nTclK/UNqhqR0xRplRkJSwJtaDJJNkJvwUsH7uQ
   XLfmIJ2MMm932o2NMNMycmGxRPHtwtngQrk9F2lBwUbesE1TuC4HxESX0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="396540385"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="396540385"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 06:03:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="746843628"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="746843628"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 06:03:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rA9Xd-00000001lqn-05Lo;
	Mon, 04 Dec 2023 16:03:21 +0200
Date: Mon, 4 Dec 2023 16:03:20 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH V3] leds: gpio: Add kernel log if devm_fwnode_gpiod_get
 fails
Message-ID: <ZW3cKOcFt4g4H7Mm@smile.fi.intel.com>
References: <20231202183636.7055-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231202183636.7055-1-wahrenst@gmx.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Dec 02, 2023 at 07:36:36PM +0100, Stefan Wahren wrote:
> In case leds-gpio fails to get at least one of possibly many GPIOs
> from the DT (e.g. the GPIO is already requested) neither gpiolib nor
> the driver does provide any helpful error log:
> 
>     leds-gpio: probe of leds failed with error -16
> 
> As the driver knows better how to handle errors with such mandatory
> GPIOs, let's implement an error log which points to the affected
> GPIO.

As we have had a consensus,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



