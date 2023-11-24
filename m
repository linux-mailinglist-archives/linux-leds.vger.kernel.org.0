Return-Path: <linux-leds+bounces-136-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD35C7F77CC
	for <lists+linux-leds@lfdr.de>; Fri, 24 Nov 2023 16:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60EE91F20CEA
	for <lists+linux-leds@lfdr.de>; Fri, 24 Nov 2023 15:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C94E2E85B;
	Fri, 24 Nov 2023 15:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3dYIM/E"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C1110FB;
	Fri, 24 Nov 2023 07:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700839744; x=1732375744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4wTXc2+Rb7ZmdlIioZQrrzZMpLjREbdeuncO3pZy9no=;
  b=d3dYIM/EsNYXFZChdxOOmqe1d2lC+6zS39PogVlVDqdpj/G9BbFqQ3eH
   isEanfYEnxyxFaNlrV6mztVfaH4tpnx/8NodnjJLaD2/TgVHqopzafZDi
   lsqvaS04nVK93s5iJ/AEf83vodxXa83Mxu1d9J/66v4vNVJp3rXkmdr0k
   C0Rx94FW4QSa6a0iJt/69wEFQiMCGaVFqvRZpuqlKeo7m9/WwxZsvx0sM
   sEhctlir7g5xn1ODmWoN2WFu1aI/i0mFzYZSEUGY34frr/rwl4GDv/0+8
   9XMAk9ZqPgviV164FcbwfZHSy9ejY5b2EDb2BarcRigs9UrQUtSUA7tYD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="5593274"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="5593274"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:29:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="885299714"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="885299714"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:29:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1r6Y6z-0000000Gkp5-1wGf;
	Fri, 24 Nov 2023 17:28:57 +0200
Date: Fri, 24 Nov 2023 17:28:57 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: George Stark <gnstark@salutedevices.com>
Cc: pavel@ucw.cz, lee@kernel.org, vadimp@nvidia.com, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kernel@sberdevices.ru
Subject: Re: [PATCH 0/8] devm_led_classdev_register() usage problem
Message-ID: <ZWDBOfpsC5AVT8bX@smile.fi.intel.com>
References: <20231025130737.2015468-1-gnstark@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025130737.2015468-1-gnstark@salutedevices.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Oct 25, 2023 at 04:07:29PM +0300, George Stark wrote:
> Lots of drivers use devm_led_classdev_register() to register their led objects
> and let the kernel free those leds at the driver's remove stage.
> It can lead to a problem due to led_classdev_unregister()
> implementation calls led_set_brightness() to turn off the led.
> led_set_brightness() may call one of the module's brightness_set callbacks.
> If that callback uses module's resources allocated without using devm funcs()
> then those resources will be already freed at module's remove() callback and
> we may have use-after-free situation.
> 
> Here is an example:
> 
> module_probe()
> {
>     devm_led_classdev_register(module_brightness_set_cb);
>     mutex_init(&mutex);
> }
> 
> module_brightness_set_cb()
> {
>     mutex_lock(&mutex);
>     do_set_brightness();
>     mutex_unlock(&mutex);
> }
> 
> module_remove()
> {
>     mutex_destroy(&mutex);
> }
> 
> at rmmod:
> module_remove()
>     ->mutex_destroy(&mutex);
> devres_release_all()
>     ->led_classdev_unregister();
>         ->led_set_brightness();
>             ->module_brightness_set_cb();
>                  ->mutex_lock(&mutex);  /* use-after-free */
> 
> I think it's an architectural issue and should be discussed thoroughly.
> Some thoughts about fixing it as a start:
> 1) drivers can use devm_led_classdev_unregister() to explicitly free leds before
> dependend resources are freed. devm_led_classdev_register() remains being useful
> to simplify probe implementation.
> As a proof of concept I examined all drivers from drivers/leds and prepared
> patches where it's needed. Sometimes it was not as clean as just calling
> devm_led_classdev_unregister() because several drivers do not track
> their leds object at all - they can call devm_led_classdev_register() and drop the
> returned pointer. In that case I used devres group API.
> 
> Drivers outside drivers/leds should be checked too after discussion.
> 
> 2) remove led_set_brightness from led_classdev_unregister() and force the drivers
> to turn leds off at shutdown. May be add check that led's brightness is 0
> at led_classdev_unregister() and put a warning to dmesg if it's not.
> Actually in many cases it doesn't really need to turn off the leds manually one-by-one
> if driver shutdowns whole led controller. For the last case to disable the warning
> new flag can be brought in e.g LED_AUTO_OFF_AT_SHUTDOWN (similar to LED_RETAIN_AT_SHUTDOWN).

NAK.

Just fix the drivers by wrapping mutex_destroy() into devm, There are many
doing so. You may be brave enough to introduce devm_mutex_init() somewhere
in include/linux/device*

-- 
With Best Regards,
Andy Shevchenko



