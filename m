Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8024371DAC
	for <lists+linux-leds@lfdr.de>; Mon,  3 May 2021 19:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234364AbhECRCA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 May 2021 13:02:00 -0400
Received: from mx2.suse.de ([195.135.220.15]:44850 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234000AbhECQ5O (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 3 May 2021 12:57:14 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A80B6AF0F;
        Mon,  3 May 2021 16:56:18 +0000 (UTC)
Date:   Mon, 3 May 2021 13:56:15 -0300
From:   Enzo Matsumiya <ematsumiya@suse.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Hannes Reinecke <hare@suse.de>, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, u.kleine-koenig@pengutronix.de,
        Jens Axboe <axboe@kernel.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] leds: trigger: implement block trigger
Message-ID: <20210503165615.maqgm5e2gq554hcm@hyori>
References: <20210430183216.27458-1-ematsumiya@suse.de>
 <20210430183216.27458-3-ematsumiya@suse.de>
 <7e8da9ec-b3e3-0329-d54c-bb44c4064f0d@suse.de>
 <20210503101134.GB6621@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210503101134.GB6621@amd>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 05/03, Pavel Machek wrote:
>> As already commented on, this for_each_blk() construct is not a good idea.
>> Infact, I guess it would be better if you could invert the logic:
>> Not having the block trigger enumerating all devices, but rather let the
>> devices register with the block trigger.
>> That would have the benefit that one could choose which block device should
>> be handled by the LED trigger subsystem, _and_ you would avoid the need for
>> a for_each_blk() construct.
>> Thing is, I don't think that all block devices should be handled by the LED
>> trigger; eg for things like 'loop' or 'ramdisk' it is very
>> >questionable.
>
>> Downside is that you would need to modify the drivers, but realistically
>> there are only very few drivers which should be modified; I would go for
>> nvme-pci and the sd driver for starters. Maybe floppy, but arguably that can
>> omitted as one has a very good audio indicator for floppy accesses
>> :-)
>
>And we already have disk activity trigger. Maybe NVMe and SD needs to
>be modified to use it?
>
>Best regards,
>								Pavel

TBH I haven't thought of that. My initial idea was to actually offer
maximum flexibility to the user, so exposing all block devices on the
system [*], being able to set any LED available as an indicator for each
of those.

But, indeed, just using ledtrig-disk in NVMe and SD might just be
simpler.


[*] - again, I see now this was a bad idea and will be changed in a
possible next version
