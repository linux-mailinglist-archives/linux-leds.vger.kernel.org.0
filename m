Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFA831424B7
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2020 09:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgATICK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Jan 2020 03:02:10 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37527 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbgATICJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Jan 2020 03:02:09 -0500
Received: by mail-wr1-f68.google.com with SMTP id w15so28478024wru.4
        for <linux-leds@vger.kernel.org>; Mon, 20 Jan 2020 00:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=e6dkf7g0PlBYzajwREklnNmjXK94Sc+HZYUhtk+5LdM=;
        b=jN6OaO3LImWPZHkie+o9NYbPcksaQwt6VefqX5klIn/3qVibfBq4ZSEimQWad5KD+6
         L0xrCWnJoG/MuPnZsGfzr3bRE8XHIIM+vG0z47GvgrzqTDe482Jya/1aN0fr8MXvzsfO
         OMt4ZrLpJH5Aex8tX99XrKSqUlXB8vtEyX4armTD5fYVwYEDuuyDE6cC31BSsDiVpRx0
         HFTAplyQVE8ZvEYKS256eR3a15jU3780jrVE9yTXKAIcDSt4x2w5mcmTEX0Oed7S78No
         mjPQ9/Zflrzc4wIpTuWX3ckETiSe6kHu6B3SPHw8Uy37A6oJCAy3mNL9IqadAXQ+A69u
         BbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=e6dkf7g0PlBYzajwREklnNmjXK94Sc+HZYUhtk+5LdM=;
        b=a5nVDEAcAZwaV9Ifpyevz7VHvZQaTrKSqDEvq+H3gJLrLF7u3YiwcAV04TZRjOG7c0
         RrwRMiK2+AfqmHlN5sCyI+GPG2fjWEriluQrUUn+AjqueotZWlNkbu8iA8EBCGWszAwv
         vsGLg8ISTZUDT+V3Q6YV9+QFedX+qc1bMKjNs2vOBghml0mdMyihiWxd6Xwo0+e6SFDc
         /AhDsxWKgr+X1qv+zdkc3hY/5b0b2r0/cYFiQ+oW8HnoqyVjON9sJo2Qcp4TLvTtW/Y5
         h9g0/L2Ps+JI/41XXsHxDIH0j7LFHZuQ3IPW4GkXWfZ+T42c9usW8zXr9ob9/3PSMYfC
         83WQ==
X-Gm-Message-State: APjAAAVSIkrZ9jwgjY5O3/8ZP8FE9WWJByx1kcLRU+aLnjxaE492b55w
        y0aJuj0atbmR9mTHSorC+XTE6Q==
X-Google-Smtp-Source: APXvYqzcaJJackorcPd9DC4Xa5AIzUt/tljBZ9+GLzsPMBa1EJ3AAs42EkOtT5IjuvRGZDmfO5jhmQ==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr16874910wrq.206.1579507326451;
        Mon, 20 Jan 2020 00:02:06 -0800 (PST)
Received: from dell ([2.27.35.227])
        by smtp.gmail.com with ESMTPSA id f16sm46604581wrm.65.2020.01.20.00.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 00:02:05 -0800 (PST)
Date:   Mon, 20 Jan 2020 08:02:20 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v10 11/13] gpio: bd71828: Initial support for ROHM
 BD71828 PMIC GPIOs
Message-ID: <20200120080220.GQ15507@dell>
References: <cover.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
 <c8ed62a1efa0c6fde93a8a08fe6bc74a450a34f3.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
 <20200117102127.GD15507@dell>
 <9f405dfc4c7e56e32f4eb2f9cb6e87c05aea1ac9.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f405dfc4c7e56e32f4eb2f9cb6e87c05aea1ac9.camel@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 20 Jan 2020, Vaittinen, Matti wrote:

> Hello,
> 
> On Fri, 2020-01-17 at 10:21 +0000, Lee Jones wrote:
> > On Fri, 17 Jan 2020, Matti Vaittinen wrote:
> > 
> > > ROHM BD71828 PMIC contains 4 pins which can be configured by OTP
> > > to be used for general purposes. First 3 can be used as outputs
> > > and 4.th pin can be used as input. Allow them to be controlled
> > > via GPIO framework.
> > > 
> > > The driver assumes all of the pins are configured as GPIOs and
> > > trusts that the reserved pins in other OTP configurations are
> > > excluded from control using "gpio-reserved-ranges" device tree
> > > property (or left untouched by GPIO users).
> > > 
> > > Typical use for 4.th pin (input) is to use it as HALL sensor
> > > input so that this pin state is toggled when HALL sensor detects
> > > LID position change (from close to open or open to close). PMIC
> > > HW implements some extra logic which allows PMIC to power-up the
> > > system when this pin is toggled. Please see the data sheet for
> > > details of GPIO options which can be selected by OTP settings.
> > > 
> > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > 
> > Linus, Is that an Ack?
> I have always thought that reviewed-by implies that reviewer is Ok with
> the patch (imples Ack). Maybe I have mistaken?

I would rather not assume.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
