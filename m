Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3E0C09CE
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2019 18:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbfI0Qre (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 27 Sep 2019 12:47:34 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42972 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbfI0Qrd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 27 Sep 2019 12:47:33 -0400
Received: by mail-pl1-f195.google.com with SMTP id e5so1313648pls.9;
        Fri, 27 Sep 2019 09:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m2PSZi6t1pyeNx43M6S8PiquKqWtbwZDxuyuxsptEfE=;
        b=PcjGBoFZnbMupCRTceJfoECMdge7ICprprk73l6pR5gu2vaHYoRyg5jU77IAZGbT77
         soVVqLLOXKaK4OPDwj1USXK7phjZ40JsTgkiGGNekBwu/aYEGZ80DM6cPr6Eh4CaZCZT
         qu258tzkoERv7X8B/BJ7Fv9LEF0cLuYuKOGDniLip/qR4z3Bst3pra44A8GYV+gZSc4g
         ftV9oHvKnUJKPzV9VHiPbyy/K65w4hbv9ja1vsy4qhwUEYvQAeS4iL2gr/JyVWRriad4
         c5ggoqKdhuywjLAAiH8Lt+taZ0/13Yntc3Ohpqu+IDIIWU8ihtynA8Cc5ptumI+EmMo/
         paSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m2PSZi6t1pyeNx43M6S8PiquKqWtbwZDxuyuxsptEfE=;
        b=GgH4vv9WNTrwkDUYLxxxuiWBBB9ukK26KOxg5/cNLdenuaMOxV7NjGVohth1dMypKo
         DLxDg1/99xUHWuD9LSJiG3NN4zxCyLby4IXAWlobX8R42Q0/Z5V74Ezvr+f4RrcUfDJG
         B/CoDV2Al+xBBRW8ZzGBXWUs7simuk0LiMmWKNZpmoI+GiEYyVt4xyuTS3kzZELlpoRP
         qSDtpUC1l+fEyz/zu5YWl+v7esABV4VtfQtKbFxw0zS6HI2TuW7xmJLaZuvtlX9jwrgW
         NuQdu7QRQIpW9F1oNLOHFyEOAieH/8Ie7Nd71by+MUoaO8Qd6gw92Q/itkPzPjw8ix5V
         25bw==
X-Gm-Message-State: APjAAAU1r3Y91ufN5c6KdMP9XPsFs+MxGyPR1i5KBV7vCF8bRu7dmeJY
        h/hbIr3z1tvcKxT1E5mGbb9gJ3chRHShVTdj0VM=
X-Google-Smtp-Source: APXvYqx5EFWMtbjcSRnztuZUm+T+I6ANhp654xUDZCDym/TLPngzA6O39HqJP/NMXLkzWVZDz2g44R2EoG4uZKwxjZk=
X-Received: by 2002:a17:902:a715:: with SMTP id w21mr5487370plq.274.1569602852491;
 Fri, 27 Sep 2019 09:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <1568387004-3802-1-git-send-email-akinobu.mita@gmail.com>
 <1568387004-3802-2-git-send-email-akinobu.mita@gmail.com> <20190927063547.GA1786569@kroah.com>
In-Reply-To: <20190927063547.GA1786569@kroah.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Sat, 28 Sep 2019 01:47:21 +0900
Message-ID: <CAC5umyjdM1+4nPg_6UaCjcpikESamdA_ZpmP4Xfjx7_-1f=+0A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] leds: remove PAGE_SIZE limit of /sys/class/leds/<led>/trigger
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

2019=E5=B9=B49=E6=9C=8827=E6=97=A5(=E9=87=91) 15:39 Greg Kroah-Hartman <gre=
gkh@linuxfoundation.org>:
>
> On Sat, Sep 14, 2019 at 12:03:24AM +0900, Akinobu Mita wrote:
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
> > We work around it here by converting /sys/class/leds/<led>/trigger to
> > binary attribute, which is not limited by length. This is _not_ good
> > design, do not copy it.
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
> > +static struct bin_attribute *led_trigger_bin_attrs[] =3D {
> > +     &bin_attr_trigger,
> >       NULL,
> >  };
> >  static const struct attribute_group led_trigger_group =3D {
> > -     .attrs =3D led_trigger_attrs,
> > +     .bin_attrs =3D led_trigger_bin_attrs,
> >  };
> >  #endif
> >
> > diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> > index 8d11a5e..ed5a311 100644
> > --- a/drivers/leds/led-triggers.c
> > +++ b/drivers/leds/led-triggers.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/rwsem.h>
> >  #include <linux/leds.h>
> >  #include <linux/slab.h>
> > +#include <linux/mm.h>
> >  #include "leds.h"
> >
> >  /*
> > @@ -26,9 +27,11 @@ LIST_HEAD(trigger_list);
> >
> >   /* Used by LED Class */
> >
> > -ssize_t led_trigger_store(struct device *dev, struct device_attribute =
*attr,
> > -             const char *buf, size_t count)
> > +ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
> > +                       struct bin_attribute *bin_attr, char *buf,
> > +                       loff_t pos, size_t count)
> >  {
> > +     struct device *dev =3D kobj_to_dev(kobj);
> >       struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> >       struct led_trigger *trig;
> >       int ret =3D count;
> > @@ -64,39 +67,84 @@ ssize_t led_trigger_store(struct device *dev, struc=
t device_attribute *attr,
> >       mutex_unlock(&led_cdev->led_access);
> >       return ret;
> >  }
> > -EXPORT_SYMBOL_GPL(led_trigger_store);
> > +EXPORT_SYMBOL_GPL(led_trigger_write);
> >
> > -ssize_t led_trigger_show(struct device *dev, struct device_attribute *=
attr,
> > -             char *buf)
> > +__printf(4, 5)
> > +static int led_trigger_snprintf(char *buf, size_t size, bool query,
> > +                             const char *fmt, ...)
> > +{
> > +     va_list args;
> > +     int i;
> > +
> > +     va_start(args, fmt);
> > +     if (query)
> > +             i =3D vsnprintf(NULL, 0, fmt, args);
> > +     else
> > +             i =3D vscnprintf(buf, size, fmt, args);
> > +     va_end(args);
> > +
> > +     return i;
> > +}
>
> You only call this in one place, why is it needed like this?  The "old"
> code open-coded this, what is this helping with here?
>
> And what does "query" mean here?  I have no idea how that variable
> matters, or what it does.  Why not just test if buf is NULL or not if
> you don't want to use it?
>
> Ah, you are trying to see how "long" the buffer is going to be.  That
> makes more sense, but just trigger off of the NULL buffer or not, making
> this a bit more "obvious" what you are doing and not tieing two
> parameters to each other (meaning one always reflects the other one).

We cannot simply replace the "query" by checking the buffer is NULL or not.
Because led_trigger_snprintf() is repeatedly called by led_trigger_format()
while increasing 'buf' and decreasing 'size' by the return value of
led_trigger_snprintf() every time.

> > +static int led_trigger_format(char *buf, size_t size, bool query,
> > +                           struct led_classdev *led_cdev)
> >  {
> > -     struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> >       struct led_trigger *trig;
> > -     int len =3D 0;
> > +     int len =3D led_trigger_snprintf(buf, size, query, "%s",
> > +                                    led_cdev->trigger ? "none" : "[non=
e]");
> > +
> > +     list_for_each_entry(trig, &trigger_list, next_trig) {
> > +             bool hit =3D led_cdev->trigger &&
> > +                     !strcmp(led_cdev->trigger->name, trig->name);
> > +
> > +             len +=3D led_trigger_snprintf(buf + len, size - len, quer=
y,
> > +                                         " %s%s%s", hit ? "[" : "",
> > +                                         trig->name, hit ? "]" : "");
> > +     }
> > +
> > +     len +=3D led_trigger_snprintf(buf + len, size - len, query, "\n")=
;
> > +
> > +     return len;
> > +}
> > +
> > +/*
> > + * It was stupid to create 10000 cpu triggers, but we are stuck with i=
t now.
> > + * Don't make that mistake again. We work around it here by creating b=
inary
> > + * attribute, which is not limited by length. This is _not_ good desig=
n, do not
> > + * copy it.
> > + */
> > +ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
> > +                     struct bin_attribute *attr, char *buf,
> > +                     loff_t pos, size_t count)
> > +{
> > +     struct device *dev =3D kobj_to_dev(kobj);
> > +     struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> > +     void *data;
> > +     int len;
> >
> >       down_read(&triggers_list_lock);
> >       down_read(&led_cdev->trigger_lock);
> >
> > -     if (!led_cdev->trigger)
> > -             len +=3D scnprintf(buf+len, PAGE_SIZE - len, "[none] ");
> > +     len =3D led_trigger_format(NULL, 0, true, led_cdev);
> > +     data =3D kvmalloc(len + 1, GFP_KERNEL);
>
> Why kvmalloc() and not just kmalloc()?  How big is this buffer you are
> expecting to have here?

The ledtrig-cpu supports upto 9999 cpus.  If all these cpus were available,
the buffer size would be 78,890 bytes.
(for i in `seq 0 9999`;do echo -n " cpu$i"; done | wc -c)

The intention of this kvmalloc() allocation is to avoid costly allocation
if possible.

> > +     if (data)
> > +             len =3D led_trigger_format(data, len + 1, false, led_cdev=
);
> >       else
> > -             len +=3D scnprintf(buf+len, PAGE_SIZE - len, "none ");
> > +             len =3D -ENOMEM;
> >
> > -     list_for_each_entry(trig, &trigger_list, next_trig) {
> > -             if (led_cdev->trigger && !strcmp(led_cdev->trigger->name,
> > -                                                     trig->name))
> > -                     len +=3D scnprintf(buf+len, PAGE_SIZE - len, "[%s=
] ",
> > -                                      trig->name);
> > -             else
> > -                     len +=3D scnprintf(buf+len, PAGE_SIZE - len, "%s =
",
> > -                                      trig->name);
> > -     }
> >       up_read(&led_cdev->trigger_lock);
> >       up_read(&triggers_list_lock);
>
> Two locks?  Why not 3?  5?  How about just 1?  :)

I don't touch these locks in this patch :)

Locking both locks seems to be necessary to prevent someone from changing
trigger_list or led_cdev->trigger.

> >
> > -     len +=3D scnprintf(len+buf, PAGE_SIZE - len, "\n");
> > +     if (len < 0)
> > +             return len;
>
> You just leaked data if led_trigger_format() returned an error :(
>
> Just return -ENOMEM above if !data, which makes this much simpler.

We are holding the two locks, so we need to release them before return.
Which one do you prefer?

        ...
        data =3D kvmalloc(len + 1, GFP_KERNEL);
        if (data)
                len =3D led_trigger_format(data, len + 1, false, led_cdev);
        else
                len =3D -ENOMEM;

        up_read(&led_cdev->trigger_lock);
        up_read(&triggers_list_lock);

        if (len < 0)
                return len;

vs.

        ...
        data =3D kvmalloc(len + 1, GFP_KERNEL);
        if (!data) {
                up_read(&led_cdev->trigger_lock);
                up_read(&triggers_list_lock);
                return -ENOMEM;
        }
        len =3D led_trigger_format(data, len + 1, false, led_cdev);

        up_read(&led_cdev->trigger_lock);
        up_read(&triggers_list_lock);
