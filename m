Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 772A8116D2B
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2019 13:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbfLIMe2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Dec 2019 07:34:28 -0500
Received: from mga11.intel.com ([192.55.52.93]:29248 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727074AbfLIMe1 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 9 Dec 2019 07:34:27 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 04:34:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="202818237"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 09 Dec 2019 04:34:26 -0800
Received: from andy by smile with local (Exim 4.93-RC5)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ieIF8-00058Q-40; Mon, 09 Dec 2019 14:34:26 +0200
Date:   Mon, 9 Dec 2019 14:34:26 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/1] leds-as3645a: Drop fwnode reference on ignored node
Message-ID: <20191209123426.GF32742@smile.fi.intel.com>
References: <20191204075642.22070-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191204075642.22070-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Dec 04, 2019 at 09:56:42AM +0200, Sakari Ailus wrote:
> If a node is ignored, do not get a reference to it. Fix the bug by moving
> fwnode_handle_get() where a reference to an fwnode is saved for clarity.
> 

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/leds/leds-as3645a.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
> index b7e0ae1af8fa5..e8922fa033796 100644
> --- a/drivers/leds/leds-as3645a.c
> +++ b/drivers/leds/leds-as3645a.c
> @@ -493,16 +493,17 @@ static int as3645a_parse_node(struct as3645a *flash,
>  		switch (id) {
>  		case AS_LED_FLASH:
>  			flash->flash_node = child;
> +			fwnode_handle_get(child);
>  			break;
>  		case AS_LED_INDICATOR:
>  			flash->indicator_node = child;
> +			fwnode_handle_get(child);
>  			break;
>  		default:
>  			dev_warn(&flash->client->dev,
>  				 "unknown LED %u encountered, ignoring\n", id);
>  			break;
>  		}
> -		fwnode_handle_get(child);
>  	}
>  
>  	if (!flash->flash_node) {
> -- 
> 2.20.1
> 

-- 
With Best Regards,
Andy Shevchenko


