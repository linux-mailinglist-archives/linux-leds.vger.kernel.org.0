Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 215AE271658
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 19:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgITReB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 13:34:01 -0400
Received: from lists.nic.cz ([217.31.204.67]:52902 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725858AbgITReB (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 20 Sep 2020 13:34:01 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 8E6AD140A3B;
        Sun, 20 Sep 2020 19:33:57 +0200 (CEST)
Date:   Sun, 20 Sep 2020 19:33:57 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        dmurphy@ti.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: ledtrig-cpu: Limit to 4 CPUs
Message-ID: <20200920193357.3d797a46@nic.cz>
In-Reply-To: <91f1caa7-8005-6c8f-ce7c-84e5c8cee5f8@gmail.com>
References: <20200919093833.GA14326@duo.ucw.cz>
        <27e19ac9-4bc0-2945-3985-6cd6bb5407df@gmail.com>
        <20200920173905.237c314e@nic.cz>
        <91f1caa7-8005-6c8f-ce7c-84e5c8cee5f8@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,URIBL_BLOCKED,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 20 Sep 2020 18:55:28 +0200
Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:

> On 9/20/20 5:39 PM, Marek Behun wrote:
> > On Sun, 20 Sep 2020 16:15:09 +0200
> > Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> >   
> >> Hi Pavel,
> >>
> >> On 9/19/20 11:38 AM, Pavel Machek wrote:  
> >>> commit 318681d3e019e39354cc6c2155a7fd1bb8e8084d
> >>> Author: Pavel Machek <pavel@ucw.cz>
> >>> Date:   Sat Sep 19 11:34:58 2020 +0200
> >>>
> >>>       ledtrig-cpu: Limit to 4 CPUs
> >>>       
> >>>       Some machines have thousands of CPUs... and trigger mechanisms was not
> >>>       really meant for thousands of triggers. I doubt anyone uses this
> >>>       trigger on many-CPU machine; but if they do, they'll need to do it
> >>>       properly.
> >>>       
> >>>       Signed-off-by: Pavel Machek <pavel@ucw.cz>
> >>>
> >>> diff --git a/drivers/leds/trigger/ledtrig-cpu.c b/drivers/leds/trigger/ledtrig-cpu.c
> >>> index 869976d1b734..b7e00b09b137 100644
> >>> --- a/drivers/leds/trigger/ledtrig-cpu.c
> >>> +++ b/drivers/leds/trigger/ledtrig-cpu.c
> >>> @@ -2,14 +2,18 @@
> >>>    /*
> >>>     * ledtrig-cpu.c - LED trigger based on CPU activity
> >>>     *
> >>> - * This LED trigger will be registered for each possible CPU and named as
> >>> - * cpu0, cpu1, cpu2, cpu3, etc.
> >>> + * This LED trigger will be registered for first four CPUs and named
> >>> + * as cpu0, cpu1, cpu2, cpu3. There's additional trigger called cpu that
> >>> + * is on when any CPU is active.
> >>> + *
> >>> + * If you want support for arbitrary number of CPUs, make it one trigger,
> >>> + * with additional sysfs file selecting which CPU to watch.
> >>>     *
> >>>     * It can be bound to any LED just like other triggers using either a
> >>>     * board file or via sysfs interface.
> >>>     *
> >>>     * An API named ledtrig_cpu is exported for any user, who want to add CPU
> >>> - * activity indication in their code
> >>> + * activity indication in their code.
> >>>     *
> >>>     * Copyright 2011 Linus Walleij <linus.walleij@linaro.org>
> >>>     * Copyright 2011 - 2012 Bryan Wu <bryan.wu@canonical.com>
> >>> @@ -145,6 +149,9 @@ static int __init ledtrig_cpu_init(void)
> >>>    	for_each_possible_cpu(cpu) {
> >>>    		struct led_trigger_cpu *trig = &per_cpu(cpu_trig, cpu);
> >>>    
> >>> +		if (cpu > 4)  
> >>
> >> NACK. The workaround for this trigger was implemented for a reason -
> >> to make it working on platforms with arbitrary number of logical cpus.
> >> I've got 8, so I am discriminated now. Not saying, that it precludes
> >> trigger registration with no single line of warning.
> >> Regardless of that - you have no guarantee that you're not breaking
> >> anyone - "I doubt" is not a sufficient argument.
> >>  
> > 
> > If that is the case Jacek, I would try 16 and then see if people
> > complain. Do you really think that someone sets a specific LED to
> > trigger on activity on CPU id > 16?  
> 
> I have an access to the machine with 80 cpus, so I could once
> get surprised not being able to find cpuN triggers not being
> listed among available triggers.
> 
> And say that I have a solution where I install 80 userspace LEDs
> (drivers/leds/uleds.c) and register them on each cpuN triggers to get
> notifications on how cpus work.

Hi Jacek,

I understand (and Pavel does for sure too) that many people
currently have that possibility, that they have access to machines with
many CPUs and many LEDs. We also understand that currently it is
possible for users to set 1847th LED to trigger on activity on CPU ID
1337. What we are suggesting is that practically no one uses this, and
for those 10 people who do, well it would be better for them to migrate
to new ABI than for kernel developers having forever maintain this
legacy ABI.

Legacy drivers get removed from kernel from time to time, if no one
uses them. So I think Pavel's proposal (although I may not agree with
the limit 4) has some merit. If we try this, and someone complains, we
can then discuss. If we don't try, we may never know.

Marek

> > If you do not agree, then I think we should implement a "cpu" trigger
> > where the cpu ID (or maybe mask of multiple CPUs) is configurable via
> > another sysfs file. And then declare current cpu trigger (with names
> > "cpu%d") as legacy.  
> 
> Yes, we can do that, and even mark the cpu trigger as legacy but we
> cannot prevent people from using it if that was present in kernel
> for many years.
> 

