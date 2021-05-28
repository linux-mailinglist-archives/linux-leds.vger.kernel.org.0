Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB04839414F
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 12:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236530AbhE1KrO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 06:47:14 -0400
Received: from mga01.intel.com ([192.55.52.88]:53668 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236340AbhE1KrN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 May 2021 06:47:13 -0400
IronPort-SDR: YsePYQJD8tTo0UOVaqrZINZuuC98X7vZS8IWuIzoIVLrzteSE3um5PPRJcf8olZwbkWQ0ED/b+
 /dvtD+TPqJuw==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="224166045"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="224166045"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 03:45:38 -0700
IronPort-SDR: bbuC1joOym2GH0be1kABCGUGS8fy59so6ikZaWMxUoC1GT44vRQcUTA1V8pg5ys7z54svUUn6x
 AStv45sMm1lw==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="465837093"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 03:45:34 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lmZzf-00FIDS-NS; Fri, 28 May 2021 13:45:31 +0300
Date:   Fri, 28 May 2021 13:45:31 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 03/28] leds: el15203000: Give better margin for
 usleep_range()
Message-ID: <YLDJy5NE+xKmGL21@smile.fi.intel.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-4-andy.shevchenko@gmail.com>
 <20210528100440.GE2209@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528100440.GE2209@amd>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, May 28, 2021 at 12:04:40PM +0200, Pavel Machek wrote:
> On Mon 2021-05-10 12:50:20, Andy Shevchenko wrote:
> > 1 microsecond with 20 millisecond parameter is too low margin for
> > usleep_range(). Give 100 to make scheduler happier.
> > 
> > While at it, fix indentation in cases where EL_FW_DELAY_USEC is in use.
> > In the loop, move it to the end to avoid a conditional.
> 
> Its not like unhappy schedulers are problem...

Any hints then? To me it sounds like torturing scheduler is the real problem
and that's why scheduler is unhappy.

-- 
With Best Regards,
Andy Shevchenko


