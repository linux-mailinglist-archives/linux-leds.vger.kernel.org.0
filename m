Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8CB9B41E
	for <lists+linux-leds@lfdr.de>; Fri, 23 Aug 2019 18:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387434AbfHWQA6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 23 Aug 2019 12:00:58 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37720 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbfHWQA5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 23 Aug 2019 12:00:57 -0400
Received: by mail-pl1-f195.google.com with SMTP id bj8so5811258plb.4;
        Fri, 23 Aug 2019 09:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=07Egtsx8BTLakWMyam+EKjHQWLxH1naEmDIZmgusaPw=;
        b=kGVFTI4bDL3B5jc2VlVW5iNmXRnUns2ue0ZpTj/fDStyBw8Q9ba/aDJhVLlhhdjQ1j
         ogGV58sT2dQmXFH+ghLlgsrPhOGFZmx0WW6SiMtPKUin6e8nSlYRMn+AYzE9fzIK6wor
         0pqaY5SeWurvg9cHY1LON3iXEhKyCq8YJJ/HmRTRXn2m4qthUFlq0FoItb2VpMQzvjpL
         ZF56Ogp+uaJxM/+62vHmbmSphGhTT0dvJJVSf9FciAyb1QaRotXxvCMY86+MfEttowlS
         bJZCN82/usH7zyQ3DUI4O4NqGizfKpQvdN0qp5jWlp85bmS+20xviHSD63RHYaEG8N6w
         sf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=07Egtsx8BTLakWMyam+EKjHQWLxH1naEmDIZmgusaPw=;
        b=CVF3AoJZ1WVsTf0+DVnXXiI2MzvO7UlYLWtvgaMQRBJJsiQiDPkwnqlZcqY55hUjjR
         ZfqpSaAKDLDuAiCyb/SMGbBEXfadeyEfNkKAowVDs/GxmOvoX6aog92u9jBMQP+gBWSQ
         X3ic4apyBpAvQ+DpXlBMa3z92MffUYuJVCtI7eJVK55teKw51cVN6w0wXac1Rcx2Y8uj
         oQHBHax827hGQEI3o6W59n5m7sAAeYj8B2ouhnjdw60Z6bSPxh4ppJDW3gEzyMnQFk6r
         7PFnw5LaEGOa9uSpkxhmYpRA9OVxGrQhoCW/tABILQ9VRms9hHzV7TMta14/CiDGvmCp
         +2NA==
X-Gm-Message-State: APjAAAViUHC8fh5JrjEWVYYdSEkDkL3y/ImXueHGmID+W0f5e/qotXC/
        Df0oKYXkpUKuVBE6ve5ySjhCMHW7AYUxPNdIr1g=
X-Google-Smtp-Source: APXvYqwxreGNcoRuFbMgXFknH7qbT7cPrnLAnQlAAkT7aQK81Y52MAYNqO9wNzUbU3CbY9CwNUKZ4CQXxpNGir8SmPw=
X-Received: by 2002:a17:902:a715:: with SMTP id w21mr5383370plq.274.1566576056998;
 Fri, 23 Aug 2019 09:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <1565888399-21550-1-git-send-email-akinobu.mita@gmail.com>
 <1565888399-21550-5-git-send-email-akinobu.mita@gmail.com>
 <20190817145509.GA18381@amd> <925633c4-a459-5e84-9c9a-502a504fdc82@gmail.com>
 <20190819143842.GA25401@amd> <7c4c4853-7e3a-0618-92a0-337e248e2b4c@gmail.com> <c937b7e0-02c6-ae9a-aaf7-16a2ef29886d@gmail.com>
In-Reply-To: <c937b7e0-02c6-ae9a-aaf7-16a2ef29886d@gmail.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Sat, 24 Aug 2019 01:00:45 +0900
Message-ID: <CAC5umyjxkeR3rhf3XZvwkxLvc-0ENEkQfOLnk8A12Qazr9Et8w@mail.gmail.com>
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

2019=E5=B9=B48=E6=9C=8820=E6=97=A5(=E7=81=AB) 3:38 Jacek Anaszewski <jacek.=
anaszewski@gmail.com>:
>
> On 8/19/19 8:22 PM, Jacek Anaszewski wrote:
> > On 8/19/19 4:38 PM, Pavel Machek wrote:
> >> On Sat 2019-08-17 22:07:43, Jacek Anaszewski wrote:
> >>> On 8/17/19 4:55 PM, Pavel Machek wrote:
> >>>> On Fri 2019-08-16 01:59:58, Akinobu Mita wrote:
> >>>>> This allows LEDs to be controlled by block device activity.
> >>>>>
> >>>>> We already have ledtrig-disk (LED disk activity trigger), but the l=
ower
> >>>>> level disk drivers need to utilize ledtrig_disk_activity() to make =
the
> >>>>> LED blink.
> >>>>>
> >>>>> The LED block device trigger doesn't require the lower level driver=
s to
> >>>>> have any instrumentation. The activity is collected by polling the =
disk
> >>>>> stats.
> >>>>>
> >>>>> Example:
> >>>>>
> >>>>> echo block-nvme0n1 > /sys/class/leds/diy/trigger
> >>>>
> >>>> Lets use one trigger "block" and have the device as a parameter,
> >>>> please.
> >>>>
> >>>> We already have 1000 cpu triggers on 1000 cpu machines, and yes, its=
 a
> >>>> disaster we'll need to fix. Lets not repeat the same mistake here.
> >>>>
> >>>> I guess it may be slightly more work. Sorry about that.
> >>>
> >>> We should be able to list available block devices to set,
> >>> so the problem would be not avoided anyway.
> >>
> >> Should we? We need to list triggers, but we may not list all the devic=
es...
> >
> > This is similar to usbport trigger that lists available
> > ports as files in a sub-directory. We might eventually go
> > in this direction.
>
> I must withdraw this statement. This is not similar to usbport
> trigger. The difference is that with ledtrig-block we have separate
> triggers per each device and I am not aware if there is some centralized
> mechanism similar to blocking_notifier_chain (usb_notifier_list
> in drivers/usb/core/notify.c) available for block devices, that
> would allow to gather all available block devs under common trigger.
>
> Moreover I remember Greg once discouraged using notifier chains
> as they are unsafe, so we would need some other solution anyway.

I start thinking that we should implement the LED block device activity
trigger in userspace.  The userspace application firstly activates
one-shot LED trigger and periodically reads /sys/block/<disk>/stat and
writes /sys/class/leds/<led>/shot if there is any disk activity.
