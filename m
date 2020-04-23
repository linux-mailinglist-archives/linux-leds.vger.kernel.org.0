Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDB9D1B592A
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2020 12:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgDWK3u (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Apr 2020 06:29:50 -0400
Received: from mail.nic.cz ([217.31.204.67]:58214 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726764AbgDWK3u (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 23 Apr 2020 06:29:50 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 5C9541413E7;
        Thu, 23 Apr 2020 12:29:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1587637788; bh=PcpMIkBvlu7jNxfuyBUePVujIQu6cnH/0WyG4zCwGPs=;
        h=Date:From:To;
        b=t6Pe0Kd4eSY6TwrG+/ILwTHHqOmNUxHc2kXcMSJ9gY3U3RDBmMqW0b/fbvRFpxYs4
         Zw+/idUV2REEnjgpk+nLAbw0YfOvWaO8oqpo5UA1IH6ha7o7mK1ZV1b1StGO8F2zPW
         KTfnZiJo1uMQmzbj13OdRCkT8STW3J5xZM09GwAo=
Date:   Thu, 23 Apr 2020 12:29:47 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: about my trigger-sources work
Message-ID: <20200423122947.38303f22@nic.cz>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,
just to let you know and maybe get some feedback or your ideas.

The documentation
https://www.kernel.org/doc/Documentation/devicetree/bindings/leds/common.yaml
specifies that a LED node can have a trigger-sources property to
specify a list of devices which should be used as a source for that
LED's activity.

I am trying to implement this now, since it is not implemented yet in
common API. The only user of this property is
drivers/usb/core/ledtrig-usbport.c and they do it on their own.

One problem is that different classes of devices can be specified as
a source, and so they have to be OF-translated differently.
To solve this I added a new method to struct led_trigger
	int (*of_xlate_and_set_source)(struct led_classdev *led_cdev,
				       const struct of_phandle_args *args);
The purpose is that if a LED trigger can have a source, such as a
network device, and this device is specified in device tree via
trigger-sources, the LED subsystem shall parse the trigger-sources
property and pass it to this method via args. This method then
translates args into a device (ie a network device) and sets it as a
source of triggering for this LED.

Another problem is that it is possible (and probable) that the trigger
source device is not probed yet when LED is being created. We can't use
probe deferral here, because it is possible that source device won't be
probed at all, and this should IMO not cause probe fail for the LED
cdev.
Now this could be solved in multiple ways:
- the led trigger subsystem could do it by registering a notifier for
  when devices are probed. Now I can't find such a notifier existing
  (there are similar, for when a driver is bound and so on, but we need
  one for when device is probed), so this would need to be implemented
  in the core device API
- the led trigger could do it on its own by registering a notifier for
  the subsystem on which the device that can be a trigger source for
  this trigger will live. For example the netdev trigger could register
  a netdevice notifier, the gpio trigger could register a notifier
  for the gpio bus (this would probably need to be implemented as in
  previous point)
I think the second option is better, because of possibility of more
specific notifier events (at least one led trigger (netdev) already uses
netdevice notifier).

This work could later also lead to a more sensible naming of the first
part (device) of LED devices in sysfs, for example:
When a network device eth0 is set to be a trigger-source for a LED,
the LED should be called eth0:color:function. I therefore think that it
should be part of the code of the LED trigger driver to rename the LED,
when a trigger source is set from OF.

What do you think?

Marek
