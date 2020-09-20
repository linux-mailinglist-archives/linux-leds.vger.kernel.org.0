Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0C9271558
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 17:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgITP2v (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 11:28:51 -0400
Received: from lists.nic.cz ([217.31.204.67]:55602 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbgITP2v (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 20 Sep 2020 11:28:51 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 7A00414093B;
        Sun, 20 Sep 2020 17:28:49 +0200 (CEST)
Date:   Sun, 20 Sep 2020 17:28:48 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Adrian Schmutzler <freifunk@adrianschmutzler.de>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: add LED_FUNCTION for
 wlan2g/wlan5g
Message-ID: <20200920172848.3e49d613@nic.cz>
In-Reply-To: <5ae6b9f4-3c9b-3a47-5738-585b28d841c5@gmail.com>
References: <20200919192427.57033-1-freifunk@adrianschmutzler.de>
        <20200919223134.2371459c@nic.cz>
        <946e7a49-db74-8d2d-0ac8-5075d20f41f3@gmail.com>
        <20200920153707.70164720@nic.cz>
        <5ae6b9f4-3c9b-3a47-5738-585b28d841c5@gmail.com>
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

On Sun, 20 Sep 2020 16:59:01 +0200
Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:

> >>> In fact the function should not be "wlan" (nor "wlan2g" or "wlan5g", but
> >>> "activity".  
> 
> I disagree. Activity should be reserved for the activity trigger.
> I've had a patch [0] documenting standard LED functions, but it
> eventually didn't make to the mainline, I'll try to send an update.

Hmm. The thing is that activity is sometimes interpreted as the union
of rx and tx, or read and write. I think the pair (device,function)
could be used better to infer the actual trigger and its settings, than
just (function,). For example:
	device	function		trigger
	system	activity		cpu activity
	(empty)	activity		cpu activity
	eth0	activity		netdev rx/tx
	sda	activity		disk read/write on sda
	wlan0	activity		phy rx/tx

Are you open for discussion on this? Or do you consider this to be
already decided and closed? I would like to hear other opinions here,
but if this was discussed than I guess I shall just stick to the
decisions already made for this...

> > 
> > Thank you Jacek, I will look into this.
> > 
> > Currently my ideas are as follows:
> > - each LED trigger that has settable trigger source (currently only
> >    netdev, gpio, phy (in wireless subsystem) and maybe disk in the
> >    future) shall implement a method for translating device/node pointer
> >    to LED devicename
> > - if trigger-sources is given, the LED registration function shall to
> >    call this new trigger method for all triggers giving the trigger
> >    source as parameter
> > - the first of the triggers that returns successfully will decide the
> >    devicename part of the LED
> > - if none of the triggers return successfully, 2 things can happen, and
> >    I am not yet sure which one should:
> >      1. the registration fails with -EPROBE_DEFER, because LED name
> >         cannot be composed, either trigger module is missing or driver
> >         for the trigger source is missing
> >      2. the registration succeeds but devicename part of LED will be
> >         missing. Since Pavel does not want LED renaming implemented,
> >         this can be only solved by forcing LED driver unbind and rebind
> > 
> > What do you think?  
> 
> I don't think that initially set trigger source should have any impact
> on the LED device name. It is rather the other way round - if the LED
> is physically integrated with the device (e.g. wlan dongle case), then
> it is justified to add a devicename section to it. This is what current
> wlan drivers do, and additionally they register trigger(s) with the same
> devicename prefix, and register the LED with one of them.
> 
> In case of my mt7601u dongle it looks like below:
> 
> /sys/class/leds/mt7601u-phy2$ cat trigger
> none kbd-scrolllock kbd-numlock kbd-capslock kbd-kanalock kbd-shiftlock 
> kbd-altgrlock kbd-ctrllock kbd-altlock kbd-shiftllock kbd-shiftrlock 
> kbd-ctrlllock kbd-ctrlrlock usb-gadget usb-host timer disk-activity 
> disk-read disk-write ide-disk mtd nand-disk heartbeat cpu cpu0 cpu1 cpu2 
> cpu3 cpu4 cpu5 cpu6 cpu7 panic pattern rfkill-any rfkill-none rfkill2 
> phy2rx phy2tx phy2assoc phy2radio [phy2tpt]
> 

(This is another thing that is wrong: there should be only phy, or
wireless-phy trigger, and the mode (rx/tx/assoc/radio) and device
(phy0, phy1, ...) should be set via device_name file, as in netdev
trigger. Can we reimplement it and leave this ABI under configuration
option _LEAGACY?).

> IMO if LED is not physically integrated with any device, then it should
> not be named after the device that is to be initially associated with
> via trigger. This association can be later changed in userspace, which
> will render the name invalid. And current associated device can be read
> by reading triggers sysfs file, provided that the trigger conveys
> that information like in case of presented above phy* triggers.

There are devices which have LEDs connected via a LED controller for
example via I2C bus, but the individual LEDs are dedicated (in the way
that there is an icon or text written on the device's case next to each
LED). In this case the trigger-source should be defined in device tree
in such a way that it aligns with the manufacturer's intended function
of the LED. And in this case I think the devicename part of the LED
should be derived from this trigger source.

Sure, if for example an ethernet PHY registers its LEDs, it can
hardcode init_data.devicename to "ethernet-phyN" or something like
that. But for LEDs on a generic LED controller...

I think we should get opinions from other people in this.

> OTOH, a LED with devicename describing its physical location will
> not change this location, even after changing the trigger
> (or trigger source), thus it proves correct to have fixed devicename
> section for the LED, but only if it is a part of some other pluggable
> device.
> 
> [0] 
> https://lore.kernel.org/linux-leds/20190609190803.14815-27-jacek.anaszewski@gmail.com/
> 

Marek
