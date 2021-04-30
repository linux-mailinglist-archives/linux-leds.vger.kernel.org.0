Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8DF3700CC
	for <lists+linux-leds@lfdr.de>; Fri, 30 Apr 2021 20:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhD3SyF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Apr 2021 14:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbhD3SyF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 30 Apr 2021 14:54:05 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B980DC06174A;
        Fri, 30 Apr 2021 11:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=5si/VPg3wezfEGfiD87VoJiPsYaH7np3TTHzup5A59I=; b=bmc9HsKHh9tg6XK8jU2azc4vSC
        mcE4x1rGP93PHG//RURfU0dL+WfVnYCsdmifXDQWwfmzfjHQb4I73aK/Nk4baD7B2R9l6CngCZ697
        ezNK5ukDKZ3RvJQY8zcHJrUXVp5ipOM9HPCxyu8ZB5mzkJxwVW9z1pmrA8ll9MQQY+zfqhjeDIop5
        dP1iHCqbQVtmdeEWUFl/+xLdunCAy/FrLEp8OVBhrmy9/n/DhJKRn3d7XbCEf42qLNSNRlX6lt8g7
        thJYR4Wj52iUoarJyOICZYKV7qoGubvhug3FppEYY19a8GsmBP5CTmfSNMeQX5Wq4NYKr/232MmJv
        KJsiTuqQ==;
Received: from [2601:1c0:6280:3f0::df68]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lcYFr-00BPIw-Ra; Fri, 30 Apr 2021 18:52:56 +0000
Subject: Re: [RFC PATCH 2/2] leds: trigger: implement block trigger
To:     Enzo Matsumiya <ematsumiya@suse.de>, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org
Cc:     u.kleine-koenig@pengutronix.de, Jens Axboe <axboe@kernel.dk>,
        Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
References: <20210430183216.27458-1-ematsumiya@suse.de>
 <20210430183216.27458-3-ematsumiya@suse.de>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d1e96245-6afa-0a67-2b56-de2dd2fda948@infradead.org>
Date:   Fri, 30 Apr 2021 11:52:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210430183216.27458-3-ematsumiya@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 4/30/21 11:32 AM, Enzo Matsumiya wrote:
> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
> index b77a01bd27f4..bead31a19148 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -153,4 +153,14 @@ config LEDS_TRIGGER_TTY
>  
>  	  When build as a module this driver will be called ledtrig-tty.
>  
> +config LEDS_TRIGGER_BLOCK
> +	tristate "LED Block Device Trigger"
> +	depends on BLOCK
> +	default m

Drop the "default m". We don't enable drivers (even to build modules)
unless they are necessary, e.g., for booting.

> +	help
> +	  This allows LEDs to be controlled by block device activity.
> +	  This trigger doesn't require the lower level drivers to have any
> +	  instrumentation. The activity is collected by polling the disk stats.
> +	  If unsure, say Y.
> +
>  endif # LEDS_TRIGGERS

thanks.
-- 
~Randy
