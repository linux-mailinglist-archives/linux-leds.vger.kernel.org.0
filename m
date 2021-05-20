Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9877638B7B7
	for <lists+linux-leds@lfdr.de>; Thu, 20 May 2021 21:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbhETTpX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 May 2021 15:45:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:52152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237966AbhETTpX (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 20 May 2021 15:45:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BED32611AD;
        Thu, 20 May 2021 19:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621539841;
        bh=mfUpKnWBH9YHSgWn5CR/E/VckYQfcAH6ErNJaVdjD1o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dBTWBL+ltW695t4h+3iYAv80cSOUZpKHpZadu/47o6iNZv4fWVYFF2n+c71kbOJu+
         MQ+zpX9VB9lgCwR8BPE9CDk3tovYX/CYJepxDVcILBUuPnh/GP7k70oa+J1rkx0B2D
         q4FU/7vRKYY0XxqjH4LETRw5Q1CNKAel1uYYLnRP2JmI9ew33iybXSC7w+90w3Bcwf
         LJUs+oBBDluFlOKk68JGxdy5Gc1tmzQQH2oImvBZlHKzKRib8PY+dSDHPImhGHRSSo
         TLQhtkwIYQR3/BYiVxoDWwCQqO7kIb6UzlbX2rynugT9qaz8ZawYRHjpP9GRnDW5AK
         zAa5lcyO6Rw4Q==
Date:   Thu, 20 May 2021 21:43:56 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linuxarm@huawei.com,
        mauro.chehab@huawei.com, gregkh@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 00/17] Adding support for controlling the leds found
 on Intel NUC
Message-ID: <20210520214356.0392f374@thinkpad>
In-Reply-To: <20210520211615.437e22ee@coco.lan>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <20210519111107.GC24621@duo.ucw.cz>
        <20210519141508.6e7a4d56@coco.lan>
        <20210519194115.GA31672@duo.ucw.cz>
        <20210520010720.32265ad4@coco.lan>
        <20210520181919.608568b2@thinkpad>
        <20210520211615.437e22ee@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 20 May 2021 21:16:15 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> So, assuming that we will have one trigger per each hardware
> state, it could have something like (names subject to change):
> 
> 	- hw:powerstate
> 	- hw:disk_activity
> 	- hw:ethernet_activity
> 	- hw:wifi_active
> 	- hw:power_limit
> 
> Right?

Yes, but we should really try to map ethernet_activity to netdev and
disk_activity to a potential blkdev trigger :-) That's my opinion.

> It still needs to indicate two other possible states:
> 
> 	- software controlled led;
> 	- led is disabled.
> 
> Setting led's brightness to zero is different than disabling
> it. 
>
> Disabling can be done via BIOS, but BIOS config doesn't allow
> setting the brightness. There are other difference on BIOS settings:
> it allow disabling each/all LED controls and/or to disable software 
> control of each LED.
> 
> So, we need a way at the API to uniquely identify when the LED
> is software-controlled and when it is disabled.
> Would it be something like:
> 
> 	- hw:disable
> 
> trigger? or better to implement it on a different way?

What is the functional difference (visible to the user) between zero
brightness and disabled LED? IMO if user says
  echo 0 >brightness
you can just disable the LED. Or is this impossible?
 
> > Is the speed of breathing/strobing also adjustable? Or only when
> > pulsing?  
> 
> Yes, speed is also adjustable, from 0.1 to 1.0 HZ, in 0.1 Hz
> (NUC 8 and above).
> 
> The NUC6 API is more limited than NUC8+: it has just two
> blink patterns (blink, fade), and only 3 frequencies are allowed
> (0.25 Hz, 0.50 Hz and 1.0 Hz).
> 
> > When this "hw:powerstate" trigger is enabled for this LED,
> > only then another sysfs files should appear in this LED's sysfs
> > directory.  
> 
> OK, makes sense. 
> 
> Out of curiosity: is it reliable to make sysfs nodes appear and
> disappear dynamically? Does inotify (or something similar) can
> be used to identify when such nodes appear/disappear?
> 
> I remember a long time ago I wanted to use something like that 
> at the media (or edac?) subsystem, but someone (Greg, I think)
> recommended otherwise due to some potential racing issues.

No idea, but I would guess yes.

> > I'd rather use one file for frequencies and one for intervals, and map
> > in to an array, but that is just my preference...  
> 
> By intervals are you meaning 1/frequency? So, basically exposing
> the frequency as two fields? If so, it sounds overkill to me to have both. 

Sorry, I meant one file for frequencies and one for patterns.
> 
> Btw, maybe instead of "blink_behavior" it could use "blink_pattern".
> 
> This would diverge from the datahseet name, but it probably describes
> better what will be controlled when blink is enabled:
> 
> 	- frequency (or inverval)
> 	- pattern
> 
> > Regarding the enum with 8 colors: are these
> > colors red, yellow, green, cyan, blue, magenta? Because if so, then
> > this is RGB with each channel being binary :) So you can again use
> > multicolor framework.  
> 
> The dual-colored ones aren't RGB. Two types are supported:
> 	- Blue/Amber
> 	- Blue/White

These would need a new API, ignore these for now.

Marek
