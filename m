Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45DEB38F31F
	for <lists+linux-leds@lfdr.de>; Mon, 24 May 2021 20:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232636AbhEXSlN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 May 2021 14:41:13 -0400
Received: from mga03.intel.com ([134.134.136.65]:7816 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232803AbhEXSlN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 24 May 2021 14:41:13 -0400
IronPort-SDR: 63vuhk4eXcjvdqrSk1COAMtjvav+oT2CP444CfrAEhGzUCeb92p27mzzupybkSwLXTEherTKjV
 HqGUbTZzKayA==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="202046324"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="202046324"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 11:39:42 -0700
IronPort-SDR: vwNMvLdb3njbjNB+C58BOdqGKehkHbmLTL84wCKzCyq5NqJ1so83ODGF/KcVN+7ZeN+6h681Yj
 WgCuwaeoUXLg==
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="546049393"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 11:39:40 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1llFUH-00EPEW-I8; Mon, 24 May 2021 21:39:37 +0300
Date:   Mon, 24 May 2021 21:39:37 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/28] leds: cleanups and fwnode refcounting bug fixes
Message-ID: <YKvy6TCF7EsiUGQ2@smile.fi.intel.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <YKIbgBd3q8c+Tgz0@smile.fi.intel.com>
 <YKu+jUHTjwf+3J5g@smile.fi.intel.com>
 <20210524174903.GA29340@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524174903.GA29340@duo.ucw.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, May 24, 2021 at 07:49:03PM +0200, Pavel Machek wrote:
> On Mon 2021-05-24 17:56:13, Andy Shevchenko wrote:
> > On Mon, May 17, 2021 at 10:30:08AM +0300, Andy Shevchenko wrote:
> > > On Mon, May 10, 2021 at 12:50:17PM +0300, Andy Shevchenko wrote:
> > > > When analyzing the current state of affairs with fwnode reference counting
> > > > I found that a lot of core doesn't take it right. Here is a bunch of
> > > > corresponding fixes against LED drivers.
> > > > 
> > > > The series includes some cleanups and a few other fixes grouped by a driver.
> > > > 
> > > > First two patches are taking care of -ENOTSUPP error code too  prevent its
> > > > appearance in the user space.
> > > 
> > > Pavel, any comments on this bug fix series?
> > 
> > Pavel, we are at rc-3 already and this is kinda a big series that needs more
> > time to be sit in Linux-next, unfortunately while I see your activities here
> > and there, it is kept uncommented and unapplied. Can you shed a light what's
> > going on here? Do I need something to be amended?
> 
> I'm busy, sorry.

Oh, I see. Good you eventually answered!

> Series looks kind of okay on quick look.

I'll look forward to see it applied at some point in the future, thanks!


-- 
With Best Regards,
Andy Shevchenko


