Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1BC1419F3B
	for <lists+linux-leds@lfdr.de>; Mon, 27 Sep 2021 21:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236474AbhI0TgI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Sep 2021 15:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhI0TgI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Sep 2021 15:36:08 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 585B3C061575
        for <linux-leds@vger.kernel.org>; Mon, 27 Sep 2021 12:34:30 -0700 (PDT)
Date:   Mon, 27 Sep 2021 21:34:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1632771266;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NV0DnVtPyMtdRH+8Ry6GwwvmsdwZGeGCFHGBeo6w/3g=;
        b=KukbsKmp+LfHz7adPvIVzwwTyZdIuDy5jKRd8jFv3MbQ44P78JvK1NWczUGqbywUtoXBw6
        9T4JgA6Jfy1kqVd7X/j9Aivs/SsvU0MhDHsrfgZSoAPC5WOODiup71eS2W+GDAqvJCdPJz
        efT/y+xZdEmagEDJxGnBMeQHGv7CGDMFxPxOIaHZ6sR31wLzGOfGFY6QSgJY72gQx+ygGj
        10XPiRkuCYoccOsaPvJlncD8BMevcN63dCEcn6RvuMkinjva2E+4ptWHy2qL9rSEnFww1K
        Lz2c9bTgxFY+1JRujjvdwIUqjZlOJYpi8FXNTjh3yi2SmKkK60fhKsY5gOjOJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1632771266;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NV0DnVtPyMtdRH+8Ry6GwwvmsdwZGeGCFHGBeo6w/3g=;
        b=RScZYYEerca84A0qBgxY586F5vGHQPj6tI/73QzNoAS+7krjyFhEYGrUgsxJoyjZBWdMyE
        sYnTVs/zG2tPBKAQ==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Thomas Gleixner <tglx@linutronix.de>, johannes.berg@intel.com,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: Disable CPU trigger on PREEMPT_RT
Message-ID: <20210927193424.glrddglskpohbosn@linutronix.de>
References: <20210924111501.m57cwwn7ahiyxxdd@linutronix.de>
 <20210927142345.GB18276@duo.ucw.cz>
 <87wnn2av6h.ffs@tglx>
 <20210927154451.GA17112@duo.ucw.cz>
 <20210927171802.uak3tbpqaig3mm7m@linutronix.de>
 <20210927190650.GA13992@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210927190650.GA13992@duo.ucw.cz>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2021-09-27 21:06:50 [+0200], Pavel Machek wrote:
> Hi!
Hi,

> What makes the CPU trigger special with RT? Other triggers will be
> called from interesting places, too... Johanes pointed out other
> problems with that rwlock, and we are getting rid of the rwlock.

There seem to be a few misunderstandings. Let me clear them up for you:
- A non sleeping lock is spinlock_t and rwlock_t as you point out but
  only on !PREEMPT_RT. In context of PREEMPT_RT both of them are
  sleeping locks.

- An interrupt handler on PREEMPT_RT is always threaded. From threaded
  context sleeping is possible and therefore a spinlock_t can be
  acquired by regular request_irq().

- The timer callback (timer_list or hrtimer) is *usually* invoked from
  softirq context which is preemptible on PREEMPT_RT. Therefore sleeping
  is possible in order to acquire a spinlock_t. The exceptional
  callbacks (which are not invoked from softirq thus the term usually
  previously) must not acquire spinlock_t and are specially marked.

- The idle loop (x86 or ARM makes no difference) is always invoked with
  disabled interrupts and so sleeping is a no no on PREEMPT_RT. So a
  spinlock_t can not be acquired in this context.

You mention "interesting places" above. Either this is not the case or
nobody reported it yet.

> Best regards,
> 								Pavel

Sebastian
