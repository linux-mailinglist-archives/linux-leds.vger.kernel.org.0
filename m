Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A202A1E4C
	for <lists+linux-leds@lfdr.de>; Sun,  1 Nov 2020 14:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbgKANWj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 1 Nov 2020 08:22:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbgKANWh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 1 Nov 2020 08:22:37 -0500
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F07C061A47
        for <linux-leds@vger.kernel.org>; Sun,  1 Nov 2020 05:22:35 -0800 (PST)
Received: by mail-il1-x144.google.com with SMTP id x7so10616529ili.5
        for <linux-leds@vger.kernel.org>; Sun, 01 Nov 2020 05:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ShSGuvzTZ9oRwHQvKH+4qGpJUbwqqt5H/ER7WPbU3Mg=;
        b=XUdipgFowg/ECNf45XU3c5ouaQdcS366SuUFtbO3RXVg2yKGl36MizHY+ZsaxuyMKv
         kiSfNy8/4gna1P04uSXdLd7hU9Dmi+Lck1/St76h54HlnbpQxFfYMnSMFX2OpCvItItH
         RfgERU55lyphXg5rJMKKKkwaJf33X7w7NWrqmCHNqRPq4/prcWeM98uRd9wbzkwK7CfH
         k+QSEqD1L3n7n3+3VP2ux9qilILpw5MBbT5uswVlogqCchyPnHubXrnU4PjkW/MyYGTr
         GacwsOkhbd22MeTbJ6qh4SRKkPx3ZOba+Lq8Ep7JyovU8r0Td6+XJ4VSl/L697Nz055E
         mbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ShSGuvzTZ9oRwHQvKH+4qGpJUbwqqt5H/ER7WPbU3Mg=;
        b=bQlA1NJgL/VoPsv0tS0V4cnQN5dR5rnLuD3NmakDnqhT0JoegFAqVBSKYU7Jz5ShH5
         +UPA7n2EE5X/oVykACsUcQ12sD2LGyTwDCleQW0Jbv9QX1da30PP/qESk0WnCXdyKZl2
         Q0YTkOdQfEJqWw/p5RMjxs9YaFhgzPvj1USbuoj+uhXQcaSRyAGJ/NbOTmRwDBuc7RqA
         HeRoEgne22UHJfkAd7kOaFJ9YJZ4w6Qshj1dDjHTMExacClywIbjFXZzdz6iFnc8gYJh
         oS/ch0ZlrPb/Py5M9RiK0vAtmxqBDMDqdQsZwoQfgvM2K2Xq5uQcFz1MbAsMEQP4Zlrg
         gJgA==
X-Gm-Message-State: AOAM531ATpLuI81NbyVcPoO9LpwggYezPjZanVsSjfr6uiVsAk0IzEYN
        BOnKR2Bhez3uEz9Ef3bPeGyrhK+ezO5pKhQNWyoVo5YUi4nqsQ==
X-Google-Smtp-Source: ABdhPJyNjdsAGxWigjWKEzVugKBc4/eIDv0hD4KSdu4anJoO0hDCDsTKKmiGl3uucYlbtQKSLe7cmf0MxJdH8HJ93wE=
X-Received: by 2002:a05:6e02:f12:: with SMTP id x18mr3454714ilj.145.1604236954484;
 Sun, 01 Nov 2020 05:22:34 -0800 (PST)
MIME-Version: 1.0
References: <20201025005916.64747-1-luka.kovacic@sartura.hr>
 <20201025005916.64747-3-luka.kovacic@sartura.hr> <CAHp75Vd81cK+nhJ1fxgRC6cEKnBELVA9UtT8VPvq7nbHEdhecQ@mail.gmail.com>
In-Reply-To: <CAHp75Vd81cK+nhJ1fxgRC6cEKnBELVA9UtT8VPvq7nbHEdhecQ@mail.gmail.com>
From:   Luka Kovacic <luka.kovacic@sartura.hr>
Date:   Sun, 1 Nov 2020 14:22:23 +0100
Message-ID: <CADZsf3ZtQyEK6diz6W=6tZz+=Toyj_XYU33At0JiLutsuRrizA@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] drivers: mfd: Add a driver for IEI WT61P803 PUZZLE MCU
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Robert Marko <robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Andy,

On Mon, Oct 26, 2020 at 11:54 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Oct 25, 2020 at 3:59 AM Luka Kovacic <luka.kovacic@sartura.hr> wrote:
> >
> > Add a driver for the IEI WT61P803 PUZZLE microcontroller, used in some
> > IEI Puzzle series devices. The microcontroller controls system power,
> > temperature sensors, fans and LEDs.
> >
> > This driver implements the core functionality for device communication
> > over the system serial (serdev bus). It handles MCU messages and the
> > internal MCU properties. Some properties can be managed over sysfs.
>
> ...
>
> > +#include <asm/unaligned.h>
>
> asm/* usually go after linux/*.
> If you get a comment against one place in your series it implies to
> check the other potential places to address.

Okay.

>
> > +#include <linux/atomic.h>
>
> > +#include <linux/delay.h>
> > +#include <linux/delay.h>
>
> Delay should delay :-)

It certainly will :)

>
> > +#include <linux/export.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/iei-wt61p803-puzzle.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
>
> > +#include <linux/of_device.h>
>
> Don't see a user of this, but of_platform.h seems to be missed.

Okay, I'll add it.
I'm still using devm_of_platform_populate() in iei_wt61p803_puzzle_probe().

>
> > +#include <linux/property.h>
> > +#include <linux/sched.h>
> > +#include <linux/serdev.h>
> > +#include <linux/slab.h>
> > +#include <linux/sysfs.h>
>
> ...
>
> > +#define IEI_WT61P803_PUZZLE_MAX_COMMAND_LENGTH (20 + 2)
>
> Since it uses formula, can you add a comment explaining what is the
> meaning of each argument?

Ok.

>
> ...
>
> > +enum iei_wt61p803_puzzle_reply_state {
> > +       FRAME_OK = 0x00,
> > +       FRAME_PROCESSING = 0x01,
> > +       FRAME_STRUCT_EMPTY = 0xFF,
> > +       FRAME_TIMEOUT = 0xFE
>
> Hmm, why not ordered?

I'll order it by value.

>
> > +};
>
> ...
>
> > +struct iei_wt61p803_puzzle_mcu_version {
> > +       char version[IEI_WT61P803_PUZZLE_VERSION_VERSION_LENGTH + 1];
> > +       char build_info[IEI_WT61P803_PUZZLE_VERSION_BUILD_INFO_LENGTH + 1];
> > +       bool bootloader_mode;
> > +       char protocol_version[IEI_WT61P803_PUZZLE_VERSION_PROTOCOL_VERSION_LENGTH + 1];
> > +       char serial_number[IEI_WT61P803_PUZZLE_VERSION_SN_LENGTH + 1];
> > +       char mac_address[8][IEI_WT61P803_PUZZLE_VERSION_MAC_LENGTH + 1];
>
> Perhaps additional constant to include (presumably) NUL ?

I wouldn't separate this into a constant, I can add a comment
explaining this is NUL.

>
> Also, what about 8?

Okay, I can add a constant for the number of MAC addresses.

>
> > +};
>
> ...
>
> > +struct iei_wt61p803_puzzle {
> > +       struct serdev_device *serdev;
>
> > +       struct kobject *kobj;
>
> It's quite strange you need this,

This is used in iei_wt61p803_puzzle_sysfs_create() and
iei_wt61p803_puzzle_sysfs_remove() to clean up afterwards.

>
> > +       struct mutex reply_lock;
> > +       struct mutex bus_lock;
> > +       struct iei_wt61p803_puzzle_reply *reply;
> > +       struct iei_wt61p803_puzzle_mcu_version version;
> > +       struct iei_wt61p803_puzzle_mcu_status status;
> > +       unsigned char *response_buffer;
> > +       struct mutex lock;
> > +};
>
> ...
>
> > +static int iei_wt61p803_puzzle_recv_buf(struct serdev_device *serdev,
> > +                                       const unsigned char *data, size_t size)
> > +{
> > +       struct iei_wt61p803_puzzle *mcu = serdev_device_get_drvdata(serdev);
> > +       int ret;
> > +
> > +       ret = iei_wt61p803_puzzle_process_resp(mcu, (unsigned char *)data, size);
>
> Dropping const, why?

I copy the content, so I can remove the cast and change the parameter
iei_wt61p803_puzzle_process_resp() accepts to const unsigned char *.

>
> > +       /* Return the number of processed bytes if function returns error */
> > +       if (ret < 0)
>
> > +               return (int)size;
>
> Will be interesting result, maybe you wanted other way around?

That is intentional.
A single frame is concatenated in the iei_wt61p803_puzzle_process_resp()
function. In case we find ourselves in an unknown state, an error is
returned there.

We want to discard the remaining incoming data, since the frame this
data belongs
to is broken anyway.

>
> > +       return ret;
> > +}
>
> ...
>
> > +       dev_err(dev, "%s: Command response timed out. Retries: %d", __func__, retry_count);
>
> Drop __func__, it should not be critical for properly formulated
> messages (for debug Dynamic Debug may take care of this at run time).

Okay.

>
>
> > +       return -ETIMEDOUT;
>
> ...
>
> > +       struct device *dev = &mcu->serdev->dev;
> > +       int ret;
>
> > +       int len = (int)size;
>
> Why len can't be size_t?

I'll check how I can improve this.

>
> Can it be also organized in reversed xmas tree order?

Ok.

>
> ...
>
> > +       ret = serdev_device_write(mcu->serdev, cmd, len, IEI_WT61P803_PUZZLE_GENERAL_TIMEOUT);
>
> > +
>
> Not a competition for LOCs, please drop unneeded blank lines here and there.

Ok.

>
> > +       if (ret < 0) {
> > +               mutex_unlock(&mcu->bus_lock);
> > +               return ret;
> > +       }
>
> > +       if (!mcu->reply) {
> > +               ret = -EFAULT;
>
> Why this error code?

Maybe ENOMEM is more appropriate here...

>
> > +               goto exit;
> > +       }
>
> ...
>
> > +exit:
>
> Perhaps
> exit_unlock:
> ?
>
> > +       mutex_unlock(&mcu->lock);
> > +       return ret;
>
> ...
>
> > +       sprintf(mcu->version.version, "v%c.%c%c%c", rb[2], rb[3], rb[4], rb[5]);
>
> Can be '%.3s' for the second part, but it's up to you.

Okay, I agree, that would look better.

>
> ...
>
> > +       sprintf(mcu->version.build_info, "%c%c/%c%c/%c%c%c%c %c%c:%c%c",
> > +               rb[8], rb[9], rb[6], rb[7], rb[2],
> > +               rb[3], rb[4], rb[5], rb[10], rb[11],
> > +               rb[12], rb[13]);
>
> Ditto.
>
> ...
>
> > +       sprintf(mcu->version.protocol_version, "v%c.%c%c%c%c%c",
> > +               rb[7], rb[6], rb[5], rb[4], rb[3], rb[2]);
>
> Ditto.
>
> ...
>
> > +err:
>
> err_unlock: ?

I use goto only in case there is also a mutex to unlock, so I don't see why
to change this.

>
> > +       mutex_unlock(&mcu->lock);
> > +       return ret;
>
> ...
>
> > +       /* Response format:
> > +        * (IDX RESPONSE)
> > +        * 0    @
> > +        * 1    O
> > +        * 2    S
> > +        * 3    S
> > +        * ...
> > +        * 5    AC Recovery Status Flag
> > +        * ...
> > +        * 10   Power Loss Recovery
> > +        * ...
> > +        * 19   Power Status (system power on method)
> > +        * 20   XOR checksum
> > +        */
>
> Shouldn't be rather defined data structure for response?

Every response, apart from the standard headers and a checksum
at the end is completely different and I don't see a good way to
standardize that in some other way.

>
> ...
>
> > +       size_t reply_size = 0;
>
> Dummy?
>
> ...
>
> > +       sprintf(mcu->version.serial_number, "%.*s",
> > +               IEI_WT61P803_PUZZLE_VERSION_SN_LENGTH, resp_buf + 4);
>
> Shouldn't you check for reply_size to be big enough?

I'll add a check.

>
> ...
>
> > +               serial_number_header[2] = 0x0 + (0xC) * sn_counter;
>
> Why capital, why in parentheses?
>
> ...
>
> > +               memcpy(serial_number_cmd + 4, serial_number + (0xC) * sn_counter, 0xC);
>
> Ditto.

I'll change these to lower case and remove the parentheses.

>
> ...
>
> > +               serial_number_cmd[sizeof(serial_number_cmd) - 1] = 0;
>
> You defined X+1 to then use sizeof() -1? Hmm...

This was used for the XOR checksum.
I'll remove this statement as it is not needed anymore.

>
> ...
>
> > +               if (!(resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
> > +                     resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK &&
> > +                     resp_buf[2] == IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK)) {
> > +                       ret = -EPROTO;
> > +                       goto err;
> > +               }
>
> I think it would be better to define data structure for replies and
> then check would be as simple as memcmp().

I'd keep this as is, because the replies are different a lot of the times.
Especially when the reply isn't just an ACK.

>
> ...
>
> > +               if (reply_size < 22) {
>
> Looking at the code organisation it seems to me like if (reply_size <
> sizeof(struct_of_this_type_of_reply)).
>
> > +                       ret = -EIO;
> > +                       goto err;
> > +               }
>
> ...
>
> > +       mac_address_header[2] = 0x24 + (0x11) * mac_address_idx;
>
> Why in parentheses?
>
> ...
>
> > +       /* Concat mac_address_header, mac_address to mac_address_cmd */
> > +       memcpy(mac_address_cmd, mac_address_header, 4);
> > +       memcpy(mac_address_cmd + 4, mac_address, 17);
>
> Yeah, much easier to use specific field names instead of this 4 / + 4, 17, ...

Ok, I'll convert this to:
memcpy(mac_address_cmd, mac_address_header, sizeof(mac_address_header));
...

>
> ...
>
> > +       ret = snprintf(cmd_buf, sizeof(cmd_buf), "%d", power_loss_recovery_action);
> > +       if (ret < 0)
> > +               return ret;
>
> ...
>
> > +       power_loss_recovery_cmd[3] = cmd_buf[0];
>
> One decimal (most significant) digit?! Isn't it a bit ambiguous?

The power_loss_recovery_action can only have a value of 0 - 4.
My understanding is that if I give snprintf a buffer of size 1, it will
truncate the one character to make space for NUL.

>
> ...
>
> > +#define sysfs_container(dev) \
> > +       (container_of((dev)->kobj.parent, struct device, kobj))
> > +
> > +static ssize_t version_show(struct device *dev, struct device_attribute *attr,
> > +                           char *buf)
> > +{
> > +       struct device *dev_container = sysfs_container(dev);
> > +       struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
> > +
> > +       return sprintf(buf, "%s\n", mcu->version.version);
> > +}
> > +static DEVICE_ATTR_RO(version);
>
> I believe we have better approach than this. dev_groups, for example.

Ok, I'll check how I could improve it.

>
> ...
>
> > +       if ((int)count != IEI_WT61P803_PUZZLE_VERSION_SN_LENGTH + 1)
> > +               return -EINVAL;
>
> You need to revisit all of these strange castings here and there. It
> should be really rear to have explicit castings in C.
>
> ...
>
> > +       memcpy(serial_number, (unsigned char *)buf, IEI_WT61P803_PUZZLE_VERSION_SN_LENGTH);
>
> This casting is not need. Basically any casting from or to void * is not needed.

Ok.

>
> ...
>
> > +       dev_info(dev, "Driver baud rate: %d", baud);
>
> Why being so noisy, how does it help user? Doesn't serdev has a
> facility to show this rather basic stuff?
>
> ...
>
> > +       dev_info(dev, "MCU version: %s", mcu->version.version);
> > +       dev_info(dev, "MCU firmware build info: %s", mcu->version.build_info);
> > +       dev_info(dev, "MCU in bootloader mode: %s",
> > +                mcu->version.bootloader_mode ? "true" : "false");
> > +       dev_info(dev, "MCU protocol version: %s", mcu->version.protocol_version);
>
> How all of this can be useful for *working* case?

I can reduce this, but I'd just like to log the baud rate and the
firmware build info.
These two could be useful in a kernel log, if something doesn't work.

>
> ...
>
> > +       ret = iei_wt61p803_puzzle_sysfs_create(dev, mcu);
>
> No check?

I'll add a check.

>
> ...
>
> Have I missed ABI documentation?

The ABI documentation is in a separate patch
(Documentation/ABI/testing/sysfs-driver-iei-wt61p803-puzzle).

>
> --
> With Best Regards,
> Andy Shevchenko

Kind regards,
Luka
