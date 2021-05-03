Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40FD537108E
	for <lists+linux-leds@lfdr.de>; Mon,  3 May 2021 04:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232828AbhECCjm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 2 May 2021 22:39:42 -0400
Received: from mx2.suse.de ([195.135.220.15]:47880 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232797AbhECCjm (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 2 May 2021 22:39:42 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id B9709B013;
        Mon,  3 May 2021 02:38:48 +0000 (UTC)
Date:   Sun, 2 May 2021 23:38:45 -0300
From:   Enzo Matsumiya <ematsumiya@suse.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        u.kleine-koenig@pengutronix.de, Jens Axboe <axboe@kernel.dk>,
        Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] leds: trigger: implement block trigger
Message-ID: <20210503023845.qkcq3pttfewdqflf@hyori>
References: <20210430183216.27458-1-ematsumiya@suse.de>
 <20210430183216.27458-3-ematsumiya@suse.de>
 <d1e96245-6afa-0a67-2b56-de2dd2fda948@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <d1e96245-6afa-0a67-2b56-de2dd2fda948@infradead.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 04/30, Randy Dunlap wrote:
>On 4/30/21 11:32 AM, Enzo Matsumiya wrote:
>> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
>> index b77a01bd27f4..bead31a19148 100644
>> --- a/drivers/leds/trigger/Kconfig
>> +++ b/drivers/leds/trigger/Kconfig
>> @@ -153,4 +153,14 @@ config LEDS_TRIGGER_TTY
>>
>>  	  When build as a module this driver will be called ledtrig-tty.
>>
>> +config LEDS_TRIGGER_BLOCK
>> +	tristate "LED Block Device Trigger"
>> +	depends on BLOCK
>> +	default m
>
>Drop the "default m". We don't enable drivers (even to build modules)
>unless they are necessary, e.g., for booting.
>
>> +	help
>> +	  This allows LEDs to be controlled by block device activity.
>> +	  This trigger doesn't require the lower level drivers to have any
>> +	  instrumentation. The activity is collected by polling the disk stats.
>> +	  If unsure, say Y.
>> +
>>  endif # LEDS_TRIGGERS
>
>thanks.
>-- 
>~Randy

Thanks, will do in v2.


Cheers,

Enzo
