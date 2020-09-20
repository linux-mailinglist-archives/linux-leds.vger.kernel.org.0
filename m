Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9E6271606
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 18:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgITQo1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 12:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITQo0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Sep 2020 12:44:26 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8630AC061755
        for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2020 09:44:26 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 8EA0913FFC2;
        Sun, 20 Sep 2020 18:44:23 +0200 (CEST)
Date:   Sun, 20 Sep 2020 18:44:22 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, pavel@ucw.cz, dmurphy@ti.com
Subject: Re: [PATCH] leds: Document standard LED functions
Message-ID: <20200920184422.60c04194@nic.cz>
In-Reply-To: <20200920162625.14754-1-jacek.anaszewski@gmail.com>
References: <20200920162625.14754-1-jacek.anaszewski@gmail.com>
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

On Sun, 20 Sep 2020 18:26:25 +0200
Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:

> Add a documentation for standard LED functions with regard
> to differences in meaning between cases when devicename section
> of an LED name is present or not.
> 
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> ---
>  Documentation/leds/led-functions.rst | 226 +++++++++++++++++++++++++++++++++++
>  1 file changed, 226 insertions(+)
>  create mode 100644 Documentation/leds/led-functions.rst
> 
> diff --git a/Documentation/leds/led-functions.rst b/Documentation/leds/led-functions.rst
> new file mode 100644
> index 000000000000..42621dd81235
> --- /dev/null
> +++ b/Documentation/leds/led-functions.rst
> @@ -0,0 +1,226 @@
> +============================================
> +Standardized LED functions and their meaning
> +============================================
> +
> +Each LED function is described using below template:
> +
> +LED function name
> +-----------------
> +
> +    NDEV : <function meaning when LED devicename section is absent>
> +    DEV  : <function meaning when LED devicename section is present>
> +    DEVICENAME : <expected LED devicename for DEV case>
> +    TRIGGER: <matching LED trigger>
> +
> +LED functions with corresponding LED trigger support
> +----------------------------------------------------
> +
> +- activity
> +    NDEV : system activity
> +    DEV  : n/a
> +    TRIGGER : "activity"
> +

Hi Jacek,
as I wrote in another discussion, but maybe we should discuss this here.
Are your opinions on this matter final or are you open for discussion?

For activity: the thing is that activity is sometimes interpreted as
the union of rx and tx, or read and write. I think the pair (device,function)
could be used better to infer the actual trigger and its settings, than
just (function,). For example:
	device	function		trigger
        ------  --------                -------
	system	activity		cpu activity
	(empty)	activity		cpu activity
	eth0	activity		netdev rx/tx
	sda	activity		disk read/write on sda
	wlan0	activity		phy rx/tx

> +- backlight
> +    NDEV : when there is a single one on the platform
> +    DEV  : backlight of a frame buffer device
> +    DEVICENAME : associated frame buffer device, e.g. fb0
> +    TRIGGER: "backlight"
> +
> +- disk
> +    NDEV : rw activity on any disk in the system
> +    DEV  : rw activity on specified disk
> +    DEVICENAME : associated disk, e.g.: hda, sdb
> +    TRIGGER : "disk-activity", applies only to NDEV case
> +
> +- disk-read / disk-write
> +    NDEV : read / write activity on any disk in the system
> +    DEV  : read / write  activity on specified disk
> +    DEVICENAME : associted disk, e.g.: hda, sdb
> +    TRIGGER : "disk-read" / "disk-write" , applies only to NDEV case
> +

Currently the disk trigger blinks on events for any device, user cannot
specify just one. If we implemented this, I think the trigger name
should be just "disk", and whether it is read/write/both should be
decided by sysfs files "read" and "write" as is in netdev trigger files
"rx" and "tx".

Moreover I think it would make more sense (but other people can of
course disagree) if the LED function for LED associated with a disk
could be "activity", "read" or "write",

	device	function		trigger
        ------  --------                -------
	sda	activity		disk read/write on sda
	sda	read			disk read on sda
	sda	write			disk write on sda

Marek

> +- flash
> +    NDEV : flash LED (if there is single available on the platform)
> +    DEV  : flash LED related to the specified video device
> +    DEVICENAME : associated video device, e.g. v4l2-subdev3
> +    TRIGGER : "flash"; this LED can be also controlled by v4l2-flash framework
> +
> +- flash-front
> +    NDEV : n/a
> +    DEV  : front flash LED related to the specified video device
> +    DEVICENAME : associated video device, e.g. v4l2-subdev3
> +    TRIGGER : "flash"; this LED can be also controlled by v4l2-flash framework
> +
> +- flash-rear
> +    NDEV : n/a
> +    DEV  : rear flash LED related to the specified video device
> +    DEVICENAME : associated video device, e.g. v4l2-subdev3
> +    TRIGGER : "flash"; this LED can be also controlled by v4l2-flash framework
> +
> +- heartbeat
> +    NDEV : cpu load average expressed as heartbeat-fashion blink frequency
> +    DEV  : n/a
> +    TRIGGER : "heartbeat"
> +
> +- lan
> +    NDEV : n/a
> +    DEV  : network traffic on selected network device
> +    DEVICENAME : associated phy, e.g. phy1
> +    TRIGGER : "netdev"
>
> +- wlan
> +    NDEV : activity on any wlan device
> +    DEV  : activity on a specified wlan device
> +    DEVICENAME: associated phy, e.g. phy1
> +    TRIGGER: wlan device drivers may implement their own triggers
> +             using phyN-function naming
> +
> +- mute
> +    NDEV : platform audio output mute state
> +    DEV  : mute state of specified audio device output
> +    DEVICENAME : associated audio device
> +    TRIGGER : "audio-mute"
> +
> +- micmute
> +    NDEV : plaform microphone input mute state
> +    DEV  : mute state of a microphone belonging to the specified device
> +    DEVICENAME : associated audio device
> +    TRIGGER : "audio-micmute"
> +
> +- mtd
> +    NDEV : rw actvity on any mtd device in the system
> +    DEV  : rw actvity on specified mtd device
> +    DEVICENAME : associated mtd device, e.g mtdN
> +    TRIGGER : "mtd"
> +
> +- panic
> +    NDEV : signals kernel panic
> +    DEV  : n/a
> +    TRIGGER : "panic"
> +
> +- torch
> +    NDEV : torch LED (if there is single available on the platform)
> +    DEV  : torch LED related to the specified video device
> +    DEVICENAME : associated video device, e.g. video1, v4l2-subdev3
> +    TRIGGER : "torch"; this LED can be also controlled by v4l2-flash framework
> +
> +- usb
> +    NDEV : activity on any USB port
> +    DEV  : activity on a specified USB port
> +    DEVICENAME: associated USB device identifier
> +    TRIGGER : "usbport"
> +
> +- numlock
> +    NDEV : n/a
> +    DEV  : keyboard numlock state related to the specified input device
> +    DEVICENAME : associated input device, e.g. input1
> +    TRIGGER : "kbd-numlock"
> +
> +- capslock
> +    NDEV : n/a
> +    DEV  : keyboard capslock state related to the specified input device
> +    DEVICENAME : associated input device, e.g. input1
> +    TRIGGER : "kbd-capslock"
> +
> +- scrolllock
> +    NDEV : n/a
> +    DEV  : keyboard scrollock state related to the specified input device
> +    DEVICENAME : associated input device, e.g. input1
> +    TRIGGER : "kbd-scrolllock"
> +
> +
> +LED functions without corresponding trigger support
> +---------------------------------------------------
> +
> +- alarm
> +    NDEV : system wide alarm
> +    DEV  : n/a
> +
> +- bluetooth
> +    NDEV : activity on platform bluetooth adapter
> +    DEV  : activity on bluetooth adapter related to the specified device
> +    DEVICENAME : associated device
> +
> +- boot
> +    NDEV : when lit indicates system boot
> +    DEV  : n/a
> +
> +- charging
> +    NDEV : battery charging status
> +    DEV  : n/a
> +
> +- debug
> +    NDEV : signals if device runs in debug mode
> +    DEV  : n/a
> +
> +- disk-err
> +    NDEV : failure on any disk in the system
> +    DEV  : failure on specified disk
> +    DEVICENAME : associted disk, e.g.: hda, sdb
> +
> +- fault
> +    NDEV : general system fault
> +    DEV  : fault on specified system device
> +    DEVICENAME : related device name
> +
> +- indicator
> +    NDEV : signals if platform camera sensor is active
> +    DEV  : signals if camera sensor related to the specified video device is active
> +    DEVICENAME : associated video device, e.g.: v4l2-subdev3
> +
> +- kbd_backlight
> +    NDEV : platform keyboard backlight state
> +    DEV  : backlight state related to the specified device
> +    DEVICENAME : associated device, e.g. input1
> +
> +- mail
> +    NDEV : signals a new massage in mailbox
> +    DEV  : n/a
> +
> +- programming
> +    NDEV : platform firmware update is in progress
> +    DEV  : n/a
> +
> +- power
> +    NDEV : power plug presence indicator
> +    DEV  : n/a
> +
> +- rx
> +    NDEV : n/a
> +    DEV  : activity on rx line of serial port related to the specified tty device
> +    DEVICENAME: associated tty device, e.g.: tty1, ttyUSB2
> +
> +- tx
> +    NDEV : n/a
> +    DEV  : activity on tx line of serial port related to the specified tty device
> +    DEVICENAME: associated tty device, e.g.: tty1, ttyUSB2
> +
> +- sd
> +    NDEV : n/a
> +    DEV  : activity on sd card related to the specified device
> +    DEVICENAME: associated disk, e.g. sdb
> +
> +- sleep
> +    NDEV : signals any variant of system hibernation or suspend state
> +    DEV  : n/a
> +
> +- standby
> +    NDEV : device standby status
> +    DEV  : n/a
> +
> +- status
> +    NDEV : system wide status LED
> +    DEV  : n/a
> +
> +- system
> +    NDEV : system is fully operating
> +    DEV  : n/a
> +
> +- wan
> +    NDEV : activity on any WAN device
> +    DEV  : activity on a specified WAN device
> +    DEVICENAME: associated WAN device identifier
> +
> +- wps
> +    NDEV : n/a
> +    DEV  : wps functionality activation state related to the specified device
> +    DEVICENAME : associated device name

