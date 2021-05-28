Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA203941BB
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 13:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbhE1L0N (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 07:26:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:55844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230227AbhE1L0J (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 May 2021 07:26:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD324613D1;
        Fri, 28 May 2021 11:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622201074;
        bh=j/O4K+NOSbsGXwxikQtCpnvjAlQ/g3jzYyr300y0/co=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZTFY2TBR0uY7k8IYibDymnP4r5wMnF2JO0+xE1SFMSGh7AjF/E7ZD5eebFgKu0ZTN
         /GMczoDhcQdlz0Xx3nDfKzlt3VyG+vIYhmMPkb6Mw3+PyrScPg4gRztkgQbiCm4a63
         WMccRvbSw8VCeE8dt7xszOFyHwfEHTdI4Q90q+vy+Lr4twOup+g6hrSSdqQhat5iAl
         Nnf53Gxqu72W6JPE7hcGp0xmSQVfjfwrWTeJh1tYhIKI04BRjX9Gi6W9236wrNkhrX
         WhMz+1pA6p+4IqprgwtJOk3z4+JwdgtFT6gU6el67q53XAl0vRJUX0N+lemrYGi9gF
         GaHapG3MNp2hw==
Date:   Fri, 28 May 2021 13:24:26 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 16/17] leds: leds-nuc: add support for changing the
 ethernet type indicator
Message-ID: <20210528132426.5d18565e@coco.lan>
In-Reply-To: <20210526144751.GA2141@amd>
References: <20210519100253.49b155e9@thinkpad>
        <20210519121812.4285b3ea@coco.lan>
        <20210519141102.0161a9d9@thinkpad>
        <20210519162413.4feeab02@coco.lan>
        <20210519175503.567e6ecc@thinkpad>
        <20210519203014.1838de3a@coco.lan>
        <20210520130014.7189a315@dellmb>
        <20210520180028.495f94e4@coco.lan>
        <20210520183633.084a8c3f@thinkpad>
        <20210520205933.3cfc57a9@coco.lan>
        <20210526144751.GA2141@amd>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Em Wed, 26 May 2021 16:47:51 +0200
Pavel Machek <pavel@ucw.cz> escreveu:

> Hi!
> 
> > > > See, there's nothing that the driver can possible do with
> > > > rx, tx, link, interval, device_name/device, as the the BIOS allows
> > > > to set to "LAN1", "LAN2" or "LAN1+LAN2". the WMI interface doesn't
> > > > provide *any* information about what LAN1 means.    
> > > 
> > > On the contrary, there is something the driver can do with these
> > > attributes. If the specific combination is not supported, the driver
> > > should return -EOPNOTSUPP in the trigger_offload method and let the
> > > netdev trigger do the work in software.   
> > 
> > Letting netdev to trigger is something we don't want to allow, as this
> > can cause side effects, making it doing slow the system due to BIOS calls
> > for no good reason.  
> 
> I'm with Marek here. Please listen to him.
> 
> Yes, operating LEDs can cost some CPU cycles. That's the case on most
> hardware. Yet we want to support most triggers on most hardware.

There are two separate things here:

1. a "normal" LED operation can indeed take some CPU cycles, specially
   if done via an I2C bus. Yet, the Kernel will still be kept running.
   A BIOS call means that the Kernel will remain interrupted until when
   the BIOS decide to return control back to it. This affects all CPUs,
   and not just the one that would be busy setting the LED.

   So, it is not a matter of just wasting some CPU cycles, but, instead,
   on potentially preventing all CPUs to run Kernel code, if the BIOS
   decides to lock until it finishes the LED setting and decides to
   return the control back to Linux.

   In practice, depending on what workload is used, their real time 
   requirements, and what the BIOS does (which may vary from device
   to device and on different BIOS versions) this could cause loses.
   This will mainly affect Real Time (e. g. audio and video apps).

   A realistic test would be to make the LED blink as fast as possible,
   while a pro-Audio device using JACK outputs something using the 
   smallest possible delay and see if blinking the leds would cause
   any audio issues.

   While I'm not against allowing using a software-triggered
   event, as this *can* cause userspace problems, IMO the user needs
   to explicitly allow the usage of it and be aware when a software
   trigger is used. Letting the LEDs core or driver to fallback
   to software and cause disturbance at userspace doesn't sound right.

2. a netdev trigger monitors a different event than the hardware
   event.

   See, if we have something like:

        LAN1  ----> eno1 ---> eno1.100     # VLAN 100 traffic at eno1
        port              |
                          +-> eno1.200     # VLAN 200 traffic at eno1

        LAN2  ---> enp5s0 ---> enp5s0.100  # VLAN 100 traffic at enp5s0
        port               |
                           +-> enp5s0.200  # VLAN 200 traffic at enp5s0


   The hardware triggered event monitors a group of physical interfaces,
   e. g.:
	- none
	- LAN1
	- LAN2
	- both LAN1 and LAN2 (default)

   The netdev trigger monitors software events at the network stack.
   So, it can be set to monitor a single software representation of an 
   interface, e. g. it can monitor either:

	- eno1
	- enp5so
	- eno1.100
	- eno1.200
	- enp5s0.100
	- enp5so.200

   It doesn't allow monitoring multiple interfaces at the same time.

   So, it is not possible to monitor both eno1 and enp5so.

   Also, even if it would be possible, what hardware detects could
   be different than what the network stack detects.

   On other words, even if we keep the BIOS default on front2 led
   and set front3 led to netdev trigger for eno1 they will blink
   differently, as one would be monitoring a single interface
   and another one will monitor both.

   It will even more different if netdev is set to monitor,
   let's say, VLAN 100 traffic at eno1.100, while hw trigger
   is set to LAN1+LAN2.

Thanks,
Mauro
