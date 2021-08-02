Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 809503DD498
	for <lists+linux-leds@lfdr.de>; Mon,  2 Aug 2021 13:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233255AbhHBLXq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 2 Aug 2021 07:23:46 -0400
Received: from mga02.intel.com ([134.134.136.20]:27260 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233243AbhHBLXq (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 2 Aug 2021 07:23:46 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="200608151"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="200608151"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 04:23:36 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="583872479"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 04:23:34 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mAW2a-004IdY-AB; Mon, 02 Aug 2021 14:23:28 +0300
Date:   Mon, 2 Aug 2021 14:23:28 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan =?iso-8859-1?Q?Kundr=E1t?= <jan.kundrat@cesnet.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/3] leds: lp50xx: KConfig: fix dependencies
Message-ID: <YQfVsN04iGpU0v5D@smile.fi.intel.com>
References: <10256dd4010034d6335139d587ebfe933343ee85.1627717572.git.jan.kundrat@cesnet.cz>
 <e64ff175a1dc36cbae639aa8ccaba91188bd789c.1627717572.git.jan.kundrat@cesnet.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e64ff175a1dc36cbae639aa8ccaba91188bd789c.1627717572.git.jan.kundrat@cesnet.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Jul 31, 2021 at 12:01:17AM +0200, Jan Kundrát wrote:
> I just lost a few hours of debugging why the heck my sysfs nodes were
> not created even though devm_led_classdev_multicolor_register_ext() was
> returning 0. It turned out that I was missing support for the multicolor
> LED device class. No errors were reported, neither during the build, nor
> at runtime -- but the DTS configuration of the connected LEDs was
> silently ignored.

Which is okay. The feature as far as I can see is optional.

> The driver also really needs DTS -- probe fails if there are no children
> in the DT, so the direct binding from userspace probably doesn't work.
> That's interesting because commit
> ea1ff99c9d235b8a54571d4292c71fce60993117 suggests that a direct bind was
> supposed to work.

First of all, please use standard reference to the commit (it will give a bit
more context here), i.e.

ea1ff99c9d23 ("leds: lp50xx: Switch to new style i2c-driver probe function")

Second, it suggests that in general. While this driver currently won't be
instantiated via user space, it the future we potentially might have a way
how to construct software node(s) from user space (perhaps using configfs)
and it will make the above statement a complete truth.

...

> -	depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
> +	depends on LEDS_CLASS_MULTICOLOR

No, until there is a justification why it should be non-optional.

You may add a debug message in order to avoid others to waste time on
understanding the issue in the cases same to yours.

...

> +	depends on OF

No, this driver is not OF-dependent. This change will bring a regression to it
on ACPI-based systems.

-- 
With Best Regards,
Andy Shevchenko


