Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C849542363
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2019 13:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408440AbfFLLDf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Jun 2019 07:03:35 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42440 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408429AbfFLLDe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Jun 2019 07:03:34 -0400
Received: by mail-wr1-f65.google.com with SMTP id x17so1121115wrl.9
        for <linux-leds@vger.kernel.org>; Wed, 12 Jun 2019 04:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fKEuXpKhwW6QYirKkEZUMz7KKtRy+gRE2kTuvjwe5Og=;
        b=RDAvMiYL1/E12jVZRrvjScX/Ri1mztuZtwe0YjXLDoQGwJ9hsU9dFZTKzXhD6yrfAF
         +vEPWD7W9C5F6bo8JKZBpBtEEDDsNrJ9BVvdiyOwNe+1OHwDE7+ylO2qqSI7KbSbM9bx
         jdVCxvg4AKjGJ/Fjr53LH24cus/xugKFsCWba7KrOcHFzBhgwOhCWINDQ1wbVrY7OQyU
         u/UBe878vavY48j4914n3YRLR28cDacRENJaFiMgeEIpJz5lpyZp9gAfovlXUsyR5wjr
         MWMd4r+tDMlwHQ73jQuuohiLcBUV1aIw655M30SX/uocU5kw5+1XTSlofcoBzjy3TvBp
         ry1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fKEuXpKhwW6QYirKkEZUMz7KKtRy+gRE2kTuvjwe5Og=;
        b=DSMxhvbGe9cZphn4REGIDcZOcCSDf1wuvcAbQQWvBiQL6gWa4dy/iUgGs+nYd/wWSW
         u9hlF2uhnfJ4NPtdOD9fsXtnHs07RmVL+FK9KNzCqJOlk1NDTwDgzRLLEuViPpxkS8dU
         sCUYTD5Ar5QHPyz4EGsR8ftULsiRbpL2RnRHdPI3/CR5QA8CO/eeD5tLWdCHTU9P8jtq
         dwiHVkXdY3ZA2Z1/o7vKW7W0q99feKh6WelNJmEV6N4lfrdjI8sth4avFigKJW7x+tce
         UJHUPe3KfsbCh9ajItA8SXe/ZA5fZlQsD62gzCHEQI6yfEZY20lc4nO33EtUdeb9Gbat
         CouA==
X-Gm-Message-State: APjAAAWfyLcUYl4W/RmxN9nmF410/vgNGVcmwJIbhrgtiFVoyytkJLWN
        r3fMxwEVwib7DTLzhb1ID7aNYw==
X-Google-Smtp-Source: APXvYqz9I7iqIVvewoxRxb2oZe1pv8KmSN3qpUEh/9sDe+JKW7LsnC39cGT3KhS/4+zBqXYPYzFNtg==
X-Received: by 2002:a5d:53ca:: with SMTP id a10mr41666584wrw.131.1560337412723;
        Wed, 12 Jun 2019 04:03:32 -0700 (PDT)
Received: from holly.lan ([185.80.132.160])
        by smtp.gmail.com with ESMTPSA id j132sm7583807wmj.21.2019.06.12.04.03.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 04:03:31 -0700 (PDT)
Date:   Wed, 12 Jun 2019 12:03:25 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Brian Norris <briannorris@google.com>, Pavel Machek <pavel@ucw.cz>,
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
Message-ID: <20190612110325.xdn3q2aod52oalge@holly.lan>
References: <20180208113032.27810-1-enric.balletbo@collabora.com>
 <20180208113032.27810-4-enric.balletbo@collabora.com>
 <20190607220947.GR40515@google.com>
 <20190608210226.GB2359@xo-6d-61-c0.localdomain>
 <20190610205233.GB137143@google.com>
 <20190611104913.egsbwcedshjdy3m5@holly.lan>
 <CA+ASDXOq7KQ+f4KMh0gaC9hvXaxBDdsbiJxiTbeOJ9ZVaeNJag@mail.gmail.com>
 <20190611223019.GH137143@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611223019.GH137143@google.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Jun 11, 2019 at 03:30:19PM -0700, Matthias Kaehlcke wrote:
> On Tue, Jun 11, 2019 at 09:55:30AM -0700, Brian Norris wrote:
> > On Tue, Jun 11, 2019 at 3:49 AM Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > > This is a long standing flaw in the backlight interfaces. AFAIK generic
> > > userspaces end up with a (flawed) heuristic.
> > 
> > Bingo! Would be nice if we could start to fix this long-standing flaw.
> 
> Agreed!
> 
> How could a fix look like, a sysfs attribute? Would a boolean value
> like 'logarithmic_scale' or 'linear_scale' be enough or could more
> granularity be needed?

Certainly "linear" (this device will work more or less correctly if the
userspace applies perceptual curves). Not sure about logarithmic since
what is actually useful is something that is "perceptually linear"
(logarithmic is merely a way to approximate that).

I do wonder about a compatible string like most-detailed to
least-detailed description. This for a PWM with the auto-generated
tables we'd see something like:

cie-1991,perceptual,non-linear

For something that is non-linear but we are not sure what its tables are
we can offer just "non-linear".

> 
> The new attribute could be optional (it only exists if explicitly
> specified by the driver) or be set to a default based on a heuristic
> if not specified and be 'fixed' on a case by case basis. The latter
> might violate "don't break userspace" though, so I'm not sure it's a
> good idea.

I think we should avoid any heuristic! There are several drivers and we
may not be able to work through all of them and make the correct
decision.

Instead one valid value for the sysfs should be "unknown" and this be
the default for drivers we have not analysed (this also makes it easy to
introduce change here).

We should only set the property to something else for drivers that have
been reviewed.

There could be a special case for pwm_bl.c in that I'm prepared to
assume that the hardware components downstream of the PWM have a
roughly linear response and that if the user provided tables that their
function is to provide a perceptually comfortable response.


Daniel.
