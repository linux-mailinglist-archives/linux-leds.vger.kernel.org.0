Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2C031D00B
	for <lists+linux-leds@lfdr.de>; Tue, 16 Feb 2021 19:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhBPSQn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Feb 2021 13:16:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55180 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229912AbhBPSQk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 16 Feb 2021 13:16:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613499303;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uTD5BpOUpOBbg52rdm7ussGemaJf38VmmOMyJYfaTig=;
        b=FdfuFFGom54st/4nhCmfT0X1CF5xmnl2+JvM5FpjMBGkVTKIotewlhx0PjgSoj/JjGIvFv
        9HkmL9EiGSiteGYGe6XPeVHTu0zEcOYU5AMMytH/p0tM2iH8zRqvfjxK48TMbOfwfR8Tqn
        GZgpuqLcReToBqcXshR2IHGToo9GG5M=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-Uzh91dpkO-GO8DDeCEQsDA-1; Tue, 16 Feb 2021 13:15:01 -0500
X-MC-Unique: Uzh91dpkO-GO8DDeCEQsDA-1
Received: by mail-pj1-f72.google.com with SMTP id cp4so2644727pjb.3
        for <linux-leds@vger.kernel.org>; Tue, 16 Feb 2021 10:15:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uTD5BpOUpOBbg52rdm7ussGemaJf38VmmOMyJYfaTig=;
        b=FpHbb67x4ZDKmtKK8de3maPdCBi5Lf8k8GPTWEpw2EUTb5H9tFrWmIxOQk7isvByLf
         Ber6eSRWoukowhceciq7zpWtQAOPPWsi6ti2nYYiD9lIRdW65YujKz/N/tNLb1+CgQB2
         FqARiuiwNnCq1Fq9yCE1B3aWcnDz4l/u7brB/ajzTm2/snQwvpnSvfQoUR1TcDL+5uLf
         mVZSeR7BYOZpi+0L973MzmJysD2gg/1vfauirRvoR4w1O9g+gvOw0HXVEr4uiUNHSjH+
         19ACYIdG7LLE6y5shvJkev/HQT1Wt9TD0GqebAmBrecIFvdpal8Y9890gJqLwFh2zFuv
         o8Bw==
X-Gm-Message-State: AOAM5308B4IQ4DBLH+M4feWwYEkP8RocavINEjATiXcPW8HrOMJKnsj5
        9hgIPJ99eIPVzw6vAtDCl4na+bLRX4+wcU1cTeEUYo0zlRjn4DuHSmUuq5E7puZKEONzkf6vU1d
        dl5UC6dl0F8dTaJiGVF0r4ud0wB9wIR7QBWmz4g==
X-Received: by 2002:a63:5603:: with SMTP id k3mr6968334pgb.419.1613499300011;
        Tue, 16 Feb 2021 10:15:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9j6NaXytYtel/8CpqtkdCMjMvzHRJPO45gGGbR3znX1uYqRzcW7Rn1D/4NqUMKTtuoIWuoq7y/A1l6NiD0Bk=
X-Received: by 2002:a63:5603:: with SMTP id k3mr6968317pgb.419.1613499299762;
 Tue, 16 Feb 2021 10:14:59 -0800 (PST)
MIME-Version: 1.0
References: <20210215004549.135251-1-roderick@gaikai.com> <20210215004549.135251-2-roderick@gaikai.com>
 <20210215143144.060fdbe6@nic.cz> <CANndSKmSP7rdsrMuwRapQkDru75TxN9zbDUbvOj_5hrQpskmJg@mail.gmail.com>
 <20210215165518.16033bb6@nic.cz> <CANndSKkVAFJzf58CNYw_j0QY7hd4umOMn5Cs6U3JnK6TozWdEQ@mail.gmail.com>
 <20210215192124.7a6c8c9d@nic.cz> <CAO-hwJ+=_fjHgenXvHv45sHgzwiG2z9vGeq7fmMqj2=BeYCF1Q@mail.gmail.com>
 <20210216185602.48a980f6@nic.cz>
In-Reply-To: <20210216185602.48a980f6@nic.cz>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 16 Feb 2021 19:14:48 +0100
Message-ID: <CAO-hwJKS_jcuXP6fhYaOutDjGk=GF09Bni88xY1RprEFOCQ-Yg@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] HID: playstation: add DualSense lightbar support
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Jiri Kosina <jikos@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Feb 16, 2021 at 6:56 PM Marek Behun <marek.behun@nic.cz> wrote:
>
> On Tue, 16 Feb 2021 18:29:46 +0100
> Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
>
> > > So all HIDs can be uniqely determined via this atomic_inc_return(&id),
> > > but it is only stored in string form as part of device name.
> >
> > Yes and no. This atomic_inc is only used to allow a sysfs tree,
> > because you can have several HID devices below the same USB, I2C or
> > UHID physical device. From the userspace, no-one cares about that ID,
> > because all HID devices are exported as input, IIO or hidraw nodes.
> >
> > So using this "id" would not allow for a direct mapping HID device ->
> > sysfs entry because users will still have to walk through the tree to
> > find out which is which.
>
> So you are saying that the fact that userspace cannot take the number
> from "hidN" string and simply do a lookup /sys/bus/hid/devices/hidN is
> the problem here.
>
> This is not a problem in my opinion, because userspace can simply
> access the parent HID device via /sys/class/leds/hidN:color:func/parent.

So in that case, there is no real point at keeping this ID in sync
with anything else? I would be more willing to accept a patch in HID
core that keeps this ID just for HID LEDs, instead of adding just an
ID with no meaning to all HID devices.

Honestly, I think the whole LED class creation API should be
revisited. I guess this is not the first time this problem arises, and
you must be tired of having to chase down users.

If I had to deal with that situation once for all, I would deprecate
the current led class creation API, and add a new API that doesn't
take a free-form string as the name but constrain the name to be
formed by your requirements. This would also send a clear message to
all subsystems because the changes have to be propagated, and then,
all the maintainers would know about this problem. Bonus point, if you
need only "subsystem", "color" and "function", that means that the ID
can be stored internally to the led class and you'll get happy users.

>
> In fact we did something similar for LEDs connected to ethernet PHYs.
> To summarize:
>   - ethernet PHYs are identified by long, sometimes crazy strings like
>       d0032004.mdio-mii:01
>     or even
>       /soc/internal-regs@d0000000/mdio@32004/switch0@10/mdio:08
>   - for the purposes of having a sane devicename part in LED names, I
>     sent this patch
>     https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2301470.html
>     which adds a simple incrementing integer ID to each PHY device.
>     (The code is not in upstream yet because there is other work needed
>      and because I decided that some functionality has to be available
>      via a different mechanism, but this part is complete and reviewed.)
>
> > An actual one-to-one mapping would using 'hidrawX' because there is a
> > one-to-one mapping between /dev/hidrawX for HID devices. However, this
> > means that we consider the bus to be hidraw which is plain wrong too.
> >
> > The unique ID of HID devices (in /sys/bus/hid/devices) is in the form
> > `BUS:VID:PID.XXXX`. I understand the need to not have colons, so could
> > we standardize LEDs on the HID subsystem to be named
> > `hid-bus_vid_pid_xxxx:color:fun(-n)?`? That would allow a mapping
> > between the LED and the sysfs, and would also allow users to quickly
> > filter out the playstation ones.
>
> As I wrote in other e-mail some minutes ago, this just means that we
> need to wait for other people's opinions. Please do not send this
> pull-request with the LED patches until this is resolved.
>

Yeah, I just asked Roderick to see if he can revert those patches
while keeping the functionality behind those. I am more concerned
about the micmute button, because we should really offer that feature
to users. The associated LED class has no real benefits for now, so
that code needs a little bit of care instead of a plain revert.

Cheers,
Benjamin

