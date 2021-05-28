Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7448394148
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 12:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236340AbhE1KpT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 06:45:19 -0400
Received: from mga17.intel.com ([192.55.52.151]:25346 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236170AbhE1KpS (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 May 2021 06:45:18 -0400
IronPort-SDR: maLhZ/sS16zBokSIWB599AdiNnm4fn8tAIYz9BX0MLZadxBJwIRyrXIAbsoU+yNevj7gUT2KF6
 h8QexolRDHvw==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="183275093"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="183275093"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 03:43:42 -0700
IronPort-SDR: EtPyt9w9JFgSEpsBg4bNlGZqiU7Afai+eL8UZ+rWH/opHFcGGFxp8So0AfJT23vW0uZdpy5GDY
 7yrQmG3GAXPw==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="445581365"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 03:43:40 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lmZxp-00FIBp-B4; Fri, 28 May 2021 13:43:37 +0300
Date:   Fri, 28 May 2021 13:43:37 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v1 02/28] leds: core: The -ENOTSUPP should never be seen
 by user space
Message-ID: <YLDJWV4HYvBJYcq0@smile.fi.intel.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-3-andy.shevchenko@gmail.com>
 <20210528100339.GD2209@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210528100339.GD2209@amd>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, May 28, 2021 at 12:03:39PM +0200, Pavel Machek wrote:
> On Mon 2021-05-10 12:50:19, Andy Shevchenko wrote:
> > Replace -ENOTSUPP by -EOPNOTSUPP when returning from exported function.
> > 
> > Fixes: 13ae79bbe4c2 ("leds: core: Drivers shouldn't enforce SYNC/ASYNC brightness setting")
> > Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> Are you sure this is real problem?

(Potential) real problem, yes.

» This does not sound like an error
> path that should happen.

Before crafting this patch I have checked callers and _luckily_ they haven't
tested the returned code. But if any of the user decides to check -> real
problem.

-- 
With Best Regards,
Andy Shevchenko


