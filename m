Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 159CB3BDD5
	for <lists+linux-leds@lfdr.de>; Mon, 10 Jun 2019 22:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389472AbfFJUwg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 Jun 2019 16:52:36 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43854 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388696AbfFJUwg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 Jun 2019 16:52:36 -0400
Received: by mail-pf1-f193.google.com with SMTP id i189so5962846pfg.10
        for <linux-leds@vger.kernel.org>; Mon, 10 Jun 2019 13:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TtEZnLcn0gJtYgNtefImovOXpRBGoVP9a9JO5/uO7mA=;
        b=FIBlK5D4o996BrhrHtNwAumtr52YJOJulb5R9MIVRrBQ+82uLHZkW9gnZBQLTf1nBk
         t33FwrKxeQCGeJE+eP9INkquw9PZAal/0UWz7pvRvRpqkFy9iDhy3LfFZNuHBd5zsviY
         2dbWvNOBSwthTmZZQi/K3uwowWF5thD5Ilioo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TtEZnLcn0gJtYgNtefImovOXpRBGoVP9a9JO5/uO7mA=;
        b=SOytYxaz+wC3UeNPU3vgEGzmReep8tvvJ3W8qNiJbrYajq5P0Ra4mbvphBDsaFzdBy
         8t8I9RE4oi2+WFdC4kXLkEa20OULMbcYA3HLKONtWp5A5j0IiCsDHvbrzhHnVfSOb4ez
         ZeuRSSUSL/pVsqkZ51DqjyKWZRblEsyyVcCFyn1SM1sGGgbyBo0SlcNqS7QL8HA2jLUV
         NYe46fOVeSgupOZYF+/y97qgbu6HNjeYdt6SHv5Tbk4azX7OS7r8juCyUHBNUu+ASZwP
         dRe+Bu/gogpq9OzBRmbYcTDS4hRnN5b4k5mFUOAS2GH6oWqbhY/6EdHDbdODb6F+z9HT
         0NKQ==
X-Gm-Message-State: APjAAAUIg9dMXkzSERdaxpBXUO7Z0052vMSOWz64ZW899NTY23N1T6Se
        T0Kq9TwbT0/yQKkeMnhuB31xwA==
X-Google-Smtp-Source: APXvYqw4NG+K4opJIst2h53KlxqakMJ7/NCRAA3/dd71Lr/ZKZxIVzfUqDSc18bQM52kaMEuesFGFw==
X-Received: by 2002:a62:778d:: with SMTP id s135mr4575261pfc.204.1560199955411;
        Mon, 10 Jun 2019 13:52:35 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id n7sm13961857pgi.54.2019.06.10.13.52.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 13:52:34 -0700 (PDT)
Date:   Mon, 10 Jun 2019 13:52:33 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
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
Message-ID: <20190610205233.GB137143@google.com>
References: <20180208113032.27810-1-enric.balletbo@collabora.com>
 <20180208113032.27810-4-enric.balletbo@collabora.com>
 <20190607220947.GR40515@google.com>
 <20190608210226.GB2359@xo-6d-61-c0.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190608210226.GB2359@xo-6d-61-c0.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On Sat, Jun 08, 2019 at 11:02:26PM +0200, Pavel Machek wrote:
> Hi!
> 
> > > +	 * Note that this method is based on empirical testing on different
> > > +	 * devices with PWM of 8 and 16 bits of resolution.
> > > +	 */
> > > +	n = period;
> > > +	while (n) {
> > > +		counter += n % 2;
> > > +		n >>= 1;
> > > +	}
> > 
> > I don't quite follow the heuristics above. Are you sure the number of
> > PWM bits can be infered from the period? What if the period value (in
> > ns) doesn't directly correspond to a register value? And even if it
> > did, counting the number of set bits (the above loops is a
> > re-implementation of ffs()) doesn't really result in the dividers
> > mentioned in the comment. E.g. a period of 32768 ns (0x8000) results
> > in a divider of 1, i.e. 32768 brighness levels.
> > 
> > On veyron minnie the period is 1000000 ns, which results in 142858
> > levels (1000000 / 7)!
> > 
> > Not sure if there is a clean solution using heuristics, a DT property
> > specifying the number of levels could be an alternative. This could
> > also be useful to limit the number of (mostly) redundant levels, even
> > the intended max of 4096 seems pretty high.
> > 
> > Another (not directly related) observation is that on minnie the
> > actual brightness at a nominal 50% is close to 0 (duty cycle ~3%). I
> > haven't tested with other devices, but I wonder if it would make
> > sense to have an option to drop the bottom N% of levels, since the
> > near 0 brightness in the lower 50% probably isn't very useful in most
> > use cases, but maybe it looks different on other devices.
> 
> Eye percieves logarithm(duty cycle), mostly, and I find very low brightness
> levels quite useful when trying to use machine in dark room.

I realized that the brightness level display on Chrome OS (= my test
device) is non-linear, and it isn't actually the lower 50% of levels
that is near 0 brightness, but 'only' about 20%.

> But yes, specifying if brightness is linear or exponential would be quite
> useful.

Agreed, this could help userspace with displaying a reasonable
brightness level.
