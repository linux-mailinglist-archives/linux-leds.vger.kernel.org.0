Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4863B2999F1
	for <lists+linux-leds@lfdr.de>; Mon, 26 Oct 2020 23:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394876AbgJZWyr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 26 Oct 2020 18:54:47 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:52274 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394871AbgJZWyr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 26 Oct 2020 18:54:47 -0400
Received: by mail-pj1-f65.google.com with SMTP id o1so4012166pjt.2;
        Mon, 26 Oct 2020 15:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ybg1/5U+SLFSAFY4Gzm8yOXjUCgQtBZ81JyKW3EFc9I=;
        b=eGoz52hw8AawscTN5v3UBvzesNH/5L/Tc1FpHCjPcVjN/YuUCnO0EUAPnEEhlhPN0I
         +Ot2awnOY5KsNgSXHUOF1egfjF/10xj0/c+mt+xR7h+Wu4Gn0HJHP9xDD3oB0AOSTPD2
         2o6VaolUi/6P1Qiyrk9ZkGtAS1nLdErI+uf9oSEJdZ/TiMheWnc9poIq8hFO2lxga4Bz
         KCPjtoEMl/jJU9BwsNUhoUGWuEvAKg/1ogDJVdrEqL2GsET3dF4LBLGHQBhJC7TiogQl
         ItzhELPypGh1ubkLhMQK8enFLj0uSxQzYmDG98fzVL/9fcLjZcSlPzTn/H+qkSMp06Yn
         28Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ybg1/5U+SLFSAFY4Gzm8yOXjUCgQtBZ81JyKW3EFc9I=;
        b=qES6Kw99nwfbkb81rEQwtluNy1yPJlZqJqvohdBWXIEW+dnXuo57WPwOonAHhHOw64
         fggjI7PdubXaPHJffUir1gvjgpALUNlMzF0B21h9zHmWxfwvb9Wr/OF/H8lgMk+zsQP2
         z37ifubITeKbQqKD6EQYOLDWFgaQUMdMV2BiYGJTFLi1kkoPzSyx/Hxy/12uw0Q+GTmI
         Ty676sEtM8hdoSNRDpY17iSkJbr8Nl8lS8ZJftFZ3nSS0GCpBRL5sCLBQIetiQZQ6LQe
         cnZuE0saRZxK/nClSBw+aw7Adq7TilgJsvIwYZwTcn/IRQ2evNyTEPbtH5XTWFL6DAPH
         R2ag==
X-Gm-Message-State: AOAM532eArAT52Fswam8BeBml/d5innVcqmb6rloMi8JVi3C31wLE+yp
        urTrru8mrsW6ZqHKO05MVqBzBSRDnSk3OwPwXa5b2gn7/Pw=
X-Google-Smtp-Source: ABdhPJzpsC3hXY2gqf3UEt9wN3AkGr3wW5/cC++uOFANRubiY/zHt+F9RuRVokc6IOV8W9U3wLbjeXN7Kigp+CCj3Vk=
X-Received: by 2002:a17:90a:fb92:: with SMTP id cp18mr23227348pjb.228.1603752886070;
 Mon, 26 Oct 2020 15:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201025005916.64747-1-luka.kovacic@sartura.hr> <20201025005916.64747-3-luka.kovacic@sartura.hr>
In-Reply-To: <20201025005916.64747-3-luka.kovacic@sartura.hr>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 27 Oct 2020 00:54:29 +0200
Message-ID: <CAHp75Vd81cK+nhJ1fxgRC6cEKnBELVA9UtT8VPvq7nbHEdhecQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] drivers: mfd: Add a driver for IEI WT61P803 PUZZLE MCU
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
        luka.perkov@sartura.hr, robert.marko@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Oct 25, 2020 at 3:59 AM Luka Kovacic <luka.kovacic@sartura.hr> wrote:
>
> Add a driver for the IEI WT61P803 PUZZLE microcontroller, used in some
> IEI Puzzle series devices. The microcontroller controls system power,
> temperature sensors, fans and LEDs.
>
> This driver implements the core functionality for device communication
> over the system serial (serdev bus). It handles MCU messages and the
> internal MCU properties. Some properties can be managed over sysfs.

...

> +#include <asm/unaligned.h>

asm/* usually go after linux/*.
If you get a comment against one place in your series it implies to
check the other potential places to address.

> +#include <linux/atomic.h>

> +#include <linux/delay.h>
> +#include <linux/delay.h>

Delay should delay :-)

> +#include <linux/export.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/iei-wt61p803-puzzle.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>

> +#include <linux/of_device.h>

Don't see a user of this, but of_platform.h seems to be missed.

> +#include <linux/property.h>
> +#include <linux/sched.h>
> +#include <linux/serdev.h>
> +#include <linux/slab.h>
> +#include <linux/sysfs.h>

...

> +#define IEI_WT61P803_PUZZLE_MAX_COMMAND_LENGTH (20 + 2)

Since it uses formula, can you add a comment explaining what is the
meaning of each argument?

...

> +enum iei_wt61p803_puzzle_reply_state {
> +       FRAME_OK = 0x00,
> +       FRAME_PROCESSING = 0x01,
> +       FRAME_STRUCT_EMPTY = 0xFF,
> +       FRAME_TIMEOUT = 0xFE

Hmm, why not ordered?

> +};

...

> +struct iei_wt61p803_puzzle_mcu_version {
> +       char version[IEI_WT61P803_PUZZLE_VERSION_VERSION_LENGTH + 1];
> +       char build_info[IEI_WT61P803_PUZZLE_VERSION_BUILD_INFO_LENGTH + 1];
> +       bool bootloader_mode;
> +       char protocol_version[IEI_WT61P803_PUZZLE_VERSION_PROTOCOL_VERSION_LENGTH + 1];
> +       char serial_number[IEI_WT61P803_PUZZLE_VERSION_SN_LENGTH + 1];
> +       char mac_address[8][IEI_WT61P803_PUZZLE_VERSION_MAC_LENGTH + 1];

Perhaps additional constant to include (presumably) NUL ?

Also, what about 8?

> +};

...

> +struct iei_wt61p803_puzzle {
> +       struct serdev_device *serdev;

> +       struct kobject *kobj;

It's quite strange you need this,

> +       struct mutex reply_lock;
> +       struct mutex bus_lock;
> +       struct iei_wt61p803_puzzle_reply *reply;
> +       struct iei_wt61p803_puzzle_mcu_version version;
> +       struct iei_wt61p803_puzzle_mcu_status status;
> +       unsigned char *response_buffer;
> +       struct mutex lock;
> +};

...

> +static int iei_wt61p803_puzzle_recv_buf(struct serdev_device *serdev,
> +                                       const unsigned char *data, size_t size)
> +{
> +       struct iei_wt61p803_puzzle *mcu = serdev_device_get_drvdata(serdev);
> +       int ret;
> +
> +       ret = iei_wt61p803_puzzle_process_resp(mcu, (unsigned char *)data, size);

Dropping const, why?

> +       /* Return the number of processed bytes if function returns error */
> +       if (ret < 0)

> +               return (int)size;

Will be interesting result, maybe you wanted other way around?

> +       return ret;
> +}

...

> +       dev_err(dev, "%s: Command response timed out. Retries: %d", __func__, retry_count);

Drop __func__, it should not be critical for properly formulated
messages (for debug Dynamic Debug may take care of this at run time).


> +       return -ETIMEDOUT;

...

> +       struct device *dev = &mcu->serdev->dev;
> +       int ret;

> +       int len = (int)size;

Why len can't be size_t?

Can it be also organized in reversed xmas tree order?

...

> +       ret = serdev_device_write(mcu->serdev, cmd, len, IEI_WT61P803_PUZZLE_GENERAL_TIMEOUT);

> +

Not a competition for LOCs, please drop unneeded blank lines here and there.

> +       if (ret < 0) {
> +               mutex_unlock(&mcu->bus_lock);
> +               return ret;
> +       }

> +       if (!mcu->reply) {
> +               ret = -EFAULT;

Why this error code?

> +               goto exit;
> +       }

...

> +exit:

Perhaps
exit_unlock:
?

> +       mutex_unlock(&mcu->lock);
> +       return ret;

...

> +       sprintf(mcu->version.version, "v%c.%c%c%c", rb[2], rb[3], rb[4], rb[5]);

Can be '%.3s' for the second part, but it's up to you.

...

> +       sprintf(mcu->version.build_info, "%c%c/%c%c/%c%c%c%c %c%c:%c%c",
> +               rb[8], rb[9], rb[6], rb[7], rb[2],
> +               rb[3], rb[4], rb[5], rb[10], rb[11],
> +               rb[12], rb[13]);

Ditto.

...

> +       sprintf(mcu->version.protocol_version, "v%c.%c%c%c%c%c",
> +               rb[7], rb[6], rb[5], rb[4], rb[3], rb[2]);

Ditto.

...

> +err:

err_unlock: ?

> +       mutex_unlock(&mcu->lock);
> +       return ret;

...

> +       /* Response format:
> +        * (IDX RESPONSE)
> +        * 0    @
> +        * 1    O
> +        * 2    S
> +        * 3    S
> +        * ...
> +        * 5    AC Recovery Status Flag
> +        * ...
> +        * 10   Power Loss Recovery
> +        * ...
> +        * 19   Power Status (system power on method)
> +        * 20   XOR checksum
> +        */

Shouldn't be rather defined data structure for response?

...

> +       size_t reply_size = 0;

Dummy?

...

> +       sprintf(mcu->version.serial_number, "%.*s",
> +               IEI_WT61P803_PUZZLE_VERSION_SN_LENGTH, resp_buf + 4);

Shouldn't you check for reply_size to be big enough?

...

> +               serial_number_header[2] = 0x0 + (0xC) * sn_counter;

Why capital, why in parentheses?

...

> +               memcpy(serial_number_cmd + 4, serial_number + (0xC) * sn_counter, 0xC);

Ditto.

...

> +               serial_number_cmd[sizeof(serial_number_cmd) - 1] = 0;

You defined X+1 to then use sizeof() -1? Hmm...

...

> +               if (!(resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
> +                     resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK &&
> +                     resp_buf[2] == IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK)) {
> +                       ret = -EPROTO;
> +                       goto err;
> +               }

I think it would be better to define data structure for replies and
then check would be as simple as memcmp().

...

> +               if (reply_size < 22) {

Looking at the code organisation it seems to me like if (reply_size <
sizeof(struct_of_this_type_of_reply)).

> +                       ret = -EIO;
> +                       goto err;
> +               }

...

> +       mac_address_header[2] = 0x24 + (0x11) * mac_address_idx;

Why in parentheses?

...

> +       /* Concat mac_address_header, mac_address to mac_address_cmd */
> +       memcpy(mac_address_cmd, mac_address_header, 4);
> +       memcpy(mac_address_cmd + 4, mac_address, 17);

Yeah, much easier to use specific field names instead of this 4 / + 4, 17, ...

...

> +       ret = snprintf(cmd_buf, sizeof(cmd_buf), "%d", power_loss_recovery_action);
> +       if (ret < 0)
> +               return ret;

...

> +       power_loss_recovery_cmd[3] = cmd_buf[0];

One decimal (most significant) digit?! Isn't it a bit ambiguous?

...

> +#define sysfs_container(dev) \
> +       (container_of((dev)->kobj.parent, struct device, kobj))
> +
> +static ssize_t version_show(struct device *dev, struct device_attribute *attr,
> +                           char *buf)
> +{
> +       struct device *dev_container = sysfs_container(dev);
> +       struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
> +
> +       return sprintf(buf, "%s\n", mcu->version.version);
> +}
> +static DEVICE_ATTR_RO(version);

I believe we have better approach than this. dev_groups, for example.

...

> +       if ((int)count != IEI_WT61P803_PUZZLE_VERSION_SN_LENGTH + 1)
> +               return -EINVAL;

You need to revisit all of these strange castings here and there. It
should be really rear to have explicit castings in C.

...

> +       memcpy(serial_number, (unsigned char *)buf, IEI_WT61P803_PUZZLE_VERSION_SN_LENGTH);

This casting is not need. Basically any casting from or to void * is not needed.

...

> +       dev_info(dev, "Driver baud rate: %d", baud);

Why being so noisy, how does it help user? Doesn't serdev has a
facility to show this rather basic stuff?

...

> +       dev_info(dev, "MCU version: %s", mcu->version.version);
> +       dev_info(dev, "MCU firmware build info: %s", mcu->version.build_info);
> +       dev_info(dev, "MCU in bootloader mode: %s",
> +                mcu->version.bootloader_mode ? "true" : "false");
> +       dev_info(dev, "MCU protocol version: %s", mcu->version.protocol_version);

How all of this can be useful for *working* case?

...

> +       ret = iei_wt61p803_puzzle_sysfs_create(dev, mcu);

No check?

...

Have I missed ABI documentation?

-- 
With Best Regards,
Andy Shevchenko
