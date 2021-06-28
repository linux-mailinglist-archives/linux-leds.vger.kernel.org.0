Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9253E3B6979
	for <lists+linux-leds@lfdr.de>; Mon, 28 Jun 2021 22:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236712AbhF1UJu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 28 Jun 2021 16:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236797AbhF1UJt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 28 Jun 2021 16:09:49 -0400
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C4FC061574;
        Mon, 28 Jun 2021 13:07:23 -0700 (PDT)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <johannes@sipsolutions.net>)
        id 1lxxXJ-00D2Fx-UL; Mon, 28 Jun 2021 22:07:18 +0200
Message-ID: <75b46034aafaac98851ed3041c079ede8684ed92.camel@sipsolutions.net>
Subject: Re: lockdep issue with trig->leddev_list_lock again/still?
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Andrea Righi <andrea.righi@canonical.com>,
        linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Date:   Mon, 28 Jun 2021 22:07:17 +0200
In-Reply-To: <YNA+d1X4UkoQ7g8a@boqun-archlinux> (sfid-20210621_092414_269518_35B37E8A)
References: <8a61ecda99843307018e3e71a5540682436443fc.camel@sipsolutions.net>
         <YNA+d1X4UkoQ7g8a@boqun-archlinux> (sfid-20210621_092414_269518_35B37E8A)
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Boqun,

First, thanks for the explanation. I have a follow-up question or two,
I'm not sure I understand things correctly.

You state the following deadlock scenario:

> The deadlock senario lockdep reported is as follow:
> 
> 	CPU 0			CPU 1			CPU 2			CPU 3
> 	=====			====			=====			=====
> 	<irq enabled>
> 	spin_lock(&txq->lock);
> 				<irq disabled>
> 				spin_lock(&host->lock);
> 							<irq disabled>
> 							read_lock(&trig->leddev_list_lock);
> 										write_lock_irqsave(&trig->leddev_list_lock);
> 							spin_lock(&txq->lock);
> 
> 				/* The following blocked because of fairness */
> 				read_lock(&trig->leddev_list_lock);
> 	<interrupted>
> 	spin_lock(&host->lock);
> 
> The key to understand this deadlock is that via a write_lock() (no
> matter whether irq is disabled or not), a read_lock() can block another
> read_lock() because of the fairness: in this case, CPU 2 is the reader
> of ->leddev_list_lock, and when CPU 3 comes and tries to acquire the
> writer of ->leddev_list_lock, it gets blocked. And no one would acquire
> ->leddev_list_lock earlier than CPU 3 (*fairness*, even a reader cannot
> steal the lock), so CPU 1 will get blocked on its read_lock().
> Therefore, this is a 4-CPU involved deadlock.

And all of that makes sense.

One of the key "ingredients" to the deadlock here is obviously CPU 1,
notably the host->lock handling there.

Would lockdep be able to tell the difference - like read_lock() -
between in_interrupt() and interrupts disabled? I'm not sure, and I'm
kind of just curious because I think in this case we have e.g.
ata_exec_internal_sg() definitely calling it like this, i.e. having a
code like in your CPU 1.


Also, the addition of "CPU 3" is kind of what I missed - though I tried
to add a write_lock(), but couldn't "make" it deadlock with 3 CPUs :)


However, since basically any CPU can actually execute a write_lock()
anywhere, should we actually even think if a read_lock() be any
different from a regular spinlock wrt. lockdep? I mean, the above
becomes kind of (more) obvious when you think of the read_lock() as just
spin_lock(), and then you don't even need CPU 3 to be executing a
write_lock(), you just deadlock right away?

Or does lockdep in fact map the difference - like my question above -
between read_lock() in and out of interrupt, and thus it could tell the
difference? Again, just wondering.



Now, what does this actually mean? I think the only reasonable thing we
could possibly do is convert the LED framework to RCU or such, because I
don't see how we can make something that's so intertwined with lots of
things in the kernel require that e.g. the iwlwifi driver disables
interrupts for its locking all the time (which is actually kind of bad,
especially if it's not required), only because ATA code wants to be able
to blink an LED with interrupts disabled ...

Any thoughts?

Thanks,
johannes

