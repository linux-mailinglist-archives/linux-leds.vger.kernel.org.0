Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6503827A474
	for <lists+linux-leds@lfdr.de>; Mon, 28 Sep 2020 01:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgI0XKp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Sep 2020 19:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgI0XKo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Sep 2020 19:10:44 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2FCC0613CE
        for <linux-leds@vger.kernel.org>; Sun, 27 Sep 2020 16:10:44 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id AAEA7140A61;
        Mon, 28 Sep 2020 01:10:41 +0200 (CEST)
Date:   Mon, 28 Sep 2020 01:10:39 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com
Subject: Re: [PATCH] leds: Add documentation about possible subsystem
 improvements
Message-ID: <20200928011039.09260cff@nic.cz>
In-Reply-To: <20200927203308.GA25916@amd>
References: <20200925093318.GB20659@amd>
        <20200925164632.22bcd5af@nic.cz>
        <20200927203308.GA25916@amd>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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

On Sun, 27 Sep 2020 22:33:09 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> On Fri 2020-09-25 16:46:32, Marek Behun wrote:
> > On Fri, 25 Sep 2020 11:33:18 +0200
> > Pavel Machek <pavel@ucw.cz> wrote:
> >   
> > > +* Command line utility to manipulate the LEDs?
> > > +
> > > +/sys interface is not really suitable to use by hand, should we have
> > > +an utility to perform LED control?  
> > 
> > I will try to implement ledtool.  
> 
> Actually.. I started something. How do you like Rust?
> 

I've never written anything in Rust. I am not opposed to the language,
since I don't know much about it (although I've heart praise for Rust
from some people), but am not much enthuiastic about this program in
particular to be written in it.

For embedded systems, for example, gcc was for a long time the only
needed compiler. Now embedded system often need at least
Python/Lua/Perl. If I wanted to embed this ledtool and it is written in
Rust, I will need one more compiler and its environment.

So if you insist on Rust for ledtool, I will most probably pass, but I
am still interested in working on the kernel part of the LED subsystem.

Marek

> https://gitlab.com/tui/tui/-/blob/master/led/src/main.rs
> 
> In future, I'd like utility to accept both old and new names while we
> clean them up.
> 
> It would be also nice to have useful listing mode -- name, type,
> current brightness/trigger...
> 
> In future, it would be good to be able to set rgb led to particular
> color.
> 
> And probably user-friendly interface to access LEDs for particular
> ethernet interface would be nice.
> 
> Best regards,
> 									Pavel
> 

