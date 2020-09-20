Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95C9271497
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 15:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbgITNhK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 09:37:10 -0400
Received: from lists.nic.cz ([217.31.204.67]:33508 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726315AbgITNhK (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 20 Sep 2020 09:37:10 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 096C61409E0;
        Sun, 20 Sep 2020 15:37:08 +0200 (CEST)
Date:   Sun, 20 Sep 2020 15:37:07 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Adrian Schmutzler <freifunk@adrianschmutzler.de>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: add LED_FUNCTION for
 wlan2g/wlan5g
Message-ID: <20200920153707.70164720@nic.cz>
In-Reply-To: <946e7a49-db74-8d2d-0ac8-5075d20f41f3@gmail.com>
References: <20200919192427.57033-1-freifunk@adrianschmutzler.de>
        <20200919223134.2371459c@nic.cz>
        <946e7a49-db74-8d2d-0ac8-5075d20f41f3@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,URIBL_BLOCKED,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 20 Sep 2020 15:16:11 +0200
Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:

> Hi Marek,
> 
> On 9/19/20 10:31 PM, Marek Behun wrote:
> > On Sat, 19 Sep 2020 21:24:26 +0200
> > Adrian Schmutzler <freifunk@adrianschmutzler.de> wrote:
> >   
> >> Many consumer "routers" have dedicated LEDs for specific WiFi bands,
> >> e.g. one for 2.4 GHz and one for 5 GHz. These LEDs specifically
> >> indicate the state of the relevant band, so the latter should be
> >> included in the function name. LED_FUNCTION_WLAN will remain for
> >> general cases or when the LED is used for more than one band.
> >>
> >> This essentially is equivalent to how we use LED_FUNCTION_LAN and
> >> LED_FUNCTION_WAN instead of just having LED_FUNCTION_ETHERNET.  
> > 
> > Dont. If you want the LED name to inform the user about the WiFi
> > device it is being triggered on, it instead should come from the
> > devicename part:
> >    "wlan0:blue:activity"
> > 
> > In fact the function should not be "wlan" (nor "wlan2g" or "wlan5g", but
> > "activity".
> > 
> > I am going to try to work on this subsystem so that if trigger source
> > of the LED is set to a WiFi device and function is set to activity, the
> > LED shall blink on wifi activity.
> > 
> > This way we can also avoid using the `linux,default-trigger` property
> > in favour of `function`, i.e. if I have:
> > 
> >     wlan0: wifi@12300 {
> >       compatible = "some-wifi";
> >       #trigger-source-cells = <0>;
> >     }
> > 
> >     led {
> >       color = <LED_COLOR_ID_BLUE>;
> >       function = LED_FUNCTION_ACTIVITY;
> >       trigger-sources = <&wlan0>;
> >     };
> > 
> > Than this will automatically name the LED as
> >    wlan0:blue:activity
> > and if the corresponding trigger is available, it should set the
> > trigger even if no `linux,default-trigger` property is present.  
> 
> Since wlan0 is DT label, then you will probably not be able to retrieve
> its name in the driver but only a pointer to the struct device_node
> associated with the label. And actually from the userspace user POV
> this name is not too informative. What is informative is
> unique identifier of the wlan device present in the system, associated
> with the LED.
> 
> And wlan drivers broadly use wiphy_name() to get phy identifier and
> use it for composing associated LED device name.
> 
> This way we get LED name in the form (here for Mediatek wlan dongle):
> 
> mt7601u-phy0
> 
> This is not in alignment with LED naming pattern and there also are
> other variations for different drivers in
> drivers/net/wireless, so it would be good to standardize that.
> 
> While implementing LED core support for LED name composition I created
> also a script for validating LED name and printing LED hardware
> related information so that could be a good starting point.
> 
> The script is in the tree:
> 
> tools/leds/get_led_device_info.sh
> 
> and for said Mediatek dongle it gives following output:
> 
> <quote>
> 
> $./tools/leds/get_led_device_info.sh /sys/class/leds/mt7601u-phy0
> 
> #####################################
> # LED class device hardware details #
> #####################################
> 
> bus:			usb
> idVendor:		148f
> idProduct:		7601
> manufacturer:		MediaTek
> product:		802.11 n WLAN
> driver:			mt7601u
> 
> ####################################
> # LED class device name validation #
> ####################################
> 
> ":" delimiter not detected.	[ FAILED ]
> 
> </quote>
> 
> And for the LEDs exposed by USB keyboard it prints below stuff:
> 
> <quote>
> 
> $./tools/leds/get_led_device_info.sh /sys/class/leds/input1\:\:capslock
> 
> #####################################
> # LED class device hardware details #
> #####################################
> 
> bus:			usb
> idVendor:		046d
> idProduct:		c31c
> manufacturer:		Logitech
> product:		USB Keyboard
> driver:			usbhid
> associated input node:	input1
> 
> ####################################
> # LED class device name validation #
> ####################################
> 
> devicename :	input1               [ OK ]
> function   :	capslock             [ OK ]     Matching definition: 
> LED_FUNCTION_CAPSLOCK
> 
> </quoute>
> 
> The script currently detects LEDs associations only with wireless and
> input devices.
> 

Thank you Jacek, I will look into this.

Currently my ideas are as follows:
- each LED trigger that has settable trigger source (currently only
  netdev, gpio, phy (in wireless subsystem) and maybe disk in the
  future) shall implement a method for translating device/node pointer
  to LED devicename
- if trigger-sources is given, the LED registration function shall to
  call this new trigger method for all triggers giving the trigger
  source as parameter
- the first of the triggers that returns successfully will decide the
  devicename part of the LED
- if none of the triggers return successfully, 2 things can happen, and
  I am not yet sure which one should:
    1. the registration fails with -EPROBE_DEFER, because LED name
       cannot be composed, either trigger module is missing or driver
       for the trigger source is missing
    2. the registration succeeds but devicename part of LED will be
       missing. Since Pavel does not want LED renaming implemented,
       this can be only solved by forcing LED driver unbind and rebind

What do you think?

Marek
