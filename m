Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA290394152
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 12:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236436AbhE1Ks3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 06:48:29 -0400
Received: from mga11.intel.com ([192.55.52.93]:5341 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236170AbhE1Ks2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 May 2021 06:48:28 -0400
IronPort-SDR: v4pvy+yHtENu2uYZfZULGVMA3G3srmdxGhzT6K7ui6LtRTcVLYxI1daKfBsIQOZ69xqMTMAIuy
 lKDcEyuIFsKA==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="199898280"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="199898280"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 03:46:53 -0700
IronPort-SDR: PpMwCDE4MI4SGk+UU0CugHN7WxxW+Hm503k+o2vpa8QaOhXGPlftJRZXGioDZ7DaETq2+SRvpD
 1aLmDMPaytKg==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="615721783"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 03:46:50 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lma0t-00FIEU-Rc; Fri, 28 May 2021 13:46:47 +0300
Date:   Fri, 28 May 2021 13:46:47 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 08/28] leds: lgm-sso: Put fwnode in any case during
 ->probe()
Message-ID: <YLDKF32PmNP0ZDTK@smile.fi.intel.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-9-andy.shevchenko@gmail.com>
 <20210528100800.GF2209@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528100800.GF2209@amd>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, May 28, 2021 at 12:08:00PM +0200, Pavel Machek wrote:
> > @@ -734,10 +736,15 @@ static int sso_led_dt_parse(struct sso_led_priv *priv)
> >  	if (fw_ssoled) {
> >  		ret = __sso_led_dt_parse(priv, fw_ssoled);
> >  		if (ret)
> > -			return ret;
> > +			goto err_child_out;
> >  	}
> >  
> > +	fwnode_handle_put(fw_ssoled);
> >  	return 0;
> > +
> > +err_child_out:
> > +	fwnode_handle_put(fw_ssoled);
> > +	return ret;
> >  }
> 
> Just delete the return and you get the same effect, no? No need to
> have two exits here.

I prefer to see it clear and follow the same pattern, but if you insist, I can
change in proposed way.

Thanks for review!

-- 
With Best Regards,
Andy Shevchenko


