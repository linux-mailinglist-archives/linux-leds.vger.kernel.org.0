Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B598394156
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 12:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236562AbhE1Kup (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 06:50:45 -0400
Received: from mga12.intel.com ([192.55.52.136]:12269 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236484AbhE1Kuo (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 May 2021 06:50:44 -0400
IronPort-SDR: qn1e/5GeU4f+tZWShtvDz9xoV81ErfqgU5pUo8R6RTUXVSIybBgpPyctOA83m1wcDuSiEF8nR7
 3htd9PLpVuAQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="182596989"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="182596989"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 03:49:06 -0700
IronPort-SDR: uAJZQ4kGZxT8yM1Hc8dvDcBEnkdMBK0oGayVCzkIKa/uPeMzdM8kWqbBomJsEkmae/8Ayb7dKE
 qToo+ruMlyFw==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="548547389"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 03:49:03 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lma33-00FIGn-4n; Fri, 28 May 2021 13:49:01 +0300
Date:   Fri, 28 May 2021 13:49:01 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 11/28] leds: lgm-sso: Remove explicit managed resource
 cleanups
Message-ID: <YLDKneVl0DefNdAW@smile.fi.intel.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-12-andy.shevchenko@gmail.com>
 <20210528100906.GG2209@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528100906.GG2209@amd>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, May 28, 2021 at 12:09:06PM +0200, Pavel Machek wrote:
> On Mon 2021-05-10 12:50:28, Andy Shevchenko wrote:
> > The idea of managed resources that they will be cleaned up automatically
> > and in the proper order. Remove explicit cleanups.
> 
> Are you really sure this is good idea with the regmap_update_bits in
> between?

Good question. I will check it.

> > -	/* unregister led */
> > -	devm_led_classdev_unregister(priv->dev, &led->cdev);
> > -
> >  	/* clear HW control bit */
> >  	if (led->desc.hw_trig)
> >  		regmap_update_bits(priv->mmap, SSO_CON3, BIT(led->desc.pin), 0);
> >  
> > -	if (led->gpiod)
> > -		devm_gpiod_put(priv->dev, led->gpiod);
> > -
> >  	led->priv = NULL;


-- 
With Best Regards,
Andy Shevchenko


