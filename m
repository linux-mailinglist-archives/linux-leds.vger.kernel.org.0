Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC90B6490C7
	for <lists+linux-leds@lfdr.de>; Sat, 10 Dec 2022 21:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbiLJU50 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 10 Dec 2022 15:57:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbiLJU5Y (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 10 Dec 2022 15:57:24 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2C71705D;
        Sat, 10 Dec 2022 12:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670705843; x=1702241843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8tRXcUKxGagfde91ZdUSDF88p8/b8+3NQn8nn2kaumc=;
  b=NcB/GMthv49QkttcaJVa5iz/7pK2kbtiV/PAs9kKRZ9Bmto3zvimo4Bu
   MD6rD9kttG4K4hiwbvwvlxsCLmV9i6amFqB03xp8U2XlgxV3vMmk5ZLza
   F0RUSV4K5AJm84AXmaKV5bTahtJ87jB4h6xLK88kia3x7794QZXUJkoOL
   BC+hfWbH/7p8Z4A9wh/E9qGmFKLLeLFvhs4RwxAlqE8it+0ZF58R1iJ3n
   TUeMHMIyv6epzi25e4pK0Ad6xYcWZwZ/qYgzjcA18p7rUEvsAr8UvMJ1c
   IAKhMqIB8OJtO7/QlKfVl88IOG1tlZ/7rt/LADvG9p0RYqdisThCudOQf
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10557"; a="315286169"
X-IronPort-AV: E=Sophos;i="5.96,235,1665471600"; 
   d="scan'208";a="315286169"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2022 12:57:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10557"; a="678489946"
X-IronPort-AV: E=Sophos;i="5.96,234,1665471600"; 
   d="scan'208";a="678489946"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 10 Dec 2022 12:57:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1p46uK-007g2g-33;
        Sat, 10 Dec 2022 22:57:16 +0200
Date:   Sat, 10 Dec 2022 22:57:16 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-riscv@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 00/11] pwm: Allow .get_state to fail
Message-ID: <Y5TyrO5maz5VYic3@smile.fi.intel.com>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <Y5OtCjQOQjjltGPa@smile.fi.intel.com>
 <20221210091833.vdfir63nq4kpj5cm@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221210091833.vdfir63nq4kpj5cm@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,SUSPICIOUS_RECIPS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Dec 10, 2022 at 10:18:33AM +0100, Uwe Kleine-K�nig wrote:
> On Fri, Dec 09, 2022 at 11:47:54PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 30, 2022 at 04:21:37PM +0100, Uwe Kleine-K�nig wrote:

...

> > I'm wondering why we didn't see a compiler warning about mistyped function
> > prototypes in some drivers.
> 
> I don't understand where you expected a warning. Care to elaborate?

intel-lpss.c has the prototype that returns an int. IIRC it was like this
before your patches. Now the above wondering passage...

-- 
With Best Regards,
Andy Shevchenko


