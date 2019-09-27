Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02EDAC0A90
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2019 19:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbfI0Rqp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 27 Sep 2019 13:46:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:43382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726321AbfI0Rqp (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 27 Sep 2019 13:46:45 -0400
Received: from localhost (unknown [62.119.166.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F7E721655;
        Fri, 27 Sep 2019 17:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569606404;
        bh=WcEO23YAVLrDPnehWuLKxDFeVrU4c5TYJVFCM1t8jQ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kRx8jVYqdIa1zqHhO+pROkGgDo7HpdPlsIiMSdj7/XnPznJuRtxt/SzkBH9j1HjZH
         dJXKuvEiUuX1xK7OPHHvCWCfNuyI5nDPAvp7PPSGHUQMyKbkwegCs5HeAXbfNWa1TL
         dQ0cLDy9TPsFtbFLkLH8PHT0+bwuUDw4oKKn498U=
Date:   Fri, 27 Sep 2019 19:46:33 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 1/1] leds: remove PAGE_SIZE limit of
 /sys/class/leds/<led>/trigger
Message-ID: <20190927174633.GB1802011@kroah.com>
References: <1568387004-3802-1-git-send-email-akinobu.mita@gmail.com>
 <1568387004-3802-2-git-send-email-akinobu.mita@gmail.com>
 <20190927063547.GA1786569@kroah.com>
 <CAC5umyjdM1+4nPg_6UaCjcpikESamdA_ZpmP4Xfjx7_-1f=+0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC5umyjdM1+4nPg_6UaCjcpikESamdA_ZpmP4Xfjx7_-1f=+0A@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Sep 28, 2019 at 01:47:21AM +0900, Akinobu Mita wrote:
> 2019年9月27日(金) 15:39 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:
> >
> > On Sat, Sep 14, 2019 at 12:03:24AM +0900, Akinobu Mita wrote:
> > > Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
> > > However, the size of this file is limited to PAGE_SIZE because of the
> > > limitation for sysfs attribute.
> > >
> > > Enabling LED CPU trigger on systems with thousands of CPUs easily hits
> > > PAGE_SIZE limit, and makes it impossible to see all available LED triggers
> > > and which trigger is currently activated.
> > >
> > > We work around it here by converting /sys/class/leds/<led>/trigger to
> > > binary attribute, which is not limited by length. This is _not_ good
> > > design, do not copy it.
> > >
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > > Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > > Cc: Pavel Machek <pavel@ucw.cz>
> > > Cc: Dan Murphy <dmurphy@ti.com>
> > > Acked-by: Pavel Machek <pavel@ucw.cz>
> > > Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> > > ---
> > >  drivers/leds/led-class.c    |  8 ++--
> > >  drivers/leds/led-triggers.c | 90 ++++++++++++++++++++++++++++++++++-----------
> > >  drivers/leds/leds.h         |  6 +++
> > >  include/linux/leds.h        |  5 ---
> > >  4 files changed, 79 insertions(+), 30 deletions(-)
> > >
> > > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > > index 4793e77..8b5a1d1 100644
> > > --- a/drivers/leds/led-class.c
> > > +++ b/drivers/leds/led-class.c
> > > @@ -73,13 +73,13 @@ static ssize_t max_brightness_show(struct device *dev,
> > >  static DEVICE_ATTR_RO(max_brightness);
> > >
> > >  #ifdef CONFIG_LEDS_TRIGGERS
> > > -static DEVICE_ATTR(trigger, 0644, led_trigger_show, led_trigger_store);
> > > -static struct attribute *led_trigger_attrs[] = {
> > > -     &dev_attr_trigger.attr,
> > > +static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
> > > +static struct bin_attribute *led_trigger_bin_attrs[] = {
> > > +     &bin_attr_trigger,
> > >       NULL,
> > >  };
> > >  static const struct attribute_group led_trigger_group = {
> > > -     .attrs = led_trigger_attrs,
> > > +     .bin_attrs = led_trigger_bin_attrs,
> > >  };
> > >  #endif
> > >
> > > diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> > > index 8d11a5e..ed5a311 100644
> > > --- a/drivers/leds/led-triggers.c
> > > +++ b/drivers/leds/led-triggers.c
> > > @@ -16,6 +16,7 @@
> > >  #include <linux/rwsem.h>
> > >  #include <linux/leds.h>
> > >  #include <linux/slab.h>
> > > +#include <linux/mm.h>
> > >  #include "leds.h"
> > >
> > >  /*
> > > @@ -26,9 +27,11 @@ LIST_HEAD(trigger_list);
> > >
> > >   /* Used by LED Class */
> > >
> > > -ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
> > > -             const char *buf, size_t count)
> > > +ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
> > > +                       struct bin_attribute *bin_attr, char *buf,
> > > +                       loff_t pos, size_t count)
> > >  {
> > > +     struct device *dev = kobj_to_dev(kobj);
> > >       struct led_classdev *led_cdev = dev_get_drvdata(dev);
> > >       struct led_trigger *trig;
> > >       int ret = count;
> > > @@ -64,39 +67,84 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
> > >       mutex_unlock(&led_cdev->led_access);
> > >       return ret;
> > >  }
> > > -EXPORT_SYMBOL_GPL(led_trigger_store);
> > > +EXPORT_SYMBOL_GPL(led_trigger_write);
> > >
> > > -ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
> > > -             char *buf)
> > > +__printf(4, 5)
> > > +static int led_trigger_snprintf(char *buf, size_t size, bool query,
> > > +                             const char *fmt, ...)
> > > +{
> > > +     va_list args;
> > > +     int i;
> > > +
> > > +     va_start(args, fmt);
> > > +     if (query)
> > > +             i = vsnprintf(NULL, 0, fmt, args);
> > > +     else
> > > +             i = vscnprintf(buf, size, fmt, args);
> > > +     va_end(args);
> > > +
> > > +     return i;
> > > +}
> >
> > You only call this in one place, why is it needed like this?  The "old"
> > code open-coded this, what is this helping with here?
> >
> > And what does "query" mean here?  I have no idea how that variable
> > matters, or what it does.  Why not just test if buf is NULL or not if
> > you don't want to use it?
> >
> > Ah, you are trying to see how "long" the buffer is going to be.  That
> > makes more sense, but just trigger off of the NULL buffer or not, making
> > this a bit more "obvious" what you are doing and not tieing two
> > parameters to each other (meaning one always reflects the other one).
> 
> We cannot simply replace the "query" by checking the buffer is NULL or not.
> Because led_trigger_snprintf() is repeatedly called by led_trigger_format()
> while increasing 'buf' and decreasing 'size' by the return value of
> led_trigger_snprintf() every time.

Odd, but ok, I'll trust you, this looks like very odd code :(

> > > +static int led_trigger_format(char *buf, size_t size, bool query,
> > > +                           struct led_classdev *led_cdev)
> > >  {
> > > -     struct led_classdev *led_cdev = dev_get_drvdata(dev);
> > >       struct led_trigger *trig;
> > > -     int len = 0;
> > > +     int len = led_trigger_snprintf(buf, size, query, "%s",
> > > +                                    led_cdev->trigger ? "none" : "[none]");
> > > +
> > > +     list_for_each_entry(trig, &trigger_list, next_trig) {
> > > +             bool hit = led_cdev->trigger &&
> > > +                     !strcmp(led_cdev->trigger->name, trig->name);
> > > +
> > > +             len += led_trigger_snprintf(buf + len, size - len, query,
> > > +                                         " %s%s%s", hit ? "[" : "",
> > > +                                         trig->name, hit ? "]" : "");
> > > +     }
> > > +
> > > +     len += led_trigger_snprintf(buf + len, size - len, query, "\n");
> > > +
> > > +     return len;
> > > +}
> > > +
> > > +/*
> > > + * It was stupid to create 10000 cpu triggers, but we are stuck with it now.
> > > + * Don't make that mistake again. We work around it here by creating binary
> > > + * attribute, which is not limited by length. This is _not_ good design, do not
> > > + * copy it.
> > > + */
> > > +ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
> > > +                     struct bin_attribute *attr, char *buf,
> > > +                     loff_t pos, size_t count)
> > > +{
> > > +     struct device *dev = kobj_to_dev(kobj);
> > > +     struct led_classdev *led_cdev = dev_get_drvdata(dev);
> > > +     void *data;
> > > +     int len;
> > >
> > >       down_read(&triggers_list_lock);
> > >       down_read(&led_cdev->trigger_lock);
> > >
> > > -     if (!led_cdev->trigger)
> > > -             len += scnprintf(buf+len, PAGE_SIZE - len, "[none] ");
> > > +     len = led_trigger_format(NULL, 0, true, led_cdev);
> > > +     data = kvmalloc(len + 1, GFP_KERNEL);
> >
> > Why kvmalloc() and not just kmalloc()?  How big is this buffer you are
> > expecting to have here?
> 
> The ledtrig-cpu supports upto 9999 cpus.  If all these cpus were available,
> the buffer size would be 78,890 bytes.
> (for i in `seq 0 9999`;do echo -n " cpu$i"; done | wc -c)
> 
> The intention of this kvmalloc() allocation is to avoid costly allocation
> if possible.

Ah, forgot it could get that big.

> > > +     if (data)
> > > +             len = led_trigger_format(data, len + 1, false, led_cdev);
> > >       else
> > > -             len += scnprintf(buf+len, PAGE_SIZE - len, "none ");
> > > +             len = -ENOMEM;
> > >
> > > -     list_for_each_entry(trig, &trigger_list, next_trig) {
> > > -             if (led_cdev->trigger && !strcmp(led_cdev->trigger->name,
> > > -                                                     trig->name))
> > > -                     len += scnprintf(buf+len, PAGE_SIZE - len, "[%s] ",
> > > -                                      trig->name);
> > > -             else
> > > -                     len += scnprintf(buf+len, PAGE_SIZE - len, "%s ",
> > > -                                      trig->name);
> > > -     }
> > >       up_read(&led_cdev->trigger_lock);
> > >       up_read(&triggers_list_lock);
> >
> > Two locks?  Why not 3?  5?  How about just 1?  :)
> 
> I don't touch these locks in this patch :)
> 
> Locking both locks seems to be necessary to prevent someone from changing
> trigger_list or led_cdev->trigger.

Ok, it just looked odd to me.

> > > -     len += scnprintf(len+buf, PAGE_SIZE - len, "\n");
> > > +     if (len < 0)
> > > +             return len;
> >
> > You just leaked data if led_trigger_format() returned an error :(
> >
> > Just return -ENOMEM above if !data, which makes this much simpler.
> 
> We are holding the two locks, so we need to release them before return.
> Which one do you prefer?
> 
>         ...
>         data = kvmalloc(len + 1, GFP_KERNEL);
>         if (data)
>                 len = led_trigger_format(data, len + 1, false, led_cdev);
>         else
>                 len = -ENOMEM;
> 
>         up_read(&led_cdev->trigger_lock);
>         up_read(&triggers_list_lock);
> 
>         if (len < 0)
>                 return len;
> 
> vs.
> 
>         ...
>         data = kvmalloc(len + 1, GFP_KERNEL);
>         if (!data) {
>                 up_read(&led_cdev->trigger_lock);
>                 up_read(&triggers_list_lock);
>                 return -ENOMEM;
>         }
>         len = led_trigger_format(data, len + 1, false, led_cdev);
> 
>         up_read(&led_cdev->trigger_lock);
>         up_read(&triggers_list_lock);

I don't care, as long as you do not leak memory I'm happy :)

thanks,

greg k-h
