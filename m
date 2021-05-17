Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFE5E38255D
	for <lists+linux-leds@lfdr.de>; Mon, 17 May 2021 09:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235262AbhEQHba (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 May 2021 03:31:30 -0400
Received: from mga12.intel.com ([192.55.52.136]:9306 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234742AbhEQHba (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 17 May 2021 03:31:30 -0400
IronPort-SDR: 5V+t+U/8yQU2VzNQiRrkKupkmKPEFKx2oG2CUJOnw55YGDIJY3486GATwCpx26v5e2PrYFjuFV
 FoorvuGg+tMw==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="180000954"
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; 
   d="scan'208";a="180000954"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 00:30:14 -0700
IronPort-SDR: O74P1WSVwbUD2+xleF7zz0o/F9NECo41rvBk2wdHwKnFvDyreGT5yFV+U0GLgO9jOB7q5DfVpt
 +T9RmNdnyofA==
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; 
   d="scan'208";a="465583628"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 00:30:12 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1liXhY-00Cgf5-ME; Mon, 17 May 2021 10:30:08 +0300
Date:   Mon, 17 May 2021 10:30:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Pavel Machek <pavel@ucw.cz>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/28] leds: cleanups and fwnode refcounting bug fixes
Message-ID: <YKIbgBd3q8c+Tgz0@smile.fi.intel.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, May 10, 2021 at 12:50:17PM +0300, Andy Shevchenko wrote:
> When analyzing the current state of affairs with fwnode reference counting
> I found that a lot of core doesn't take it right. Here is a bunch of
> corresponding fixes against LED drivers.
> 
> The series includes some cleanups and a few other fixes grouped by a driver.
> 
> First two patches are taking care of -ENOTSUPP error code too  prevent its
> appearance in the user space.

Pavel, any comments on this bug fix series?

-- 
With Best Regards,
Andy Shevchenko


