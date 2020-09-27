Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E78E27A475
	for <lists+linux-leds@lfdr.de>; Mon, 28 Sep 2020 01:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgI0XPW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Sep 2020 19:15:22 -0400
Received: from lists.nic.cz ([217.31.204.67]:40896 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726316AbgI0XPW (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 27 Sep 2020 19:15:22 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id A6C0D140A4F;
        Mon, 28 Sep 2020 01:15:20 +0200 (CEST)
Date:   Mon, 28 Sep 2020 01:15:20 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com
Subject: Re: [PATCH] leds: Add documentation about possible subsystem
 improvements
Message-ID: <20200928011520.6e13e9aa@nic.cz>
In-Reply-To: <20200928011039.09260cff@nic.cz>
References: <20200925093318.GB20659@amd>
        <20200925164632.22bcd5af@nic.cz>
        <20200927203308.GA25916@amd>
        <20200928011039.09260cff@nic.cz>
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

On Mon, 28 Sep 2020 01:10:39 +0200
Marek Behun <marek.behun@nic.cz> wrote:

> On Sun, 27 Sep 2020 22:33:09 +0200
> Pavel Machek <pavel@ucw.cz> wrote:
> 
> > 
> > Actually.. I started something. How do you like Rust?
> >   
> 
> I've never written anything in Rust. I am not opposed to the language,
> since I don't know much about it (although I've heart praise for Rust
> from some people), but am not much enthuiastic about this program in
> particular to be written in it.
> 
> For embedded systems, for example, gcc was for a long time the only
> needed compiler. Now embedded system often need at least
> Python/Lua/Perl. If I wanted to embed this ledtool and it is written in
> Rust, I will need one more compiler and its environment.
> 
> So if you insist on Rust for ledtool, I will most probably pass, but I
> am still interested in working on the kernel part of the LED subsystem.
> 
> Marek
> 

In fact until recently I managed to avoid Rust on my system (Gentoo),
and was annoyed when suddenly one library needed Rust as a dependency
(librsvg) and Rust had to be installed.

Not because of dislike of Rust, but because of dislike of the idea of
having compilers for 50 different languages on the system...

Marek
