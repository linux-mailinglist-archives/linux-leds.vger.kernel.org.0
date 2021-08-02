Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D404E3DD499
	for <lists+linux-leds@lfdr.de>; Mon,  2 Aug 2021 13:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233387AbhHBLYE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 2 Aug 2021 07:24:04 -0400
Received: from mga04.intel.com ([192.55.52.120]:20863 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233243AbhHBLYE (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 2 Aug 2021 07:24:04 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="211564960"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="211564960"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 04:23:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="500403548"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 04:23:53 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mAW2s-004Ie2-Go; Mon, 02 Aug 2021 14:23:46 +0300
Date:   Mon, 2 Aug 2021 14:23:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan =?iso-8859-1?Q?Kundr=E1t?= <jan.kundrat@cesnet.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/3] leds: lp50xx: Fix chip name in KConfig
Message-ID: <YQfVwopPpxtRSjJE@smile.fi.intel.com>
References: <10256dd4010034d6335139d587ebfe933343ee85.1627717572.git.jan.kundrat@cesnet.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10256dd4010034d6335139d587ebfe933343ee85.1627717572.git.jan.kundrat@cesnet.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Jul 30, 2021 at 11:59:11PM +0200, Jan Kundrát wrote:
> The 9-channel one is called LP5009, not LP509.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Jan Kundrát <jan.kundrat@cesnet.cz>
> ---
>  drivers/leds/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index bdf16180f5ff..a5101dfa2713 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -397,7 +397,7 @@ config LEDS_LP3952
>  	  module will be called leds-lp3952.
>  
>  config LEDS_LP50XX
> -	tristate "LED Support for TI LP5036/30/24/18/12/9 LED driver chip"
> +	tristate "LED Support for TI LP5036/30/24/18/12/09 LED driver chip"
>  	depends on LEDS_CLASS && REGMAP_I2C
>  	depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
>  	help
> -- 
> 2.32.0
> 
> 

-- 
With Best Regards,
Andy Shevchenko


