Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 069A52A1D04
	for <lists+linux-leds@lfdr.de>; Sun,  1 Nov 2020 10:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbgKAJ4d (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 1 Nov 2020 04:56:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbgKAJ4c (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 1 Nov 2020 04:56:32 -0500
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 579B7C0617A6
        for <linux-leds@vger.kernel.org>; Sun,  1 Nov 2020 01:56:32 -0800 (PST)
Received: by mail-il1-x141.google.com with SMTP id f16so10395659ilr.0
        for <linux-leds@vger.kernel.org>; Sun, 01 Nov 2020 01:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rWF0jUBfgM4gE1L1ibjwFfJ7/wL24CjLQAYD2m6zhIc=;
        b=yaBZ2eEGHm2PmstDlb04y0oHeTp/sSkpYGAHF5ronXi276gjl/BD/5XQsksXfmhZXS
         tq8bl4x+YB6y7KJL2Z2qu1lv5nSAxB8CA5diL0S9XsBYcV/KaeecPGgdmdYOttzew3Z9
         xRbS+T/mHCWUtLrY5PStEtHvmrlph4KFnjJJm4TZOPV2SmrBAyFbhSkctBAQbXw+RvL3
         Ej+DqDGhA693Eq5Lyoi+Bwl0UiAzJ1/Hqrqo3OPE4GkQJujm1Hxz2D4kEK2PVCay25lN
         Rj3M7FNrNcis3CQ7IwwPQi32FmBteR1nWasN8PP35GSuK3yq/90Igg9RPUaQO3iWvhkx
         3UDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rWF0jUBfgM4gE1L1ibjwFfJ7/wL24CjLQAYD2m6zhIc=;
        b=l5wXaiT1peqq7RSOGHXQ+G0dN4lOamaXXBoivbR+i424JSlKN+sfyY1yYG9eIwxcHB
         eZzhDsTiVeQ1z2S21XrLlpp7601A/Raki99abYMaYroq45J4rUW96nqpHjl6gLIKIloN
         YYV3MpYKtx4nh6IGn+B9/abIEyApgNeCYZ9h/a/NfmIsyNzJLNAMqwPn5GmkqZgwj8gz
         vgSeBUP0bPWCWem0EC5h2v4zCoAl1d3MFNQa/N3JaT6C6N6T2xirMtcmi58unzvd9mgF
         /Kpy7uD/0vTx3JCiLRCN7Z0rzyrvcLBQXES3cXwN4xW8/+C9N0ZBzHV7E+SeBD4uRZBS
         XfQQ==
X-Gm-Message-State: AOAM530f24o7eh6YPw8xEqCKwYl2dZkPRCO6/cCoJf0YRQkIpMATCjpA
        eo8A5OeAjfCAQggbI3nI5h/xHiHlOvt+F01J5xQl5Q==
X-Google-Smtp-Source: ABdhPJwv/+/UUcQWrqznnqne/tb+9I2DT9gLQL5cGzcLb8pERNY+4rhcYnzgXbfpzMjl/etubEYGqHrZ6HtLcs91sO4=
X-Received: by 2002:a92:41cf:: with SMTP id o198mr7442692ila.262.1604224591586;
 Sun, 01 Nov 2020 01:56:31 -0800 (PST)
MIME-Version: 1.0
References: <20201025005916.64747-7-luka.kovacic@sartura.hr>
 <20201025005916.64747-6-luka.kovacic@sartura.hr> <20201025005916.64747-5-luka.kovacic@sartura.hr>
 <20201025005916.64747-4-luka.kovacic@sartura.hr> <20201025005916.64747-3-luka.kovacic@sartura.hr>
 <20201025005916.64747-2-luka.kovacic@sartura.hr> <20201025005916.64747-1-luka.kovacic@sartura.hr>
 <20201029180105.GD26053@duo.ucw.cz>
In-Reply-To: <20201029180105.GD26053@duo.ucw.cz>
From:   Luka Kovacic <luka.kovacic@sartura.hr>
Date:   Sun, 1 Nov 2020 10:56:20 +0100
Message-ID: <CADZsf3YE3d=dtMVVYHL91Z1WFcpNN4vyJJ6RG7VnJ2V-DqE+wQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] Add support for the IEI WT61P803 PUZZLE MCU
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Marek Behun <marek.behun@nic.cz>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Robert Marko <robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Pavel,

On Thu, Oct 29, 2020 at 7:01 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > +What:                /sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/power_status
> > +Date:                September 2020
> > +Contact:     Luka Kovacic <luka.kovacic@sartura.hr>
> > +Description: (RO) Power status indicates the host platform power on method.
> > +             Value mapping (bitwise list):
> > +             0x80 - Null
> > +             0x40 - Firmware flag
> > +             0x20 - Power loss detection flag (powered off)
> > +             0x10 - Power loss detection flag (AC mode)
> > +             0x08 - Button power on
> > +             0x04 - WOL power on
> > +             0x02 - RTC alarm power on
> > +             0x01 - AC recover power on
>
> It would be nice to put this into standard place somewhere. Many
> machines will want to expose this information.

As this is specific to this microcontroller and to how it encodes
these values, I don't see a need to change this.
This isn't used anywhere else.

>
> If not, at least spell out WoL, as it is not that common of acronym.

Okay.

>
> > +What:                /sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/ac_recovery_status
> > +Date:                September 2020
> > +Contact:     Luka Kovacic <luka.kovacic@sartura.hr>
> > +Description: (RO) Host platform AC recovery status value
>
> I can not tell what this is from documentation...

I'll expand the description.

>
> Best regards,
>                                                                 Pavel
>
> --
> http://www.livejournal.com/~pavelmachek

Kind regards,
Luka
