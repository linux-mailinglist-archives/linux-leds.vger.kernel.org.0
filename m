Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54F0D9EA52
	for <lists+linux-leds@lfdr.de>; Tue, 27 Aug 2019 16:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbfH0OD5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Aug 2019 10:03:57 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45210 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbfH0OD5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Aug 2019 10:03:57 -0400
Received: by mail-pg1-f194.google.com with SMTP id o13so12747601pgp.12;
        Tue, 27 Aug 2019 07:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vRyuTS5qz2XPINcB7iLgtQKJC9f4ym0cl5Z9n4olkJ8=;
        b=X4MqDOM3NpQlq8zFabAVi3zXT4qB4XT9H6oeKNPetlhQBOGhSnr2vDJQJ1nOTRLmx0
         asfst4+807osIwzlK7laI+rw8CkMci9NUI+M5+yuH2S89cMVQpfzFFh9M70Q5dMx13fB
         iFnS1uZWk3x6p9vX0QsOMWwEQUW9jIvsjgBWowHP13/SWeeVPVCRfaQ7Zfy29eN2aVJe
         X/rEaEbDeLvvyFm0Juwyrdy2laaATjJ5dXTXkiISX1oQf9oZKGF5rzyW4GGE8+ckkgGD
         PPJ5kBhYm3Gp97NE6PYwKqReGMlJyKe8vZnBHZz36EoHkSNoDXPY/GRaReFhgdSKEFVE
         JrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vRyuTS5qz2XPINcB7iLgtQKJC9f4ym0cl5Z9n4olkJ8=;
        b=h0JdUZ0rVgJaKaJhcvZkq0SNlvdhn8aa1lg9+Neuq2zOptFdJudLnaWY+uSCej4n+1
         r3XEw9iss8TAfw6n59czAmrB3uDWXhQE8YpePAAr55iqtc1D3waVQo++udHWkiqdj3md
         FcwvwOER39nS6UAqe5utkJO4tistEj1rNM5y5WItBO6AnbidBreqJ9s1Z846MuohHl8I
         zi3HcAcQ7nCVJsSugsoOJYZMbr9iu8zGbDcR5tlIq+gChfxE5iKMoiJL2PFX0LQY5BNc
         /pP/uhcW2IxygRu10zoTC8B3Zt1h8sUGy+b5ouIwuaoDytlB97s3ojtWmoRSv5rUsYvo
         FuZw==
X-Gm-Message-State: APjAAAXT8iUFefl6Jp8kxxJmHpXmPYz1Lj3l+fgBuHts2/OB7cgkTv05
        xFE0wkzSACayfpnDi84vA8COZwqq+5w+9bcrJDs=
X-Google-Smtp-Source: APXvYqxC9fDdQGPHmEP/2yp/CfPRcllwn+ny0Utliu9P6xDn54VSI5qHeGbP0PWgfwoT5mwG9D1Ws/3vWFNeZl4ytJs=
X-Received: by 2002:aa7:8007:: with SMTP id j7mr26172131pfi.154.1566914636187;
 Tue, 27 Aug 2019 07:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <1565888399-21550-1-git-send-email-akinobu.mita@gmail.com>
 <1565888399-21550-5-git-send-email-akinobu.mita@gmail.com>
 <20190817145509.GA18381@amd> <925633c4-a459-5e84-9c9a-502a504fdc82@gmail.com>
 <20190819143842.GA25401@amd> <7c4c4853-7e3a-0618-92a0-337e248e2b4c@gmail.com>
 <c937b7e0-02c6-ae9a-aaf7-16a2ef29886d@gmail.com> <CAC5umyjxkeR3rhf3XZvwkxLvc-0ENEkQfOLnk8A12Qazr9Et8w@mail.gmail.com>
 <86309c4f-bcee-182c-369f-fcc883f379c6@gmail.com>
In-Reply-To: <86309c4f-bcee-182c-369f-fcc883f379c6@gmail.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Tue, 27 Aug 2019 23:03:45 +0900
Message-ID: <CAC5umyibEMrxhZv0TyS6hYHR+oyj2Oby+LVsjrYmMV8u-chXRQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] block: introduce LED block device activity trigger
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-block@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-nvme@lists.infradead.org,
        linux-scsi@vger.kernel.org,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Dan Murphy <dmurphy@ti.com>, Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Hannes Reinecke <hare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

2019=E5=B9=B48=E6=9C=8825=E6=97=A5(=E6=97=A5) 0:53 Jacek Anaszewski <jacek.=
anaszewski@gmail.com>:
>
> On 8/23/19 6:00 PM, Akinobu Mita wrote:
> > 2019=E5=B9=B48=E6=9C=8820=E6=97=A5(=E7=81=AB) 3:38 Jacek Anaszewski <ja=
cek.anaszewski@gmail.com>:
> >>
> >> On 8/19/19 8:22 PM, Jacek Anaszewski wrote:
> >>> On 8/19/19 4:38 PM, Pavel Machek wrote:
> >>>> On Sat 2019-08-17 22:07:43, Jacek Anaszewski wrote:
> >>>>> On 8/17/19 4:55 PM, Pavel Machek wrote:
> >>>>>> On Fri 2019-08-16 01:59:58, Akinobu Mita wrote:
> >>>>>>> This allows LEDs to be controlled by block device activity.
> >>>>>>>
> >>>>>>> We already have ledtrig-disk (LED disk activity trigger), but the=
 lower
> >>>>>>> level disk drivers need to utilize ledtrig_disk_activity() to mak=
e the
> >>>>>>> LED blink.
> >>>>>>>
> >>>>>>> The LED block device trigger doesn't require the lower level driv=
ers to
> >>>>>>> have any instrumentation. The activity is collected by polling th=
e disk
> >>>>>>> stats.
> >>>>>>>
> >>>>>>> Example:
> >>>>>>>
> >>>>>>> echo block-nvme0n1 > /sys/class/leds/diy/trigger
> >>>>>>
> >>>>>> Lets use one trigger "block" and have the device as a parameter,
> >>>>>> please.
> >>>>>>
> >>>>>> We already have 1000 cpu triggers on 1000 cpu machines, and yes, i=
ts a
> >>>>>> disaster we'll need to fix. Lets not repeat the same mistake here.
> >>>>>>
> >>>>>> I guess it may be slightly more work. Sorry about that.
> >>>>>
> >>>>> We should be able to list available block devices to set,
> >>>>> so the problem would be not avoided anyway.
> >>>>
> >>>> Should we? We need to list triggers, but we may not list all the dev=
ices...
> >>>
> >>> This is similar to usbport trigger that lists available
> >>> ports as files in a sub-directory. We might eventually go
> >>> in this direction.
> >>
> >> I must withdraw this statement. This is not similar to usbport
> >> trigger. The difference is that with ledtrig-block we have separate
> >> triggers per each device and I am not aware if there is some centraliz=
ed
> >> mechanism similar to blocking_notifier_chain (usb_notifier_list
> >> in drivers/usb/core/notify.c) available for block devices, that
> >> would allow to gather all available block devs under common trigger.
> >>
> >> Moreover I remember Greg once discouraged using notifier chains
> >> as they are unsafe, so we would need some other solution anyway.
> >
> > I start thinking that we should implement the LED block device activity
> > trigger in userspace.  The userspace application firstly activates
> > one-shot LED trigger and periodically reads /sys/block/<disk>/stat and
> > writes /sys/class/leds/<led>/shot if there is any disk activity.
>
> This would suboptimal solution. I have another idea - let's get back
> to the implementation of ledtrig-blk in genhd.c. We would be registering
> one trigger on module initialization in a function with __init modifier.
> Then we would need to add/remove triggers to the ledtrig-blk in
> register_blkdev()/unregister_blkdev(). And registered triggers would
> be listed in block_devs directory created by the trigger.
>
> You can compare how drivers/usb/core/ledtrig-usbport.c maintains
> similar directory of usb ports.

It could be possible, but I have yet another idea.  What about introducing
/proc/led-triggers and /sys/class/leds/<led>/current-trigger?
The /sys/class/leds/<led>/trigger will be obsoleted by these two files.

The /proc/led-triggers is read only and no PAGE_SIZE limitation by the
seq_file interface.  So we can list all triggers in this file.

The /sys/class/leds/<led>/current-trigger is almost identical to
/sys/class/leds/<led>/trigger.  The only difference is that
'current-trigger' only shows the current trigger name.
