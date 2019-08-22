Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA93699830
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2019 17:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732445AbfHVPbG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 22 Aug 2019 11:31:06 -0400
Received: from mga02.intel.com ([134.134.136.20]:19411 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731844AbfHVPbF (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 22 Aug 2019 11:31:05 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Aug 2019 08:31:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; 
   d="scan'208";a="378557301"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga005.fm.intel.com with ESMTP; 22 Aug 2019 08:31:02 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1i0p3E-0003kB-Lp; Thu, 22 Aug 2019 18:31:00 +0300
Date:   Thu, 22 Aug 2019 18:31:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v1] leds: core: Refactor led_update_brightness()
Message-ID: <20190822153100.GR30120@smile.fi.intel.com>
References: <20190822152539.52641-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822152539.52641-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Aug 22, 2019 at 06:25:39PM +0300, Andy Shevchenko wrote:
> There is neither need to have an additional assignment of ret, nor
> the non-so-standard conditional. Moreover, the resulting code better to read
> and less LOCs.

Please, ignore this, it's not correct in this form.

-- 
With Best Regards,
Andy Shevchenko


