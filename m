Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2989285601
	for <lists+linux-leds@lfdr.de>; Wed,  7 Oct 2020 03:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgJGBKu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Oct 2020 21:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgJGBKu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Oct 2020 21:10:50 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41036C0613D3
        for <linux-leds@vger.kernel.org>; Tue,  6 Oct 2020 18:10:49 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id c5so768567ilr.9
        for <linux-leds@vger.kernel.org>; Tue, 06 Oct 2020 18:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NVWHfHuOKQpw/wHkMkUCTHI9GcrsDKWlgFwgCCsXTt8=;
        b=tQ9z9Zl/2G/7PRrwpRrrLpUNUOSf8s0nhmDDMWtimnxfdHs1vRvuEf9t38jn42EvKp
         HDoswwrCu4VihJFDNx+7FK9pz7XE0fxTni9Z08gKn5lkVel1YpJAQHCClzg1+CHWfMTv
         5MQcOd7HUPjeLhq9m/NVdCrYRhXFKJ9mS9yr1r1Ha/Hn5u84cZZ55CrM8jic3cajsQMB
         Db6sZgGK4lN57aUBrwHzlj2vraw+Jtb0Q99UjQhuQ6W0z88QxQ8aSxuqTU/Rg7GJc77b
         YnDOAp7ADqCeIUovD2cX9e12aKOdLf2L02cAw2vkXkzwsi3lurWOOOr1FLiFetfLYwok
         T86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NVWHfHuOKQpw/wHkMkUCTHI9GcrsDKWlgFwgCCsXTt8=;
        b=o9B5Fl0dImDMZ7g2yzapMowfMrUb6NtfgGI6P78ZvJL2t0+UIhRjaqKFUcDGU36E1g
         QeW1jLmuJBoFA55GeJFSnVsLGnjNcCqjlRIO9A+YNl/JGCIfTrD0xDG1Lq79dOrrQrcP
         OiC6DAGCbLNdgqmFpstHPT97rKWZjmtyjSOMDKhhuDIyBgVQ4/WetTygfRj0a74ViTnn
         xKVbBsUIUnkLLCS2XWxTzoUzlvxs4eLfHhNEUwj4YTHEgDV+oPlLgDfBiFyEcGgQbr4z
         4knAst4+9oK32TVENWda/7oCX86QpKCKI84aYS5guJVzOb3y/njXP+cmQv5Z5/27+lKU
         0yaw==
X-Gm-Message-State: AOAM5301v56QslteMZ8hExrgQNc8GlSWjyBjAutSsXnHu/U2bHSx9vwU
        PBYLc2AErG38VmwT644TvQFiyIc2zdT77UrAqGV5gA==
X-Google-Smtp-Source: ABdhPJysHBgnkxj/7VNsn4IgW3iq6KQbvS2wJbZpy8tzWC2kbon/6gcCgtMaHeLrfziuMUZ7OUd5QgnYP5FLwSQZADg=
X-Received: by 2002:a92:6811:: with SMTP id d17mr751971ilc.145.1602033048401;
 Tue, 06 Oct 2020 18:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200930014058.44460-1-luka.kovacic@sartura.hr>
 <20200930014058.44460-5-luka.kovacic@sartura.hr> <20200930194759.GA24378@amd> <CADZsf3ZL712nZh5nQxh5RQ=YCbM0fEK8dp-uHyOW+2FSMv+UpA@mail.gmail.com>
In-Reply-To: <CADZsf3ZL712nZh5nQxh5RQ=YCbM0fEK8dp-uHyOW+2FSMv+UpA@mail.gmail.com>
From:   Luka Kovacic <luka.kovacic@sartura.hr>
Date:   Wed, 7 Oct 2020 03:10:37 +0200
Message-ID: <CADZsf3bYHMAkbwSN657+EnpDTxgRr8qHiHDrM68UD7rJXQHDCQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] drivers: leds: Add the iEi WT61P803 PUZZLE LED driver
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Jason Cooper <jason@lakedaemon.net>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Marek Behun <marek.behun@nic.cz>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Robert Marko <robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Oct 6, 2020 at 8:41 AM Luka Kovacic <luka.kovacic@sartura.hr> wrote:
>
> On Wed, Sep 30, 2020 at 9:48 PM Pavel Machek <pavel@ucw.cz> wrote:
> >
> > Hi!
> >
> > > +static int iei_wt61p803_puzzle_led_brightness_set_blocking(struct led_classdev *cdev,
> > > +             enum led_brightness brightness)
> > > +{
> > > +     struct iei_wt61p803_puzzle_led *priv = cdev_to_iei_wt61p803_puzzle_led(cdev);
> > > +     unsigned char *resp_buf = priv->response_buffer;
> > > +     unsigned char led_power_cmd[5] = {
> > > +             IEI_WT61P803_PUZZLE_CMD_HEADER_START,
> > > +             IEI_WT61P803_PUZZLE_CMD_LED,
> > > +             IEI_WT61P803_PUZZLE_CMD_LED_POWER,
> > > +             (char)IEI_LED_OFF
> > > +     };
> > > +     size_t reply_size;
> > > +
> > > +     mutex_lock(&priv->lock);
> > > +     if (brightness == LED_OFF) {
> > > +             led_power_cmd[3] = (char)IEI_LED_OFF;
> > > +             priv->led_power_state = LED_OFF;
> > > +     } else {
> > > +             led_power_cmd[3] = (char)IEI_LED_ON;
> > > +             priv->led_power_state = LED_ON;
> > > +     }
> > > +     mutex_unlock(&priv->lock);
> > > +
> > > +     return iei_wt61p803_puzzle_write_command(priv->mcu, led_power_cmd,
> > > +                     sizeof(led_power_cmd), resp_buf, &reply_size);
> > > +}
> >
> > Is the mutex needed? If so, should it include the
> > iei_wt61p803_puzzle_write_command()? Does
> > iei_wt61p803_puzzle_write_command() have internal locking to prevent
> > two messages from being mingled?
> >
> > Best regards,
> >                                                                         Pavel
> >
> > --
> > (english) http://www.livejournal.com/~pavelmachek
> > (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
>
> Hello Pavel,
>
> The mutex isn't needed and can be removed.
> The function iei_wt61p803_puzzle_write_command() already handles its own
> mutex locking, so a separate mutex isn't required.
>
> Does brightness_set_blocking only block a single caller (each caller separately)
> or does it block all callers until the previous caller is finished?
>
> Kind regards,
> Luka

Hello Pavel,

I've sent out a new patchset, but I kept the mutex in use.
It's used to make sure only one read or write request is done at once,
when writing
to the LED driver private structure.

I have also added this description to the struct comment.

Kind regards,
Luka
