Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F877A056C
	for <lists+linux-leds@lfdr.de>; Wed, 28 Aug 2019 16:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbfH1O5E (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Aug 2019 10:57:04 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:32801 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfH1O5E (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Aug 2019 10:57:04 -0400
Received: by mail-pl1-f193.google.com with SMTP id go14so117638plb.0;
        Wed, 28 Aug 2019 07:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JzE5osCTB92XAPpUB75wCbGts3OVhlEyRxVtEnEhM+s=;
        b=VjafpiHn+H/Yn3ttsfJr5HQonWbXr70KXEmx0gnO39ej1X0lllUFu7YbyJzR5Xmb9X
         pY0MEvyRHBq6SoRV4pw+e/OmRF/9Ehmn4pnpjmXbIoDrLQYFA8C9P9aGUbIOlna4K/I4
         mT+IWsYtQgekyP8NBtddxS1iUw6KL5tX04Dx7XgdvJNuYVNLJ5pUu/TqaSLavXroCTwk
         DROvd2xkRwR6S5fsE5R6gJvu2pWY2Ge2zJVIHxb2DOwQdxx5MBbCwd4EcRuUXTEofiat
         opgF80qTA4p6UTx+mzD7884oIHIhoISj9+zM2f/MYFY07q2OMiOfrYacY/cVAXX67/j8
         ujdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JzE5osCTB92XAPpUB75wCbGts3OVhlEyRxVtEnEhM+s=;
        b=mxtU+I4Vv+ITY/jdLO9XoM8KuBOOtI/eWaCxY2Av0HeLbthPe4DyNCHXZ6OTVPZNXv
         kPWcqTGevlyKtFEkVeaFskS8IxNuH+CCi3M+x4GQdaCK8qBLFqi6/etUsWyLUu40tbr4
         Scl9La4Q6lIRUpCuA0Sq2pbW/ut/Wy3oFY9SimdRZXDtZgPMO7u7JInGLzlKf5iCCMPk
         psH8OrF9Ix+PSOWsDHB+fxFHxAmFyn+lwN3dGfQeLLetJFHj7k6AHZM5VBOoPJUJmPV7
         6Coxj1SlPtC9VQSFWRHV6VsoQT/DJkizsKN9/hd9LOK7h9iuZBkh1xf9QY31BtTPPwcA
         7TDg==
X-Gm-Message-State: APjAAAUGBmDT3Cc2O2EP/1Dk7inkxS3nvf28tjSK8U7iXzShJobf7pYl
        ZTMeb0npBSvQNymO0z2qXlKfzY9C49zkx68kWUw=
X-Google-Smtp-Source: APXvYqx4jFzQQN92tBres1dfrzux0bEqo1UfkwxDaRPm7h+C4Zv52PksySBqfNdYulxwW35s56T3DlTv/QuLEuZvtpY=
X-Received: by 2002:a17:902:426:: with SMTP id 35mr4859364ple.192.1567004222800;
 Wed, 28 Aug 2019 07:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <1565888399-21550-1-git-send-email-akinobu.mita@gmail.com>
 <1565888399-21550-5-git-send-email-akinobu.mita@gmail.com>
 <20190817145509.GA18381@amd> <925633c4-a459-5e84-9c9a-502a504fdc82@gmail.com>
 <20190819143842.GA25401@amd> <7c4c4853-7e3a-0618-92a0-337e248e2b4c@gmail.com>
 <c937b7e0-02c6-ae9a-aaf7-16a2ef29886d@gmail.com> <CAC5umyjxkeR3rhf3XZvwkxLvc-0ENEkQfOLnk8A12Qazr9Et8w@mail.gmail.com>
 <86309c4f-bcee-182c-369f-fcc883f379c6@gmail.com> <CAC5umyibEMrxhZv0TyS6hYHR+oyj2Oby+LVsjrYmMV8u-chXRQ@mail.gmail.com>
 <1f7928a1-61ba-72f0-fd03-2208856cd8b8@gmail.com>
In-Reply-To: <1f7928a1-61ba-72f0-fd03-2208856cd8b8@gmail.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Wed, 28 Aug 2019 23:56:51 +0900
Message-ID: <CAC5umygq7p63sAnL+cqe35RqXpFDv=CyuEMiWGQy76=_uq8ZHg@mail.gmail.com>
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

2019=E5=B9=B48=E6=9C=8828=E6=97=A5(=E6=B0=B4) 6:23 Jacek Anaszewski <jacek.=
anaszewski@gmail.com>:
>
> On 8/27/19 4:03 PM, Akinobu Mita wrote:
> > 2019=E5=B9=B48=E6=9C=8825=E6=97=A5(=E6=97=A5) 0:53 Jacek Anaszewski <ja=
cek.anaszewski@gmail.com>:
> >>
> >> On 8/23/19 6:00 PM, Akinobu Mita wrote:
> >>> 2019=E5=B9=B48=E6=9C=8820=E6=97=A5(=E7=81=AB) 3:38 Jacek Anaszewski <=
jacek.anaszewski@gmail.com>:
> >>>>
> >>>> On 8/19/19 8:22 PM, Jacek Anaszewski wrote:
> >>>>> On 8/19/19 4:38 PM, Pavel Machek wrote:
> >>>>>> On Sat 2019-08-17 22:07:43, Jacek Anaszewski wrote:
> >>>>>>> On 8/17/19 4:55 PM, Pavel Machek wrote:
> >>>>>>>> On Fri 2019-08-16 01:59:58, Akinobu Mita wrote:
> >>>>>>>>> This allows LEDs to be controlled by block device activity.
> >>>>>>>>>
> >>>>>>>>> We already have ledtrig-disk (LED disk activity trigger), but t=
he lower
> >>>>>>>>> level disk drivers need to utilize ledtrig_disk_activity() to m=
ake the
> >>>>>>>>> LED blink.
> >>>>>>>>>
> >>>>>>>>> The LED block device trigger doesn't require the lower level dr=
ivers to
> >>>>>>>>> have any instrumentation. The activity is collected by polling =
the disk
> >>>>>>>>> stats.
> >>>>>>>>>
> >>>>>>>>> Example:
> >>>>>>>>>
> >>>>>>>>> echo block-nvme0n1 > /sys/class/leds/diy/trigger
> >>>>>>>>
> >>>>>>>> Lets use one trigger "block" and have the device as a parameter,
> >>>>>>>> please.
> >>>>>>>>
> >>>>>>>> We already have 1000 cpu triggers on 1000 cpu machines, and yes,=
 its a
> >>>>>>>> disaster we'll need to fix. Lets not repeat the same mistake her=
e.
> >>>>>>>>
> >>>>>>>> I guess it may be slightly more work. Sorry about that.
> >>>>>>>
> >>>>>>> We should be able to list available block devices to set,
> >>>>>>> so the problem would be not avoided anyway.
> >>>>>>
> >>>>>> Should we? We need to list triggers, but we may not list all the d=
evices...
> >>>>>
> >>>>> This is similar to usbport trigger that lists available
> >>>>> ports as files in a sub-directory. We might eventually go
> >>>>> in this direction.
> >>>>
> >>>> I must withdraw this statement. This is not similar to usbport
> >>>> trigger. The difference is that with ledtrig-block we have separate
> >>>> triggers per each device and I am not aware if there is some central=
ized
> >>>> mechanism similar to blocking_notifier_chain (usb_notifier_list
> >>>> in drivers/usb/core/notify.c) available for block devices, that
> >>>> would allow to gather all available block devs under common trigger.
> >>>>
> >>>> Moreover I remember Greg once discouraged using notifier chains
> >>>> as they are unsafe, so we would need some other solution anyway.
> >>>
> >>> I start thinking that we should implement the LED block device activi=
ty
> >>> trigger in userspace.  The userspace application firstly activates
> >>> one-shot LED trigger and periodically reads /sys/block/<disk>/stat an=
d
> >>> writes /sys/class/leds/<led>/shot if there is any disk activity.
> >>
> >> This would suboptimal solution. I have another idea - let's get back
> >> to the implementation of ledtrig-blk in genhd.c. We would be registeri=
ng
> >> one trigger on module initialization in a function with __init modifie=
r.
> >> Then we would need to add/remove triggers to the ledtrig-blk in
> >> register_blkdev()/unregister_blkdev(). And registered triggers would
> >> be listed in block_devs directory created by the trigger.
> >>
> >> You can compare how drivers/usb/core/ledtrig-usbport.c maintains
> >> similar directory of usb ports.
> >
> > It could be possible, but I have yet another idea.  What about introduc=
ing
> > /proc/led-triggers and /sys/class/leds/<led>/current-trigger?
> > The /sys/class/leds/<led>/trigger will be obsoleted by these two files.
> >
> > The /proc/led-triggers is read only and no PAGE_SIZE limitation by the
> > seq_file interface.  So we can list all triggers in this file.
> >
> > The /sys/class/leds/<led>/current-trigger is almost identical to
> > /sys/class/leds/<led>/trigger.  The only difference is that
> > 'current-trigger' only shows the current trigger name.
>
> There's not need to come up with yet another trigger interface.
> We just need to convert sysfs trigger attribute type to binary.

OK, I'll try it.
