Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4F673491E0
	for <lists+linux-leds@lfdr.de>; Thu, 25 Mar 2021 13:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbhCYM0y (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Mar 2021 08:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbhCYM0x (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 Mar 2021 08:26:53 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F02BC06174A;
        Thu, 25 Mar 2021 05:26:51 -0700 (PDT)
Received: from thinkpad (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 9CA3F140AB2;
        Thu, 25 Mar 2021 13:26:48 +0100 (CET)
Date:   Thu, 25 Mar 2021 13:26:47 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Hermes Zhang <Hermes.Zhang@axis.com>
Cc:     "pavel@ucw.cz" <pavel@ucw.cz>, "dmurphy@ti.com" <dmurphy@ti.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lkml@axis.com" <lkml@axis.com>, kernel <kernel@axis.com>
Subject: Re: [PATCH 1/2] leds: leds-multi-gpio: Add multiple GPIOs LED
 driver
Message-ID: <20210325132647.3004fd73@thinkpad>
In-Reply-To: <7ea3f7e6ea7a464fa4bb59b94857a755@XBOX01.axis.com>
References: <20210324075631.5004-1-chenhui.zhang@axis.com>
        <20210324075631.5004-2-chenhui.zhang@axis.com>
        <20210324103431.4b945915@thinkpad>
        <7ea3f7e6ea7a464fa4bb59b94857a755@XBOX01.axis.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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

On Thu, 25 Mar 2021 06:04:43 +0000
Hermes Zhang <Hermes.Zhang@axis.com> wrote:

> > LED_FULL / LED_OFF are deprecated, don't use them.  
> 
> Then could I use just 0 (instead LED_OFF) and led_cdev->max_brightness
> 
> (instead of LED_FULL) here? The idea here is map the states defined in dts
> 
> to the full brightness range.

Yes, you can and should use 0 insted of LED_OFF.

> > +	priv->cdev.max_brightness = LED_FULL;
> > ???? max_brightness is not 255 (= LED_FULL). max_brightness must be
> > derived from the led-states property.  
> 
> Yeah, I will fix this. the max-brightness should for the whole LED,
> right? So
> 
> it will at same level with led-states.

max_brightness should be (the number of states - 1). I.e. if you have 4
gpios and the LED supports full 2^4 = 16 states, max brightness should
be 15.

Marek
