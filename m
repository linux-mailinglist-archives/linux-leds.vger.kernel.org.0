Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D21D31CEE6
	for <lists+linux-leds@lfdr.de>; Tue, 16 Feb 2021 18:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbhBPRVf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Feb 2021 12:21:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52941 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230332AbhBPRVc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 16 Feb 2021 12:21:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613496003;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=n4aM62SkNawcaaUjavXMsEwrCsKeWQciX7tR3J1vge8=;
        b=SI4fWrKZmJl2PyjIKqbGa/sZqFofxwKi1M6IRrDff4FG2NGE10Bu9p92eTnoLlPA5iZCmC
        +SZ4DXx7jeDy2LBdDe+dRheFkZWQx2A1k3eJqXIaEWrTueLySxb9N+XSdBsixe9R9vtuO3
        gpT8vEf2QvrUbdgwf0i1se63Z1cUMqE=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-BKd2Prf2MiKTCidZuglFbQ-1; Tue, 16 Feb 2021 12:20:01 -0500
X-MC-Unique: BKd2Prf2MiKTCidZuglFbQ-1
Received: by mail-pj1-f72.google.com with SMTP id lt15so3010942pjb.9
        for <linux-leds@vger.kernel.org>; Tue, 16 Feb 2021 09:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n4aM62SkNawcaaUjavXMsEwrCsKeWQciX7tR3J1vge8=;
        b=r2d90jmTnhGbmahKqOh+rHTImLtwjgidt2EbxsBWnzWJvUDYL29dpBifmJzPbhkTnT
         /YqTq+X6Kg9Iere/acx5TA+rMxUnmna6//KPmKmwVgiEudUQKkQAhHc8PrR954gTSUxv
         l1f+5eV5To1izuP3QW8bTMNBbHcsnLyAHZqqTiqxwGpo1zJvO0jwbRSRLzpnBm9s5oRL
         VVKHtr3GWJL8y6oMoFzUhv9ORI3V3icczElS6JF8nf/18WkyKfg6x84/mh57LaluOoq2
         pHalivw3M0bEwMt/kItXsD2/uyrX95maUPdtVL8QtO9p7cq2rjiJhf2xP4r+9wwctzzU
         QjtA==
X-Gm-Message-State: AOAM532i5mS0pydqRblCllvwXH0tjK6K2dZM7wIdNdBlextc3BqdKqmv
        8CnASNMryg+QQqALKoKiAARTzU8vl5DHaJBT4RIMuXwFK4YFIUkemFIlw+jH5k2k6lH58BzCssA
        Tm33/WYCzTSAKkpD09/XiRXiAIqZ96vlI7z+TrA==
X-Received: by 2002:a63:4d41:: with SMTP id n1mr20423141pgl.147.1613496000559;
        Tue, 16 Feb 2021 09:20:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxaYsz2es5U4cREgjfQ2X5X+fbGVMQsVPg4uhJeW6LRxvHMQrZ2lBoc6onW7lM/hy7QbKy94fL9fw21DugsSk=
X-Received: by 2002:a63:4d41:: with SMTP id n1mr20423125pgl.147.1613496000323;
 Tue, 16 Feb 2021 09:20:00 -0800 (PST)
MIME-Version: 1.0
References: <20210215004549.135251-1-roderick@gaikai.com> <20210215004549.135251-4-roderick@gaikai.com>
 <CANndSK=52kV50SsDzhEg78m67AFhNoz=Z4H1=pFyHLzAJj-YBQ@mail.gmail.com>
 <20210216013337.284220cf@nic.cz> <CANndSKke4zGn2T6jC4xYtguAjixZ7n5Rf9SSY3knEhvwJ1cLyQ@mail.gmail.com>
 <20210216033744.123b9acd@nic.cz>
In-Reply-To: <20210216033744.123b9acd@nic.cz>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 16 Feb 2021 18:19:49 +0100
Message-ID: <CAO-hwJ+WPacFxvT=88mq2osES=JYQ3-yQWf6mEZO67ZymGw-vg@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] HID: playstation: add DualSense player LEDs support.
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Feb 16, 2021 at 3:37 AM Marek Behun <marek.behun@nic.cz> wrote:
>
> On Mon, 15 Feb 2021 17:11:14 -0800
> Roderick Colenbrander <roderick@gaikai.com> wrote:
>
> > On Mon, Feb 15, 2021 at 4:33 PM Marek Behun <marek.behun@nic.cz> wrote:
> > >
> > > On Mon, 15 Feb 2021 15:00:30 -0800
> > > Roderick Colenbrander <roderick@gaikai.com> wrote:
> > >
> > > > What is the desired naming for these player LEDs? There is not an
> > > > officially designed function based on DT bindings. So far they used
> > > > "playstation::mac::ledX". When changing the naming scheme towards
> > > > "hid" and removing MAC, they would be: "hid%d::led1" etcetera.
> > >
> > > Hi,
> > >
> > > there is one more thing I forgot to mention in the LED name schema:
> > >   devicename:color:function-functionEnumerator
> > >
> > > So LED core can for example compose a names in the format:
> > >   switch0:green:lan-1
> > >   switch0:green:lan-2
> > >   switch0:green:lan-3
> > >   switch0:green:lan-4
> > >
> > > In your case I think the most appropriate name would be something like
> > >   hid0:color:indicator-1
> > >   hid0:color:indicator-2
> > >   ...
> >
> > I am trying to think if indicator is clear enough. Currently devices
> > use a mixture of names, which is obviously bad (wiimote uses p1-p4 at
> > the end, sony uses sony1-4 for DualShock 3, hid-nintendo uses
> > player1-4). I would at least like new drivers to standardize. In
> > particular in Android frameworks we have a need to map these LEDs back
> > to the Java InputDevice. Finding the LEDs has been quite painful so
> > far.
>
> Thinking about it more, function "player" should theoretically be
> reasonable. Maybe we should try sending a patch for review, adding this
> funciton to include/dt-bindings/leds/common.h, and see what others
> think of it...

FWIW, I am not sure 'player' would be a good fit here. I personally
preferred "indicator".
My reasons are because those LEDs are basically a matrix of LEDs, and
are supposed to be read as a whole. For player 1, you would light up
the 3rd LED only. And for player 2, you would light up LEDS #2 and #4.

So I would say that in this particular case, "player" would lead to
confusion because users would want to set player 1 on the controller
and would have to talk to the "player-3" LED.

If we keep the more generic "indicator", the one-to-one mapping is
removed, and it's clearer that userspace needs an adaptor to convert
"players" into "indicator".

For the older controllers with a dedicated "player" LED, like the PS3
and the Wiimote, "player" would make sense, yes.

Cheers,
Benjamin

>
> > If this is what is decided, I guess we should update the Linux gamepad
> > document at some point as well.
> >
> > > Are these LEDs of different colors which are impossible to determine?
> > > The string "hid%d::led1" you mention above does not indicate color.
> >
> > The DualSense LEDs are all white (at least so far?). On controllers
> > from other brands I have seen them be red or green. So could indeed
> > use: "hid%d:white".
>
> Yes, a constant for white color is defined in headers.
>
> > > Marek
> >
> > Thanks,
> > Roderick
>

