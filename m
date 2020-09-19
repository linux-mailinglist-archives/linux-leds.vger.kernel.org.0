Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24CD027111E
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 00:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgISW2u (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 18:28:50 -0400
Received: from mail.nic.cz ([217.31.204.67]:56206 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726617AbgISW2u (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 19 Sep 2020 18:28:50 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id CBEF0140A46;
        Sun, 20 Sep 2020 00:28:47 +0200 (CEST)
Date:   Sun, 20 Sep 2020 00:28:46 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     "Adrian Schmutzler" <mail@adrianschmutzler.de>
Cc:     <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: add LED_FUNCTION for
 wlan2g/wlan5g
Message-ID: <20200920002846.22a76e03@nic.cz>
In-Reply-To: <00b201d68ecd$8af46280$a0dd2780$@adrianschmutzler.de>
References: <20200919192427.57033-1-freifunk@adrianschmutzler.de>
        <20200919223134.2371459c@nic.cz>
        <00b201d68ecd$8af46280$a0dd2780$@adrianschmutzler.de>
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

On Sat, 19 Sep 2020 23:40:50 +0200
"Adrian Schmutzler" <mail@adrianschmutzler.de> wrote:

> > -----Original Message-----
> > From: Marek Behun [mailto:marek.behun@nic.cz]
> > Sent: Samstag, 19. September 2020 22:32
> > To: Adrian Schmutzler <freifunk@adrianschmutzler.de>
> > Cc: linux-leds@vger.kernel.org
> > Subject: Re: [PATCH v2 1/2] dt-bindings: leds: add LED_FUNCTION for
> > wlan2g/wlan5g
> > 
> > On Sat, 19 Sep 2020 21:24:26 +0200
> > Adrian Schmutzler <freifunk@adrianschmutzler.de> wrote:
> >   
> > > Many consumer "routers" have dedicated LEDs for specific WiFi bands,
> > > e.g. one for 2.4 GHz and one for 5 GHz. These LEDs specifically
> > > indicate the state of the relevant band, so the latter should be
> > > included in the function name. LED_FUNCTION_WLAN will remain for
> > > general cases or when the LED is used for more than one band.
> > >
> > > This essentially is equivalent to how we use LED_FUNCTION_LAN and
> > > LED_FUNCTION_WAN instead of just having LED_FUNCTION_ETHERNET.  
> > 
> > Dont. If you want the LED name to inform the user about the WiFi device it is
> > being triggered on, it instead should come from the devicename part:
> >   "wlan0:blue:activity"
> > 
> > In fact the function should not be "wlan" (nor "wlan2g" or "wlan5g", but
> > "activity".
> > 
> > I am going to try to work on this subsystem so that if trigger source of the LED
> > is set to a WiFi device and function is set to activity, the LED shall blink on wifi
> > activity.
> > 
> > This way we can also avoid using the `linux,default-trigger` property in favour
> > of `function`, i.e. if I have:
> > 
> >    wlan0: wifi@12300 {
> >      compatible = "some-wifi";
> >      #trigger-source-cells = <0>;
> >    }
> > 
> >    led {
> >      color = <LED_COLOR_ID_BLUE>;
> >      function = LED_FUNCTION_ACTIVITY;
> >      trigger-sources = <&wlan0>;
> >    };
> > 
> > Than this will automatically name the LED as
> >   wlan0:blue:activity
> > and if the corresponding trigger is available, it should set the trigger even if
> > no `linux,default-trigger` property is present.  
> 
> Thanks for the explanation, I understand why this makes sense conceptually.
> 
> However, I assume your use of the word "will" indicates that I won't be able to build a solution like this with kernel 5.4?
> So, easiest surrogate there would be to just stick to label property for the moment ...?

Yes.

> How is the "device" part determined? Can I just change the DT label from wlan0 to wlan2g to get a more descriptive name, which will be translated into the led name like wlan2g:blue:activity?

The label "wlan0" in the example above (wlan0: wifi@12300) is not stored
is DT binary. It is just a name for phandle reference. The actual name
of the DT node is "wifi@12300".

Currently the devicename part is given by the LED driver. Some drivers
do this, some do not. Those who do set it differently, for example
they give name of the parent device of the LED (which is often name of
the LED controller).

This should be changed by the core so that if trigger-source is given,
then the devicename part is taken from the trigger-source. But
currently this is not implemented.

> And finally, though partly off-topic:
> Is there any way to determine the full "led name" from device-tree? We currently have aliases for certain leds, like
> 	led-upgrade = &led_somename;
> 
> The allowed us to construct the /sys/class/leds/<label> path directly from /proc/device-tree (in a user-space script), as we could access the label property of the LED.
> As far as I understand it, the color/function system does not provide a comparable lever, as the final name is only constructed in led-core.c?
> 

The files in /sys/class/leds/ are symlinks. The actual files are in
/sys/devices/ somewhere. If you know the path of your LED in the
device hierarchy, you can find it that way. If your script can access
the LED by reading device-tree, you can implement your script so that
you can find the LED in the hiearchy in /sys/devices/ (or simply byt
reading where do the symlinks in /sys/class/leds/ point to).

Marek
