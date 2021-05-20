Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 216CE38B423
	for <lists+linux-leds@lfdr.de>; Thu, 20 May 2021 18:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233840AbhETQUp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 May 2021 12:20:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:59618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233647AbhETQUp (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 20 May 2021 12:20:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49F2E60FE8;
        Thu, 20 May 2021 16:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621527563;
        bh=0GmCmFU5wfCMbmtOzP0mBUf5uBtCwTwQbf8LadEdPK4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RfkVHOKkHVmFSDIelI+0Le6gh6OCdtiFzuysKzyJ5wZ5H7a/6lv2TmO95MYoGjUFa
         1Oz0hMX2sKUjqtQSHL2wcpdFYLRxR5UJzl2jZaZwTzlmp9Jdzku9wC+CcgdxRN0LgS
         dSgWM+lw0OSidS7vDJlvF/hgy4sNFclikr9JqBowUf3aajYriYuHJoJFXlzSEMwfXQ
         6tUyUmKkrtfnAV1qwJnC3ZDJr9fEW5Nu5fOH7EHlsOJmRHcP8TQDi3ZB59FQiSIIcR
         wKja+ONQLflpTy3DW2c/OEGCcT9HQF65OYXfidIucA0h/A2+ODWh7LtI7tkxAWT63x
         3zA8XJS8WlqTA==
Date:   Thu, 20 May 2021 18:19:19 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linuxarm@huawei.com,
        mauro.chehab@huawei.com, gregkh@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 00/17] Adding support for controlling the leds found
 on Intel NUC
Message-ID: <20210520181919.608568b2@thinkpad>
In-Reply-To: <20210520010720.32265ad4@coco.lan>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <20210519111107.GC24621@duo.ucw.cz>
        <20210519141508.6e7a4d56@coco.lan>
        <20210519194115.GA31672@duo.ucw.cz>
        <20210520010720.32265ad4@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 20 May 2021 01:07:20 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> So, the first thing that the API needs is a way to tell what LED
> is monitoring the device's power state.

If a LED can monitor the device's power state in HW, register a LED
private trigger for this LED. If the LED is configured into this state
by default, you can set this trigger to be the default_trigger prior
registering the LED. The name of this private trigger can be
"hw:powerstate" or something like that (I wonder what others will
think about this name).

> Then, for each power state (S0, S3, S5), define if the LED will
> be ON all the times or not.
> 
> The "slowing breathing" is one of the possible blink patterns.
> The driver supports 4 other blink patterns
> 
> 	- Solid - the LED won't blink;
> 	- Breathing - it looks like a sinusoidal wave pattern;
> 	- Pulsing - it looks like a square wave pattern;
> 	- Strobing - it turns ON suddenly, and then it slowly turns OFF.
> 
> The speed of the blink is also adjustable, ranging from 0.1 Hz to 1 Hz,
> on 0.1 Hz steps.

Is the speed of breathing/strobing also adjustable? Or only when
pulsing?

When this "hw:powerstate" trigger is enabled for this LED,
only then another sysfs files should appear in this LED's sysfs
directory.

> ---
> 
> Let me explain this specific part of the API from my original proposal.
> 
> Those are the led names from the datasheets (NUC 8 and above),
> and my proposal for the sysfs class directory name:
> 
> =============	===============================
> LED name	sysfs
> =============	===============================
> Skull		``/sys/class/leds/nuc::skull``
> Skull eyes	``/sys/class/leds/nuc::eyes``
> Power		``/sys/class/leds/nuc::power``
> HDD		``/sys/class/leds/nuc::hdd``
> Front1		``/sys/class/leds/nuc::front1``
> Front2		``/sys/class/leds/nuc::front2``
> Front3		``/sys/class/leds/nuc::front3``
> =============	===============================
> 
> For each of the above, there's the need to identify what
> hardware function is monitored (if any).
> 
> My proposal were to add an "indicator" node (the name came from
> the Intel datasheets) that shows what led will monitor the power state.
> 
> Then, one blink_behavior and one blink_frequency per power state,
> e. g.:
> 
>     /sys/class/leds/nuc::front1
>     |-- indicator
>     |-- s0_blink_behavior
>     |-- s0_blink_frequency
>     |-- s3_blink_behavior
>     |-- s3_blink_frequency
>     |-- s5_blink_behavior
>     `-- s5_blink_frequency

I'd rather use one file for frequencies and one for intervals, and map
in to an array, but that is just my preference...

> 
> PS.: I don't care much about what names we'll use. Feel free to
> rename them, if you think the above is not clear or generic enough.
> 
> -
> 
> To make part of the API complete, there's also the need of a node
> to control the max brightness that the leds will achieve at the
> ON state, and another one to control the color on each state,
> as one could define, let's say, "white" when powered on, "blue"
> when suspended and "yellow" when hibernating. The colors at the
> NUC I have are RGB (but other models can use an enum for the
> supported colors).
> 
>     /sys/class/leds/nuc::front1
>     |-- s0_brightness
>     |-- s0_color		# only shown on colored leds
>     |-- s3_brightness
>     |-- s3_color		# only shown on colored leds
>     |-- s0_brightness
>     `-- s5_color		# only shown on colored leds

If the BIOS reports a LED being full RGB LED, you should register it
via multicolor framework. Regarding the enum with 8 colors: are these
colors red, yellow, green, cyan, blue, magenta? Because if so, then
this is RGB with each channel being binary :) So you can again use
multicolor framework.
