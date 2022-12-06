Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31356644800
	for <lists+linux-leds@lfdr.de>; Tue,  6 Dec 2022 16:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbiLFP2J (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Dec 2022 10:28:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbiLFP2I (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Dec 2022 10:28:08 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9128C28715
        for <linux-leds@vger.kernel.org>; Tue,  6 Dec 2022 07:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670340486; x=1701876486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JcYVbZAtA437yXAVYiQVowJSbWoRgYSP2hEGJ2lFBrc=;
  b=bjmhRs/Tnau0/Vm8yE+Z3cxiMdTondkZy62q+gGcryf1+sCQJKGMLF+p
   G38alUU4we4YY6Rqq+MxvJOIWL6FpXs3n/a1ZI3KRl4CihucwJklBg4fS
   2ZbRnK8rkaf+3PZzKjb7cPUiQE92S3U26qnoQsOxAr2WZIEjCzWm7abOb
   H3eutw4MVMVRQXzKlsGRndhYA+dRp1IbkNAMlOf29yEZoV6HyA8peEgup
   CMnUR6gn5ezy6lGoyw8qguGO963cRHhSDwboQQSkXfVSq/ULtI4Ic+LsI
   J+w6aOeR22rtxjmLwnvjWFpoADI9tX2PMKm3IQSY8Eqph2iDbrD+i5l3H
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="343675643"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="343675643"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2022 07:28:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="596613317"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="596613317"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 06 Dec 2022 07:28:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p2ZrW-005MVI-1s;
        Tue, 06 Dec 2022 17:28:02 +0200
Date:   Tue, 6 Dec 2022 17:28:02 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Lee Jones <lee@kernel.org>
Cc:     pavel@ucw.cz, krzysztof.kozlowski@linaro.org,
        gregkh@linuxfoundation.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/1] MAINTAINERS: Add additional co-maintainer to LEDs
Message-ID: <Y49fgt1i+/RhMKZu@smile.fi.intel.com>
References: <20221206104510.123817-1-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221206104510.123817-1-lee@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Dec 06, 2022 at 10:45:10AM +0000, Lee Jones wrote:
> Add myself as co-maintainer for the LED subsystem,
> in support of Pavel during busy times.

Thank you for doing this!

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Suggested-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8bea25ac61964..6591462661d6c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11701,6 +11701,7 @@ F:	scripts/leaking_addresses.pl
>  
>  LED SUBSYSTEM
>  M:	Pavel Machek <pavel@ucw.cz>
> +M:	Lee Jones <lee@kernel.org>
>  L:	linux-leds@vger.kernel.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git
> -- 
> 2.39.0.rc0.267.gcb52ba06e7-goog
> 

-- 
With Best Regards,
Andy Shevchenko


