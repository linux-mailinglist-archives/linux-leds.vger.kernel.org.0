Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA3D3B1AEB
	for <lists+linux-leds@lfdr.de>; Wed, 23 Jun 2021 15:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbhFWNRr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Jun 2021 09:17:47 -0400
Received: from mga17.intel.com ([192.55.52.151]:54901 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231127AbhFWNRr (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 23 Jun 2021 09:17:47 -0400
IronPort-SDR: Iajfa+PReLhQUtGxST/O/rpPO3Y5RQ7OYyh7fusDAjIJsko2dJjKi/7vV94HirIAt/SDqaKnKP
 o59oXVh7Z26Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="187638815"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; 
   d="scan'208";a="187638815"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2021 06:15:26 -0700
IronPort-SDR: 5g/zksFLyxZZs31WhAZ9wcBMwnIFj2s9RS5yOHj9RFyya9cECjmoJEwaEBDmw2kUyEVWvC8o6f
 tz/s23u6oyDw==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; 
   d="scan'208";a="406304926"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2021 06:15:23 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lw2it-004kaA-DG; Wed, 23 Jun 2021 16:15:19 +0300
Date:   Wed, 23 Jun 2021 16:15:19 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 01/13] leds: core: The -ENOTSUPP should never be seen
 by user space
Message-ID: <YNMz59WLCMwr0rVD@smile.fi.intel.com>
References: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, May 29, 2021 at 02:19:23PM +0300, Andy Shevchenko wrote:
> Luckily there is no user which checks for returned code and actually
> returns it, but since the function is exported any user may try to return
> an error code from it to user space, usually during probe phase,
> 
> Replace -ENOTSUPP by -EOPNOTSUPP when returning from exported function.

There were no issue reported by bots, no comments from people (except one tag),
can we do something about this series or should I amend it?


-- 
With Best Regards,
Andy Shevchenko


