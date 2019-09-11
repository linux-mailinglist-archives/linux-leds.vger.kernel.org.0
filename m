Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB480B02A0
	for <lists+linux-leds@lfdr.de>; Wed, 11 Sep 2019 19:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729130AbfIKR0C (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Sep 2019 13:26:02 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34019 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728897AbfIKR0B (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Sep 2019 13:26:01 -0400
Received: by mail-pg1-f196.google.com with SMTP id n9so11873170pgc.1;
        Wed, 11 Sep 2019 10:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dHzjWEjbmPZ/bJXnFMndg1gxGQSAtyDI2pcJRpM0tHQ=;
        b=eAZiwy348jYbQ9tlPkJ6aw2DPNxIoNTmOn3/zeTYf2Bfd7KM24MTgiMA1meaVNBEMR
         DbFpKTC2vaSHYL8T+Baf9pmU8A+aOQAD5Ni2VSPClPrhJUCsX8as6AQ/15NkRdN4BZuw
         62Hhn0jY7AL8i/nT8S6G6mrKEftbh/lJVURnLMTpwXfkacEnvws3b7Q0G6ovCrRvlf0d
         0z8hmePN55njAHE0LTQdofDEsaoAKCuCoP0YxEU12uRE++qnUydarz50FJ5fOiHA+pHP
         uLpuCAjOFxYiin8vi1aLHJ8F7tSQ6nxlQtAVgvL2/pKYj3zwhOF2yZaEQU5mUy5hKIbg
         Elsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dHzjWEjbmPZ/bJXnFMndg1gxGQSAtyDI2pcJRpM0tHQ=;
        b=GxnacMwAOxgZ3HOkaj2odWTJXpA2rauntl7MTcxJkYdZrZ5w1mCOonI8qoXOoT67N7
         Q3q7Xk4mZPvPrDPXhxYULBWH2d4m5xai/0uL39H9DRj6MZHaBlDUN+DWevBryC6KxvsT
         QuZIihX93r1eAI0eJYDzJx1a60eC4YXJjHy8s0Qt5WyEPoWkCOhyiyycmIdm1GYXc4Ig
         sDzQxkgtzpRTTDOCkJ/dI+r0Mi2eVLQETvmXTBblwCk2/1G+GQnUCb+gwJ69vxV1Lml3
         j7gY3lZJbPmGdqexmKSW64wySHdVmUfEGVsc76GUkmxEbwgLZHQRAh1lmncUZ5m/1eIq
         xohA==
X-Gm-Message-State: APjAAAWBMtLOr9xrkQu6WiMgVvbdPcLjlaXcet5N039UWVDUhQMCCeN3
        VzK0Vhvz/EXs2XcouYuh1UOiy5Ryyc9oSSBEwww=
X-Google-Smtp-Source: APXvYqzMRDssqpgsK8fSzya4V0/uXkWx/h2Ddhu3BRv6cUncAazQPvzvWNQgRlC9+H9UkzbUl2Qwc438VsPYjvzuMzY=
X-Received: by 2002:a17:90a:3546:: with SMTP id q64mr6696670pjb.13.1568222759459;
 Wed, 11 Sep 2019 10:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <1567946472-10075-1-git-send-email-akinobu.mita@gmail.com>
 <1567946472-10075-2-git-send-email-akinobu.mita@gmail.com>
 <20190908131034.GD9466@kroah.com> <CAC5umyhZ_-Gdh7+EzNoHPs2zki2-dK1xBv5xpE5zwZPt_jvNEA@mail.gmail.com>
 <20190911153602.GB13865@kroah.com>
In-Reply-To: <20190911153602.GB13865@kroah.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Thu, 12 Sep 2019 02:25:48 +0900
Message-ID: <CAC5umygQWrhN-=5g+87YeKYUzGGPGW01mtaVDJ3NERYbXBGKog@mail.gmail.com>
Subject: Re: [PATCH 1/5] leds: remove PAGE_SIZE limit of /sys/class/leds/<led>/trigger
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

2019=E5=B9=B49=E6=9C=8812=E6=97=A5(=E6=9C=A8) 0:36 Greg Kroah-Hartman <greg=
kh@linuxfoundation.org>:
>
> On Thu, Sep 12, 2019 at 12:25:28AM +0900, Akinobu Mita wrote:
> > 2019=E5=B9=B49=E6=9C=888=E6=97=A5(=E6=97=A5) 22:10 Greg Kroah-Hartman <=
gregkh@linuxfoundation.org>:
> > >
> > > On Sun, Sep 08, 2019 at 09:41:08PM +0900, Akinobu Mita wrote:
> > > > Reading /sys/class/leds/<led>/trigger returns all available LED tri=
ggers.
> > > > However, the size of this file is limited to PAGE_SIZE because of t=
he
> > > > limitation for sysfs attribute.
> > > >
> > > > Enabling LED CPU trigger on systems with thousands of CPUs easily h=
its
> > > > PAGE_SIZE limit, and makes it impossible to see all available LED t=
riggers
> > > > and which trigger is currently activated.
> > > >
> > > > This converts /sys/class/leds/<led>/trigger to bin attribute and re=
moves
> > > > the PAGE_SIZE limitation.
> > > >
> > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > > > Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > > > Cc: Pavel Machek <pavel@ucw.cz>
> > > > Cc: Dan Murphy <dmurphy@ti.com>
> > > > Acked-by: Pavel Machek <pavel@ucw.cz>
> > > > Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> > > > ---
> > > >  drivers/leds/led-class.c    |  8 ++--
> > > >  drivers/leds/led-triggers.c | 90 +++++++++++++++++++++++++++++++++=
+-----------
> > > >  drivers/leds/leds.h         |  6 +++
> > > >  include/linux/leds.h        |  5 ---
> > > >  4 files changed, 79 insertions(+), 30 deletions(-)
> > > >
> > > > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > > > index 4793e77..8b5a1d1 100644
> > > > --- a/drivers/leds/led-class.c
> > > > +++ b/drivers/leds/led-class.c
> > > > @@ -73,13 +73,13 @@ static ssize_t max_brightness_show(struct devic=
e *dev,
> > > >  static DEVICE_ATTR_RO(max_brightness);
> > > >
> > > >  #ifdef CONFIG_LEDS_TRIGGERS
> > > > -static DEVICE_ATTR(trigger, 0644, led_trigger_show, led_trigger_st=
ore);
> > > > -static struct attribute *led_trigger_attrs[] =3D {
> > > > -     &dev_attr_trigger.attr,
> > > > +static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write=
, 0);
> > >
> > > BIN_ATTR_RW()?
> >
> > We can use BIN_ATTR_RW() by renaming led_trigger_{read,write}() to
> > trigger_{read,write}().  But led_trigger_{read,write}() are not static
> > functions.  These are defined as export symbols for led-class module.
> >
> > So trigger_{read,write}() will be too generic symbol names, won't they?
>
> Yes they would, sorry I didn't notice that.
>
> Wait, why are those functions being exported?  Who is calling a sysfs
> function from a different code path than sysfs?

led-class.c :)

led_trigger_{read,write}() are defined in led-triggers.c which is built
into the kernel. led-class.c can be built as module.
