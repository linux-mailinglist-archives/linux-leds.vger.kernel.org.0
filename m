Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B506B0032
	for <lists+linux-leds@lfdr.de>; Wed, 11 Sep 2019 17:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbfIKPgH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Sep 2019 11:36:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:40192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727839AbfIKPgH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Sep 2019 11:36:07 -0400
Received: from localhost (unknown [62.28.240.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 46CF9206A1;
        Wed, 11 Sep 2019 15:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568216166;
        bh=qxZQXSziXo+H6d/nno1dmQLnRFxQwJr3Dw8uDFe2odo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rhyFuL/9goMGIHfRJC27hH2SlluHVfsAP5kFre9S7h8dVxwZ1nHouElayo3hE/g2O
         4OaX8r6nHmzqwEv4d+DZ9v+GCUiGsX6vkvSIljm/UZfOgtRWaDGFQOs8f345UT4qMe
         X7p16CYetPBInxHrgDYfiPFVQfaAts5ILEu6tX2Q=
Date:   Wed, 11 Sep 2019 16:36:02 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 1/5] leds: remove PAGE_SIZE limit of
 /sys/class/leds/<led>/trigger
Message-ID: <20190911153602.GB13865@kroah.com>
References: <1567946472-10075-1-git-send-email-akinobu.mita@gmail.com>
 <1567946472-10075-2-git-send-email-akinobu.mita@gmail.com>
 <20190908131034.GD9466@kroah.com>
 <CAC5umyhZ_-Gdh7+EzNoHPs2zki2-dK1xBv5xpE5zwZPt_jvNEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC5umyhZ_-Gdh7+EzNoHPs2zki2-dK1xBv5xpE5zwZPt_jvNEA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Sep 12, 2019 at 12:25:28AM +0900, Akinobu Mita wrote:
> 2019年9月8日(日) 22:10 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:
> >
> > On Sun, Sep 08, 2019 at 09:41:08PM +0900, Akinobu Mita wrote:
> > > Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
> > > However, the size of this file is limited to PAGE_SIZE because of the
> > > limitation for sysfs attribute.
> > >
> > > Enabling LED CPU trigger on systems with thousands of CPUs easily hits
> > > PAGE_SIZE limit, and makes it impossible to see all available LED triggers
> > > and which trigger is currently activated.
> > >
> > > This converts /sys/class/leds/<led>/trigger to bin attribute and removes
> > > the PAGE_SIZE limitation.
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
> >
> > BIN_ATTR_RW()?
> 
> We can use BIN_ATTR_RW() by renaming led_trigger_{read,write}() to
> trigger_{read,write}().  But led_trigger_{read,write}() are not static
> functions.  These are defined as export symbols for led-class module.
> 
> So trigger_{read,write}() will be too generic symbol names, won't they?

Yes they would, sorry I didn't notice that.

Wait, why are those functions being exported?  Who is calling a sysfs
function from a different code path than sysfs?

thanks,

greg k-h
