Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9908131CF18
	for <lists+linux-leds@lfdr.de>; Tue, 16 Feb 2021 18:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhBPRcU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Feb 2021 12:32:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20254 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231246AbhBPRbb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 16 Feb 2021 12:31:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613496603;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6KFZHA8LHzUAUd4JrGpryLyVr1tjiuh/bfJkWe7Rh2o=;
        b=YxzCjAKneRV6GYQqGJ6W4tJMthW+JaZ3vmuPIhMJXkKzoKQY98fJVF7L1C20ICJcu8VClB
        AIsxXk+A2pYoaiMR34HzcdEQ+cHkn5+dCc3CRXO/QFAxHZISBnmDF98yv2z1k4NgJtSTm9
        YbN0a57OUnRcZOfE8WFyetfMqiOw+B0=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-4klqYPaAMjGFkd5NHI30-w-1; Tue, 16 Feb 2021 12:29:59 -0500
X-MC-Unique: 4klqYPaAMjGFkd5NHI30-w-1
Received: by mail-pf1-f198.google.com with SMTP id 137so10419656pfw.4
        for <linux-leds@vger.kernel.org>; Tue, 16 Feb 2021 09:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6KFZHA8LHzUAUd4JrGpryLyVr1tjiuh/bfJkWe7Rh2o=;
        b=c7vbVFwU2q6IOiskF5HvYRMCK0igeeQ5gcLs+rWHlcyI57sq8qkvjPaMz5EaflIDmV
         SiRXiG4sP48jtUqxsTiT+KlAzNveFSNgoyA5PnBsbyjYb/5jv88L/yFclVPzkPfrFgWT
         cQAyfYpa6tR4dB853HbKp2KrtSzSiYU0nVuR88D+R9L0CAdjPEShlXVp7hv12p1SeIZw
         7DocpfZ3qVeICR/tNkwMOJpyc1fYHvw6yP9TyivZ4mcSvtPA0/eTNeD+vUU2nsxaxrE4
         m9Zs3XhECflY6t5MHnhjxYWYjaXwcA/OdUvpFV3sF6DUh1JzYP2FqBGtSOR0McYeAhfB
         mevQ==
X-Gm-Message-State: AOAM53304/FSau1NpgwDiVbUVb9AZhrS+meXhAjJVe4YxNlOjF/bdeOA
        OnPzdahFYeKqRUWVLzifzxR3EsIi3fPePdMeYvqbCcMwZLZRIDVAlUyeemR3dHkcLUGYQ1bZ3ZZ
        pTTQMFbVYby+aifnzWpMPBY7xVLN86Ixl2uu+kg==
X-Received: by 2002:aa7:9a4c:0:b029:1db:1c54:d52d with SMTP id x12-20020aa79a4c0000b02901db1c54d52dmr20329330pfj.35.1613496598175;
        Tue, 16 Feb 2021 09:29:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzi+Wd0amtTNqjjXi4/DkxbmH66kPG4aJWIeSbq8mDfnPvoIGZfjOM6OkLIFLS8YYFMvGbaCStcGp/Q4pYOGt0=
X-Received: by 2002:aa7:9a4c:0:b029:1db:1c54:d52d with SMTP id
 x12-20020aa79a4c0000b02901db1c54d52dmr20329310pfj.35.1613496597894; Tue, 16
 Feb 2021 09:29:57 -0800 (PST)
MIME-Version: 1.0
References: <20210215004549.135251-1-roderick@gaikai.com> <20210215004549.135251-2-roderick@gaikai.com>
 <20210215143144.060fdbe6@nic.cz> <CANndSKmSP7rdsrMuwRapQkDru75TxN9zbDUbvOj_5hrQpskmJg@mail.gmail.com>
 <20210215165518.16033bb6@nic.cz> <CANndSKkVAFJzf58CNYw_j0QY7hd4umOMn5Cs6U3JnK6TozWdEQ@mail.gmail.com>
 <20210215192124.7a6c8c9d@nic.cz>
In-Reply-To: <20210215192124.7a6c8c9d@nic.cz>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 16 Feb 2021 18:29:46 +0100
Message-ID: <CAO-hwJ+=_fjHgenXvHv45sHgzwiG2z9vGeq7fmMqj2=BeYCF1Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] HID: playstation: add DualSense lightbar support
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Jiri Kosina <jikos@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Feb 15, 2021 at 7:21 PM Marek Behun <marek.behun@nic.cz> wrote:
>
> On Mon, 15 Feb 2021 09:51:15 -0800
> Roderick Colenbrander <roderick@gaikai.com> wrote:
>
> > On Mon, Feb 15, 2021 at 7:55 AM Marek Behun <marek.behun@nic.cz> wrote:
> > >
> > > On Mon, 15 Feb 2021 07:36:58 -0800
> > > Roderick Colenbrander <roderick@gaikai.com> wrote:
> > >
> > > > Hi Marek,
> > > >
> > > > On Mon, Feb 15, 2021 at 5:31 AM Marek Behun <marek.behun@nic.cz> wrote:
> > > > >
> > > > > On Sun, 14 Feb 2021 16:45:46 -0800
> > > > > Roderick Colenbrander <roderick@gaikai.com> wrote:
> > > > >
> > > > > > +     led_cdev->name = devm_kasprintf(&hdev->dev, GFP_KERNEL, "playstation::%pMR::rgb",
> > > > > > +                     ps_dev->mac_address);
> > > > > ...
> > > > > > +     ret = devm_led_classdev_multicolor_register(&hdev->dev, lightbar_mc_dev);
> > > > >
> > > > > The LED subsystem has a predefined schema by which LED names should
> > > > > look like:
> > > > >   devicename:color:function
> > > > > (Not all fields are required, but the order must be preserved. The ':'
> > > > >  character should be used only as separator of these fields, so not MAC
> > > > >  addresses in these names, it will confuse userspace parsers.)
> > > > > See Documentation/leds/leds-class.rst
> > > > >
> > > > > The devicename part should not be "playstation". It should be something
> > > > > otherwise recognizable from userspace. For example an mmc indicator has
> > > > > devicename "mmc0", keyboard capslock LED can have devicename "input0"...
> > > > >
> > > > > In your case the name should be something like:
> > > > >   input3:rgb:indicator
> > > >
> > > > Naming is a little bit tricky. The LEDs as well as other sysfs nodes
> > > > are added to the 'parent' HID device, not the input devices. In case
> > > > of DualSense it is actually implemented as a composite device with
> > > > mulitple input devices (gamepad, touchpad and motion sensors) per HID
> > > > device. The device name of HID devices seems to be something like:
> > > > <bus>:<vendor_id>:<product_id>:<some other id> e.g. for DualSense USB
> > > > 0003:054C:0CE6.0029 or Bluetooth 0005:054C:0CE6.002B
> > > >
> > > > This is I guess why many HID devices in general pick their own names
> > > > (and not all have need to have input devices I guess). Though Benjamin
> > > > and Jiri know better.
> > > >
> > > > I'm not sure what naming could make sense here. The previous Sony
> > > > driver for PlayStation devices used: HID_name "::red" for e.g. red LED
> > > > on DualShock 4.
> > >
> > > We have to find a reasonable devicename here. If each joystick registers
> > > multiple input devices, it cannot be "input%d". I suppose there isn't
> > > an API for grouping mulitple input devices toghether into inputgroups.
> > > Maybe it could be in the format "joystick%d".
> >
> > Yeah, there is no inputgroups mechanism.  It could use some type of
> > joystick name if that's what desired. However, there is no common ID
> > code. Individual drivers are sometimes calculating their own IDs
> > (hid-nintendo, hid-sony, hid-playstation and xpad I think). At least
> > for hid-sony/hid-playstation the use case for tracking IDs is for a
> > part to prevent duplicate devices as you can connect your device using
> > both bluetooth and USB. So would be "ps-joystick0"
> >
> > At the HID layer there does seem to be a unique ID, but it is only
> > exposed in the name string: This is how the name is constructed:
> >      dev_set_name(&hdev->dev, "%04X:%04X:%04X.%04X", hdev->bus,
> >              hdev->vendor, hdev->product, atomic_inc_return(&id));
> >
> > This ID is HID specific, but not all input devices use HID.
> >
> > I'm not entirely sure what makes sense...
>
> So all HIDs can be uniqely determined via this atomic_inc_return(&id),
> but it is only stored in string form as part of device name.

Yes and no. This atomic_inc is only used to allow a sysfs tree,
because you can have several HID devices below the same USB, I2C or
UHID physical device. From the userspace, no-one cares about that ID,
because all HID devices are exported as input, IIO or hidraw nodes.

So using this "id" would not allow for a direct mapping HID device ->
sysfs entry because users will still have to walk through the tree to
find out which is which.

An actual one-to-one mapping would using 'hidrawX' because there is a
one-to-one mapping between /dev/hidrawX for HID devices. However, this
means that we consider the bus to be hidraw which is plain wrong too.

The unique ID of HID devices (in /sys/bus/hid/devices) is in the form
`BUS:VID:PID.XXXX`. I understand the need to not have colons, so could
we standardize LEDs on the HID subsystem to be named
`hid-bus_vid_pid_xxxx:color:fun(-n)?`? That would allow a mapping
between the LED and the sysfs, and would also allow users to quickly
filter out the playstation ones.

Cheers,
Benjamin

>
> Send a patch to hid-core to make this atomic_inc_return(&id) also be
> stored into struct hid_device as an integer, not only as a part
> of the device name string.
>
> Then use "hid%d" as the devicename for this LED, with %d substituted
> with this ID.
>
> Marek
>

