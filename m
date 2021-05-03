Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 888F537108A
	for <lists+linux-leds@lfdr.de>; Mon,  3 May 2021 04:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbhECCic (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 2 May 2021 22:38:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:47558 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230368AbhECCib (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 2 May 2021 22:38:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 32D87AD09;
        Mon,  3 May 2021 02:37:38 +0000 (UTC)
Date:   Sun, 2 May 2021 23:37:35 -0300
From:   Enzo Matsumiya <ematsumiya@suse.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        u.kleine-koenig@pengutronix.de, Jens Axboe <axboe@kernel.dk>,
        Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] block: export block_class and disk_type symbols
Message-ID: <20210503023649.a437epxpd7tkgkwx@hyori>
References: <20210430183216.27458-1-ematsumiya@suse.de>
 <20210430183216.27458-2-ematsumiya@suse.de>
 <YIz0EBqKTHhB+n8N@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YIz0EBqKTHhB+n8N@kroah.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 05/01, Greg Kroah-Hartman wrote:
>On Fri, Apr 30, 2021 at 03:32:10PM -0300, Enzo Matsumiya wrote:
>> Export symbols to be used by _for_each_blk() helper in LED block
>> trigger.
>>
>> Signed-off-by: Enzo Matsumiya <ematsumiya@suse.de>
>> ---
>>  block/genhd.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/block/genhd.c b/block/genhd.c
>> index 8c8f543572e6..516495179230 100644
>> --- a/block/genhd.c
>> +++ b/block/genhd.c
>> @@ -1218,6 +1218,7 @@ static void disk_release(struct device *dev)
>>  struct class block_class = {
>>  	.name		= "block",
>>  };
>> +EXPORT_SYMBOL(block_class);
>>
>>  static char *block_devnode(struct device *dev, umode_t *mode,
>>  			   kuid_t *uid, kgid_t *gid)
>> @@ -1235,6 +1236,7 @@ const struct device_type disk_type = {
>>  	.release	= disk_release,
>>  	.devnode	= block_devnode,
>>  };
>> +EXPORT_SYMBOL(disk_type);
>>
>>  #ifdef CONFIG_PROC_FS
>>  /*
>
>Please please no.  These should not be needed by anything.
>
>And if they really do, they must be EXPORT_SYMBOL_GPL().
>
>thanks,
>
>greg k-h

Thanks. I was indeed skeptical about submitting this particular change.

Do you think it's more acceptable if I implement a for_each_blk() helper
(cf. patch 2 on this series) on block code?

I couldn't find any other way to do this (get all block devices on the
system), so please let me know if I missed something.


Cheers,

Enzo
