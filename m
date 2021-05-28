Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F31C539415B
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 12:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236454AbhE1Kwi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 06:52:38 -0400
Received: from mga07.intel.com ([134.134.136.100]:3326 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236340AbhE1Kwi (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 May 2021 06:52:38 -0400
IronPort-SDR: djpBFNttFEdKEclcmvpkSGegQPP6r6Ddlb1qod7pNiQeo5vTagwVINXMh6pW29lnbOaPyWgi12
 cZvJ4LxNjz6A==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="266821100"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="266821100"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 03:51:02 -0700
IronPort-SDR: pTWpuRB73zdELuMDVRaGK+RfNYVy1mMF3sBmnntZM2aId+n4j4ZbS0wTztx2FxOczz9ynQH+op
 0eCncQF2fhmg==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="445582657"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 03:51:00 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lma4v-00FIIB-Ma; Fri, 28 May 2021 13:50:57 +0300
Date:   Fri, 28 May 2021 13:50:57 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 21/28] leds: lm3697: Make error handling more robust
Message-ID: <YLDLEQ0IALoBbY7T@smile.fi.intel.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-22-andy.shevchenko@gmail.com>
 <20210528101057.GH2209@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528101057.GH2209@amd>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, May 28, 2021 at 12:10:57PM +0200, Pavel Machek wrote:
> On Mon 2021-05-10 12:50:38, Andy Shevchenko wrote:
> > It's easy to miss necessary clean up, e.g. firmware node reference counting,
> > during error path in ->probe(). Make it more robust by moving to a single
> > point of return.
> > 
> > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> You are now putting the handle even in the success case. Is that
> right?

Let's put it this way: it's no-op in successful case.

But yeah, I would prefer to have a separate case for error, I'll revisit this.

-- 
With Best Regards,
Andy Shevchenko


