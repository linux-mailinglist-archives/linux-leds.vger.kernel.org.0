Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1C8C33859E
	for <lists+linux-leds@lfdr.de>; Fri, 12 Mar 2021 07:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhCLF7e (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 12 Mar 2021 00:59:34 -0500
Received: from lists.nic.cz ([217.31.204.67]:59370 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229470AbhCLF70 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 12 Mar 2021 00:59:26 -0500
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 4FBC21409D7;
        Fri, 12 Mar 2021 06:59:24 +0100 (CET)
Date:   Fri, 12 Mar 2021 06:59:22 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Hermes Zhang <Hermes.Zhang@axis.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        kernel <kernel@axis.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: leds-dual-gpio: Add dual GPIO LEDs driver
Message-ID: <20210312065922.53468d07@nic.cz>
In-Reply-To: <161920e0746e4c0daff7f83163b71677@XBOX03.axis.com>
References: <20210311130408.10820-1-chenhui.zhang@axis.com>
        <20210311163814.74c1885f@nic.cz>
        <20210311163951.0046fb5c@nic.cz>
        <161920e0746e4c0daff7f83163b71677@XBOX03.axis.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 12 Mar 2021 04:48:52 +0000
Hermes Zhang <Hermes.Zhang@axis.com> wrote:

> > 
> > Sorry, leds-regulator has only a binary state LED.
> > 
> > Maybe you could extend leds-regulator to be able to use all regulator states?
> > 
> > Or you can extend leds-gpio driver to support N states via log N gpios,
> > instead of adding new driver.  
> 
> It seems a good idea to extend leds-gpio, so in my case, I should have such dts:
> 
>  63         leds {
>  64                 compatible = "gpio-leds";
>  65 
>  66                 recording_front {
>  67                         label = "recording_front:red";
>  68                         gpios = <&gpio 130 GPIO_ACTIVE_HIGH>, <&gpio 129 GPIO_ACTIVE_HIGH>;
>  69                         default-state = "off";
>  70                 };
>  71         };
> 
> For my case, two leds is enough, but it sill easy to extend the support number bigger than two. And the length of gpios array is not fixed, so it could compatible with exist "gpio-leds" dts, right? 
> 
> If this idea work, should I create a new commit or still in this track (V2)?

However you want :)

Look at the states property of gpio regulator:
https://www.kernel.org/doc/Documentation/devicetree/bindings/regulator/gpio-regulator.yaml

It is possible to have a multi-GPIO LED which brightness is set via N
GPIOs and it has 2^N brightness states encoded by binary values of
those GPIOs, but it is entirely possible to have less than 2^N states,
or that the states are encoded in a different way.

In the first version though imlpemenent just the simplest case: N GPIOs
with 2^N states.

Marek
