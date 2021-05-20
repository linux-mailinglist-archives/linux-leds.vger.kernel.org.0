Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1423338B813
	for <lists+linux-leds@lfdr.de>; Thu, 20 May 2021 22:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235659AbhETUI3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 May 2021 16:08:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:55594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234708AbhETUI3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 20 May 2021 16:08:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DADC6121E;
        Thu, 20 May 2021 20:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621541227;
        bh=pFf9otXpGIOgWFDqx2eADeNTgOtcU5w03TbAb82o17s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kusykJbJM5cStbYzo5DKswJ2pXwb1ATZyf1LPFRnjDS88LCDH/KFA9R7DseZKqnJp
         AJa12fhb2mHzQlNZnTof2uLku/QPXmB1FnVQliyLaXNXnhImLwzdMoVO5pSmpN5+tn
         wpJ1XTqIJHHP+YnFIQfNM7cnp/4Eimq80Z5tlZtpgvaru6G/woNRVODv/ZOgMceU0+
         OwTa1seIYtNUAPHlG/jXterBT0bJEmLmajvg0+Z2vUSpvMetnXY8cN3onSbamvL/xH
         E8VLO63DkZhoTC8RqaGr/KKlNk0IUfPQZVC1qoUSebBM2G7XZjCVmboQerGlA/k8+q
         kVYfCkSJIRbZQ==
Date:   Thu, 20 May 2021 22:07:03 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 16/17] leds: leds-nuc: add support for changing the
 ethernet type indicator
Message-ID: <20210520220703.5a86b994@thinkpad>
In-Reply-To: <20210520205933.3cfc57a9@coco.lan>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <792598f4a1a3219b6517057c92559b0f0a95b419.1621349814.git.mchehab+huawei@kernel.org>
        <20210519100253.49b155e9@thinkpad>
        <20210519121812.4285b3ea@coco.lan>
        <20210519141102.0161a9d9@thinkpad>
        <20210519162413.4feeab02@coco.lan>
        <20210519175503.567e6ecc@thinkpad>
        <20210519203014.1838de3a@coco.lan>
        <20210520130014.7189a315@dellmb>
        <20210520180028.495f94e4@coco.lan>
        <20210520183633.084a8c3f@thinkpad>
        <20210520205933.3cfc57a9@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 20 May 2021 20:59:33 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> > On the contrary, there is something the driver can do with these
> > attributes. If the specific combination is not supported, the driver
> > should return -EOPNOTSUPP in the trigger_offload method and let the
> > netdev trigger do the work in software.   
> 
> Letting netdev to trigger is something we don't want to allow, as this
> can cause side effects, making it doing slow the system due to BIOS calls
> for no good reason.
>
> > What exactly do the LEDs do
> > when configured to blink on activity on a network device? Do they just
> > blink on RX/TX, and otherwise are off?  Or are they on when a cable is
> > plugged, blink on rx/tx and otherwise off?  
> 
> They are on when a cable is plugged, blink on rx/tx and otherwise off.
> 
> Worth mentioning that, besides the LEDs controlled by this driver, each
> RJ-45 port also a couple leds that behave just like normal RJ-45 ones: 
> a yellow led for Ethernet PHY detection and a green one for traffic.

So what the LED does when configured for ethernet is almost equivalent
to netdev setting [link=1, rx=1, activity=1]. Almost because we still have
the correct device setting and interval setting.

Theoretically what you can do is deny the netdev trigger for every
other netdev setting (since, according to you, it would use too much
CPU time in BIOS via software control). This could be done by the
offload method returning another error value, or maybe just returning 0
and printing info about this into kernel log. I wonder what others
think about this possible resolution.

> > Have you looked into DSDT and SSDT tables?  
> 
> It doesn't help.

Pity :(

> > If even DSDT data is not enough to reliably find out which of the 2
> > network interfaces belongs to which LED setting, the worst case scenario
> > here is for your driver to need to have a list containing this
> > information for specific motherboards, and other people can then extend
> > the driver to support their motherboards as well.  
> 
> Needing something like that sucks and it is hard to maintain,
> and depends on people reporting issues.

I don't see much difference between this and various drivers having
different OF compatible strings for different chips all supported by
one driver.

> Ok, on some cases, there are no other options, but this is not
> the case here, as the user of such API that wants to monitor
> just a single interface (default is to monitor both) can easily 
> ask the driver to monitor LAN1. If it doesn't work, switch to LAN2.
> 
> That's a way more elegant than adding some guessing code that
> would be checking for the machine codes, eventually printing
> a warning and disabling support for monitoring LAN when the
> machine is not properly identified.
> 
> Also, implementing such table can be painful. I can't see an
> easy way to implement it, specially without having any information
> about how all other models that support the WMI API are shipped,
> and how to map "LAN1", "LAN2" into something that matches netdev
> detection. OK, if each one have a different BUS ID,
> a mapping table could associate each one with a different BUS
> ID, and then some logic at netdev would convert BUS ID into
> the device name.
> 
> > > > > Also, while netdev trigger seems to use just one device name,
> > > > > the NUC allows to monitor both interfaces at the same time.        
> > > > 
> > > > Yes. This can be solved in the future by extending netdev trigger to
> > > > support blinking on activity on multiple netdevices. I also thought
> > > > about this for use with another HW (mv88e6xxx switch).
> > > >       
> > > > > See, unfortunately I can't see a common API that would fit
> > > > > nicely on both cases.        
> > > > 
> > > > Well I can.      
> > > 
> > > Then the API needs to change, in order to allow to abstract from
> > > netdev-centric view of Ethernet interfaces. Or, instead, some
> > > other trigger is needed for firmware-controlled events.    
> > 
> > No. If the necessary information for determining which network
> > interface pairs to LED1 and which to LED2 cannot be reliably determined
> > from ACPI tables, then IMO the driver should specify this information
> > for each motherboard that wants to use this feature.  
> 
> What's the gain of adding such extra complexity to the driver?

Having a consistent API on different devices is a benefit in itself, I
would think.

> All the user wants is to blink a led only for one of the LAN ports.
> 
> Denying it and using a more complex API doesn't make much sense, IMO.

As I see it you are the one wanting to introduce more complexity into
the sysfs ABI. There is already a solution together with documentation
and everything for when the user wants to "blink a led only for one of
the LAN ports". It is the netdev trigger. And you want to complicate
that ABI.

> > > -
> > > 
> > > One thing that it is not clear to me: let's say that the LED
> > > called "front1" is currently handling Ethernet events, but
> > > the user wants to use, instead, the "front2" LED, disabling
> > > the "front1" one (or using for another event, like wifi, which
> > > is not monitored on BIOS default).
> > > 
> > > How this can be done using the trigger's API?    
> > 
> > cd /sys/class/leds/front1
> > echo none >trigger
> > cd /sys/class/leds/front2
> > echo netdev >trigger  
> 
> Clear enough to me.
> 
> > echo ifname >device_name
> > echo 1 >rx
> > echo 1 >tx  
> 
> And that's the part that it makes no sense for this hardware ;-)
> 
> It can't identify RX/TX in separate. It can only monitor both RX and TX at
> the same time.
> 
> So, for this specific device, neither "rx", "tx" or "interval"
> attributes should be shown.

If a netdev setting is not supported by the HW, it should be done in SW.
You say that for this controller it would be bad to do in SW, because it
would take too much time in BIOS calls. (I wonder how much...) If this
is really the case then I still think it is more preferable to do this
via netdev trigger, and forbid settings not supported by HW. The result
could be:

     # I want the LED to blink on ethernet activity
   $ echo netdev >trigger
     # ok, but I only wan't it to blink on rx activity, not tx
   $ echo 0 >tx
   Operation not supported.

Pavel, what is your opinion here?

Marek
