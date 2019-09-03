Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81D6CA6A87
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2019 15:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729183AbfICNzx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Sep 2019 09:55:53 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44422 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728576AbfICNzx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Sep 2019 09:55:53 -0400
Received: by mail-pf1-f194.google.com with SMTP id q21so5791849pfn.11;
        Tue, 03 Sep 2019 06:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NLKvK3f8SdEghfwOcKdCBnv2yALB4FJT+JO4qAGu9vY=;
        b=CqCwVzfPIEt7EUoqsb3vuZ2oJNfv7mm6Y+sSBaVje4EVbtB3+AI0GcahDat2aI+piH
         CbFjdAVGYRtzMmaCp48+5iynm8I348kzdUa8085v1POys7GdGGZeEf8qLpeIZqOrN9nS
         onAbZtBSUzeDBnLKZ8l1FSVJwds6K2WkWFQ2CxaqgD3jiseP9QkkwA7PngptgHsulqTT
         vnqgED8EWsmVaJQrrBD7WQbenCs0/Bh1vH6gDCqnrxdVEcOgLxUCYBJ+6D1XbESoAF8X
         maN+uHlxUnvxjm/dCYs2cY7ZhNa1UZmXg+0xyFKrRw157K78Rt56Azf5UBtYviiWfis4
         QunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NLKvK3f8SdEghfwOcKdCBnv2yALB4FJT+JO4qAGu9vY=;
        b=kUAZoCsFT92xn1/kpUgGReggTzrcEi/Vj6zjTpZ3C/SXt1jnnSK8pXyjmpA4osHYCT
         PUUBtEg6YSuh9zE/CC9/GRJj+GsnUYmkKDqIejvw61vPNb/PKxYftz6CvYvHx2xFn89c
         Iqy/WkGF1rxE6ZAQ7U6P1xfpoyvDSJJI8cGFSVfyiBg6Pg1YgyrBQkn3T4gMKOUti69A
         qHX2cELQqnzkbJDpJcWajxK62EKyzbZhHlZojHaniNEG1GlvFH3oyp1Ab6XixVMp5kSR
         WCkcaRzzwg0VK8uESJ4N9m41Zr+jivwnXF6vvl2eF2E3QwgkfjCWdG4R4vwqBsqHdbwx
         /tbA==
X-Gm-Message-State: APjAAAXlIxXcR10EKntwVUVAx3mL2qLMR1d5DUVzjDnipLgSCvM/eOok
        XlSbyNPzokJIteo0uHBio6ChMQNxHGEY7ffKNEQ=
X-Google-Smtp-Source: APXvYqwQU7sOMX0lTDfc+K5B77SeOLOlV8KLToWsFoAvVJjozpSZ+S5zDG/63oo+9Omo1hxtsVQ5VtOzBwW4cxUdgRc=
X-Received: by 2002:a17:90a:6504:: with SMTP id i4mr128907pjj.13.1567518952222;
 Tue, 03 Sep 2019 06:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <1567090164-6819-1-git-send-email-akinobu.mita@gmail.com>
 <6ebeedab-4a7f-14ea-d62e-9184e911047f@gmail.com> <20190902181207.GA18577@kroah.com>
 <1cd468a3-b6e5-a93b-739a-f30288318356@gmail.com> <20190902190843.GB25019@kroah.com>
In-Reply-To: <20190902190843.GB25019@kroah.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Tue, 3 Sep 2019 22:55:40 +0900
Message-ID: <CAC5umyjTJSMdKMtZbF8Uxky6nOrAHesTHmZRV5VA1uPwX2rtxA@mail.gmail.com>
Subject: Re: [PATCH] leds: remove PAGE_SIZE limit of /sys/class/leds/<led>/trigger
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

2019=E5=B9=B49=E6=9C=883=E6=97=A5(=E7=81=AB) 4:08 Greg KH <gregkh@linuxfoun=
dation.org>:
>
> On Mon, Sep 02, 2019 at 08:47:02PM +0200, Jacek Anaszewski wrote:
> > On 9/2/19 8:12 PM, Greg KH wrote:
> > > On Sun, Sep 01, 2019 at 06:53:34PM +0200, Jacek Anaszewski wrote:
> > >> Hi Akinobu,
> > >>
> > >> Thank you for the patch.
> > >>
> > >> I have one nit below but in general it looks good to me.
> > >> I've tested it with 2000 mtd triggers (~14kB file size)
> > >> and it worked flawlessly.
> > >>
> > >> Still, I would like to have ack from Greg for it.
> > >>
> > >> Adding Greg on Cc.
> > >>
> > >> On 8/29/19 4:49 PM, Akinobu Mita wrote:
> > >>> Reading /sys/class/leds/<led>/trigger returns all available LED tri=
ggers.
> > >>> However, the size of this file is limited to PAGE_SIZE because of t=
he
> > >>> limitation for sysfs attribute.
> > >>>
> > >>> Enabling LED CPU trigger on systems with thousands of CPUs easily h=
its
> > >>> PAGE_SIZE limit, and makes it impossible to see all available LED t=
riggers
> > >>> and which trigger is currently activated.
> > >>>
> > >>> This converts /sys/class/leds/<led>/trigger to bin attribute and re=
moves
> > >>> the PAGE_SIZE limitation.
> > >
> > > But this is NOT a binary file.  A sysfs binary file is used for when =
the
> > > kernel passes data to or from hardware without any parsing of the dat=
a
> > > by the kernel.
> > >
> > > You are not doing that here, you are abusing the "one value per file"
> > > rule of sysfs so much that you are forced to work around the limitati=
on
> > > it put in place on purpose to keep you from doing stuff like this.
> > >
> > > Please fix this "correctly" by creating a new api that works properly
> > > and just live with the fact that this file will never work correctly =
and
> > > move everyone to use the new api instead.
> > >
> > > Don't keep on abusing the interface by workarounds like this, it is n=
ot
> > > ok.
> >
> > In the message [0] you pledged to give us exception for that, provided
> > it will be properly documented in the code. I suppose you now object
> > because the patch does not meet that condition.
>
> Well, I honestly don't remember writing that email, but it was 5 months
> and many thousands of emails ago :)
>
> Also, you all didn't document the heck out of this.  So no, I really do
> not want to see this patch accepted as-is.
>
> > Provided that will be fixed, can we count on your ack for the
> > implementation of the solution you proposed? :-)
>
> Let's see the patch that actually implements what I suggested first :)

I'd propose introducing a new procfs file (/proc/led-triggers) and new
/sys/class/leds/<led>/current-trigger api.

Reading /proc/led-triggers file shows all available triggers.
This violates "one value per file", but it's a procfs file.

The /sys/class/leds/<led>/current-trigger is almost identical to
/sys/class/leds/<led>/trigger.  The only difference is that
'current-trigger' only shows the current trigger name.
This file follows the "one value per file" rule of sysfs.
