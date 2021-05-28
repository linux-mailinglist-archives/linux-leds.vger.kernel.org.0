Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 764B3393FFF
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 11:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbhE1Jda (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 05:33:30 -0400
Received: from mga12.intel.com ([192.55.52.136]:63888 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229774AbhE1Jd3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 May 2021 05:33:29 -0400
IronPort-SDR: rd9JKdBpjZoO4pdsteUnKyqyXls5iy66ay4As1pLnczxgejOfz6cc5reVM4UipvACGpmR5aVIP
 WmaDQF8LvNtA==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="182588124"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="182588124"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 02:31:55 -0700
IronPort-SDR: eOvRP1Wcyudl8jebpfyNVAeRlikWPc6SvEcQa0J4i3ECKV0lVPl7X6d353InsFTc09f6Q24Hy/
 NsKsuExFQRIA==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="436881295"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 02:31:53 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id DC31E202F7;
        Fri, 28 May 2021 12:31:50 +0300 (EEST)
Date:   Fri, 28 May 2021 12:31:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH 05/15] leds: leds-as3645a: Fix function name
 'as3645a_set_current()'
Message-ID: <20210528093150.GN3@paasikivi.fi.intel.com>
References: <20210528090629.1800173-1-lee.jones@linaro.org>
 <20210528090629.1800173-6-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528090629.1800173-6-lee.jones@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Lee,

On Fri, May 28, 2021 at 10:06:19AM +0100, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/leds/leds-as3645a.c:198: warning: expecting prototype for as3645a_set_config(). Prototype was for as3645a_set_current() instead
> 
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/leds/leds-as3645a.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
> index e8922fa033796..c41937ff8fd33 100644
> --- a/drivers/leds/leds-as3645a.c
> +++ b/drivers/leds/leds-as3645a.c
> @@ -185,7 +185,7 @@ static int as3645a_read(struct as3645a *flash, u8 addr)
>   */
>  
>  /**
> - * as3645a_set_config - Set flash configuration registers
> + * as3645a_set_current - Set flash configuration registers
>   * @flash: The flash
>   *
>   * Configure the hardware with flash, assist and indicator currents, as well as

Thanks for the patch.

The entire comment could be removed. It's wrong and doesn't really tell
more than what you can read in the two functions below (the two are result
of splitting one the documentation was written for).

-- 
Kind regards,

Sakari Ailus
