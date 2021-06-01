Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C018638F0DC
	for <lists+linux-leds@lfdr.de>; Mon, 24 May 2021 18:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236216AbhEXQGj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 May 2021 12:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237258AbhEXQFP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 May 2021 12:05:15 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58438C08C5DE
        for <linux-leds@vger.kernel.org>; Mon, 24 May 2021 08:20:16 -0700 (PDT)
Received: from [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1] (unknown [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id AACCD202FE2;
        Mon, 24 May 2021 17:20:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621869615;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KKLQc2NBPOHNUHuTQ5VD+lESnzXxzbFhPv9iqnAedX0=;
        b=U8O/lCMbraND+fUwsMSmNU7BX7DyIgkOE5GmzcAlF+BsqPEh5+xyarQ9QMacOZXRoUsHdj
        cWTjPBxmX3lJ6iQXrr/Nxyc1PdPbTAcHuH0adEgDbUcasGzEH+cqBYlXK/5Kt8dX8AsCGF
        MNzJQqP2eKTWUP2vzwEEVraU0z8SjvOZFhbPNBeS4MXm9OexdrCyyl3EQ73V3USNvvsl9p
        LY9NwbZSOCEvxEFsjtFxbL69B3FmdOvuz9GdJFMOng/e9NcRN4nmBzhrInTfkPddOG6EtI
        hznHNDLlmof6dPNvyPl8+pjVC9LivmOuvhzOGR3RmS8ZJxDBkwfUW4PHLvsiTw==
Message-ID: <69c95adb6bafb8fbf69b9f79613606f62ba769e8.camel@svanheule.net>
Subject: Re: [PATCH v3 0/6] RTL8231 GPIO expander support
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Mon, 24 May 2021 17:20:13 +0200
In-Reply-To: <CAHp75Vf_dAfoMmziVLkEQ2Yr-e7Cj5=61ua5Q05Cyz-pLwVjpw@mail.gmail.com>
References: <cover.1620735871.git.sander@svanheule.net>
         <cover.1621809029.git.sander@svanheule.net> <YKr9G3EfrM34gCsL@lunn.ch>
         <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
         <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
         <CAHp75Vf_dAfoMmziVLkEQ2Yr-e7Cj5=61ua5Q05Cyz-pLwVjpw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Andy,

Forgot to reply to the sysfs suggestion.

On Mon, 2021-05-24 at 15:54 +0300, Andy Shevchenko wrote:
> On Mon, May 24, 2021 at 2:41 PM Sander Vanheule <sander@svanheule.net> wrote:
> > On Mon, 2021-05-24 at 10:53 +0300, Andy Shevchenko wrote:
> > > On Mon, May 24, 2021 at 4:11 AM Andrew Lunn <andrew@lunn.ch> wrote:
> 
> > > > >   - Introduce GPIO regmap quirks to set output direction first
> > > > 
> > > > I thought you had determined it was possible to set output before
> > > > direction?
> > > 
> > > Same thoughts when I saw an updated version of that patch. My
> > > anticipation was to not see it at all.
> > 
> > The two devices I've been trying to test the behaviour on are:
> >  * Netgear GS110TPP: has an RTL8231 with three LEDs, each driven via a pin
> >    configured as (active-low) GPIO. The LEDs are easy for a quick visual
> > check.
> >  * Zyxel GS1900-8: RTL8231 used for the front panel button, and an active-
> > low
> >    GPIO used to hard reset the main SoC (an RTL8380). I've modified this
> > board
> >    to change some of the strapping pin values, but testing with the jumpers
> > and
> >    pull-up/down resistors is a bit more tedious.
> > 
> > On the Netgear, I tested the following with and without the quirk:
> > 
> >    # Set as OUT-LOW twice, to avoid the quirk. Always turns the LED on
> >    gpioset 1 32=0; gpioset 1 32=0
> >    # Get value to change to input, turns the LED off (high impedance)
> >    # Will return 1 due to (weak) internal pull-up
> >    gpioget 1 32
> >    # Set as OUT-HIGH, should result in LED off
> >    # When the quirk is disabled, the LED turns on (i.e. old OUT-LOW value)
> >    # When the quirk is enabled, the LED remains off (i.e. correct OUT-HIGH
> > value)
> >    gpioset 1 32=1
> > 
> > Now, what's confusing (to me) is that the inverse doesn't depend on the
> > quirk:
> > 
> >    # Set as OUT-HIGH twice
> >    gpioset 1 32=1; gpioset 1 32=1
> >    # Change to high-Z
> >    gpioget 1 32
> >    # Set to OUT-LOW, always results in LED on, with or without quirk
> >    gpioset 1 32=0
> > 
> > Any idea why this would be (or appear) broken on the former case, but not on
> > the
> > latter?
> 
> GPIO tools for the shell are context-less. Can you reproduce this with
> the legacy sysfs interface?

Using the sysfs interface produced the same behaviour for both test cases.

E.g. case 1:
   # Set to output low
   echo out > direction; echo 0 > value
   # Change to input (with weak pull-up)
   echo in > direction
   # Try to set to output high
   # Fails to go high if the pin value is set before the direction
   echo high > direction


Best,
Sander

