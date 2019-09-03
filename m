Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33832A6B31
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2019 16:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729539AbfICOWL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Sep 2019 10:22:11 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43369 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728576AbfICOWL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Sep 2019 10:22:11 -0400
Received: by mail-pf1-f196.google.com with SMTP id d15so1371820pfo.10;
        Tue, 03 Sep 2019 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WJT8mC+y7rk6LxADX+jcP4QHKshWYtsWFcHsDWvCv6o=;
        b=M+u/sdgRp7BmBOgRDTVflFNf8pslru3t4U8MOJsazOLz96FhHuJqREwKSNd2A4H3Qj
         LCQklPPReXTVNLVqiLtzRmHgIoNTZkK+7QCbdijkP+Kg7ecSw0ImPFwvrdM6HqIU/oPz
         CjrAyNl0Ouj9u4OrwnbW+qzp5NEtaMZgmRQ79YhiQQNIs3LGA3q0OOnDy6IXXPnBgmUu
         9iHG+seZireoepKI+rf5cvnLbnIef/2/MmsHK9sWKqWIWJBmxQOQ4+zj7Fds8vMFH0Vj
         gjYG4BEm3RTySymgotlC2z3Ch/Hh37lZeboHjijeS7rBbCEPybeoadbph9rPy2Zg3vws
         x7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WJT8mC+y7rk6LxADX+jcP4QHKshWYtsWFcHsDWvCv6o=;
        b=tNG5He9yKZ70o4MIVXgouAqCRWy1O09lgXloM393MgjS+7v+/jszrWsWBiBNM8T3/9
         r5INa29QsRpvtQwaRxHJMcyuZl+gdl0yX/qY/0mJxHfWCtxR2drWwKhpr/ORC2D6nQn+
         hV8d7dWlflEtmrbQ0HTgn3rEOb/CWGdZuDV0j/1eQGXOq1yKqVKwUEtoHmA87tYOPgFZ
         iwclX5jhea1/qkRCyJzjZAF3/++ZHLqy2FEdRG9ViN44Hmp6Pxy3c85RPGPlogo7ZkSx
         3X9udGdRQU3xgyiXsdOE1UlLmSe5lQRfOVno0d20loX4BbOY523JufNWGOiCOWj2O+lP
         ffzA==
X-Gm-Message-State: APjAAAVHmQl3QqRKoTXnWIJOdZq4ebOnEdabjhCvlbjIUw9iMM9gam7s
        9+tTDNKIpJ9tt40tOy2TW1TnOZMCcSGvTlDq/hU=
X-Google-Smtp-Source: APXvYqxuEwoU+wUljRNwFRrt6A6UXzHB5I57vI9aPFbbX5bo7O6q/UxKyoT4oApqBKsFT1w0vVKqknvyDeSu6QYclRc=
X-Received: by 2002:a63:505a:: with SMTP id q26mr29702007pgl.18.1567520530332;
 Tue, 03 Sep 2019 07:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <1567090164-6819-1-git-send-email-akinobu.mita@gmail.com>
 <6ebeedab-4a7f-14ea-d62e-9184e911047f@gmail.com> <20190902181207.GA18577@kroah.com>
 <1cd468a3-b6e5-a93b-739a-f30288318356@gmail.com> <20190902190843.GB25019@kroah.com>
 <CAC5umyjTJSMdKMtZbF8Uxky6nOrAHesTHmZRV5VA1uPwX2rtxA@mail.gmail.com> <20190903140719.GA9506@kroah.com>
In-Reply-To: <20190903140719.GA9506@kroah.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Tue, 3 Sep 2019 23:21:59 +0900
Message-ID: <CAC5umyhApkfo+-7+nPFn20MLpG7dxrSE1+1FPhZp+p=hCsopeg@mail.gmail.com>
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

2019=E5=B9=B49=E6=9C=883=E6=97=A5(=E7=81=AB) 23:07 Greg KH <gregkh@linuxfou=
ndation.org>:
>
> On Tue, Sep 03, 2019 at 10:55:40PM +0900, Akinobu Mita wrote:
> > 2019=E5=B9=B49=E6=9C=883=E6=97=A5(=E7=81=AB) 4:08 Greg KH <gregkh@linux=
foundation.org>:
> > >
> > > On Mon, Sep 02, 2019 at 08:47:02PM +0200, Jacek Anaszewski wrote:
> > > > On 9/2/19 8:12 PM, Greg KH wrote:
> > > > > On Sun, Sep 01, 2019 at 06:53:34PM +0200, Jacek Anaszewski wrote:
> > > > >> Hi Akinobu,
> > > > >>
> > > > >> Thank you for the patch.
> > > > >>
> > > > >> I have one nit below but in general it looks good to me.
> > > > >> I've tested it with 2000 mtd triggers (~14kB file size)
> > > > >> and it worked flawlessly.
> > > > >>
> > > > >> Still, I would like to have ack from Greg for it.
> > > > >>
> > > > >> Adding Greg on Cc.
> > > > >>
> > > > >> On 8/29/19 4:49 PM, Akinobu Mita wrote:
> > > > >>> Reading /sys/class/leds/<led>/trigger returns all available LED=
 triggers.
> > > > >>> However, the size of this file is limited to PAGE_SIZE because =
of the
> > > > >>> limitation for sysfs attribute.
> > > > >>>
> > > > >>> Enabling LED CPU trigger on systems with thousands of CPUs easi=
ly hits
> > > > >>> PAGE_SIZE limit, and makes it impossible to see all available L=
ED triggers
> > > > >>> and which trigger is currently activated.
> > > > >>>
> > > > >>> This converts /sys/class/leds/<led>/trigger to bin attribute an=
d removes
> > > > >>> the PAGE_SIZE limitation.
> > > > >
> > > > > But this is NOT a binary file.  A sysfs binary file is used for w=
hen the
> > > > > kernel passes data to or from hardware without any parsing of the=
 data
> > > > > by the kernel.
> > > > >
> > > > > You are not doing that here, you are abusing the "one value per f=
ile"
> > > > > rule of sysfs so much that you are forced to work around the limi=
tation
> > > > > it put in place on purpose to keep you from doing stuff like this=
.
> > > > >
> > > > > Please fix this "correctly" by creating a new api that works prop=
erly
> > > > > and just live with the fact that this file will never work correc=
tly and
> > > > > move everyone to use the new api instead.
> > > > >
> > > > > Don't keep on abusing the interface by workarounds like this, it =
is not
> > > > > ok.
> > > >
> > > > In the message [0] you pledged to give us exception for that, provi=
ded
> > > > it will be properly documented in the code. I suppose you now objec=
t
> > > > because the patch does not meet that condition.
> > >
> > > Well, I honestly don't remember writing that email, but it was 5 mont=
hs
> > > and many thousands of emails ago :)
> > >
> > > Also, you all didn't document the heck out of this.  So no, I really =
do
> > > not want to see this patch accepted as-is.
> > >
> > > > Provided that will be fixed, can we count on your ack for the
> > > > implementation of the solution you proposed? :-)
> > >
> > > Let's see the patch that actually implements what I suggested first :=
)
> >
> > I'd propose introducing a new procfs file (/proc/led-triggers) and new
> > /sys/class/leds/<led>/current-trigger api.
> >
> > Reading /proc/led-triggers file shows all available triggers.
> > This violates "one value per file", but it's a procfs file.
>
> No, procfs files are ONLY for process-related things.  Don't keep the
> insanity of this file format by just moving it out of sysfs and into
> procfs :)

I see.

How about creating one file or directory for each led-trigger in
/sys/kernel/led-triggers directory?

e.g.

$ ls /sys/kernel/led-triggers
audio-micmute                              ide-disk        phy0assoc
audio-mute                                 kbd-altgrlock   phy0radio
...
hidpp_battery_3-full                       panic
