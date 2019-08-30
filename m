Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8EBEA39BC
	for <lists+linux-leds@lfdr.de>; Fri, 30 Aug 2019 17:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbfH3PB5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Aug 2019 11:01:57 -0400
Received: from mga01.intel.com ([192.55.52.88]:33237 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727729AbfH3PB4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 30 Aug 2019 11:01:56 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Aug 2019 08:01:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,447,1559545200"; 
   d="scan'208";a="181228154"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 30 Aug 2019 08:01:55 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1i3iPS-0008Vp-6z; Fri, 30 Aug 2019 18:01:54 +0300
Date:   Fri, 30 Aug 2019 18:01:54 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v1 1/2] leds: trigger: gpio: GPIO 0 is valid
Message-ID: <20190830150154.GN2680@smile.fi.intel.com>
References: <20190821171727.87886-1-andriy.shevchenko@linux.intel.com>
 <c06873f2-7472-8013-7909-e5eb50def993@gmail.com>
 <20190826095746.GE30120@smile.fi.intel.com>
 <4abc4284-023d-2596-1554-42c0657cf1e8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4abc4284-023d-2596-1554-42c0657cf1e8@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Aug 26, 2019 at 08:36:04PM +0200, Jacek Anaszewski wrote:
> On 8/26/19 11:57 AM, Andy Shevchenko wrote:
> > On Sat, Aug 24, 2019 at 06:47:54PM +0200, Jacek Anaszewski wrote:
> >> On 8/21/19 7:17 PM, Andy Shevchenko wrote:
> >>> Allow all valid GPIOs to be used in the driver.
> >>>
> >>> Fixes: 17354bfe8527 ("leds: Add gpio-led trigger")
> >>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> >>> -	if (!gpio) {
> >>> -		if (gpio_data->gpio != 0)
> >>> +	if (!gpio_is_valid(gpio)) {
> >>> +		if (gpio_is_valid(gpio_data->gpio))
> >>>  			free_irq(gpio_to_irq(gpio_data->gpio), led);
> >>> -		gpio_data->gpio = 0;
> >>> +		gpio_data->gpio = gpio;
> >>
> >> It looks odd to me. I'd just assign invalid constant gpio number
> >> e.g. -1.
> > 
> > Current ABI (unsigned) doesn't allow us to do this. Internally we can redefine
> 
> Ah, right, missed that.
> 
> > invalid GPIO line number to -1 or so, but does it worth it?  And actually I
> > would prefer -EINVAL or -ENOENT in such cases.
> 
> OK, we can keep your "= gpio" assignment in view of the above, but need
> to return error instead of "n".

Then we will break an ABI, where user expects no error it suddenly will be one.

-- 
With Best Regards,
Andy Shevchenko


