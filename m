Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3E1C9CCE9
	for <lists+linux-leds@lfdr.de>; Mon, 26 Aug 2019 11:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731061AbfHZJ5v (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 26 Aug 2019 05:57:51 -0400
Received: from mga03.intel.com ([134.134.136.65]:25853 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731052AbfHZJ5v (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 26 Aug 2019 05:57:51 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Aug 2019 02:57:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,431,1559545200"; 
   d="scan'208";a="379595567"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga005.fm.intel.com with ESMTP; 26 Aug 2019 02:57:49 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1i2Bkw-00014n-VI; Mon, 26 Aug 2019 12:57:46 +0300
Date:   Mon, 26 Aug 2019 12:57:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v1 1/2] leds: trigger: gpio: GPIO 0 is valid
Message-ID: <20190826095746.GE30120@smile.fi.intel.com>
References: <20190821171727.87886-1-andriy.shevchenko@linux.intel.com>
 <c06873f2-7472-8013-7909-e5eb50def993@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c06873f2-7472-8013-7909-e5eb50def993@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Aug 24, 2019 at 06:47:54PM +0200, Jacek Anaszewski wrote:
> On 8/21/19 7:17 PM, Andy Shevchenko wrote:
> > Allow all valid GPIOs to be used in the driver.
> > 
> > Fixes: 17354bfe8527 ("leds: Add gpio-led trigger")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> > -	if (!gpio) {
> > -		if (gpio_data->gpio != 0)
> > +	if (!gpio_is_valid(gpio)) {
> > +		if (gpio_is_valid(gpio_data->gpio))
> >  			free_irq(gpio_to_irq(gpio_data->gpio), led);
> > -		gpio_data->gpio = 0;
> > +		gpio_data->gpio = gpio;
> 
> It looks odd to me. I'd just assign invalid constant gpio number
> e.g. -1.

Current ABI (unsigned) doesn't allow us to do this. Internally we can redefine
invalid GPIO line number to -1 or so, but does it worth it?  And actually I
would prefer -EINVAL or -ENOENT in such cases.

> Note that we should also do that in gpio_trig_activate(), where
> gpio_data->gpio is initialized to 0 by kzalloc(). That later can
> have nasty side effect in gpio_trig_gpio_store() when gpio to set
> is 0. Then the condition "if (gpio_data->gpio == gpio)" will evaluate
> to true and gpio_trig_irq() handler will not be registered.

Thanks for spotting this!

-- 
With Best Regards,
Andy Shevchenko


