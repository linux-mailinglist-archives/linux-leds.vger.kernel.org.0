Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53FC231BD04
	for <lists+linux-leds@lfdr.de>; Mon, 15 Feb 2021 16:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhBOPi3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Feb 2021 10:38:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231521AbhBOPh4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Feb 2021 10:37:56 -0500
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F062AC061756
        for <linux-leds@vger.kernel.org>; Mon, 15 Feb 2021 07:37:09 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id q85so6680656qke.8
        for <linux-leds@vger.kernel.org>; Mon, 15 Feb 2021 07:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Hb5nI6Q6WBDCaymmNdmUo4qabXK+bI2hlTBxNdA/A0=;
        b=XTL1p8UKPHCluyI9HzqkrQXTq5sBRsaOOwm8DWIOKk+t4vcQpQ7N4xxXoZqCguxODA
         HYMbRnQAkzdLyq/C2es7Jg7vHn60/n1l0ckxd/Mr0/4/FooC0E8gRT4iL7jy+moE26UV
         1kPNx4847LfqHCtmkZfEpfW4TgeA2uEdROOZNmDnqFX/d8FWd+dogvhq3tT3er0fWnrZ
         n5a85DhgzCbh6B02o9nQY3Tl9dnOTf4zgc4ZMkeR9yoyG6vTFpIRNpmaxB/UOsZ/V01c
         pH69nS0cMCTuhSbZ9tqqb0qgtDvvDSoJUcu2IraI065ctlQ7L2mvqoRVssoLlKllzmfn
         qz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Hb5nI6Q6WBDCaymmNdmUo4qabXK+bI2hlTBxNdA/A0=;
        b=DFYPIIQZh9Bj1vVZ6sTnwLsF/lcOOs3tZr62V286YiKBIixGyKhLnP6qu6msiVZlVP
         HLJfgkLcIETOtE5pEGltTxZanLwmSizosMBVsGFHYa4xk8Cbay5oyQfWeAZuLbobofJx
         AEBqeG2Oew/Cn1tHHO/yGf+ajKBkg4/llRurivfZvS4kBF124vAQX48VyGdMYiNRyeFl
         WiObYWJEWVHcehCl3YMHT8v20USNNlenZ7JFMSvq5MLOJdnEADB9I0Ol3L9jN3lu3Csz
         zRuUHJ7cG1GSHoL2sFLGiyePKtG6Xoh0h/xAqs9qtiv2yJArbT42yCcS1eZFbLczJ82p
         08QA==
X-Gm-Message-State: AOAM532P3hPQMzY42a2XvBS2pUica/Mb+KPlpY6U9/KsjJgrW07kXMoC
        FU/K4tjpnwhXlqIDSOeEPNah7H2A7eaGcus2T3fmKw==
X-Google-Smtp-Source: ABdhPJyYgu6wUZ/b1WObUVIK2pYaLswn1F/F66kM7S8MANpKwetb96z/bouA8B70ZyearMuI1OmNL8wdGKb+YlksFHE=
X-Received: by 2002:a05:620a:cd6:: with SMTP id b22mr14799762qkj.451.1613403429194;
 Mon, 15 Feb 2021 07:37:09 -0800 (PST)
MIME-Version: 1.0
References: <20210215004549.135251-1-roderick@gaikai.com> <20210215004549.135251-2-roderick@gaikai.com>
 <20210215143144.060fdbe6@nic.cz>
In-Reply-To: <20210215143144.060fdbe6@nic.cz>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Mon, 15 Feb 2021 07:36:58 -0800
Message-ID: <CANndSKmSP7rdsrMuwRapQkDru75TxN9zbDUbvOj_5hrQpskmJg@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] HID: playstation: add DualSense lightbar support
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

On Mon, Feb 15, 2021 at 5:31 AM Marek Behun <marek.behun@nic.cz> wrote:
>
> On Sun, 14 Feb 2021 16:45:46 -0800
> Roderick Colenbrander <roderick@gaikai.com> wrote:
>
> > +     led_cdev->name = devm_kasprintf(&hdev->dev, GFP_KERNEL, "playstation::%pMR::rgb",
> > +                     ps_dev->mac_address);
> ...
> > +     ret = devm_led_classdev_multicolor_register(&hdev->dev, lightbar_mc_dev);
>
> The LED subsystem has a predefined schema by which LED names should
> look like:
>   devicename:color:function
> (Not all fields are required, but the order must be preserved. The ':'
>  character should be used only as separator of these fields, so not MAC
>  addresses in these names, it will confuse userspace parsers.)
> See Documentation/leds/leds-class.rst
>
> The devicename part should not be "playstation". It should be something
> otherwise recognizable from userspace. For example an mmc indicator has
> devicename "mmc0", keyboard capslock LED can have devicename "input0"...
>
> In your case the name should be something like:
>   input3:rgb:indicator

Naming is a little bit tricky. The LEDs as well as other sysfs nodes
are added to the 'parent' HID device, not the input devices. In case
of DualSense it is actually implemented as a composite device with
mulitple input devices (gamepad, touchpad and motion sensors) per HID
device. The device name of HID devices seems to be something like:
<bus>:<vendor_id>:<product_id>:<some other id> e.g. for DualSense USB
0003:054C:0CE6.0029 or Bluetooth 0005:054C:0CE6.002B

This is I guess why many HID devices in general pick their own names
(and not all have need to have input devices I guess). Though Benjamin
and Jiri know better.

I'm not sure what naming could make sense here. The previous Sony
driver for PlayStation devices used: HID_name "::red" for e.g. red LED
on DualShock 4.

> Different existing functions are defined in
> include/dt-bindings/leds/common.h.
>
> BTW there are extended versions of LED registering functions, suffixed
> by "_ext". These accept a struct led_init_data. If a fwnode of the LED
> is passed to the registering function via this struct, the LED core
> will compose a name for the LED itself. But since your LEDs don't have
> device-tree nodes because they are on USB/BlueTooth joysticks, you
> either have to compose the name itself like your code is doing now, or
> you can propose a patch to the LED core, so that LED core will be able
> to compose the LED name even without a device-tree node.
>
> JFI, the function part is (in the future) supposed to somehow define LED
> trigger which the system will assign to the LED on probe, but this is
> not implemented yet. Currently when the LED has a devicetree node,
> the trigger is assigned from the `linux,default-trigger` property, but
> the idea is to infer it from the `function` property.
>

Thanks for the info. Might be handy in the future.

> What is this RGB LED supposed to do on the joystick? Is it just for
> nice colors? Or should it blink somehow? Can the hardware in the
> joystick blink the LED itself? Or maybe fade between colors?

I mentioned a bit in the other email. These LEDs are under direct
control from PlayStation games. Some may change the color on a per
video frame basis. Use cases include health (green) and when a
character loses health becomes more red/orange and can start flashing.
I have seen games use this for police car and then mixing between blue
and red. Others use it with a static player ID color. The console side
API is literally raw RGB values. There is no hardware blink support.
The previous controllers had it though.

> There is for example the pattern LED trigger which changes the LED
> brightness by a defined pattern. I am planning to add multicolor
> support to this trigger, because our RGB LED controller can offload
> such thing to hardware.
>
> Marek

Thanks,
Roderick
