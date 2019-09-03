Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F317A7288
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2019 20:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbfICScf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Sep 2019 14:32:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:47966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725977AbfICScf (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 3 Sep 2019 14:32:35 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AA2EF20828;
        Tue,  3 Sep 2019 18:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567535554;
        bh=jkqGLIjzZlBP8ZD7zxshQdo67YM0NVdk0TFH7QzG15I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s9d0jflia/PLY0CpCVjU9z1Z0F0GVvm3dNgSdhJSLaq6Wu8sFSDR1yj1rW40z3UGT
         Uti7o5qkX2wt0RIArZu4aphafAIQObs88DqjvYiONNknTxUthUiecAqqacR2EEagKY
         gPgM34SROg3fJeGsyYRlzgV3G7QsgeZO4vfAJVvA=
Date:   Tue, 3 Sep 2019 20:32:31 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Akinobu Mita <akinobu.mita@gmail.com>, linux-leds@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] leds: remove PAGE_SIZE limit of
 /sys/class/leds/<led>/trigger
Message-ID: <20190903183231.GA26562@kroah.com>
References: <1567090164-6819-1-git-send-email-akinobu.mita@gmail.com>
 <6ebeedab-4a7f-14ea-d62e-9184e911047f@gmail.com>
 <20190902181207.GA18577@kroah.com>
 <1cd468a3-b6e5-a93b-739a-f30288318356@gmail.com>
 <20190902190843.GB25019@kroah.com>
 <CAC5umyjTJSMdKMtZbF8Uxky6nOrAHesTHmZRV5VA1uPwX2rtxA@mail.gmail.com>
 <20190903140719.GA9506@kroah.com>
 <CAC5umyhApkfo+-7+nPFn20MLpG7dxrSE1+1FPhZp+p=hCsopeg@mail.gmail.com>
 <52bef6f9-7d96-627b-069e-02b3ffa0559e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52bef6f9-7d96-627b-069e-02b3ffa0559e@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Sep 03, 2019 at 08:18:36PM +0200, Jacek Anaszewski wrote:
> On 9/3/19 4:21 PM, Akinobu Mita wrote:
> > 2019年9月3日(火) 23:07 Greg KH <gregkh@linuxfoundation.org>:
> >>
> >> On Tue, Sep 03, 2019 at 10:55:40PM +0900, Akinobu Mita wrote:
> >>> 2019年9月3日(火) 4:08 Greg KH <gregkh@linuxfoundation.org>:
> >>>>
> >>>> On Mon, Sep 02, 2019 at 08:47:02PM +0200, Jacek Anaszewski wrote:
> >>>>> On 9/2/19 8:12 PM, Greg KH wrote:
> >>>>>> On Sun, Sep 01, 2019 at 06:53:34PM +0200, Jacek Anaszewski wrote:
> >>>>>>> Hi Akinobu,
> >>>>>>>
> >>>>>>> Thank you for the patch.
> >>>>>>>
> >>>>>>> I have one nit below but in general it looks good to me.
> >>>>>>> I've tested it with 2000 mtd triggers (~14kB file size)
> >>>>>>> and it worked flawlessly.
> >>>>>>>
> >>>>>>> Still, I would like to have ack from Greg for it.
> >>>>>>>
> >>>>>>> Adding Greg on Cc.
> >>>>>>>
> >>>>>>> On 8/29/19 4:49 PM, Akinobu Mita wrote:
> >>>>>>>> Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
> >>>>>>>> However, the size of this file is limited to PAGE_SIZE because of the
> >>>>>>>> limitation for sysfs attribute.
> >>>>>>>>
> >>>>>>>> Enabling LED CPU trigger on systems with thousands of CPUs easily hits
> >>>>>>>> PAGE_SIZE limit, and makes it impossible to see all available LED triggers
> >>>>>>>> and which trigger is currently activated.
> >>>>>>>>
> >>>>>>>> This converts /sys/class/leds/<led>/trigger to bin attribute and removes
> >>>>>>>> the PAGE_SIZE limitation.
> >>>>>>
> >>>>>> But this is NOT a binary file.  A sysfs binary file is used for when the
> >>>>>> kernel passes data to or from hardware without any parsing of the data
> >>>>>> by the kernel.
> >>>>>>
> >>>>>> You are not doing that here, you are abusing the "one value per file"
> >>>>>> rule of sysfs so much that you are forced to work around the limitation
> >>>>>> it put in place on purpose to keep you from doing stuff like this.
> >>>>>>
> >>>>>> Please fix this "correctly" by creating a new api that works properly
> >>>>>> and just live with the fact that this file will never work correctly and
> >>>>>> move everyone to use the new api instead.
> >>>>>>
> >>>>>> Don't keep on abusing the interface by workarounds like this, it is not
> >>>>>> ok.
> >>>>>
> >>>>> In the message [0] you pledged to give us exception for that, provided
> >>>>> it will be properly documented in the code. I suppose you now object
> >>>>> because the patch does not meet that condition.
> >>>>
> >>>> Well, I honestly don't remember writing that email, but it was 5 months
> >>>> and many thousands of emails ago :)
> >>>>
> >>>> Also, you all didn't document the heck out of this.  So no, I really do
> >>>> not want to see this patch accepted as-is.
> >>>>
> >>>>> Provided that will be fixed, can we count on your ack for the
> >>>>> implementation of the solution you proposed? :-)
> >>>>
> >>>> Let's see the patch that actually implements what I suggested first :)
> >>>
> >>> I'd propose introducing a new procfs file (/proc/led-triggers) and new
> >>> /sys/class/leds/<led>/current-trigger api.
> >>>
> >>> Reading /proc/led-triggers file shows all available triggers.
> >>> This violates "one value per file", but it's a procfs file.
> >>
> >> No, procfs files are ONLY for process-related things.  Don't keep the
> >> insanity of this file format by just moving it out of sysfs and into
> >> procfs :)
> > 
> > I see.
> > 
> > How about creating one file or directory for each led-trigger in
> > /sys/kernel/led-triggers directory?
> > 
> > e.g.
> > 
> > $ ls /sys/kernel/led-triggers
> > audio-micmute                              ide-disk        phy0assoc
> > audio-mute                                 kbd-altgrlock   phy0radio
> > ...
> > hidpp_battery_3-full                       panic
> I think that /sys/class/leds/triggers would better reflect the reality.
> After all LED Trigger core belongs to LED subsystem.

Yes, sorry, I missed that "kernel" directory, that's a non-starter, use
the class directory as that is what it is for here.

greg k-h
