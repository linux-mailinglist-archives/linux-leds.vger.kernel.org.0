Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6507F29F6E7
	for <lists+linux-leds@lfdr.de>; Thu, 29 Oct 2020 22:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726226AbgJ2Vcm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Oct 2020 17:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgJ2Vcl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Oct 2020 17:32:41 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92165C0613CF
        for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2020 14:32:41 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id y12so4335585wrp.6
        for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2020 14:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0BHvPcgmARh4Q+/c40YmHOEMatgZHuFzWD0SHWEBkUM=;
        b=eLp8gPHqw5OEgk9YVRi78peo5kvAGknD9ex5cAxfojVxrR8e35uBHUsuRxC/rdXFOc
         P0Jeb5ghjtNPHW2TiRrFFqkCDh5crFRM8r36o5jbhxjzkJbNkL1cn+f/qB+ExFTUMtw8
         5I3kGeWa90RpAOp3FhH+gVs4gNwtU/X/EHplbw4Ep22OhvgmhTldRzrrU/5ftt83aHS8
         s5xGRDonKIhT2wJ4Hx4xmykv4YRINPMu9sMS8Kt7G7vWoyvdehVhBkqIeWEC2hntJxqe
         nCy7q9+PdkllJwKmuX54WV4Upn8eRmDpJ46e+sPh68wAceUFqOlyUeM3mPDXcCqf0ekB
         8b7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0BHvPcgmARh4Q+/c40YmHOEMatgZHuFzWD0SHWEBkUM=;
        b=s+hj1GgsMXJM6vfAx9ixskInJBAC5lO1ZE2PI7d9J6Ad6aoBJ3QMxMCDu4/iPcI6Oq
         d7LtM91xyMd7aGGpq7eoe3RCbtbnclokX9USlRMWe9U7cPy9JmgW710BQBeV7+uMxB2f
         jSEhgOzHs4UvjhVOaLNy47bTLzV6NbPru4QJMogSex2QGpigmlajXy3QiYDl/m2vY449
         LvvXGJ3mdiQKnL186mGfDvFbhU4+bNKHhYZ7jG0t46wngxK26agAJbAMVyKSeMgEJWD6
         Fl23sgpb5u7+mFydDZ9eji2PosYUWnI11yZXgIk9KK/6lxEgLyqsj70Sp2Pujc17nR0u
         XrUA==
X-Gm-Message-State: AOAM530eE3QmxdAF6n+/ZBKpfS/qG2Tr2zPlRqvsPJD4HOdhnrKGB4c8
        b81Gb1aS5a+q4rD0gdPcLIw8BXNmkWQ/gDC3DKQ=
X-Google-Smtp-Source: ABdhPJxqsDqmuX8z13lBdKLtQ3JHEmQQQyt2NVY3/yL9OzZczQFlmhJdX/ppZgXO22Jn3DbXOw6Q9pxO8h5o6mQFvcs=
X-Received: by 2002:adf:c04d:: with SMTP id c13mr8390150wrf.27.1604007160236;
 Thu, 29 Oct 2020 14:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201029070000.15472666@kernel.org> <20201029174529.GA26053@duo.ucw.cz>
 <20201029191347.6d509614@kernel.org>
In-Reply-To: <20201029191347.6d509614@kernel.org>
From:   Ben Whitten <ben.whitten@gmail.com>
Date:   Thu, 29 Oct 2020 21:32:29 +0000
Message-ID: <CAF3==isr0hHM7ab6ivTqD3ijWNtsg9LtS90vHEkYfG_JeUp1tQ@mail.gmail.com>
Subject: Re: ledtrig netdev: what is the purpose of spinlock usage?
To:     =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On Thu, 29 Oct 2020 at 18:13, Marek Beh=C3=BAn <kabel@kernel.org> wrote:
>
> On Thu, 29 Oct 2020 18:45:29 +0100
> Pavel Machek <pavel@ucw.cz> wrote:
>
> > Hi!
> >
> > > since you are the original author of netdev LED trigger, I guess this
> > > question should go to you. Why are spinlocks used as locks in the
> > > netdev trigger code? Is this for performance? Would it be a drastic
> > > performance hit to use mutexes?
> >
> > Triggers can be called from interrupt context, IIRC, and many simple
> > LEDs can be operated from interrupt context, too.
> >
> > Thus you need spinlocks...
> >
> > Best regards,
> >                                                               Pavel
>
> Pavel,
>
> the set_baseline_state function in netdev trigger is guarded by a
> spinlock only when reading/writing device_name attribute and in
> netdev notify callback.
>
> netdev_trig_notify can for example put the device away on
> NETDEV_UNREGISTER event, and if someone was reading/writing the
> device_name at the same time netdev_trig_notify is manipulating
> netdevice pointer, it could break. So my guess for the lock is that it
> is used because of this.
>
> It is possible that netdev_trig_notify can be called from interrupt
> context, I will have to look into this.

IIRC that is what I was seeing on my platform and I used the same locking
mechanism for consistency, though my memory is hazy.

>
> Anyway for the trigger_offload() method to be able to communicate with
> PHYs I need the set_baseline_state function not to be called from
> within spinlock. Otherwise the drivers implementing this method would
> get too complicated. Would it be allright if on netdev event (link up,
> link down, netdev changename, netdev unregister) the set_baseline_state
> was called from a work, instead of directly from the spinlock?
>
> I will send a patch proposing and explaining this.

Go for it, patches welcome! Sounds interesting.

>
> Marek
