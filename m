Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6490C6F9E9
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jul 2019 09:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727462AbfGVHGZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Jul 2019 03:06:25 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44979 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727566AbfGVHGY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Jul 2019 03:06:24 -0400
Received: by mail-wr1-f67.google.com with SMTP id p17so38113985wrf.11
        for <linux-leds@vger.kernel.org>; Mon, 22 Jul 2019 00:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=7AKc4S2JdeQQN46PQF2XtG4Lb0wPXYNR/5uOmrJuwCI=;
        b=n1V9ILuFGiEzUzu6vh751kEk3R4i+V91IXoSJlqrNELQuIg9OTOSXjvfRoFZMI+qUD
         sOseYkxLIKd4eQl8a5NQ/NwTMJP+faWHBKb6arB5aWYQJ8Hk5Is5HkhGPzTSghZ2fzld
         f4fU6UER4R681nXx7VKwHMCTJ6SR5cOEOzzGx/7wTBJejfu/IrYARxwWYhUnSkEpzo+l
         Y2mV85siW50mM8hUNQWpTxhJw4ZqqcVhgG4ouq3XWIRjDymNdHITh9h62hFuRGkOvL9O
         sLwaogitA6gF7TXq0HTDti5ZkYFk+g2ITjoZR8ThP5JY3QAnhjju10fFUm313K4f4CEs
         eTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=7AKc4S2JdeQQN46PQF2XtG4Lb0wPXYNR/5uOmrJuwCI=;
        b=E8QUYNNQm5rVbekzN6xQOsd0RQKjMSXlfiGlrvq0c0Ssj7DzU5Q4mnyOEOf4Hfck3n
         LfrwMoLSB6a6AXsXJYQhmICOs2T9N1IyE7zR3LGthFz4teCdPgMo34b5OwPt2Yvtp7Mc
         BSexPhS+AaBNt/cliY+JpawJ4WUUWBgLb+rOT6xCwgFtMNlAMzOHm1xZY3gqXRMWT0Wh
         /eB2Sdw11PHFMh2YqNPE0exV7XKjFyU8s4ZPp6y4Scig7XKXCWF+9cv4IG7XI9joDM1M
         WexYM5oCDXb6viRxh8ghpv/pH4U70xI5WpBEO/XUPQ3dIN+yB1muvModGZbvTdQBc34K
         xsew==
X-Gm-Message-State: APjAAAX2Gz89kO8atMuLLndwEL2sT+40BsoDsKb+2Q5F4BYzQfbAEJw8
        y4d07nlRrT2k4YmnUES5CBFNdw==
X-Google-Smtp-Source: APXvYqz1zNy/Suaraf0jDlZuuwYJiXQboZhBofok0+Dw6tTV/c6MAxCe+hyhocPGQ96oLQ/5Yf2ZSA==
X-Received: by 2002:a5d:4211:: with SMTP id n17mr4118838wrq.137.1563779182766;
        Mon, 22 Jul 2019 00:06:22 -0700 (PDT)
Received: from dell ([2.27.35.164])
        by smtp.gmail.com with ESMTPSA id k17sm42778533wrq.83.2019.07.22.00.06.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 00:06:22 -0700 (PDT)
Date:   Mon, 22 Jul 2019 08:06:20 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Jean-Jacques Hiblot <jjhiblot@ti.com>, pavel@ucw.cz,
        robh+dt@kernel.org, mark.rutland@arm.com,
        daniel.thompson@linaro.org, jingoohan1@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com
Subject: Re: [PATCH v4 0/4] Add a generic driver for LED-based backlight
Message-ID: <20190722070620.GD8402@dell>
References: <20190717141514.21171-1-jjhiblot@ti.com>
 <283d9044-df2d-b176-bea9-7e1520d9cf56@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <283d9044-df2d-b176-bea9-7e1520d9cf56@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 18 Jul 2019, Jacek Anaszewski wrote:

> On 7/17/19 4:15 PM, Jean-Jacques Hiblot wrote:
> > This series aims to add a led-backlight driver, similar to pwm-backlight,
> > but using a LED class device underneath.
> > 
> > A few years ago (2015), Tomi Valkeinen posted a series implementing a
> > backlight driver on top of a LED device:
> > https://patchwork.kernel.org/patch/7293991/
> > https://patchwork.kernel.org/patch/7294001/
> > https://patchwork.kernel.org/patch/7293981/
> > 
> > The discussion stopped because Tomi lacked the time to work on it.
> > 
> > changes in v4:
> > - fix dev_err() messages and commit logs following the advices of Pavel
> > - cosmetic changes (indents, getting rid of  "? 1 : 0" in
> >   led_match_led_node())
> > 
> > changes in v3:
> > - dt binding: don't limit the brightness range to 0-255. Use the range of
> >   the underlying LEDs. as a side-effect, all LEDs must now have the same
> >   range
> > - driver: Adapt to dt binding update.
> > - driver: rework probe() for clarity and remove the remaining goto.
> > 
> > changes in v2:
> > - handle more than one LED.
> > - don't make the backlight device a child of the LED controller.
> > - make brightness-levels and default-brightness-level optional
> > - removed the option to use a GPIO enable.
> > - removed the option to use a regulator. It should be handled by the LED
> >   core
> > - don't make any change to the LED core (not needed anymore)
> > 
> > Jean-Jacques Hiblot (2):
> >   leds: Add managed API to get a LED from a device driver
> >   dt-bindings: backlight: Add led-backlight binding
> > 
> > Tomi Valkeinen (2):
> >   leds: Add of_led_get() and led_put()
> >   backlight: add led-backlight driver
> > 
> >  .../bindings/leds/backlight/led-backlight.txt |  28 ++
> >  drivers/leds/led-class.c                      |  92 ++++++
> >  drivers/video/backlight/Kconfig               |   7 +
> >  drivers/video/backlight/Makefile              |   1 +
> >  drivers/video/backlight/led_bl.c              | 268 ++++++++++++++++++
> >  include/linux/leds.h                          |   6 +
> >  6 files changed, 402 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> >  create mode 100644 drivers/video/backlight/led_bl.c
> > 
> 
> For the whole set:
> 
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> 
> Lee - we need to create immutable branch for this set since there will
> be some interfering changes in the LED core in this cycle.
> 
> I can create the branch and send the pull request once we will
> obtain the ack from Rob for DT bindings, unless you have other
> preference.

We also require a review to be conducted by Daniel Thompson.

After which, an immutable branch sounds like a good idea.  I'd like to
create this myself if you don't mind.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
