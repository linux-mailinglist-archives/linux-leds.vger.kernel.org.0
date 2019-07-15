Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8A568640
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jul 2019 11:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729519AbfGOJYK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Jul 2019 05:24:10 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44479 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729516AbfGOJYG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jul 2019 05:24:06 -0400
Received: by mail-wr1-f67.google.com with SMTP id p17so16227186wrf.11
        for <linux-leds@vger.kernel.org>; Mon, 15 Jul 2019 02:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=nfm6Ua4RrGb4WspYU/6CGmVhaLbOHYoHSE5D469nkM4=;
        b=nUxlRHFEmdE//fmjfkSwYbzIynIsAnyHZUwgu6k0FB6rJdmYLn1JuaKI7GL+Or08qm
         /HGIxW0JUuNh1P87D362eX4UINwyRltQtIAdPWZ5jzdhOvPEoYsdbm19qyy9LSa4BYMj
         19mBueDluvMxyxuhKPDWjd5WxBAPDUSCsWMXuJDuuVK6xPYOEshMZsyOq6oIQEagQ5Bx
         Xz74JAvKgmaa9W2rGpL8v3ORmqBOLPrK9+yQdLuKN9ziL/7AUbq5GKY5bZ4enS+ztBW1
         VjjE3L5Rj/aaNY8X9f3BiuYpolJhC9Nn+pRwVw3CzhorEC/HiPOlfVNUgETAa0t4Xk6V
         x3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=nfm6Ua4RrGb4WspYU/6CGmVhaLbOHYoHSE5D469nkM4=;
        b=drd7JWg9O3obR/ScoAQ9o3SxBP/EJaZVO2Tump5cEMCQp/7+NzNqBYlGSzBQDjghIq
         vmYtuAW2G38k4Thh0VZ10ea1iq4lysbbpw3tg1yWqEzRFH9glcd0RJKCRVChBpc2FwrU
         O4raKMKAU3YVO8C/6WVhvDtpBMhOWCZ3FBsiWYYpxooRHbsltMjVUfzPL+LaTrXScVXx
         xtFwL1Olpu2Li9wHosIEcgeGUfM1QixTGwuVxuxIwR94iexQU+gExCX/HybnuY+KlwYr
         ByJz8a4EiaKspKGiHp6c5A82lGgKImlnepnL96bViae0DTscFZ7U2RIMOG1jGc1HYId4
         hVmw==
X-Gm-Message-State: APjAAAWMi/ip529ur9DFzuNxT7YST/HbjDRwfxoEjNYS45DzHSbWS41c
        dTcvhEwF1bflPlAMOe6lmjpvgdTi9PJ1wg==
X-Google-Smtp-Source: APXvYqy/+ExO8IuTAiFAaExvyr1yLeuxu4zrL0AJ5A1eSvxhI4KUOZVS3tFbBntpsYO2vgJahfMW8w==
X-Received: by 2002:a5d:518c:: with SMTP id k12mr26872647wrv.116.1563182643036;
        Mon, 15 Jul 2019 02:24:03 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id n1sm13156524wrx.39.2019.07.15.02.24.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 15 Jul 2019 02:24:02 -0700 (PDT)
Date:   Mon, 15 Jul 2019 10:24:00 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: Add control of the voltage/current regulator
 to the LED core
Message-ID: <20190715092400.sedjumqkecglheyu@holly.lan>
References: <20190708103547.23528-1-jjhiblot@ti.com>
 <20190708103547.23528-2-jjhiblot@ti.com>
 <56d16260-ff82-3439-4c1f-2a3a1552bc7d@ti.com>
 <ab4818c0-bc7a-13e1-c6ce-e977b0234de0@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab4818c0-bc7a-13e1-c6ce-e977b0234de0@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Jul 15, 2019 at 11:01:29AM +0200, Jean-Jacques Hiblot wrote:
> Hi Dan,
> 
> On 12/07/2019 20:49, Dan Murphy wrote:
> > JJ
> > 
> > On 7/8/19 5:35 AM, Jean-Jacques Hiblot wrote:
> > > A LED is usually powered by a voltage/current regulator. Let the LED
> > > core
> > Let the LED core know
> > > about it. This allows the LED core to turn on or off the power supply
> > > as needed.
> > 
> > > 
> > > Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> > > ---
> > >   drivers/leds/led-class.c | 10 ++++++++
> > >   drivers/leds/led-core.c  | 53 +++++++++++++++++++++++++++++++++++++---
> > >   include/linux/leds.h     |  4 +++
> > >   3 files changed, 64 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > > index 4793e77808e2..e01b2d982564 100644
> > > --- a/drivers/leds/led-class.c
> > > +++ b/drivers/leds/led-class.c
> > > @@ -17,6 +17,7 @@
> > >   #include <linux/slab.h>
> > >   #include <linux/spinlock.h>
> > >   #include <linux/timer.h>
> > > +#include <linux/regulator/consumer.h>
> > 
> > What if you move this to leds.h so core and class can both include it.
> > 
> > 
> > >   #include <uapi/linux/uleds.h>
> > >   #include "leds.h"
> > >   @@ -272,6 +273,15 @@ int of_led_classdev_register(struct device
> > > *parent, struct device_node *np,
> > >           dev_warn(parent, "Led %s renamed to %s due to name collision",
> > >                   led_cdev->name, dev_name(led_cdev->dev));
> > >   +    led_cdev->regulator = devm_regulator_get(led_cdev->dev, "power");
> > 
> > Is the regulator always going to be called power?
> 
> Actually in the dts, that will be "power-supply". I lacked the imagination
> to come up with a better name.
> 
> 
> 
> > 
> > > +    if (IS_ERR(led_cdev->regulator)) {
> > > +        dev_err(led_cdev->dev, "Cannot get the power supply for %s\n",
> > > +            led_cdev->name);
> > > +        device_unregister(led_cdev->dev);
> > > +        mutex_unlock(&led_cdev->led_access);
> > > +        return PTR_ERR(led_cdev->regulator);
> > 
> > This is listed as optional in the DT doc.  This appears to be required.
> 
> The regulator core will provide a dummy regulator if none is given in the
> device tree. I would rather have an error in that case, but that is not how
> it works.

If you actively wanted to get -ENODEV back when there is no regulator
then you can use devm_regulator_get_optional() for that.

However perhaps be careful what you wish for. If you use get_optional()
then you will have to sprinkle NULL or IS_ERR() checks everywhere. I'd
favour using the current approach!


Daniel.

> 
> 
> > 
> > I prefer to keep it optional.  Many LED drivers are connected to fixed
> > non-managed supplies.
> > 
> > > +    }
> > > +
> > >       if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
> > >           ret = led_add_brightness_hw_changed(led_cdev);
> > >           if (ret) {
> > > diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> > > index 7107cd7e87cf..139de6b08cad 100644
> > > --- a/drivers/leds/led-core.c
> > > +++ b/drivers/leds/led-core.c
> > > @@ -16,6 +16,7 @@
> > >   #include <linux/rwsem.h>
> > >   #include <linux/slab.h>
> > >   #include "leds.h"
> > > +#include <linux/regulator/consumer.h>
> > >     DECLARE_RWSEM(leds_list_lock);
> > >   EXPORT_SYMBOL_GPL(leds_list_lock);
> > > @@ -23,6 +24,31 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
> > >   LIST_HEAD(leds_list);
> > >   EXPORT_SYMBOL_GPL(leds_list);
> > >   +static bool __led_need_regulator_update(struct led_classdev
> > > *led_cdev,
> > > +                    int brightness)
> > > +{
> > > +    bool new_regulator_state = (brightness != LED_OFF);
> > > +
> > > +    return led_cdev->regulator_state != new_regulator_state;
> > > +}
> > > +
> > > +static int __led_handle_regulator(struct led_classdev *led_cdev,
> > > +                int brightness)
> > > +{
> > > +    if (__led_need_regulator_update(led_cdev, brightness)) {
> > > +        int ret;
> > 
> > Prefer to this to be moved up.
> ok
> > 
> > > +
> > > +        if (brightness != LED_OFF)
> > > +            ret = regulator_enable(led_cdev->regulator);
> > > +        else
> > > +            ret = regulator_disable(led_cdev->regulator);
> > > +        if (ret)
> > > +            return ret;
> > new line
> > > +        led_cdev->regulator_state = (brightness != LED_OFF);
> > > +    }
> > > +    return 0;
> > > +}
> > > +
> > >   static int __led_set_brightness(struct led_classdev *led_cdev,
> > >                   enum led_brightness value)
> > >   {
> > > @@ -80,6 +106,7 @@ static void led_timer_function(struct timer_list *t)
> > >       }
> > >         led_set_brightness_nosleep(led_cdev, brightness);
> > > +    __led_handle_regulator(led_cdev, brightness);
> > 
> > Again this seems to indicate that the regulator is a required property
> > for the LEDs
> > 
> > This needs to be made optional.  And the same comment through out for
> > every call.
> > 
> > 
> > >         /* Return in next iteration if led is in one-shot mode and
> > > we are in
> > >        * the final blink state so that the led is toggled each
> > > delay_on +
> > > @@ -115,6 +142,8 @@ static void set_brightness_delayed(struct
> > > work_struct *ws)
> > >       if (ret == -ENOTSUPP)
> > >           ret = __led_set_brightness_blocking(led_cdev,
> > >                       led_cdev->delayed_set_value);
> > > +    __led_handle_regulator(led_cdev, led_cdev->delayed_set_value);
> > > +
> > >       if (ret < 0 &&
> > >           /* LED HW might have been unplugged, therefore don't warn */
> > >           !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
> > > @@ -141,6 +170,7 @@ static void led_set_software_blink(struct
> > > led_classdev *led_cdev,
> > >       /* never on - just set to off */
> > >       if (!delay_on) {
> > >           led_set_brightness_nosleep(led_cdev, LED_OFF);
> > > +        __led_handle_regulator(led_cdev, LED_OFF);
> > >           return;
> > >       }
> > >   @@ -148,6 +178,7 @@ static void led_set_software_blink(struct
> > > led_classdev *led_cdev,
> > >       if (!delay_off) {
> > >           led_set_brightness_nosleep(led_cdev,
> > >                          led_cdev->blink_brightness);
> > > +        __led_handle_regulator(led_cdev, led_cdev->blink_brightness);
> > >           return;
> > >       }
> > >   @@ -256,8 +287,14 @@ void led_set_brightness_nopm(struct
> > > led_classdev *led_cdev,
> > >                     enum led_brightness value)
> > >   {
> > >       /* Use brightness_set op if available, it is guaranteed not to
> > > sleep */
> > > -    if (!__led_set_brightness(led_cdev, value))
> > > -        return;
> > > +    if (!__led_set_brightness(led_cdev, value)) {
> > > +        /*
> > > +         * if regulator state doesn't need to be changed, that is all/
> > > +         * Otherwise delegate the change to a work queue
> > > +         */
> > > +        if (!__led_need_regulator_update(led_cdev, value))
> > > +            return;
> > > +    }
> > >         /* If brightness setting can sleep, delegate it to a work
> > > queue task */
> > >       led_cdev->delayed_set_value = value;
> > > @@ -280,6 +317,8 @@ EXPORT_SYMBOL_GPL(led_set_brightness_nosleep);
> > >   int led_set_brightness_sync(struct led_classdev *led_cdev,
> > >                   enum led_brightness value)
> > >   {
> > > +    int ret;
> > > +
> > >       if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
> > >           return -EBUSY;
> > >   @@ -288,7 +327,15 @@ int led_set_brightness_sync(struct
> > > led_classdev *led_cdev,
> > >       if (led_cdev->flags & LED_SUSPENDED)
> > >           return 0;
> > >   -    return __led_set_brightness_blocking(led_cdev,
> > > led_cdev->brightness);
> > > +    ret = __led_set_brightness_blocking(led_cdev,
> > > led_cdev->brightness);
> > > +    if (ret)
> > > +        return ret;
> > > +
> > > +    ret = __led_handle_regulator(led_cdev, led_cdev->brightness);
> > 
> > Can't you just return here?
> 
> ok
> 
> 
> thanks for the review
> 
> JJ
> 
> > 
> > Dan
> > 
> > > +    if (ret)
> > > +        return ret;
> > > +
> > > +    return 0;
> > >   }
> > >   EXPORT_SYMBOL_GPL(led_set_brightness_sync);
> > >   diff --git a/include/linux/leds.h b/include/linux/leds.h
> > > index 9b2bf574a17a..bee8e3f8dddd 100644
> > > --- a/include/linux/leds.h
> > > +++ b/include/linux/leds.h
> > > @@ -123,6 +123,10 @@ struct led_classdev {
> > >         /* Ensures consistent access to the LED Flash Class device */
> > >       struct mutex        led_access;
> > > +
> > > +    /* regulator */
> > > +    struct regulator    *regulator;
> > > +    bool            regulator_state;
> > >   };
> > >     extern int of_led_classdev_register(struct device *parent,
