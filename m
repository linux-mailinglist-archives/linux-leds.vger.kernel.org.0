Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 856EAAD7AC
	for <lists+linux-leds@lfdr.de>; Mon,  9 Sep 2019 13:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730250AbfIILMT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Sep 2019 07:12:19 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34948 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730703AbfIILMS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Sep 2019 07:12:18 -0400
Received: by mail-wr1-f67.google.com with SMTP id g7so13406579wrx.2
        for <linux-leds@vger.kernel.org>; Mon, 09 Sep 2019 04:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=r0cqelu1CHocdn9tAl3rxNNP2PFx49WcLGnntUDmH00=;
        b=BkQbGtCLTXPp+0ahNqGnKkBg9mw1KDONv/V/dovinCIjnlFHwTGsyK8iWoB9FnIpMw
         8TKZ2mMZ622pGuvFHAW5ZIMPEzo5HHE/eJMai7lsyTdSu6i8fx/Qog4gpYYQaZire8J4
         acRrOqaYGh3x1Ou+o7UsSmuOR5yevYuqFSgDv9JydXEOD7RQvEB4Cql8uUEon6IR1MHb
         8gGKs4cDvaodT+IW0I03i+zZCZhYEYVzKD1KJGIOu1I/FE8Fe1XPRj9g+z2RkKcaYe6R
         Uhrop5P4MrMzUgcEhuLGfr3DKNWxVhulxq1ndBupq6OJEuJpWq60u8AVxWzYwdBKfIMp
         L7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=r0cqelu1CHocdn9tAl3rxNNP2PFx49WcLGnntUDmH00=;
        b=EWEN6WdJ+sc8fcoAYa0J5f4YaMfbWSVEOg13QtimZvamj3SAy5hnZCEZGto+iMcAFo
         y9dR5qCy8ols3MTJ5nN6L5fm0Vfg/gGXKUcql6w5QEzax3P1xcbcrGB9CSPHJ5FZbGh5
         JwZW5nv6LMHk7zXreic8p3oP8m9419x6uGIvBKS3Jhk5Qwb6fw6jdZMuPHGHNjhbYJfr
         4nsFFVcNkQoy0R6GT1IhaQD8R00hziCPO9krNNbQVZA+9Q05SIM5BqqP7StaqBaGoOLo
         az6Y9NrVIEse2XAyYYFxx2idaf+6yPlXkreZ9m9yffvInpxgX6knpYBMeQXemcHwocdy
         LX2g==
X-Gm-Message-State: APjAAAV3R73uyl8I1InDMe4kn9lhfvNhh0QAQNHKamAmW9xeGdfKH8Cj
        Kw3i6HlBHqJVGQ3bSoOh2m083w==
X-Google-Smtp-Source: APXvYqzaBI0NkJdKnfne3ZbLfenHCgShMsft+MxAjXo4pydOyPT+jtolAEOiXuPQUOi3pKczahHhYA==
X-Received: by 2002:adf:d1a4:: with SMTP id w4mr19670272wrc.331.1568027535792;
        Mon, 09 Sep 2019 04:12:15 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id k6sm29499911wrg.0.2019.09.09.04.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2019 04:12:15 -0700 (PDT)
Date:   Mon, 9 Sep 2019 12:12:13 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>, pavel@ucw.cz,
        robh+dt@kernel.org, mark.rutland@arm.com, jingoohan1@gmail.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ti.com
Subject: Re: [PATCH v4 0/4] Add a generic driver for LED-based backlight
Message-ID: <20190909111213.objkrztpikruhgzi@holly.lan>
References: <20190717141514.21171-1-jjhiblot@ti.com>
 <283d9044-df2d-b176-bea9-7e1520d9cf56@gmail.com>
 <20190722070620.GD8402@dell>
 <9cbd9cf6-3422-85df-885f-904f52e9cabd@gmail.com>
 <e8b4bf9a-2ee2-a496-c4de-1ed643211ec7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8b4bf9a-2ee2-a496-c4de-1ed643211ec7@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Sep 08, 2019 at 06:17:50PM +0200, Jacek Anaszewski wrote:
> On 7/22/19 11:23 PM, Jacek Anaszewski wrote:
> > On 7/22/19 9:06 AM, Lee Jones wrote:
> >> On Thu, 18 Jul 2019, Jacek Anaszewski wrote:
> >>
> >>> On 7/17/19 4:15 PM, Jean-Jacques Hiblot wrote:
> >>>> This series aims to add a led-backlight driver, similar to pwm-backlight,
> >>>> but using a LED class device underneath.
> >>>>
> >>>> A few years ago (2015), Tomi Valkeinen posted a series implementing a
> >>>> backlight driver on top of a LED device:
> >>>> https://patchwork.kernel.org/patch/7293991/
> >>>> https://patchwork.kernel.org/patch/7294001/
> >>>> https://patchwork.kernel.org/patch/7293981/
> >>>>
> >>>> The discussion stopped because Tomi lacked the time to work on it.
> >>>>
> >>>> changes in v4:
> >>>> - fix dev_err() messages and commit logs following the advices of Pavel
> >>>> - cosmetic changes (indents, getting rid of  "? 1 : 0" in
> >>>>   led_match_led_node())
> >>>>
> >>>> changes in v3:
> >>>> - dt binding: don't limit the brightness range to 0-255. Use the range of
> >>>>   the underlying LEDs. as a side-effect, all LEDs must now have the same
> >>>>   range
> >>>> - driver: Adapt to dt binding update.
> >>>> - driver: rework probe() for clarity and remove the remaining goto.
> >>>>
> >>>> changes in v2:
> >>>> - handle more than one LED.
> >>>> - don't make the backlight device a child of the LED controller.
> >>>> - make brightness-levels and default-brightness-level optional
> >>>> - removed the option to use a GPIO enable.
> >>>> - removed the option to use a regulator. It should be handled by the LED
> >>>>   core
> >>>> - don't make any change to the LED core (not needed anymore)
> >>>>
> >>>> Jean-Jacques Hiblot (2):
> >>>>   leds: Add managed API to get a LED from a device driver
> >>>>   dt-bindings: backlight: Add led-backlight binding
> >>>>
> >>>> Tomi Valkeinen (2):
> >>>>   leds: Add of_led_get() and led_put()
> >>>>   backlight: add led-backlight driver
> >>>>
> >>>>  .../bindings/leds/backlight/led-backlight.txt |  28 ++
> >>>>  drivers/leds/led-class.c                      |  92 ++++++
> >>>>  drivers/video/backlight/Kconfig               |   7 +
> >>>>  drivers/video/backlight/Makefile              |   1 +
> >>>>  drivers/video/backlight/led_bl.c              | 268 ++++++++++++++++++
> >>>>  include/linux/leds.h                          |   6 +
> >>>>  6 files changed, 402 insertions(+)
> >>>>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> >>>>  create mode 100644 drivers/video/backlight/led_bl.c
> >>>>
> >>>
> >>> For the whole set:
> >>>
> >>> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> >>>
> >>> Lee - we need to create immutable branch for this set since there will
> >>> be some interfering changes in the LED core in this cycle.
> >>>
> >>> I can create the branch and send the pull request once we will
> >>> obtain the ack from Rob for DT bindings, unless you have other
> >>> preference.
> >>
> >> We also require a review to be conducted by Daniel Thompson.
> >>
> >> After which, an immutable branch sounds like a good idea.  I'd like to
> >> create this myself if you don't mind.
> > 
> > Sure, thanks.
> 
> Unfortunately that hasn't happened and it will miss 5.4 merge window.
> 
> Daniel, we need your ack for this patch set.

Sorry for dropping the ball here.

I'm afraid I couldn't ack since I spotted a bug but I have shared
review feedback now!


Daniel.
