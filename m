Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E446394192
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 13:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236445AbhE1LBd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 07:01:33 -0400
Received: from mga17.intel.com ([192.55.52.151]:26290 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236170AbhE1LBc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 May 2021 07:01:32 -0400
IronPort-SDR: mSYL3t3iCBuh5FFbDih6cwxrQbngPyabDxhvjewIVCFZBcW9iZT2M//xfMe9ACHb+mByc95wWz
 bWFOsZ9c/G+A==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="183276534"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="183276534"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 03:59:58 -0700
IronPort-SDR: uy0r5inqD7b3ySekCdAI9Xs1TWDSN3JJKFkITW47mQ1iH7+JKYS/0+lvwDe4GIk4taAjr/EI7v
 VHVvCsQauAVw==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="465839889"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 03:59:56 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lmaDZ-00FIOq-9v; Fri, 28 May 2021 13:59:53 +0300
Date:   Fri, 28 May 2021 13:59:53 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH v1 28/28] leds: sgm3140: Put fwnode in any case during
 ->probe()
Message-ID: <YLDNKekDfNQPorRG@smile.fi.intel.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-29-andy.shevchenko@gmail.com>
 <20210528101454.GJ2209@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528101454.GJ2209@amd>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, May 28, 2021 at 12:14:54PM +0200, Pavel Machek wrote:
> Hi!
> 
> > fwnode_get_next_child_node() bumps a reference counting of a returned variable.
> > We have to balance it whenever we return to the caller.
> 
> This (and similar) -- in half of the drivers we hold the handle from
> successful probe. Is it a problem and why is it problem only for some
> drivers?

Hmm... I'm not sure I have understood the question correctly. Any examples of
the driver that you think needs some attention?

In general the idea is that these kind of for-loops or getting next fwnode
should be balanced.

In case of for-loops the error or any other breakage means that reference count
is bumped, for the get_next API it's always the case.

I have checked between drivers and only considered above cases. Wherever there
is a for-loop which isn't broken, we are fine. Wherever we have explicit
reference counter drop for get_next cases, we are fine. If (any) framework
requires the resource to be present that framework should bump and drop
reference count on the resource by itself (so I split LED framework out from
the consideration and consider that it does the right things)

> Thanks for series, btw, I pushed out current version of the tree.

Should I rebase the new version on something I can find in your Git tree?

-- 
With Best Regards,
Andy Shevchenko


