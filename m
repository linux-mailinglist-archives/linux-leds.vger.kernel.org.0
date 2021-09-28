Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E2641A411
	for <lists+linux-leds@lfdr.de>; Tue, 28 Sep 2021 02:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238259AbhI1APl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Sep 2021 20:15:41 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:60122 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238253AbhI1APl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Sep 2021 20:15:41 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1632788041;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tB5syXgutrMkuUuhsmDzWKkd9Rv9oG3kKMus4IhY/9A=;
        b=kmetPHuV4FoMdjGP4Qqa0/2D0KkDrr5c4zK99ZtrvSc2t4zzG2PxqUGSPCmeWE6bGNBb8w
        HBTSnX4KEn66nv3zbDAGvcwO3P9LXavcmxu+NTg1VIJnkQg3n2nLdfeu9y4djG0aSHrYeL
        sbs5nIY5rQCRoApwE1QoAPtOTyqqgBrzwTSP1aEH8j8XrkMM6RGURDZN/logBDA9uG4Zc7
        eSwsWpChWVk5oquckyFz8YqJEJGPNbg17QpIhrFQTS7lCmzzj5zk0EebDSMLVFfCMh+jov
        PBbigAY4FgKwKzPZi+cfEQQNq2ndXYs7V+G5iFuIm/01rAl3hNLFlGXiSE9SYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1632788041;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tB5syXgutrMkuUuhsmDzWKkd9Rv9oG3kKMus4IhY/9A=;
        b=xNOSKSzAxSuQdFlhuqrys+ISfc4sEAoOM94ZWDjWNkBQ0Rm/NH3yd+hvWxRZdXGHjEzstN
        3UZghIn+VsobRLBw==
To:     Pavel Machek <pavel@ucw.cz>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     johannes.berg@intel.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: Disable CPU trigger on PREEMPT_RT
In-Reply-To: <20210927190650.GA13992@duo.ucw.cz>
References: <20210924111501.m57cwwn7ahiyxxdd@linutronix.de>
 <20210927142345.GB18276@duo.ucw.cz> <87wnn2av6h.ffs@tglx>
 <20210927154451.GA17112@duo.ucw.cz>
 <20210927171802.uak3tbpqaig3mm7m@linutronix.de>
 <20210927190650.GA13992@duo.ucw.cz>
Date:   Tue, 28 Sep 2021 02:14:00 +0200
Message-ID: <87bl4dblpz.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel,

On Mon, Sep 27 2021 at 21:06, Pavel Machek wrote:
>> I hope you reconsider. It is not all LED usage, just the CPU
>> trigger.
>
> What makes the CPU trigger special with RT?

Care to look at the call sites?

> Other triggers will be called from interesting places, too...

Can you please define "called from interesting places" in terms of RT
related semantics?

Once you've done that you might have the courtesy to explain which RT
related problem is "too...".

May I also recommend to think about the fact that RT explicitely
disables a particular LED trigger and not ALL of them. There might be a
reason. Hint: See the first question above.

> Johanes pointed out other problems with that rwlock, and we are
> getting rid of the rwlock.

That solves the problem in which way?

May I recommend to read:

  https://www.kernel.org/doc/html/latest/locking/locktypes.html

which clearly explains the constraints of RT vs. locking.

Now if you just look at the callsites of ledtrig_cpu() in arch/arm/ then
you might notice that these are in code sections which are not
preemtible even on RT enabled kernels for obvious reasons.

Of course the primary offender on RT is the rwlock but even if you get
rid of it, how is any of the regular spinlocks which are taken in the
deeper call chain via the set_brightness() callbacks not going to cause
the same problem?

IOW, you can point us at Johannes' patch as much as you want, it won't
solve the problems in the subsequently invoked callbacks.

Sorry for not having provided enough context for you in the first place,
but I was under the impression that the CIP's SLT-RT maintainer [1]
understands at least the basic principles of RT.

And of course the stable RT kernels you maintain there contain the very
same patch, but obviously it's not a problem for those kernels because
otherwise you or someone else would have complained before.

But of course for integrating RT into mainline it's essential to support
this, right?

We're definitely going to pay more attention next time when submitting
that patch unless it becomes obsolete because someone who cares deeply
about ledtrigg_cpu() working correctly with RT enabled kernels on
obsolete hardware has fixed all underlying isues.

That hasn't happened in the past 15+ years and I'm happy to postpone any
attempt of supporting RT on arch/arm/ for another 15+ years.

Thanks,

        tglx

[1] https://wiki.linuxfoundation.org/civilinfrastructureplatform/start
