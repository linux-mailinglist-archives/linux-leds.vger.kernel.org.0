Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE7A03BEF5
	for <lists+linux-leds@lfdr.de>; Mon, 10 Jun 2019 23:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbfFJVyH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 Jun 2019 17:54:07 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43469 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728651AbfFJVyH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 Jun 2019 17:54:07 -0400
Received: by mail-pl1-f195.google.com with SMTP id cl9so4160074plb.10
        for <linux-leds@vger.kernel.org>; Mon, 10 Jun 2019 14:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ilDXamFYOlEO8GWysgGDqHVYIEw5cY+v0lRtT4Q7uCA=;
        b=M54n+YZdWMqnrmPvi6vT8IJ8mylWm76h2+jOYmOVHfsu4lCiaKMQ1fk0oTQP4ru2nY
         ZCdqPnTKIyooUPaEM0H4AQ2XextdAG3axmuTwTqqvloFS2xJT1E3apq/5VUWy/AMUXkp
         eSGBRMMGb678qHmrEEdTy32gFDUA4i8/fzObI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ilDXamFYOlEO8GWysgGDqHVYIEw5cY+v0lRtT4Q7uCA=;
        b=A3IEIOyouifVYuc7tnwT+hcGl7zBpl+Ef2/CR3xRLjEB6o+AaYSKksmfq5UaqfNSU7
         Jwb8Cl0D5IcKBblIkCVHgteu5k0DVZrZeABJAqGDHrNV3e63iWXKwY3n3RAkeL+7gxR8
         h9+SQe+1+FaK60cMON3kV6/94PNy3tW7xai4Cq5NlDvR+Cxm6dhGHPkge6HyZfm76pzj
         xQTeB5rIxYowp/nVv7h+0RSfWsq/4A7ISa2YZFbB9pQNIWRWj0r7f3KVP1LKhDHrrGTL
         TNifblFvYZKjW2n+GbVX9iHbj7RttfSpsnJvY+ziOt8npMhw1z3tUXHS471xKxZ7Fg1w
         Qf1g==
X-Gm-Message-State: APjAAAX8qHcbZuE6ClCManE00t+V3ezUJi6rY0ubSIriqxsml4OlMXIK
        SJJTpJnwiEvFvUSNiUptbhA72A==
X-Google-Smtp-Source: APXvYqzMm6aINKOxX2KeUbtZPTnv+Z+yfCyTSVJfFV7qUiltd8qouqT/1lMB0iF/K2lBlTNTuW1Feg==
X-Received: by 2002:a17:902:e409:: with SMTP id ci9mr72703491plb.103.1560203646104;
        Mon, 10 Jun 2019 14:54:06 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id u7sm11324196pgl.64.2019.06.10.14.54.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 14:54:05 -0700 (PDT)
Date:   Mon, 10 Jun 2019 14:54:03 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Doug Anderson <dianders@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Richard Purdie <rpurdie@rpsys.net>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Brian Norris <briannorris@google.com>,
        Guenter Roeck <groeck@google.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCH v3 3/4] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Message-ID: <20190610215403.GC137143@google.com>
References: <20180208113032.27810-1-enric.balletbo@collabora.com>
 <20180208113032.27810-4-enric.balletbo@collabora.com>
 <20190607220947.GR40515@google.com>
 <20190608210226.GB2359@xo-6d-61-c0.localdomain>
 <819ecbcd-18e3-0f6b-6121-67cb363df440@collabora.com>
 <20190610203928.GA137143@google.com>
 <c8992414-8067-f82a-55f0-74fe9c2e1b3e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c8992414-8067-f82a-55f0-74fe9c2e1b3e@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Jun 10, 2019 at 11:02:27PM +0200, Enric Balletbo i Serra wrote:
> Hi Matthias,
> 
> On 10/6/19 22:39, Matthias Kaehlcke wrote:
> > Hi Enric
> > 
> > On Mon, Jun 10, 2019 at 12:00:02PM +0200, Enric Balletbo i Serra wrote:
> >> Hi Matthias,
> >>
> >> On 8/6/19 23:02, Pavel Machek wrote:
> >>> Hi!
> >>>
> >>>>> +	 * Note that this method is based on empirical testing on different
> >>>>> +	 * devices with PWM of 8 and 16 bits of resolution.
> >>>>> +	 */
> >>>>> +	n = period;
> >>>>> +	while (n) {
> >>>>> +		counter += n % 2;
> >>>>> +		n >>= 1;
> >>>>> +	}
> >>>>
> >>>> I don't quite follow the heuristics above. Are you sure the number of
> >>>> PWM bits can be infered from the period? What if the period value (in
> >>>> ns) doesn't directly correspond to a register value? And even if it
> >>>> did, counting the number of set bits (the above loops is a
> >>>> re-implementation of ffs()) doesn't really result in the dividers
> >>>> mentioned in the comment. E.g. a period of 32768 ns (0x8000) results
> >>>> in a divider of 1, i.e. 32768 brighness levels.
> >>>>
> >>
> >> Right, I think that only works on the cases that we only have one pwm cell, and
> >> looks like during my tests I did only tests on devices with one pwm cell :-(
> >>
> >> And as you point the code is broken for other cases (pwm-cells > 1)
> >>
> >>>> On veyron minnie the period is 1000000 ns, which results in 142858
> >>>> levels (1000000 / 7)!
> >>>>
> >>>> Not sure if there is a clean solution using heuristics, a DT property
> >>>> specifying the number of levels could be an alternative. This could
> >>>> also be useful to limit the number of (mostly) redundant levels, even
> >>>> the intended max of 4096 seems pretty high.
> >>>>
> >>
> >> Looking again looks like we _can not_ deduce the number of bits of a pwm, it is
> >> not exposed at all, so I think we will need to end adding a property to specify
> >> this. Something similar to what leds-pwm binding does, it has:
> >>
> >> max-brightness : Maximum brightness possible for the LED
> > 
> > Thanks for the confirmation that I didn't just miss some clever trick.
> > 
> > I also think that some kind of DT property is needed, I'll try to come
> > up with a reasonable name, keeping in mind that some devices might not
> > want to use the entire range of levels.
> > 
> 
> Note that, If I remember correctly, the original idea behind all these patches
> was provide a default curve with enough points following the  CIE 1931 formula
> (which describes how we perceive light). When default doesn't work for your
> hardware, you could play and define your own curve using the
> num-interpolated-steps property I.e:
> 
>  brightness-levels = <0 2048 4096 8192 16384 65535>;
>  num-interpolated-steps = <2048>;
>  default-brightness-level = <4096>;
> 
> Or even expose all the possible levels, like you do with your chromeos kernel.
> 
>  brightness-levels = <0 65535>;
>  num-interpolated-steps = <65535>;
>  default-brightness-level = <4096>;
> 
> The above should work independently of the bug found (that of course needs to be
> fixed)

Thanks for the info, indeed (keep) using a custom curve could be an
option.

I'm learning about the corresponding user space component of Chrome OS
as we speak. It looks like it's possible to specify the minimum
brightness level to use, which should do the trick, also making the OS
aware of the exponential nature of the backlight levels might help.
