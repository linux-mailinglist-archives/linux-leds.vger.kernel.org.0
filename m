Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04486AFFEC
	for <lists+linux-leds@lfdr.de>; Wed, 11 Sep 2019 17:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbfIKPZl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Sep 2019 11:25:41 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42082 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbfIKPZl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Sep 2019 11:25:41 -0400
Received: by mail-pf1-f196.google.com with SMTP id w22so13870097pfi.9;
        Wed, 11 Sep 2019 08:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tZpvg5cxS2JHNuCcfb8U6RrEOvGWDHm2trij5oevORs=;
        b=tSNca9TIi5ARLjisuukAuGJRj7fDSg15c4hp0ZTvffMzMVxMH9bz5PtryQDu75MT63
         xGEewIuKGsZyLLPozANSVTcH37S4bhohg7lyh0U8/7CX9JPFDbyCGa1e7YAg4e3fs5Hv
         bhSIC+y47dMj+WHqQ2fo+VWqjQnk45BYfGrkl+4MDhU4I6zWoDZ4cwtUTZl4a0nKBrpC
         IvU8za+osNwHVtmtJJRDGGelEv6s3TZjjw/SRjp5v23Ihsm1ycqFl0zPDu9l1x3gssaW
         QNpZYUcnnQgwVZLpQlsLZBzJ+qnMPQaR5MELMnBId4jl0Wfa96s/wYTO3waLdbrm4wH4
         Hddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tZpvg5cxS2JHNuCcfb8U6RrEOvGWDHm2trij5oevORs=;
        b=Ui+tDT1p4Iz/82g/2F1nQlkIxl4n2t3TdGzeOTH/cJDE0LT/ABJ4gXlm5BL9cjg/5z
         CferFJZrnJYEDLF2pS9/UUxWkYroOnZq7n5cjJVdR+BElty59ZUrFYYpZRJ22WtdzzBz
         pA4FTHN2lhpVqF4TahF1ppXT0ZxynZvpRZI7QJUSLMG8eybm6IT//Wh98G6aE0j7zHBR
         C9jtRvVBJqOjOJ47oAD4bRo8eIgioRKQ88gz3g8LeVUZ+467eVxat4EoWFP+Nx2AkPJw
         90vINd15MzraKEd/++gtKXH8528aWZH+el1W+dcUQSEhs0YocZa6XGw0dLRqNckQ+yfl
         ylRA==
X-Gm-Message-State: APjAAAWejAoQBqM4xUxBPORjA66AyjFl451yQ19dwlKLzs/75BPu1c3q
        n46mKFymGQ5XM8IeK5wcTEBXIbF0siVKiB7LXnE=
X-Google-Smtp-Source: APXvYqxb3fZu9dA/+SpsctPld2M4SO6RblnjK5MCs1xrjm21ps3uLR70SapOcrdZwEw8Y/HzMJ44ZQfjIIOMJHxOVpo=
X-Received: by 2002:a63:dd0c:: with SMTP id t12mr32085443pgg.82.1568215540133;
 Wed, 11 Sep 2019 08:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <1567946472-10075-1-git-send-email-akinobu.mita@gmail.com>
 <1567946472-10075-2-git-send-email-akinobu.mita@gmail.com> <20190908131034.GD9466@kroah.com>
In-Reply-To: <20190908131034.GD9466@kroah.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Thu, 12 Sep 2019 00:25:28 +0900
Message-ID: <CAC5umyhZ_-Gdh7+EzNoHPs2zki2-dK1xBv5xpE5zwZPt_jvNEA@mail.gmail.com>
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

2019=E5=B9=B49=E6=9C=888=E6=97=A5(=E6=97=A5) 22:10 Greg Kroah-Hartman <greg=
kh@linuxfoundation.org>:
>
> On Sun, Sep 08, 2019 at 09:41:08PM +0900, Akinobu Mita wrote:
> > Reading /sys/class/leds/<led>/trigger returns all available LED trigger=
s.
> > However, the size of this file is limited to PAGE_SIZE because of the
> > limitation for sysfs attribute.
> >
> > Enabling LED CPU trigger on systems with thousands of CPUs easily hits
> > PAGE_SIZE limit, and makes it impossible to see all available LED trigg=
ers
> > and which trigger is currently activated.
> >
> > This converts /sys/class/leds/<led>/trigger to bin attribute and remove=
s
> > the PAGE_SIZE limitation.
> >
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Dan Murphy <dmurphy@ti.com>
> > Acked-by: Pavel Machek <pavel@ucw.cz>
> > Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> > ---
> >  drivers/leds/led-class.c    |  8 ++--
> >  drivers/leds/led-triggers.c | 90 ++++++++++++++++++++++++++++++++++---=
--------
> >  drivers/leds/leds.h         |  6 +++
> >  include/linux/leds.h        |  5 ---
> >  4 files changed, 79 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index 4793e77..8b5a1d1 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -73,13 +73,13 @@ static ssize_t max_brightness_show(struct device *d=
ev,
> >  static DEVICE_ATTR_RO(max_brightness);
> >
> >  #ifdef CONFIG_LEDS_TRIGGERS
> > -static DEVICE_ATTR(trigger, 0644, led_trigger_show, led_trigger_store)=
;
> > -static struct attribute *led_trigger_attrs[] =3D {
> > -     &dev_attr_trigger.attr,
> > +static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0)=
;
>
> BIN_ATTR_RW()?

We can use BIN_ATTR_RW() by renaming led_trigger_{read,write}() to
trigger_{read,write}().  But led_trigger_{read,write}() are not static
functions.  These are defined as export symbols for led-class module.

So trigger_{read,write}() will be too generic symbol names, won't they?
