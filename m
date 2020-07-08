Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09DAB218A7C
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2020 16:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729689AbgGHO4W (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Jul 2020 10:56:22 -0400
Received: from mail.nic.cz ([217.31.204.67]:55036 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729625AbgGHO4W (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 8 Jul 2020 10:56:22 -0400
Received: from dellmb (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTPSA id 1682C13F695;
        Wed,  8 Jul 2020 16:56:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594220180; bh=giCnF4goR1Cb9ewxi13p5MAhs9JmU9oUD5KGQ3U//Yk=;
        h=Date:From:To;
        b=h7o61047UMvbF+/3ewFKec5zBgGUDjUmm8FTMSMt+fBuXTZk7j2mC+GvoZZfqwwF2
         vQvnLMi5USDjMNzjwJVVHqoo+KCBdks8elMqxfchRFGuX9iIH0j9vgxzfXh3FzlLK9
         YMSHS0y3ZcsjoqBIxSDGlaNfmgTUf80LXMLzo5dU=
Date:   Wed, 8 Jul 2020 16:56:19 +0200
From:   Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Ondrej Jirman <megous@megous.com>, linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH RFC] leds: Add support for per-LED device triggers
Message-ID: <20200708165619.0321d3db@dellmb>
In-Reply-To: <20200704125900.GA20503@amd>
References: <20200702144712.1994685-1-megous@megous.com>
        <20200703120602.457cff1a@dellmb.labs.office.nic.cz>
        <20200704125900.GA20503@amd>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 4 Jul 2020 14:59:00 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> > Some criticism to this approach to HW triggers:
> > - every hw trigger for each LED has to be registered via current
> > trigger API. This will grow code size and memory footprint once
> > this API is widely used
> > - one HW trigger can only master one LED device (via private_led
> >   member). So if I have, for example an ethernet switch with 8
> > ports, and each port has 2 LEDs, and each LED has 10 possible HW
> > triggering mechanisms, with your proposed API one would need to
> > register 8*2*10 = 160 triggers  
> 
> Well, code is simple, and so far I have seen 2 HW triggering
> mechanisms, not 10. Maybe we should have a function to regiter a hw
> trigger for a LED, so that internal implementation can be changed
> more easily.
> 
> Ondrej: You already have code using this, right? Can we get an
> example?
> 
> > I too have been thinking about an API for HW LED triggers, and I
> > tinkered with it a little. Some time ago I sent some emails, with
> > subjects:
> >   "RFC: LED hw triggering API"
> >   "about my trigger-sources work"  
> 
> Perhaps it is time to send them one more time, so Ondrej can say if it
> works for him/looks okay for him?
> 
> > My current thoughts about how HW LED triggers could work nicely is
> > as such:
> >   - these members (maybe with different names) shall be added to
> > struct led_classdev:
> >       available_hw_triggers()
> >         - shall return a NULL terminated list of HW trigger names
> >           available for this LED
> >       set_hw_trigger()
> >         - sets HW trigger for this LED. The LED triggering API shall
> >           call this method after previous LED trigger is unset. If
> >           called with NULL parameter, unsets HW trigger
> >       current_hw_trigger
> >         - name of the currently set HW LED trigger for this LED
> >   - the driver registering the LED cdev informs abouth the LED being
> >     capable of HW triggering - members available_hw_triggers and
> >     set_hw_trigger must be set
> >   - SW LED trigger and HW LED trigger are mutualy exclusive on one
> > LED
> >   - the trigger file in sysfs (/sys/class/leds/LED/trigger) shall
> > first list the available SW triggers, and then available hw
> > triggers for this LED, prefixed with "hw:"
> >     When written, if the written trigger name starts with "hw:",
> >     instead of setting SW trigger, a HW trigger is set via
> >     set_hw_trigger() method  
> 
> This does not sound bad, either.
> 
> Best regards,
> 								Pavel

Hi Pavel
I shall try to implement this and send a proposal within 2 weeks.
Marek
