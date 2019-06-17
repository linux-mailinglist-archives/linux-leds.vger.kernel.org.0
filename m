Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 618E4490BB
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jun 2019 22:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727765AbfFQUDS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 Jun 2019 16:03:18 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45319 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726443AbfFQUDS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Jun 2019 16:03:18 -0400
Received: by mail-pl1-f194.google.com with SMTP id bi6so4562509plb.12
        for <linux-leds@vger.kernel.org>; Mon, 17 Jun 2019 13:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+6f59ZFOs1PSocx1cXbKIlzxOSpO4grS25QzNht0IBo=;
        b=HAUdFKJJhiMKymZJQB2BDPSJoE/iyuSm4Zoz28SB10+kykqiY9fWV8m3ZhHifNYLQ0
         gianVGa6NRSwnraiQxQPnn47Y8vu2BUM9Ii2feCs9YyJI3a1/UdASYpWOtlBtcDsOoCE
         4wNhyON7emBZtf6bZmyiPF2newLP+1pJGDKwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+6f59ZFOs1PSocx1cXbKIlzxOSpO4grS25QzNht0IBo=;
        b=AK9wl2rcd87nCZ9KYuZXKbQ7IlFnsdsdO2m71dy9paMks5FMOMdgiOLLmLa1ObGN4n
         mM1ieGJplg4MnJl1F63WizLOTS8qyJgpqoSDNqvpPHii2mS8fiU/mjO4LZbIGCeZGfK1
         Jm+rG9NWY66+xVqAVF483oOdWv4hZGF3kz3zbqfOiNulco97PR/26e3pMUu+rZBy3gxD
         Cdv0h8aXUJiuO4xFNpkmjKU/Fyh7ROqh3+WcUSVut0UdTSTt7cJEeSgaFSI4bFUuUekH
         hGIkX7KSzZ4qQnxgEmyws0Cyrria0sVvxIZIfZOl3WFxdMcPGtw9xvL8fTa8GjZCoSmV
         Wlug==
X-Gm-Message-State: APjAAAWzguumzgkI3twsKaq8NuFPz3OLuyla3xMIiTWSAsnxT59uJEDB
        RdvYz31zlo7qWkESBm/LcVF+Sg==
X-Google-Smtp-Source: APXvYqwHSEuRqTDvpMokDsWAY4XbioaGwEV5S7azKc4M2N6fF8IpbDcv8EnRsu1EG2Q/oxRkJNkzXw==
X-Received: by 2002:a17:902:8c83:: with SMTP id t3mr82969184plo.93.1560801797840;
        Mon, 17 Jun 2019 13:03:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id a3sm13221952pfo.49.2019.06.17.13.03.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 13:03:16 -0700 (PDT)
Date:   Mon, 17 Jun 2019 13:03:14 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Brian Norris <briannorris@google.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Doug Anderson <dianders@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Richard Purdie <rpurdie@rpsys.net>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Guenter Roeck <groeck@google.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        kernel@collabora.com
Subject: Re: [PATCH v3 3/4] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Message-ID: <20190617200314.GT137143@google.com>
References: <20180208113032.27810-4-enric.balletbo@collabora.com>
 <20190607220947.GR40515@google.com>
 <20190608210226.GB2359@xo-6d-61-c0.localdomain>
 <20190610205233.GB137143@google.com>
 <20190611104913.egsbwcedshjdy3m5@holly.lan>
 <CA+ASDXOq7KQ+f4KMh0gaC9hvXaxBDdsbiJxiTbeOJ9ZVaeNJag@mail.gmail.com>
 <20190611223019.GH137143@google.com>
 <20190612110325.xdn3q2aod52oalge@holly.lan>
 <20190612192642.GK137143@google.com>
 <20190617130150.GA21113@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190617130150.GA21113@amd>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On Mon, Jun 17, 2019 at 03:01:51PM +0200, Pavel Machek wrote:
> Hi!
> 
> > > Certainly "linear" (this device will work more or less correctly if the
> > > userspace applies perceptual curves). Not sure about logarithmic since
> > > what is actually useful is something that is "perceptually linear"
> > > (logarithmic is merely a way to approximate that).
> > > 
> > > I do wonder about a compatible string like most-detailed to
> > > least-detailed description. This for a PWM with the auto-generated
> > > tables we'd see something like:
> > > 
> > > cie-1991,perceptual,non-linear
> > > 
> > > For something that is non-linear but we are not sure what its tables are
> > > we can offer just "non-linear".
> > 
> > Thanks for the feedback!
> > 
> > It seems clear that we want a string for the added flexibility. I can
> > work on a patch with the compatible string like description you
> > suggested and we can discuss in the review if we want to go with that
> > or prefer something else.
> 
> Compatible-like string seems overly complicated.

I see the merit in the sense that it allows to provide more precision
for if userspace wants/needs it, without requiring userspace to know all
possible (future) options. If userspace wants to keep things simple it
can just check for check for "s == 'non-linear'" and
"s.ends_with(',non-linear')"

In any case, I posted a first version of the patch:

https://lore.kernel.org/patchwork/patch/1088760/

Maybe best to center the discussion there?

> > > Instead one valid value for the sysfs should be "unknown" and this be
> > > the default for drivers we have not analysed (this also makes it easy to
> > > introduce change here).
> > 
> > An "unknown" value sounds good, it allows userspace to just do what it
> > did/would hace done before this attribute existed.
> 
> What about simply not presenting the attribute when we don't have the
> information?

I'm open to either, I mentioned it earlier and Daniel seemed to prefer
the 'unknown' value so I went with it in the first version (it's also
slightly less code).

Cheers

Matthias
