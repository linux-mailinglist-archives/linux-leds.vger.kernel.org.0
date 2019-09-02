Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6B24A53A0
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2019 12:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729741AbfIBKIF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 2 Sep 2019 06:08:05 -0400
Received: from mga12.intel.com ([192.55.52.136]:5832 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729489AbfIBKIF (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 2 Sep 2019 06:08:05 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Sep 2019 03:08:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,457,1559545200"; 
   d="scan'208";a="265984015"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 02 Sep 2019 03:08:03 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1i4jFi-0008Jv-E6; Mon, 02 Sep 2019 13:08:02 +0300
Date:   Mon, 2 Sep 2019 13:08:02 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 2/2] leds: trigger: gpio: Convert to use kstrtox()
Message-ID: <20190902100802.GY2680@smile.fi.intel.com>
References: <20190830150820.63450-1-andriy.shevchenko@linux.intel.com>
 <20190830150820.63450-2-andriy.shevchenko@linux.intel.com>
 <20190901102316.GA29681@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190901102316.GA29681@amd>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Sep 01, 2019 at 12:23:17PM +0200, Pavel Machek wrote:
> On Fri 2019-08-30 18:08:20, Andy Shevchenko wrote:
> > sscanf() is a heavy one and moreover requires additional boundary checks.
> > Convert driver to use kstrtox() and replace kstrtoul() by kstrtobool()
> > in gpio_trig_inverted_store().
> > 
> > While here, check the desired brightness against maximum defined for
> > a certain LED.
> 
> One change per patch, please.
> 
> Because this one will not end well.
> 
> > @@ -60,10 +60,10 @@ static ssize_t gpio_trig_brightness_store(struct device *dev,
> >  	unsigned desired_brightness;
> >  	int ret;
> >  
> > -	ret = sscanf(buf, "%u", &desired_brightness);
> > -	if (ret < 1 || desired_brightness > 255) {
> > +	ret = kstrtouint(buf, 10, &desired_brightness);
> > +	if (ret || desired_brightness > gpio_data->led->max_brightness) {
> >  		dev_err(dev, "invalid value\n");
> > -		return -EINVAL;
> > +		return ret ? ret : -EINVAL;
> >  	}
> 
> We have people writing 255 into brightness, because that's what we
> used to do even for on/off LEDS. It is expected to work even for leds
> with max_brightness of 1.
> 
> So... we want to saturate here, not return -EINVAL. (And we will
> eventually want to switch on/off leds to max_brightness = 1...)

Agree. Thank you for your review!

> 
> > @@ -86,16 +86,13 @@ static ssize_t gpio_trig_inverted_store(struct device *dev,
> >  {
> >  	struct led_classdev *led = led_trigger_get_led(dev);
> >  	struct gpio_trig_data *gpio_data = led_trigger_get_drvdata(dev);
> > -	unsigned long inverted;
> > +	bool inverted;
> >  	int ret;
> >  
> > -	ret = kstrtoul(buf, 10, &inverted);
> > -	if (ret < 0)
> > +	ret = kstrtobool(buf, &inverted);
> > +	if (ret)
> >  		return ret;
> >  
> > -	if (inverted > 1)
> > -		return -EINVAL;
> > -
> >  	gpio_data->inverted = inverted;
> >  
> >  	/* After inverting, we need to update the LED. */
> 
> So, this accepted 0/1. Now it also accepts true false and many other pairs.
> 
> Which... might be ok. But probably should be separated.



-- 
With Best Regards,
Andy Shevchenko


