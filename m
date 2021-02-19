Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB1731FA0C
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 14:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbhBSNoA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 08:44:00 -0500
Received: from mga01.intel.com ([192.55.52.88]:8794 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230299AbhBSNn7 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 19 Feb 2021 08:43:59 -0500
IronPort-SDR: zFU465set7nEVqTudvGcSn+AvXkOd5/0sUGqhJ+JV2HUmSKVGgl5Q09Ux2IMTeovMiPHyDbyZo
 SJCM/xxqRr6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="203127216"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
   d="scan'208";a="203127216"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2021 05:42:11 -0800
IronPort-SDR: ClK7nKCC1NulLIONlpcICidg6Ynxo/EEYGHIufPxGJaaeBPafFG6nuKeA6I6Ai7mbltlmZCe6Q
 YCRPUvHOeB+w==
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
   d="scan'208";a="440260183"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2021 05:42:09 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lD62o-006Dr5-O8; Fri, 19 Feb 2021 15:42:06 +0200
Date:   Fri, 19 Feb 2021 15:42:06 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 6/7] leds: lp50xx: Add missed bits.h and convert to
 BIT()
Message-ID: <YC/ALoRpoov/JaQN@smile.fi.intel.com>
References: <20210216155050.29322-1-andriy.shevchenko@linux.intel.com>
 <20210216155050.29322-6-andriy.shevchenko@linux.intel.com>
 <20210219112755.GN19207@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219112755.GN19207@duo.ucw.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Feb 19, 2021 at 12:27:55PM +0100, Pavel Machek wrote:
> Hi!
> 
> > Add missed bits.h and convert to BIT() in lp50xx_set_banks().
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thanks,

Thanks!

>	I applied whole series except this one...
> 
> << is well known C, it can stay.

Shall we drop BIT() in the other place?
Otherwise it is inconsistency.


-- 
With Best Regards,
Andy Shevchenko


