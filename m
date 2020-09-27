Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 591CC27A1B0
	for <lists+linux-leds@lfdr.de>; Sun, 27 Sep 2020 17:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgI0PtD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 27 Sep 2020 11:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgI0PtD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 27 Sep 2020 11:49:03 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F22FFC0613D3
        for <linux-leds@vger.kernel.org>; Sun, 27 Sep 2020 08:49:02 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id m17so8588624ioo.1
        for <linux-leds@vger.kernel.org>; Sun, 27 Sep 2020 08:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kMOePL7SuunhCQJvUEzJENmJqI2ZT46rRLTR1oHruk0=;
        b=ZTMmsNrKXqA5RsQNSpCRZDHhk9W97uuDmVabN2P9vN4e1WJs8BF/4ZjloizBFL+WkR
         msL1QgJLxWFzN6a/3hK1ckvb2SY8rwaM4i2obvKJ4cPUWSgCi2lYA3VXr/Oeomljz1Cl
         01iXgXHM9C6QXBkysMMMA072Rq0HfH9SwBH6GxksToMnPySeABgE0Yq7futAwLLCbHSJ
         63AAMEKr9H6fFRQsvrC7AAcv+31cuKciPJvCwb5Mz9nNzbfzzXtQ/C5cJEuAQCx8JDZ1
         yH8rt2YF7WnOHmSIPuc2MJdY6zJjNx46UKhlbRLfEGkHIv7cFUfrk+uiUs2RAp8a3eGZ
         8/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kMOePL7SuunhCQJvUEzJENmJqI2ZT46rRLTR1oHruk0=;
        b=IxG79zjnUpR8bbHloJtYLoNXQ/WHIrO3fjuIbFWj141dmSVgD8DUGMNmNWiqOSpurI
         8eq4dJK2rb+Uc7TZ/m+oZnX7E8Vu7+IoSV7g20w+hskJG9zJ4eM3GO9ssYTfXmMgHMJh
         /A0Dj90w6QvDSHXyrVKdIJ4eWy9dhCJYXRRjDy+bBufbTBJyF61WUC7z12gogcnz1hma
         kJYCLqHIYwfjT1YS/0gYiXJtt/XIpb42SIZeYjt7cBX6LBc7gIiNMMMCKxr1cghonmDO
         pbhsDUN9VixZprD//tS1Zl29YYuS8NvmcgZNL7PdmemKm9Nm0PzqbefBFvf2doLQB928
         dmgA==
X-Gm-Message-State: AOAM5324fnzSl0hERWy+pqZc8V1wQXKFH3jGrcuEuR5e1PmmQWoT0XMC
        clPzbfamuOYPXMt5O4QjmhxM5cnNtOz25LyI2Ej3MA==
X-Google-Smtp-Source: ABdhPJydTQXOfAgH73YHVMqDI0Qi6yiTEDtQ8bHWUbqPUMPOLmzvN8dZKz+AF3P5AAyHDR8E8qMEoqyqk5Sxjejt5dc=
X-Received: by 2002:a02:4b07:: with SMTP id q7mr6144862jaa.84.1601221740947;
 Sun, 27 Sep 2020 08:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200926135514.26189-1-luka.kovacic@sartura.hr>
 <20200926135514.26189-6-luka.kovacic@sartura.hr> <20200926202521.100d17f8@nic.cz>
In-Reply-To: <20200926202521.100d17f8@nic.cz>
From:   Luka Kovacic <luka.kovacic@sartura.hr>
Date:   Sun, 27 Sep 2020 17:49:02 +0200
Message-ID: <CADZsf3YmbELw6mw2wT2tkkx03zf1y_jM2vrBDH1_HqXc--AHew@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] Documentation/ABI: Add iei-wt61p803-puzzle driver
 sysfs interface documentation
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Jason Cooper <jason@lakedaemon.net>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Robert Marko <robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

I agree, I'll move this over to testing.

These values are stored in the microcontroller EEPROM and can be modified.
Some test units might be shipped with unpopulated MAC address and S/N values
so I exposed this functionality to enable the user to use some
internal value there.

Kind regards,
Luka

On Sat, Sep 26, 2020 at 8:25 PM Marek Behun <marek.behun@nic.cz> wrote:
>
> On Sat, 26 Sep 2020 15:55:12 +0200
> Luka Kovacic <luka.kovacic@sartura.hr> wrote:
>
> > Add the iei-wt61p803-puzzle driver sysfs interface documentation to allow
> > monitoring and control of the microcontroller from user space.
> >
> > Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> > Cc: Luka Perkov <luka.perkov@sartura.hr>
> > Cc: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../stable/sysfs-driver-iei-wt61p803-puzzle   | 65 +++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >  create mode 100644 Documentation/ABI/stable/sysfs-driver-iei-wt61p803-puzzle
> >
> > diff --git a/Documentation/ABI/stable/sysfs-driver-iei-wt61p803-puzzle b/Documentation/ABI/stable/sysfs-driver-iei-wt61p803-puzzle
> > new file mode 100644
> > index 000000000000..36fca70d66ef
> > --- /dev/null
> > +++ b/Documentation/ABI/stable/sysfs-driver-iei-wt61p803-puzzle
>
> I think this should go to testing, not stable. It should go to stable
> only after it is stable for some time.
>
> > @@ -0,0 +1,65 @@
> > +What:                /sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/mac_address_*
> > +Date:                September 2020
> > +Contact:     Luka Kovacic <luka.kovacic@sartura.hr>
> > +Description: Read the internal iEi WT61P803 PUZZLE MCU MAC address values.
> > +             These are factory assigned and can be changed.
> > +
> > +What:                /sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/serial_number
> > +Date:                September 2020
> > +Contact:     Luka Kovacic <luka.kovacic@sartura.hr>
> > +Description: Read the internal iEi WT61P803 PUZZLE MCU serial number.
> > +             This value is factory assigned and can be changed.
> > +
>
> Please use (RO) and (RW) prefixes before the Description, instead of
> writing "This value is read only", i.e.:
>   Description: (RO) Internal ... serial number.
>
> JFI: Why can these values be changed? Shouldn't they be burned into OTP?
>
> Marek
>
> > +What:                /sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/version
> > +Date:                September 2020
> > +Contact:     Luka Kovacic <luka.kovacic@sartura.hr>
> > +Description: Read the internal iEi WT61P803 PUZZLE MCU version.
> > +             This value is read only.
> > +
> > +What:                /sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/protocol_version
> > +Date:                September 2020
> > +Contact:     Luka Kovacic <luka.kovacic@sartura.hr>
> > +Description: Read the internal iEi WT61P803 PUZZLE MCU protocol version.
> > +             This value is read only.
> > +
> > +What:                /sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/power_loss_recovery
> > +Date:                September 2020
> > +Contact:     Luka Kovacic <luka.kovacic@sartura.hr>
> > +Description: Read the iEi WT61P803 PUZZLE MCU power loss recovery value.
> > +             This value is read write.
> > +             Value mapping: 0 - Always-On, 1 - Always-Off, 2 - Always-AC, 3 - Always-WA
> > +
> > +What:                /sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/bootloader_mode
> > +Date:                September 2020
> > +Contact:     Luka Kovacic <luka.kovacic@sartura.hr>
> > +Description: Read whether the MCU is in bootloader mode.
> > +             This value is read only.
> > +
> > +What:                /sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/power_status
> > +Date:                September 2020
> > +Contact:     Luka Kovacic <luka.kovacic@sartura.hr>
> > +Description: Read the iEi WT61P803 PUZZLE MCU power status. Power status indicates
> > +             the power on method.
> > +             This value is read only.
> > +             Value mapping (bitwise list):
> > +             0x80 - Null
> > +             0x40 - Firmware flag
> > +             0x20 - Power loss detection flag (powered off)
> > +             0x10 - Power loss detection flag (AC mode)
> > +             0x08 - Button power on
> > +             0x04 - WOL power on
> > +             0x02 - RTC alarm power on
> > +             0x01 - AC recover power on
> > +
> > +What:                /sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/build_info
> > +Date:                September 2020
> > +Contact:     Luka Kovacic <luka.kovacic@sartura.hr>
> > +Description: Read the iEi WT61P803 PUZZLE MCU firmware build date.
> > +             This value is read only.
> > +             Format: yyyy/mm/dd hh:mm
> > +
> > +What:                /sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/ac_recovery_status
> > +Date:                September 2020
> > +Contact:     Luka Kovacic <luka.kovacic@sartura.hr>
> > +Description: Read the iEi WT61P803 PUZZLE MCU AC recovery status.
> > +             This value is read only.
>
