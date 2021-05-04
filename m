Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 445EE372D35
	for <lists+linux-leds@lfdr.de>; Tue,  4 May 2021 17:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231436AbhEDPo6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 4 May 2021 11:44:58 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49126 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbhEDPo4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 4 May 2021 11:44:56 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id EC6C71C0B87; Tue,  4 May 2021 17:43:59 +0200 (CEST)
Date:   Tue, 4 May 2021 17:43:56 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Enzo Matsumiya <ematsumiya@suse.de>
Cc:     Hannes Reinecke <hare@suse.de>, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, u.kleine-koenig@pengutronix.de,
        Jens Axboe <axboe@kernel.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] leds: trigger: implement block trigger
Message-ID: <YJFrvI4I2qe7UyMW@mobian>
References: <20210430183216.27458-1-ematsumiya@suse.de>
 <20210430183216.27458-3-ematsumiya@suse.de>
 <7e8da9ec-b3e3-0329-d54c-bb44c4064f0d@suse.de>
 <20210503101134.GB6621@amd>
 <20210503165615.maqgm5e2gq554hcm@hyori>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210503165615.maqgm5e2gq554hcm@hyori>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon 2021-05-03 13:56:15, Enzo Matsumiya wrote:
> On 05/03, Pavel Machek wrote:
> > > As already commented on, this for_each_blk() construct is not a good idea.
> > > Infact, I guess it would be better if you could invert the logic:
> > > Not having the block trigger enumerating all devices, but rather let the
> > > devices register with the block trigger.
> > > That would have the benefit that one could choose which block device should
> > > be handled by the LED trigger subsystem, _and_ you would avoid the need for
> > > a for_each_blk() construct.
> > > Thing is, I don't think that all block devices should be handled by the LED
> > > trigger; eg for things like 'loop' or 'ramdisk' it is very
> > > >questionable.
> > 
> > > Downside is that you would need to modify the drivers, but realistically
> > > there are only very few drivers which should be modified; I would go for
> > > nvme-pci and the sd driver for starters. Maybe floppy, but arguably that can
> > > omitted as one has a very good audio indicator for floppy accesses
> > > :-)
> > 
> > And we already have disk activity trigger. Maybe NVMe and SD needs to
> > be modified to use it?
> 
> TBH I haven't thought of that. My initial idea was to actually offer
> maximum flexibility to the user, so exposing all block devices on the
> system [*], being able to set any LED available as an indicator for each
> of those.
> 
> But, indeed, just using ledtrig-disk in NVMe and SD might just be
> simpler.
> 
> 
> [*] - again, I see now this was a bad idea and will be changed in a
> possible next version

Sounds like there should be no new version. Modify NVMe/SD if
required, instead.

Oh and disk-activity LED trigger blinks when disk is fully loaded. I
believe that is a bug and I'd not mind if it was fixed. I probably
have local patch that needs cleaning up somewhere.

Best regards,
								Pavel

-- 
