Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE4B5C0F8C
	for <lists+linux-leds@lfdr.de>; Sat, 28 Sep 2019 06:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725290AbfI1EIY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 28 Sep 2019 00:08:24 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39106 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725263AbfI1EIX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 28 Sep 2019 00:08:23 -0400
Received: by mail-pl1-f195.google.com with SMTP id s17so1802892plp.6;
        Fri, 27 Sep 2019 21:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zd5LuW2dmAnavUG5b7g07Kd/6YYjFkpDKAGxGB0aM5w=;
        b=md3JJhFfv/J3eueqTUw383MidijG/p5odcRw5Ls8wFMVLF+7GZkvbktSneeMmR555K
         3EVMtqbrCCWE8ZFS0i8eJhWgnK4bWFwufthQ5kWlY9P2HQsFrngkNce4BmVnWV2NZYH+
         DF8hYZz4IzYp10AHBj50lyOpK5Z+hxMWgwwWjtM4bMS+Hqx+llA6WyW2wsIhJo+QMrIq
         Hpy6Fc3IecRjy0Yg7ARtuJfG5nGxi2v76khB5rBwBUpzNL0qAHnIPis9CKFWyLfz1puM
         HVjxHxyLbm3eLDGu7SCfT1arqcda0WQURy7DCFjHUjKAsYguN4TLzuPrnUBzW9JI1SAn
         yZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zd5LuW2dmAnavUG5b7g07Kd/6YYjFkpDKAGxGB0aM5w=;
        b=HHlIHba1iVSe1yjzw8R9fa8MFbMYKKB43AnasGYZ9Rk/aw98iXtNp9K7mswDQSWWkF
         mQKrfO5SQCydh0vKvDO7TdCkUiIozmaSCZTz5huM6sHeeh249+aEbNOmNfLtkYRj8Uqb
         wlX4qv00ABNH4p3lvcLNL1AJLQSGVlgh8ZeEhSFcpT0MDH5w26vHDGZX5Y2HriPuHb9Y
         NjaUZAJFjKmIwt9bVQ15UlvtHTOdOSrxz16HiZu7bwAFHgS0kwHkSviLmZoUoEPDCmP7
         oyifgpzAke2AuN4Vu9nMt6zNb5gvUXM5AjRLcyBBiRUdXjYDoj8I9TMHIXVGvpkmc1HD
         XE/A==
X-Gm-Message-State: APjAAAXJP2KnjqNVE9qAxEp2uttmQHg0Lw0b8wuMjNorgrxvjYS2k8nE
        NqehSJ4U5JbbCQFRIwGTbtOgIPfVnRViX7V7FGI=
X-Google-Smtp-Source: APXvYqwutDw2+zcRK1Wjw/PhrwnwtMZCxwTBQPNxExgBpn45KzbiLrL1szG2CTVXFXjcQvs4+4cDPAymMdBe0V0hsxE=
X-Received: by 2002:a17:902:8690:: with SMTP id g16mr1820621plo.274.1569643702744;
 Fri, 27 Sep 2019 21:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <1568387004-3802-1-git-send-email-akinobu.mita@gmail.com>
 <1568387004-3802-2-git-send-email-akinobu.mita@gmail.com> <20190927063547.GA1786569@kroah.com>
 <CAC5umyjdM1+4nPg_6UaCjcpikESamdA_ZpmP4Xfjx7_-1f=+0A@mail.gmail.com> <20190927174633.GB1802011@kroah.com>
In-Reply-To: <20190927174633.GB1802011@kroah.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Sat, 28 Sep 2019 13:08:11 +0900
Message-ID: <CAC5umyjZHtFnqrBujCEnBqAfYfsGHth6OnESyDFFdvtgEpZaDQ@mail.gmail.com>
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

2019=E5=B9=B49=E6=9C=8828=E6=97=A5(=E5=9C=9F) 2:46 Greg Kroah-Hartman <greg=
kh@linuxfoundation.org>:
>
> On Sat, Sep 28, 2019 at 01:47:21AM +0900, Akinobu Mita wrote:
> > 2019=E5=B9=B49=E6=9C=8827=E6=97=A5(=E9=87=91) 15:39 Greg Kroah-Hartman =
<gregkh@linuxfoundation.org>:
> > >
> > > On Sat, Sep 14, 2019 at 12:03:24AM +0900, Akinobu Mita wrote:
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
> > > > We work around it here by converting /sys/class/leds/<led>/trigger =
to
> > > > binary attribute, which is not limited by length. This is _not_ goo=
d
> > > > design, do not copy it.
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
> > > > +static struct bin_attribute *led_trigger_bin_attrs[] =3D {
> > > > +     &bin_attr_trigger,
> > > >       NULL,
> > > >  };
> > > >  static const struct attribute_group led_trigger_group =3D {
> > > > -     .attrs =3D led_trigger_attrs,
> > > > +     .bin_attrs =3D led_trigger_bin_attrs,
> > > >  };
> > > >  #endif
> > > >
> > > > diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-trigger=
s.c
> > > > index 8d11a5e..ed5a311 100644
> > > > --- a/drivers/leds/led-triggers.c
> > > > +++ b/drivers/leds/led-triggers.c
> > > > @@ -16,6 +16,7 @@
> > > >  #include <linux/rwsem.h>
> > > >  #include <linux/leds.h>
> > > >  #include <linux/slab.h>
> > > > +#include <linux/mm.h>
> > > >  #include "leds.h"
> > > >
> > > >  /*
> > > > @@ -26,9 +27,11 @@ LIST_HEAD(trigger_list);
> > > >
> > > >   /* Used by LED Class */
> > > >
> > > > -ssize_t led_trigger_store(struct device *dev, struct device_attrib=
ute *attr,
> > > > -             const char *buf, size_t count)
> > > > +ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
> > > > +                       struct bin_attribute *bin_attr, char *buf,
> > > > +                       loff_t pos, size_t count)
> > > >  {
> > > > +     struct device *dev =3D kobj_to_dev(kobj);
> > > >       struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> > > >       struct led_trigger *trig;
> > > >       int ret =3D count;
> > > > @@ -64,39 +67,84 @@ ssize_t led_trigger_store(struct device *dev, s=
truct device_attribute *attr,
> > > >       mutex_unlock(&led_cdev->led_access);
> > > >       return ret;
> > > >  }
> > > > -EXPORT_SYMBOL_GPL(led_trigger_store);
> > > > +EXPORT_SYMBOL_GPL(led_trigger_write);
> > > >
> > > > -ssize_t led_trigger_show(struct device *dev, struct device_attribu=
te *attr,
> > > > -             char *buf)
> > > > +__printf(4, 5)
> > > > +static int led_trigger_snprintf(char *buf, size_t size, bool query=
,
> > > > +                             const char *fmt, ...)
> > > > +{
> > > > +     va_list args;
> > > > +     int i;
> > > > +
> > > > +     va_start(args, fmt);
> > > > +     if (query)
> > > > +             i =3D vsnprintf(NULL, 0, fmt, args);
> > > > +     else
> > > > +             i =3D vscnprintf(buf, size, fmt, args);
> > > > +     va_end(args);
> > > > +
> > > > +     return i;
> > > > +}
> > >
> > > You only call this in one place, why is it needed like this?  The "ol=
d"
> > > code open-coded this, what is this helping with here?
> > >
> > > And what does "query" mean here?  I have no idea how that variable
> > > matters, or what it does.  Why not just test if buf is NULL or not if
> > > you don't want to use it?
> > >
> > > Ah, you are trying to see how "long" the buffer is going to be.  That
> > > makes more sense, but just trigger off of the NULL buffer or not, mak=
ing
> > > this a bit more "obvious" what you are doing and not tieing two
> > > parameters to each other (meaning one always reflects the other one).
> >
> > We cannot simply replace the "query" by checking the buffer is NULL or =
not.
> > Because led_trigger_snprintf() is repeatedly called by led_trigger_form=
at()
> > while increasing 'buf' and decreasing 'size' by the return value of
> > led_trigger_snprintf() every time.
>
> Odd, but ok, I'll trust you, this looks like very odd code :(

We can remove the "query" by checking if "size" is less than or equal to
zero in led_trigger_snprintf(), instead of checking "buf".

Because the "size" keeps decreasing every time led_trigger_snprintf() is
called by led_trigger_format().
