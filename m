Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99EB12718E0
	for <lists+linux-leds@lfdr.de>; Mon, 21 Sep 2020 03:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgIUBAr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Sun, 20 Sep 2020 21:00:47 -0400
Received: from lists.nic.cz ([217.31.204.67]:59602 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726221AbgIUBAr (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 20 Sep 2020 21:00:47 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 2F89A13FF1D;
        Mon, 21 Sep 2020 03:00:45 +0200 (CEST)
Date:   Mon, 21 Sep 2020 03:00:44 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     "Adrian Schmutzler" <mail@adrianschmutzler.de>
Cc:     "'Pavel Machek'" <pavel@ucw.cz>, <linux-leds@vger.kernel.org>
Subject: Re: How to name multiple LEDs of the same type and color
Message-ID: <20200921030044.304f0d5c@nic.cz>
In-Reply-To: <00f701d68fa6$2778ce60$766a6b20$@adrianschmutzler.de>
References: <00ab01d68eca$d2d4fcc0$787ef640$@adrianschmutzler.de>
        <20200920110810.GA15219@duo.ucw.cz>
        <00f701d68fa6$2778ce60$766a6b20$@adrianschmutzler.de>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 21 Sep 2020 01:31:23 +0200
"Adrian Schmutzler" <mail@adrianschmutzler.de> wrote:

> > >               link3 { 
> > >                       function = LED_FUNCTION_RSSI; 
> > >                       color = <LED_COLOR_ID_GREEN>; 
> > >                       gpios = <&gpio 15 GPIO_ACTIVE_LOW>; 
> > >               }; 
> > >       };   
> > Well, this is not really three LEDs. This is more like... LED meter 
> > composed of three LEDs. And we don't have good support for that. 
> > But I guess we'll need it one day. There were some previous attempts: 
> > https://lwn.net/Articles/802967/ 
> > Do you plan to control RSSI LEDs from kernel?   
> 
> To be honest, I mostly sent this patch for completeness.
> 
> OpenWrt uses a very simple process written in C for updating these LEDs, which is quite old and has essentially remained unchanged for years, but does its job.
> I personally don't think there will be overwhelming interest in touching this and migrate it to whatever different implementation without a pressing need.
> 
> My main interest here was/is that I started to evaluate how OpenWrt can migrate from LED labels to the "new" color/function syntax and to me the rssi leds are a dedicated type that should be supported.
> So I fear I won't be helpful for the implementation of RSSI leds in the kernel in general.
> 
> For the three leds vs. set of leds discussion: Note that we are interested in (and already do) exposing each LED to the user individually (in user-space via sysfs), so the user can redefine the purpose of the LED freely based on his/her desire. Therefore, a total abstraction of the set of LEDs as a single entity would be detrimental for us here.
> 
> Best
> 
> Adrian 

This is interesting. How does this work? Better signal => faster
blinking?

Where is the signal strength taken from?

Marek
