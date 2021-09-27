Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E378041922A
	for <lists+linux-leds@lfdr.de>; Mon, 27 Sep 2021 12:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233811AbhI0KXw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Sep 2021 06:23:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:35798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233793AbhI0KXw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 27 Sep 2021 06:23:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7D2160E73;
        Mon, 27 Sep 2021 10:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632738134;
        bh=QUIvZStWayLdfYN/lFWATeOck4qVnQn2r5LIkwIhM7k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dUXnNwX6cFdiuo1qovtC3+TKEisHHVVxZ6goiHEmTPuJ8xEBBwUS2yxE+QhxCDk1Z
         Tzn/hIAah1PMhBVhe8w2fcuXLGItoUUTnLcTpOMSDegYIWYdFDWwNoXAcGe/bndSdF
         eMxelcYVnRmbDgxQo/5N8XYZzKDGdekweoYRT2EE=
Date:   Mon, 27 Sep 2021 12:22:11 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Isaac Hazan <isaac.hazan@intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] led-class-flash: fix -Wrestrict warning
Message-ID: <YVGbU1lYp6/5HyRy@kroah.com>
References: <20210927101610.1669830-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927101610.1669830-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Sep 27, 2021 at 12:15:59PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> drivers/leds/led-class-flash.c: In function 'flash_fault_show':
> drivers/leds/led-class-flash.c:210:16: error: 'sprintf' argument 3 overlaps destination object 'buf' [-Werror=restrict]
>   210 |         return sprintf(buf, "%s\n", buf);
>       |                ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/leds/led-class-flash.c:187:54: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
>   187 |                 struct device_attribute *attr, char *buf)
>       |                                                ~~~~~~^~~
> cc1: all warnings being treated as errors
> make[5]: *** [scripts/Makefile.build:277: drivers/leds/led-class-flash.o] Error 1
> make[5]: Target '__build' not remade because of errors.
> make[4]: *** [scripts/Makefile.build:540: drivers/leds] Error 2
> drivers/thunderbolt/xdomain.c: In function 'modalias_show':
> drivers/thunderbolt/xdomain.c:733:16: error: 'sprintf' argument 3 overlaps destination object 'buf' [-Werror=restrict]
>   733 |         return sprintf(buf, "%s\n", buf);
>       |                ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/xdomain.c:727:36: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
>   727 |                              char *buf)
>       |                              ~~~~~~^~~
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/leds/led-class-flash.c | 2 +-
>  drivers/thunderbolt/xdomain.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
> index 185e17055317..6fe9d700dfef 100644
> --- a/drivers/leds/led-class-flash.c
> +++ b/drivers/leds/led-class-flash.c
> @@ -207,7 +207,7 @@ static ssize_t flash_fault_show(struct device *dev,
>  		mask <<= 1;
>  	}
>  
> -	return sprintf(buf, "%s\n", buf);
> +	return strlen(strcat(buf, "\n"));
>  }
>  static DEVICE_ATTR_RO(flash_fault);
>  
> diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
> index d66ea4d616fd..eff32499610f 100644
> --- a/drivers/thunderbolt/xdomain.c
> +++ b/drivers/thunderbolt/xdomain.c
> @@ -730,7 +730,7 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
>  
>  	/* Full buffer size except new line and null termination */
>  	get_modalias(svc, buf, PAGE_SIZE - 2);
> -	return sprintf(buf, "%s\n", buf);
> +	return strlen(strcat(buf, "\n"));
>  }
>  static DEVICE_ATTR_RO(modalias);
>  
> -- 
> 2.29.2
> 

You also have a thunderbolt change in here as well :(

