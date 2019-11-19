Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B294C102EA3
	for <lists+linux-leds@lfdr.de>; Tue, 19 Nov 2019 22:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbfKSVwl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Nov 2019 16:52:41 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43282 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbfKSVwl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Nov 2019 16:52:41 -0500
Received: by mail-oi1-f194.google.com with SMTP id l20so20471230oie.10;
        Tue, 19 Nov 2019 13:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xM3EqgbuqqFTuFds9OXw93bcS82NPSO+DWIZagqqiLs=;
        b=YkTGgkMXI89sxk3/u7tRBG3M7mmU9sCH0ke7b0Y5IBkjP9TWTdyAaldxKGoaILeakO
         2Rh/WekqWEpSMRymaXo4m6vwncBPPqQas+ybA2EAoAhGFoZDj9w9NayQJGbn+XMFdnnk
         r3A8dbPFUE9A6W1rdZqeRuS3ZwpqBb9ZXlHNDV2YwUttC4DVI7o2nA7FieOhkhRLv3Nv
         k5PAB2q0sClXMZcrXWWPg2BavWlR9tr1vx3UeWiyPNC2RzeQJrEjPuIhsvZ2T6a5oE1f
         u+GaEpnmRq1d/k5tOTR+xgFryztcSi+3NEii1nwbv9tRnk+GyNXnlqwpWpeBXEL9+zpF
         VVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xM3EqgbuqqFTuFds9OXw93bcS82NPSO+DWIZagqqiLs=;
        b=cvkcaO1OLh3sSvcGBubQjCKPzV3SiyTuFq5T1lFLqiY6p0Y2+a4M+NHkaSNYLybqXN
         3fLyDkLOoQLk8PmA3cFj1r+hO4CUm4FRg6zhdnWx2CkoKizIDTdfBzivOGtHNJWhpBis
         Y7yexsGmhiyOdRcBsSdgL+/3bfF9N02MIXeLZuvbzn1RM7dHdbXh2AfLEyuGthdN4vkd
         Ws5u11ToheVUpRNxgGR37rzNcx+j2L2zx2qoxrI4U1+/8hIe14jm/3xiw5ZboalxAqht
         NIeuxaoToxrAeg4PVHjSDEVhF0CEgwgdlWMnvNrdtPzDGe803XReUuWoqjdJ04X/kUzZ
         M4AQ==
X-Gm-Message-State: APjAAAVAhtxn+4/83kx11xtxG5W5Vo2fTR0+KIxSS5t4VH0FpPgkjgYN
        CsVD1ZU6H+Qw4fYtMdFz1W94TDfthGY6D7eL3vE=
X-Google-Smtp-Source: APXvYqx3Y0smPJ5QwrudTtg09uEj0XidrI88Qy1PrTuOO30PuYTQPVaARl3wM9JjPFM7N6h1SXT9xS1Ko58ZZIW+qYs=
X-Received: by 2002:a05:6808:3a1:: with SMTP id n1mr5973808oie.86.1574200359962;
 Tue, 19 Nov 2019 13:52:39 -0800 (PST)
MIME-Version: 1.0
References: <20191119154611.29625-1-TheSven73@gmail.com> <20191119154611.29625-4-TheSven73@gmail.com>
 <23217b5b-90f4-748a-c008-9ae7ef82c6dd@ti.com>
In-Reply-To: <23217b5b-90f4-748a-c008-9ae7ef82c6dd@ti.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Tue, 19 Nov 2019 16:52:29 -0500
Message-ID: <CAGngYiXcpfkTyhJ4qRwD+tVVGODa6+e3cqQD8s9W9n8axuq_-g@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] leds: tps6105x: add driver for mfd chip led mode
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan / Jacek,

On Tue, Nov 19, 2019 at 1:33 PM Dan Murphy <dmurphy@ti.com> wrote:
>
> Prefer device_* calls as opposed to of_* calls.

Ok, I see now how this is done on lp8860 and lm3692x.

So for this led driver to be correct, it should:
- use device_* calls
- use led_init_data (i.e. devm_led_classdev_register_ext)
- drop pdata support for the led subdriver (nice to have)

Unfortunately I can't, because the required infrastructure isn't present in
the 4.19 vendor kernel I'm using.

I only have a single tps6105x chip in my target system, so I don't have
a requirement for devicetree led naming.

So for v3 I will hard-code the led name to 'tps6105x::torch' which should
comply with the naming convention.
