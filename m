Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEAD7213AA0
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2020 15:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgGCNIN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Jul 2020 09:08:13 -0400
Received: from vps.xff.cz ([195.181.215.36]:42170 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726035AbgGCNIM (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 3 Jul 2020 09:08:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1593781689; bh=p6X5Q7+LkJZdzuX+IC0XR31s1h+IfCcWhRImKLam3uY=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=N1nzdZ90yRiDiRWfezkpv0AqT2b2QvVYB2IS/tRKbejO3qw/ooBkVNr1Df9StNidy
         72YQ+jrs7zUiql44/6XlcKMK6ZOqSuL3LUxcJX8QHoZVRq7PCnRxhrhAQvxIp+i1cg
         I5EJysOgwOxjm66ZCcjD1MTH8Yg6zEuVRrsC5xew=
Date:   Fri, 3 Jul 2020 15:08:09 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>
Cc:     linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH RFC] leds: Add support for per-LED device triggers
Message-ID: <20200703130809.h4mvhwbdiymuo5pn@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>,
        linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
References: <20200702144712.1994685-1-megous@megous.com>
 <20200703120602.457cff1a@dellmb.labs.office.nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200703120602.457cff1a@dellmb.labs.office.nic.cz>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Marek,

On Fri, Jul 03, 2020 at 12:06:02PM +0200, Marek Behún wrote:
> On Thu,  2 Jul 2020 16:47:11 +0200
> Ondrej Jirman <megous@megous.com> wrote:
> 
> > Some LED controllers may come with an internal HW triggering mechanism
> > for the LED and an ability to switch between user control of the LED,
> > or the internal control. One such example is AXP20X PMIC, that allows
> > wither for user control of the LED, or for internal control based on
> > the state of the battery charger.
> > 
> > Add support for registering per-LED device trigger.
> > 
> > Names of private triggers need to be globally unique, but may clash
> > with other private triggers. This is enforced during trigger
> > registration. Developers can register private triggers just like
> > the normal triggers, by setting private_led to a classdev
> > of the LED the trigger is associated with.
> > 

[...]

> 
> Hi Ondrej,
> 
> Some criticism to this approach to HW triggers:
> - every hw trigger for each LED has to be registered via current trigger
>   API. This will grow code size and memory footprint once this API is
>   widely used
> - one HW trigger can only master one LED device (via private_led
>   member). So if I have, for example an ethernet switch with 8 ports,
>   and each port has 2 LEDs, and each LED has 10 possible HW triggering
>   mechanisms, with your proposed API one would need to register 8*2*10
>   = 160 triggers

Do you have such a switch? Also what's your real usecase?

My usecase is a PMIC which has either a user-controllable or self-working mode
for a single LED it controls. I want to be able to switch between those quickly
and easily.

I want the LED to be mostly controlled by PMIC, because that way PMIC can signal
events that are not exposed to OS like overvoltage, overheating, etc. ... all
automagically, but also be able to control it sometimes via SW (for non PMIC
related notifications, eg.).

So in my mindset LED is either controlled by Linux via various SW triggers, or
it's self-working in some arbitrary device specific configuration that doesn't
need any passing of the data via CPU for the LED to reflect some HW state.

So I'd expose a 'hw-trigger' only on the LED device that allows this, that you
can select among all the other regular triggers as you do now, and then
configure its precise mode/options in sysfs (on the trigger kobj). The driver
would come with some sane device specific defaults for the self-working mode.

User can then select hw-trigger, in the triggers and would get a nice PMIC LED
behavior controlled by HW, or a common LED behavior of the ehternet port, or
on the wireless card, or whatever.

From the perspective of this use case the interface is nice and generic:

- you set LED to hw-trigger mode on boot
- you set trigger to none and poke the LED with a pattern you want for the
  notification and put it back to hw-trigger mode again afterwards

We can standardize on hw-trigger, or self-controlled, or some other name
for this kind of private LED trigger, and then the userspace would not need
to even care about the specific LED device type, when sitching between
SW controlled and self-working modes.

You'd be able to take SW control of the ethernet PHY controlled LEDs this way
just the same as the PMIC LED with the same interface, described above. And
if you don't like the default self-controled mode, you can change it via
sysfs attributes on the trigger.

It would also allow the user to switch between SW and HW control, without
having to remember the previous HW triggering mode, because that could be
persisted by the LED HW trigger device. So you can go back to previous
HW triggering mode just by 'echo hw-trigger > your-led/trigger'.

I've read through the discussions, and this seems like a workable interface.

Most of the LED devices would just add one extra private trigger to the
triggers_list, so it would not explode in the way you describe above.

Also benefit of this approach is that it fits quite nicely with the existing
code, and requires minimal changes. The trigger already allows for specifying
sysfs attributes, too.

regards,
	o.

> I too have been thinking about an API for HW LED triggers, and I
> tinkered with it a little. Some time ago I sent some emails, with
> subjects:
>   "RFC: LED hw triggering API"
>   "about my trigger-sources work"



> My current thoughts about how HW LED triggers could work nicely is as
> such:
>   - these members (maybe with different names) shall be added to struct
>     led_classdev:
>       available_hw_triggers()
>         - shall return a NULL terminated list of HW trigger names
>           available for this LED
>       set_hw_trigger()
>         - sets HW trigger for this LED. The LED triggering API shall
>           call this method after previous LED trigger is unset. If
>           called with NULL parameter, unsets HW trigger
>       current_hw_trigger
>         - name of the currently set HW LED trigger for this LED
>   - the driver registering the LED cdev informs abouth the LED being
>     capable of HW triggering - members available_hw_triggers and
>     set_hw_trigger must be set
>   - SW LED trigger and HW LED trigger are mutualy exclusive on one LED
>   - the trigger file in sysfs (/sys/class/leds/LED/trigger) shall first
>     list the available SW triggers, and then available hw triggers for
>     this LED, prefixed with "hw:"
>     When written, if the written trigger name starts with "hw:",
>     instead of setting SW trigger, a HW trigger is set via
>     set_hw_trigger() method
> 
> This could also nicely work with trigger-source DTS property - when the
> driver registers a LED, it can determine what other device is
> triggering the LED (for example a netdevice), and correspondingly set
> the correct name for the LED. Code for that could be shared between HW
> and SW triggering API.
> 
> Marek
