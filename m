Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDD2D32FF72
	for <lists+linux-leds@lfdr.de>; Sun,  7 Mar 2021 08:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbhCGHPT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 7 Mar 2021 02:15:19 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:45729 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbhCGHO5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 7 Mar 2021 02:14:57 -0500
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <andrea.righi@canonical.com>)
        id 1lInct-0002Kq-JP
        for linux-leds@vger.kernel.org; Sun, 07 Mar 2021 07:14:55 +0000
Received: by mail-ed1-f72.google.com with SMTP id n20so3336385edr.8
        for <linux-leds@vger.kernel.org>; Sat, 06 Mar 2021 23:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8RAwbWKs3D0TFja/bS8+raVCy0idj4NZ23+PF/iBrVs=;
        b=B9/4EuELlmYGLfC79+qO1E829yahsJrJdnoFwHaWen/8hjQUW/EDkjUpQFKl3N7oPr
         P047Oa9RZbyAFLBwqnd8pdZpmqo+Clhd5bIGk0nmoHdSJuWupoQHJfcAAWhg4u2Z+ECX
         DRaL7gzYl8yaCgYejgZIWZ1urhiEuADSVBLQ5Ei+M8wpC+2wlwtbOyfHHH9ZByFoatbA
         HXz3H7xo0Cp5PuG75Ar9kDO9LpXwB4r9OH+LgsJOD96azBgLaOSXrxKUIMboR2T1p89O
         EeS5Vm/KX7LNo4ZuTDkT/d6BtyvaG6XGooXcZYtWGQBiyNHiH9Dp4E1vQaz4LTE3YfzR
         ApFQ==
X-Gm-Message-State: AOAM533cCoAGoijpJTC5MhVD68vL+igWn6qnmO8gKhm3CIs6tbVMpght
        MFEpCZwG/VIukMITX7eHEV1ioG6rHY7RVT8h2YguBhb4tygG77GodueOKfXH6Kh5j4aPGJNteVB
        AGWt/iRBrPfACtyQwxIqAJRjo1cNjDeMLHKwNo9A=
X-Received: by 2002:a17:906:6c4:: with SMTP id v4mr9548309ejb.198.1615101295282;
        Sat, 06 Mar 2021 23:14:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxexOesV/gr/ay1DEqZGVArOt9zbi7hcYzbtxNarcicjOTC0WZSvwL2nh2syiuMim+McE+8sA==
X-Received: by 2002:a17:906:6c4:: with SMTP id v4mr9548291ejb.198.1615101295073;
        Sat, 06 Mar 2021 23:14:55 -0800 (PST)
Received: from localhost (host-79-43-122-37.retail.telecomitalia.it. [79.43.122.37])
        by smtp.gmail.com with ESMTPSA id r4sm4856778edv.27.2021.03.06.23.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 23:14:54 -0800 (PST)
Date:   Sun, 7 Mar 2021 08:14:53 +0100
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     Marc Kleine-Budde <mkl@pengutronix.de>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, schuchmann@schleissheimer.de
Subject: Re: [PATCH] leds: trigger: fix potential deadlock with libata
Message-ID: <YER9bWcfTI3jB1wT@xps-13-7390>
References: <20201102104152.GG9930@xps-13-7390>
 <20210306203954.ya5oqgkdalcw45c4@pengutronix.de>
 <YEQ0ONQCwVUd0wmc@boqun-archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YEQ0ONQCwVUd0wmc@boqun-archlinux>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Mar 07, 2021 at 10:02:32AM +0800, Boqun Feng wrote:
> On Sat, Mar 06, 2021 at 09:39:54PM +0100, Marc Kleine-Budde wrote:
> > Hello *,
> > 
> > On 02.11.2020 11:41:52, Andrea Righi wrote:
> > > We have the following potential deadlock condition:
> > > 
> > >  ========================================================
> > >  WARNING: possible irq lock inversion dependency detected
> > >  5.10.0-rc2+ #25 Not tainted
> > >  --------------------------------------------------------
> > >  swapper/3/0 just changed the state of lock:
> > >  ffff8880063bd618 (&host->lock){-...}-{2:2}, at: ata_bmdma_interrupt+0x27/0x200
> > >  but this lock took another, HARDIRQ-READ-unsafe lock in the past:
> > >   (&trig->leddev_list_lock){.+.?}-{2:2}
> > > 
> > >  and interrupts could create inverse lock ordering between them.
> > 
> > [...]
> > 
> > > ---
> > >  drivers/leds/led-triggers.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> > > index 91da90cfb11d..16d1a93a10a8 100644
> > > --- a/drivers/leds/led-triggers.c
> > > +++ b/drivers/leds/led-triggers.c
> > > @@ -378,14 +378,15 @@ void led_trigger_event(struct led_trigger *trig,
> > >  			enum led_brightness brightness)
> > >  {
> > >  	struct led_classdev *led_cdev;
> > > +	unsigned long flags;
> > >  
> > >  	if (!trig)
> > >  		return;
> > >  
> > > -	read_lock(&trig->leddev_list_lock);
> > > +	read_lock_irqsave(&trig->leddev_list_lock, flags);
> > >  	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list)
> > >  		led_set_brightness(led_cdev, brightness);
> > > -	read_unlock(&trig->leddev_list_lock);
> > > +	read_unlock_irqrestore(&trig->leddev_list_lock, flags);
> > >  }
> > >  EXPORT_SYMBOL_GPL(led_trigger_event);
> > 
> > meanwhile this patch hit v5.10.x stable and caused a performance
> > degradation on our use case:
> > 
> > It's an embedded ARM system, 4x Cortex A53, with an SPI attached CAN
> > controller. CAN stands for Controller Area Network and here used to
> > connect to some automotive equipment. Over CAN an ISOTP (a CAN-specific
> > Transport Protocol) transfer is running. With this patch, we see CAN
> > frames delayed for ~6ms, the usual gap between CAN frames is 240µs.
> > 
> > Reverting this patch, restores the old performance.
> > 
> > What is the best way to solve this dilemma? Identify the critical path
> > in our use case? Is there a way we can get around the irqsave in
> > led_trigger_event()?
> > 
> 
> Probably, we can change from rwlock to rcu here, POC code as follow,
> only compile tested. Marc, could you see whether this help the
> performance on your platform? Please note that I haven't test it in a
> running kernel and I'm not that familir with led subsystem, so use it
> with caution ;-)

If we don't want to touch the led subsystem at all maybe we could try to
fix the problem in libata, we just need to prevent calling
led_trigger_blink_oneshot() with &host->lock held from
ata_qc_complete(), maybe doing the led blinking from another context (a
workqueue for example)?

-Andrea
