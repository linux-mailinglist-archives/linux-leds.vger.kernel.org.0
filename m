Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70EEB90312
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2019 15:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbfHPNcP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Aug 2019 09:32:15 -0400
Received: from mga18.intel.com ([134.134.136.126]:50905 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727255AbfHPNcP (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 16 Aug 2019 09:32:15 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Aug 2019 06:31:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,393,1559545200"; 
   d="scan'208";a="377416999"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga006.fm.intel.com with ESMTP; 16 Aug 2019 06:31:48 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hycKY-0001tM-Nz; Fri, 16 Aug 2019 16:31:46 +0300
Date:   Fri, 16 Aug 2019 16:31:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v1] leds: Allow to call led_classdev_unregister()
 unconditionally
Message-ID: <20190816133146.GH30120@smile.fi.intel.com>
References: <20190816105229.81234-1-andriy.shevchenko@linux.intel.com>
 <20190816114908.GA10081@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816114908.GA10081@amd>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Aug 16, 2019 at 01:49:08PM +0200, Pavel Machek wrote:
> Hi!
> 
> > If in the certain driver the LED is optional, and it's a majority of them,
> > the call of led_classdev_unregister() still requires some additional checks.
> > 
> > The usual pattern on unregistering is to check for NULL, but we also check
> > for IS_ERR() in case device_create_with_groups() fails.
> > 
> > The change will reduce a burden in a lot of drivers to repeatedly check
> > for above conditions.
> 
> I don't see majority of calls being protected.  Doing nothing on NULL
> sounds reasonable. I'm less sure about "IS_ERR"...

Majority by drivers, not by absolute number of calls you can grep for.

What I'm referring to is, for example,

     commit 99fef587ff98894426d9bf1f5b7336345052d4b3
     Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
     Date:   Mon Dec 3 20:21:41 2018 +0200

         driver core: platform: Respect return code of platform_device_register_full()

-- 
With Best Regards,
Andy Shevchenko


