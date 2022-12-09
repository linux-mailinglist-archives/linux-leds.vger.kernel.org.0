Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B64C648A4C
	for <lists+linux-leds@lfdr.de>; Fri,  9 Dec 2022 22:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbiLIVsG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 9 Dec 2022 16:48:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbiLIVsC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 9 Dec 2022 16:48:02 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E23F1FCD2;
        Fri,  9 Dec 2022 13:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670622481; x=1702158481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VyW/tMWJvyoCTirAlG73DmAZL480LWhJqZ6Zbp5E2tY=;
  b=LcZPK7567S9GLSQgbaAz2YpWqOE2KUKCIGZq4zvg0fcwVXX1GPQ0QNlJ
   lC5lXdo6syO2jR2moI+RkJMVPLg5byCczeHSV6cLU2VRFB0MZ5ZovraNQ
   AzNT/Ty56pKMiQkW+enUcL3L2/ZkFBX/1x8CUIR8UsWzheMnSfRz72Kcw
   dJMFLthDkbi/c++m87o0IUVETJPGXPkNgFkUb+acYB4Z/XsPxcoGLBZht
   ye/kE6LAFVcCAA2PUaTJDHpJhj6r7siYRVp45vKI+rkWlmx837xPjRyha
   eqtWaJKyEjDpCPQvzGq2qvyizkeU6oCRELMLgT3K6JsPrCV1FdLPANwYK
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="319415092"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; 
   d="scan'208";a="319415092"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 13:48:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="821856456"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; 
   d="scan'208";a="821856456"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 09 Dec 2022 13:47:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1p3lDn-007CW5-0p;
        Fri, 09 Dec 2022 23:47:55 +0200
Date:   Fri, 9 Dec 2022 23:47:54 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-riscv@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 00/11] pwm: Allow .get_state to fail
Message-ID: <Y5OtCjQOQjjltGPa@smile.fi.intel.com>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,SUSPICIOUS_RECIPS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Nov 30, 2022 at 04:21:37PM +0100, Uwe Kleine-K�nig wrote:
> Hello,
> 
> I forgot about this series and was remembered when I talked to Conor
> Dooley about how .get_state() should behave in an error case.
> 
> Compared to (implicit) v1, sent with Message-Id: 20220916151506.298488-1-u.kleine-koenig@pengutronix.de
> I changed:
> 
>  - Patch #1 which does the prototype change now just adds "return 0" to
>    all implementations and so gets simpler and doesn't change behaviour.
>    The adaptions to the different .get_state() implementations are split
>    out into individual patches to ease review.
>  - One minor inconsistency fixed in "pwm: Handle .get_state() failures"
>    that I noticed while looking into this patch.
>  - I skipped changing sun4i.c as I don't know how to handle the error
>    there. Someone might want to have a look. (That's not ideal, but it's
>    not worse than the same issue before this series.)
> 
> In v1 Thierry had the concern:
> 
> | That raises the question about what to do in these cases. If we return
> | an error, that could potentially throw off consumers. So perhaps the
> | closest would be to return a disabled PWM? Or perhaps it'd be up to the
> | consumer to provide some fallback configuration for invalidly configured
> | or unconfigured PWMs.
> 
> .get_state() is only called in pwm_device_request on a pwm_state that a
> consumer might see. Before my series a consumer might have seen a
> partial modified pwm_state (because .get_state() might have modified
> .period, then stumbled and returned silently). The last patch ensures
> that this partial modification isn't given out to the consumer. Instead
> they now see the same as if .get_state wasn't implemented at all.

I'm wondering why we didn't see a compiler warning about mistyped function
prototypes in some drivers.

P.S. The series is good thing to do, thank you.

-- 
With Best Regards,
Andy Shevchenko


