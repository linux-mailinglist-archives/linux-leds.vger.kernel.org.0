Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 426DD414AA4
	for <lists+linux-leds@lfdr.de>; Wed, 22 Sep 2021 15:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbhIVNis (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Sep 2021 09:38:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:53696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230512AbhIVNis (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 22 Sep 2021 09:38:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E86F60F6E;
        Wed, 22 Sep 2021 13:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632317838;
        bh=ioDw3nm6uVfM2mfqhojI8XOMaKV3Y3t43sTlhOH3H6U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AyIu204zsdbhMSLA8GeyrhDapBueEtvfURBrRmavoJzm679deOvXz5Ku1kicuL+uU
         /fiZqedJa5WUr4Ggl+s2aynrLICibnx7xus8UTlUe4Y0sEtNIozaIfZuqeOuRBA+wE
         OrY3+oGe0oAVS6y69G/PC7zmT9eQT8/p7sibsUkA=
Date:   Wed, 22 Sep 2021 15:37:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Luka Kovacic <luka.kovacic@sartura.hr>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Max.Merchel@tq-group.com, Oleksij Rempel <linux@rempel-privat.de>,
        Daniel Palmer <daniel@0x0f.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        pavo.banicevic@sartura.hr, Jonathan Corbet <corbet@lwn.net>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, goran.medic@sartura.hr,
        luka.perkov@sartura.hr, robert.marko@sartura.hr
Subject: Re: [PATCH v9 2/7] drivers: mfd: Add a driver for IEI WT61P803
 PUZZLE MCU
Message-ID: <YUsxi2KbS8lY0b9q@kroah.com>
References: <20210824124438.14519-1-luka.kovacic@sartura.hr>
 <20210824124438.14519-3-luka.kovacic@sartura.hr>
 <YUsWeWlfanGMCpT8@kroah.com>
 <CAMuHMdU9Mes_kyOeRbgzcvCRLLj0_N_na88REEqejdrhSuzByA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU9Mes_kyOeRbgzcvCRLLj0_N_na88REEqejdrhSuzByA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Sep 22, 2021 at 02:18:49PM +0200, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Wed, Sep 22, 2021 at 1:41 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Tue, Aug 24, 2021 at 02:44:33PM +0200, Luka Kovacic wrote:
> > > +++ b/drivers/mfd/iei-wt61p803-puzzle.c
> > > @@ -0,0 +1,908 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/* IEI WT61P803 PUZZLE MCU Driver
> > > + * System management microcontroller for fan control, temperature sensor reading,
> > > + * LED control and system identification on IEI Puzzle series ARM-based appliances.
> > > + *
> > > + * Copyright (C) 2020 Sartura Ltd.
> >
> > It is 2021 now :(
> 
> IANAL, but if the driver was published first in 2020 (v1 of the patch),
> "2020" should be fine.

THis is a v9, the odds that this file has not been touched at all since
2020 is probably pretty low.

At the least, it better be changed after my review of it :)

thanks,

greg k-h
