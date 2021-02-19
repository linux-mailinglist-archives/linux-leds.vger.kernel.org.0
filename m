Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C344431FB69
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 15:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhBSOwv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 09:52:51 -0500
Received: from mga06.intel.com ([134.134.136.31]:32372 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230045AbhBSOws (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 19 Feb 2021 09:52:48 -0500
IronPort-SDR: KWc+tMYChgqo4VL925+ofOw8AQKM0QQbAKDUxYgsY6CgS9eJd9+EjlZvArtDReJn2YYCMpdfsp
 VgsfQc1L04tg==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="245297940"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
   d="scan'208";a="245297940"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2021 06:51:00 -0800
IronPort-SDR: XNsOsLS/6p2KI9BVXBS0S5Q0fHuqsTaIzWVr3TOnxt9tTdXzgYEdkRsgSXs/UsPjRp3R4SeSVz
 p2GCd5Zc5jBA==
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
   d="scan'208";a="440289014"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2021 06:50:58 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lD77Q-006Ehe-5C; Fri, 19 Feb 2021 16:50:56 +0200
Date:   Fri, 19 Feb 2021 16:50:56 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sven Schuchmann <schuchmann@schleissheimer.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] leds: lp50xx: add setting of default intensity
 from DT
Message-ID: <YC/QUIc4LOJtyY5r@smile.fi.intel.com>
References: <20210204143738.28036-1-schuchmann@schleissheimer.de>
 <20210204145308.GC14305@duo.ucw.cz>
 <DB8P190MB0634587826F57667BB3BBB6CD9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210205103438.GB27854@amd>
 <DB8P190MB063473FEA37E69E6DF6BC5F6D9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210219111659.GI19207@duo.ucw.cz>
 <DB8P190MB06340AA6D789A80A4CE2B6C6D9849@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <YC/DUmhXate4NhML@smile.fi.intel.com>
 <DB8P190MB063470370E6CD67900726B5DD9849@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB8P190MB063470370E6CD67900726B5DD9849@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Feb 19, 2021 at 02:09:03PM +0000, Sven Schuchmann wrote:
> > Von: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Gesendet: Freitag, 19. Februar 2021 14:56

> > > > > > Can you or Dan submit patch getting the regulator support to work? If
> > > > > > not, I guess we should remove the regulator support after all.
> > > > >
> > > > > To be true I am fairly new to the kernel and have no idea
> > > > > how to test this. So no, I don't want provide a patch (except
> > > > > for removing), sorry.
> > > >
> > > > No problem. It seems Andy submitted series for this.
> > > >
> > >
> > > To me it seems that patches from Andy don't make
> > > the regulator work. Maybe I am wrong?
> > 
> > I;m not sure I understand this correctly. Do you mean that my patches broke
> > something? Which one explicitly and what is broken?
> 
> No, your patches do not break something (as far as I can see).
> Pavel asked for a patch to fix the regulator. The regulator
> at this time is only initialized but never used in the lp50xx.
> I told him (see above) that I cannot provide a patch which
> fixes this. He answered that you fixed this in your series,
> but to me it doesn't seem so.
> or did you fix the regulator usage in your patch series?

No, I haven't touched regulator and I see now what is there.
One may add some code, I know Linus did it in many places, maybe he can help to
have done this properly?


-- 
With Best Regards,
Andy Shevchenko


