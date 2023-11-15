Return-Path: <linux-leds+bounces-11-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7E27EB1F8
	for <lists+linux-leds@lfdr.de>; Tue, 14 Nov 2023 15:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDCF92811B4
	for <lists+linux-leds@lfdr.de>; Tue, 14 Nov 2023 14:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F1B41211;
	Tue, 14 Nov 2023 14:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T48Xlf/U"
X-Original-To: linux-leds@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B22E405ED;
	Tue, 14 Nov 2023 14:19:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB1D122;
	Tue, 14 Nov 2023 06:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699971542; x=1731507542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g9zYZnZiNzto+K7m9pFPS+Sot20cLnI/IhhfnjZUFKE=;
  b=T48Xlf/UBchPkxy5RkzwVti1uh6yL5av2JXzn1kw5QWczsA1EKm2HdjR
   ZfKlBcJF4kOQxR1UsIE8M4yqNlhN8DQ0aBo1Krd7XTYq+nIs8EavP7WTZ
   4akJU2hI14kSBGiomKx0Knk7uk3Mmwda8FWsmqwvg8LRKRR+aDcr2Kv3j
   uzXSL1Xs52jbmncWM+M2DN1ELiZs2jU+3NCgigurkQFW5fyYlL4/XyRtF
   nbDUmo3OS5KWD5Va1+cy+s3sAe0OQa6AO+CRvGuCsrAEadYHDlqq+L348
   yt3BQECCioIxfp1OzgZm8MtmqLa79rwy0mDXLUdoYD+QW4KqPEWxZ8U9s
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="3725019"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="3725019"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 06:19:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="741106694"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="741106694"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 06:18:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r2uFk-0000000Dpmn-0ceR;
	Tue, 14 Nov 2023 16:18:56 +0200
Date: Tue, 14 Nov 2023 16:18:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "larry.lai" <larry.lai@yunjingtech.com>
Cc: lee@kernel.org, linus.walleij@linaro.org, pavel@ucw.cz,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-leds@vger.kernel.org, GaryWang@aaeon.com.tw,
	musa.lin@yunjingtech.com, jack.chang@yunjingtech.com,
	noah.hung@yunjingtech.com
Subject: Re: [PATCH V7 2/3] pinctrl: Add support pin control for UP board
 CPLD/FPGA
Message-ID: <ZVOBz8-tahhrVmO-@smile.fi.intel.com>
References: <20231031015119.29756-1-larry.lai@yunjingtech.com>
 <20231031015119.29756-3-larry.lai@yunjingtech.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031015119.29756-3-larry.lai@yunjingtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 31, 2023 at 09:51:18AM +0800, larry.lai wrote:
> The UP Squared board <http://www.upboard.com> implements certain
> features (pin control) through an on-board FPGA.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Gary Wang <garywang@aaeon.com.tw>
> Signed-off-by: larry.lai <larry.lai@yunjingtech.com>

Same comments as per previous patch.

...

> +	help
> +	  Pin controller for the FPGA GPIO lines on UP boards. Due to the
> +	  hardware layout, these are meant to be controlled in tandem with their
> +	  corresponding Intel SoC GPIOs.

+ blank line here.

> +	  To compile this driver as a module, choose M here: the module
> +	  will be called pinctrl-upboard.

...

> + * UP Board HAT pin controller driver
> + * remapping native pin to RPI pin and set CPLD pin dir

Same comment to all the comments as per previous patch.

...

+ Missing bits.h, types.h and maybe others.

> +#include <linux/dmi.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>

> +#include <linux/kernel.h>

array_size.h ?

> +#include <linux/mfd/upboard-fpga.h>
> +#include <linux/module.h>

> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>

Move this...

> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/interrupt.h>
> +#include <linux/seq_file.h>
> +#include <linux/string.h>

...here to be a group of pinctrl headers.


> +#include "core.h"

...


> +#include "intel/pinctrl-intel.h"

I do not think it's correct use of the header.

...

> +/* for older kernel lost DIRECTION_IN/OUT definition */
> +#ifndef GPIO_LINE_DIRECTION_IN
> +#define GPIO_LINE_DIRECTION_IN		1
> +#define GPIO_LINE_DIRECTION_OUT		0
> +#endif

Are you submitting this to older kernel here? No. Then why this?

...

> +/* Offset from regs */
> +#define REVID						0x000
> +#define REVID_SHIFT					16
> +#define REVID_MASK					GENMASK(31, 16)
> +#define PADBAR						0x00c
> +
> +/* Offset from pad_regs */
> +#define PADCFG0						0x000
> +#define PADCFG0_RXEVCFG_SHIFT		25
> +#define PADCFG0_RXEVCFG_MASK		GENMASK(26, 25)
> +#define PADCFG0_RXEVCFG_LEVEL		0
> +#define PADCFG0_RXEVCFG_EDGE		1
> +#define PADCFG0_RXEVCFG_DISABLED	2
> +#define PADCFG0_RXEVCFG_EDGE_BOTH	3
> +#define PADCFG0_PREGFRXSEL			BIT(24)
> +#define PADCFG0_RXINV				BIT(23)
> +#define PADCFG0_GPIROUTIOXAPIC		BIT(20)
> +#define PADCFG0_GPIROUTSCI			BIT(19)
> +#define PADCFG0_GPIROUTSMI			BIT(18)
> +#define PADCFG0_GPIROUTNMI			BIT(17)
> +#define PADCFG0_PMODE_SHIFT			10
> +#define PADCFG0_PMODE_MASK			GENMASK(13, 10)
> +#define PADCFG0_PMODE_GPIO			0
> +#define PADCFG0_GPIORXDIS			BIT(9)
> +#define PADCFG0_GPIOTXDIS			BIT(8)
> +#define PADCFG0_GPIORXSTATE			BIT(1)
> +#define PADCFG0_GPIOTXSTATE			BIT(0)
> +
> +#define PADCFG1						0x004
> +#define PADCFG1_TERM_UP				BIT(13)
> +#define PADCFG1_TERM_SHIFT			10
> +#define PADCFG1_TERM_MASK			GENMASK(12, 10)
> +#define PADCFG1_TERM_20K			BIT(2)
> +#define PADCFG1_TERM_5K				BIT(1)
> +#define PADCFG1_TERM_1K				BIT(0)
> +#define PADCFG1_TERM_833			(BIT(1) | BIT(0))
> +
> +#define PADCFG2						0x008
> +#define PADCFG2_DEBEN				BIT(0)
> +#define PADCFG2_DEBOUNCE_SHIFT		1
> +#define PADCFG2_DEBOUNCE_MASK		GENMASK(4, 1)
> +
> +#define DEBOUNCE_PERIOD_NSEC		31250
> +
> +/* Additional features supported by the hardware */
> +#define PINCTRL_FEATURE_DEBOUNCE	BIT(0)
> +#define PINCTRL_FEATURE_1K_PD		BIT(1)

Huh?! No way it should be here in _any_ form!

...

I'm done with review as design wise this one is broken. Please, redesign and
reimplement. Also split this per platform addition (as suggested for MFD),
it will be easier to review.

-- 
With Best Regards,
Andy Shevchenko



