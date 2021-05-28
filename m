Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC1583941A2
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 13:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236519AbhE1LHS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 07:07:18 -0400
Received: from mga01.intel.com ([192.55.52.88]:54864 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236170AbhE1LHS (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 May 2021 07:07:18 -0400
IronPort-SDR: AP1FINOecpGiqcdbysLQnbtpDXfTljrAoixWaacWWDyWFjXRTFauzHB9ycrP31YeeJ5H6g+0Xi
 hB8VR5TGHaqQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="224168436"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="224168436"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 04:05:38 -0700
IronPort-SDR: 5gUpgFI3ijJhpVhNYyLzYKRGjOJiehWYgVfNXasWTI5Jj0AXbkyROweD2+VTajJhQXIyB3FkTD
 Prch3rKKsLDg==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="547949947"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 04:05:36 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lmaJ3-00FIT7-2g; Fri, 28 May 2021 14:05:33 +0300
Date:   Fri, 28 May 2021 14:05:33 +0300
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
Message-ID: <YLDOfWuis5MvdxfJ@smile.fi.intel.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <YKIbgBd3q8c+Tgz0@smile.fi.intel.com>
 <20210528100254.GC2209@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528100254.GC2209@amd>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, May 28, 2021 at 12:02:54PM +0200, Pavel Machek wrote:
> On Mon 2021-05-17 10:30:08, Andy Shevchenko wrote:
> > On Mon, May 10, 2021 at 12:50:17PM +0300, Andy Shevchenko wrote:
> > > When analyzing the current state of affairs with fwnode reference counting
> > > I found that a lot of core doesn't take it right. Here is a bunch of
> > > corresponding fixes against LED drivers.
> > > 
> > > The series includes some cleanups and a few other fixes grouped by a driver.
> > > 
> > > First two patches are taking care of -ENOTSUPP error code too  prevent its
> > > appearance in the user space.
> > 
> > Pavel, any comments on this bug fix series?
> 
> I took these:

Thanks!

What branch/tree should I rebase the rest on?

> For the "remove depends on OF"... I'd preffer not to take those. We
> don't need to ask the user for configurations that never happen.

What do you mean by this? ACPI is quite a good configuration to make use
of it on the corresponding platforms. By default any discrete LED driver
(in hardware term here) IC should be considered independent from the type
of the platform description. Do you agree? If so, it means that dropping
OF dependency is a right thing to do to allow users of those ICs to be happy
even on ACPI based platforms.

Note, entire IIO subsystem is a good example of this activity. All the sensors
can be used now in ACPI environment without explicit requirement to have an
ACPI ID, although it's highly recommended to acquire for the real products
(not DIY ones).

-- 
With Best Regards,
Andy Shevchenko


