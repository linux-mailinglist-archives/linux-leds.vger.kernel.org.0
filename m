Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1325031CF67
	for <lists+linux-leds@lfdr.de>; Tue, 16 Feb 2021 18:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhBPRoN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Feb 2021 12:44:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50058 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231325AbhBPRoB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 16 Feb 2021 12:44:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613497353;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2A9twubF3w6uP2eZ9kbP24o7l8tEJ+WXbE5eeyHYWcw=;
        b=KPra9aL0nb8r2sGbg46lwiQgKG0zRq+7rO7WgLLlDdel3+cYfwarO9FQ5X0jybd5P9IuiS
        ijbb35rwAvEeFaZnS3DQ+hvJ5cdeKobXwsSv/z1q/kxEShMDezLoCNVBVLgQMHrsUee5Mj
        vUxP4plJXKsrld0YKZwM3S6j1hMVDkY=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-YOK3odv_NMuczjU9kSU7eQ-1; Tue, 16 Feb 2021 12:42:31 -0500
X-MC-Unique: YOK3odv_NMuczjU9kSU7eQ-1
Received: by mail-pf1-f197.google.com with SMTP id y142so10417115pfb.21
        for <linux-leds@vger.kernel.org>; Tue, 16 Feb 2021 09:42:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2A9twubF3w6uP2eZ9kbP24o7l8tEJ+WXbE5eeyHYWcw=;
        b=Ww03epQhcYJ8BMICyOzw1cJ7Qv/4AiHOEmUKZwlD17y1kn0cbIUpMKXfI/BuEMSPyT
         DFgcUu2SGzfdV7Dj8tyRBCd9+c8n8Z/wdpYEkTdMvxp5YiC5J4sdnxeh7rv7CJ3I5+I0
         yg+B6rjGZbphXytc1vHi+5ouf3bMExAlU0eGo/pLy8UGxxbfJ8BsoxkxfqSg45iYvZo0
         sdf46gT2EW2nW7djES2Ihsfff9y+qQyXdTW+rzJgawuWnqcMvco7t1ce/VRJM0skv20Z
         ZBn9Km2fjHalzn5rTo3lu9fE313oTxAm+yL42HG/pPe2F2UF5IsRPp0q/TKtxK5Mw246
         CcbA==
X-Gm-Message-State: AOAM533V+E8odjAHkC9mD79iuHJ5Ft1FKrmM2FKOk4ceR2zvWm1QzGMI
        gGzsqjxCnWvixge4pgLormId3NlkGy99E/PUoeBN29H+soR1qqeVr4DFJ57SRcZQ3yB6+5LEIDU
        GMyKXW5OZDg8U961tqwQkx1FG+lpZpg//WX3qRw==
X-Received: by 2002:a17:90a:bb0c:: with SMTP id u12mr5306954pjr.234.1613497350512;
        Tue, 16 Feb 2021 09:42:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLg7ipZzwcArm0wFJLlCxLfIuoWkf9+2zaUOjkqsqUI10FJtYSVegiTUw+0673lds+yNyXbKs3LHGk20Gt+lE=
X-Received: by 2002:a17:90a:bb0c:: with SMTP id u12mr5306927pjr.234.1613497350155;
 Tue, 16 Feb 2021 09:42:30 -0800 (PST)
MIME-Version: 1.0
References: <20210215004549.135251-1-roderick@gaikai.com> <20210215004549.135251-3-roderick@gaikai.com>
 <20210215154045.4ac27ec0@nic.cz> <CANndSK=6TAzJJCvcgtRe_ASLbcqb73Y81gXPu3Qhg62Dxyvmuw@mail.gmail.com>
 <20210215191757.58992f44@nic.cz> <CANndSKmA4nh6FRv89vBwshUD7t0c7bBMcZcC7TbQOzU88j=+jA@mail.gmail.com>
 <20210216174129.78b2e9ab@nic.cz> <CAO-hwJLmO4Y7Q2gXHCobx6M3_9ixz+3xpZzp+yB-uQfDQ9fHWA@mail.gmail.com>
 <20210216182155.4caba859@nic.cz>
In-Reply-To: <20210216182155.4caba859@nic.cz>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 16 Feb 2021 18:42:19 +0100
Message-ID: <CAO-hwJLourtf+1siacXn4URMoQjoZwp_x7eSUdR+BE3KuNX6uw@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] HID: playstation: add microphone mute support for DualSense.
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Jiri Kosina <jikos@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        pobm@protonmail.com,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Feb 16, 2021 at 6:22 PM Marek Behun <marek.behun@nic.cz> wrote:
>
> On Tue, 16 Feb 2021 18:12:39 +0100
> Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
>
> > On Tue, Feb 16, 2021 at 5:41 PM Marek Behun <marek.behun@nic.cz> wrote:
> > >
> > > On Tue, 16 Feb 2021 00:33:24 -0800
> > > Roderick Colenbrander <roderick@gaikai.com> wrote:
> > >
> > > > On Mon, Feb 15, 2021 at 10:17 AM Marek Behun <marek.behun@nic.cz> wrote:
> > > > >
> > > > > On Mon, 15 Feb 2021 10:07:29 -0800
> > > > > Roderick Colenbrander <roderick@gaikai.com> wrote:
> > > > >
> > > > > > On Mon, Feb 15, 2021 at 6:40 AM Marek Behun <marek.behun@nic.cz> wrote:
> > > > > > >
> > > > > > > On Sun, 14 Feb 2021 16:45:47 -0800
> > > > > > > Roderick Colenbrander <roderick@gaikai.com> wrote:
> > > > > > >
> > > > > > > > From: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > > > > > > >
> > > > > > > > The DualSense controller has a built-in microphone exposed as an
> > > > > > > > audio device over USB (or HID using Bluetooth). A dedicated
> > > > > > > > button on the controller handles mute, but software has to configure
> > > > > > > > the device to mute the audio stream.
> > > > > > > >
> > > > > > > > This patch captures the mute button and schedules an output report
> > > > > > > > to mute/unmute the audio stream as well as toggle the mute LED.
> > > > > > > >
> > > > > > > > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > > > > > >
> > > > > > > Is the microphone supported via Linux? I.e. is there an audio driver
> > > > > > > for it?
> > > > > >
> > > > > > Yes and no. The microphone is supported using USB, not yet using
> > > > > > Bluetooth (uses a custom protocol). Actually there are various other
> > > > > > audio features in the DualSense (headphone jack, speaker, volume
> > > > > > controls,..) and they all work using custom protocols. We were
> > > > > > planning to defer this work through future patches as the features are
> > > > > > very complicated and need a deep analysis on how to realize them. For
> > > > > > example audio controls work through HID, but for USB the audio driver
> > > > > > is a generic hda audio device I think. Bluetooth is a custom protocol
> > > > > > and will be yet a different audio driver somewhere.
> > > > > >
> > > > > > > If it is, look at the audio-micmute LED trigger.
> > > > > > >
> > > > > >
> > > > > > I'm not sure if the expected behavior for the DualSense is similar to
> > > > > > the standard audio mute use cases. My understanding of these triggers
> > > > > > (please correct me if I'm wrong) is for e.g. an audio driver or user
> > > > > > space to send a signal to anything registering for a particular
> > > > > > trigger. In this case a global micmute. Is that, right?
> > > > > >
> > > > > > In our case for PlayStation games, there are often multiple
> > > > > > controllers connected and each user has their own microphone in their
> > > > > > controller. All can function at the same time (different from a
> > > > > > standard PC use case). That's why I'm wondering if this makes sense.I
> > > > > > know we are on Linux, but for Sony we want to properly support such
> > > > > > use cases.
> > > > >
> > > > > If there aren't audio drivers yet for this, simply have this driver
> > > > > also register a private LED trigger (with name "joystick-audiomute"
> > > > > or something similar), and when registering the LED, set the
> > > > > trigger_type member. Look at trigger_type in include/linux/leds.h, and
> > > > > in LED Documentation.
> > > >
> > > > Sorry for some more questions. I have been trying to understand
> > > > triggers all night. The concept is just so strange and foreign to me.
> > > > I understand it is in the end just a string and one use case is
> > > > in-kernel IPC and you can configure them from user space as well, but
> > > > I just don't get it. I understand you can use a trigger to in the end
> > > > program your LED in a automatic manner. I just don't understand how
> > > > the concepts fit together and how to implement it (maybe I will update
> > > > the docs later on... they are a bit sparse for if you don't know this
> > > > area).
> > > >
> > > > Regarding registering a private trigger. I see include/linux/leds.h
> > > > have a comment about trigger_type and how it should be set for private
> > > > triggers on led_classdev. I haven't been able to find any example
> > > > usages of this within the kernel. It doesn't seem to be used in the
> > > > kernel, maybe it is just around for future use? I also seem to need to
> > > > implement my own activate/deactive callbacks for the trigger. These I
> > > > would use to program the LED brightness I guess. Though I see various
> > > > trigger drivers (drivers/leds/triggers), but not all of them have
> > > > activate/deactivate callbacks. Mostly simple drivers, but not sure why
> > > > they don't need them. What else is the point of a trigger?
> > > >
> > > > > When this trigger is enabled for your LED, have your code switch LED
> > > > > state like it does now. When there is no trigger enabled, the userspace
> > > > > will be able to set brightness of this LED via sysfs.
> > > >
> > > > Right now I manage the button mute state directly from the input
> > > > handler (dualsense_parse_report) when the button is pressed and then
> > > > schedule an output report to toggle the LED and program the DualSense
> > > > to mute its audio (the PlayStation works very similar). I would need
> > > > to use led_trigger_event then here?
> > > >
> > > > If I then understand it right, I need to modify my "brightness_set"
> > > > handler and check if there is a trigger (based on
> > > > led_classdev->activated??). If there is none, then userspace can
> > > > change the LED state. Internally when I change the LED state, I will
> > > > also program the hardware to mute as well. (they are tied together)
> > > >
> > > > I am tempted to wait with the trigger code as I really don't understand it.
> > >
> > > Simple triggers are just normal triggers but with some simplifying code
> > > to avoid code repetition. Ignore them for now.
> > >
> > > When a trigger is set to a LED via sysfs, the trigger .activate()
> > > method is called and the led_cdev.trigger is set to point to that
> > > trigger.
> > >
> > > It is then up to the code inside the trigger's .activate() method to
> > > initialize mechanisms that will control the LED.
> > >
> > > For netdev trigger a delayed_work is scheduled periodically, and in each
> > > execution of that work's callback the netdevice's stats are compared to
> > > the last ones. If the new stats are greater, the trigger code blinks the
> > > LED.
> > >
> > > So in your case it is pretty simple to implement, because you already
> > > have the necessary code to manipulate the LED brightness automatically
> > > according to whether button was pressed. You are setting
> > >   ds->update_mic_mute = true;
> > > in dualsense_parse_report() and then manipulate the LED in
> > > dualsense_output_worker().
> > >
> > > Just add another boolean member into struct dualsense:
> > >   bool control_mute_led;
> > > and change the code in dualsense_output_worker() to only change the
> > > mute_led brightness is this new member is true.
> > >
> > > Add this code to your driver:
> > >
> > >   static struct led_hw_trigger_type ps_micmute_trigger_type;
> > >
> > > When registering the LED in ps_led_register(), also set
> > >   led->trigger_type = &ps_micmute_trigger_type;
> > >
> > > Add this functions:
> > >   static int ps_micmute_trig_activate(struct led_classdev *led_cdev)
> > >   {
> > >     struct dualsense *ds = container_of(...);
> > >
> > >     /* make the worker control mute LED according to mute button */
> > >     ds->control_mute_led = true;
> > >
> > >     /* make sure the mute LED shows the current mute button state */
> > >     ds->update_mic_mute = true;
> > >     schedule_work(&ds->output_worker);
> > >
> > >     return 0;
> > >   }
> > >
> > >   static void ps_micmute_trig_deactivate(struct led_classdev *led_cdev)
> > >   {
> > >     struct dualsense *ds = container_of(...);
> > >
> > >     ds->control_mute_led = false;
> > >   }
> > >
> > >   static struct led_trigger ps_micmute_trigger = {
> > >     .name = "playstation-micmute",
> > >     .activate = ps_micmute_trig_activate,
> > >     .deactivate = ps_micmute_trig_deactivate,
> > >     .trigger_type = &ps_micmute_trigger_type,
> > >   };
> > >
> > > Add this code to ps_init():
> > >   int ret;
> > >
> > >   ret = led_trigger_register(&ps_micmute_trigger);
> > >   if (ret)
> > >     return ret;
> > >
> > > And to ps_exit():
> > >   led_trigger_unregister(&ps_micmute_trigger);
> > >
> > > All this will make sure that the driver will manipulate the mute
> > > LED state only when the playstation-micmute trigger is active on the
> > > LED.
> > >
> > > Moreover if you want this driver to be active on the LED by default,
> > > set this prior to registering the LED
> > >   led->default_trigger = "playstation-micmute";
> > >
> > > Finally add code to dualsense_mute_led_set_brightness() to make
> > > userspace/[other LED triggers] able to set mute LED brightness.
> > >
> > > The purpose of the .trigger_type member of struct led_classdev and
> > > struct led_trigger is that if this member is set for a trigger, this
> > > trigger will only be available for LEDs that have the same trigger_type.
> > >
> >
> > Thanks Marek for the in-depth 101 on LED triggers :)
> >
> > However, I am not sure we want to enable LED triggers for the micmute
> > on the controller itself. In the early discussions with Roderick, I
> > already suggested the use of the LED triggers, and the problem was
> > that they are shared system-wide. This is good for many use cases, but
> > in that particular case, the user expects the mic *of the controller*
> > to be muted, not everyone's controller's mics.This is a behavior
> > inherited from the Playstation 5 which would be hard to sell to owners
> > of the controllers.
>
> They are not system wide if private LED trigger API is used, as I
> explained and as the example code does it in my previous reply. This
> trigger will only be available for PlayStation micmute LEDs.

My initial reply was the following:
"""
Unless I am reading this all wrong, the "private" is private for the
driver, not the device itself. If I have 2 controllers connected, and
both are set to "playstation-micmute", if one controller sends the
trigger because the button is pressed, both controllers would receive
the trigger, no?
"""

But after re-reading your explanations it seems you are not asking the
trigger to be actually "triggered". So basically, the private trigger
is just a way for the driver to handle its own business and allow
other triggers to be set. I always thought that whenever we declare a
trigger, we *had* to use it, but actually using the trigger just as a
way to confer information is smart.

Cheers,
Benjamin

>
> > So if read-only LEDs are not an option, how about we simply ditch the
> > LED for micmute in the current code, and have a simple callback
> > executed by the driver to light up or not the LED when the player
> > presses the key. Or just revert entirely this commit in the currently
> > staged series. We can then figure out a better way in the next future
> > to handle that part.
>
> This is irrelevant if you take into account the information I wrote
> above.
>
> > BTW, AFAICT, the only problem we have left (if we put that micmute
> > issue aside) is about the naming convention. If we fix the naming
> > shortly, would you have any concerns if we still push that code to
> > Linus in 5.12-rc0?
>
> Yes, if naming is corrected I have no issue with this. LED triggers can
> be sent to 5.13.
>
> Marek
>

