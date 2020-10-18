Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0152918EB
	for <lists+linux-leds@lfdr.de>; Sun, 18 Oct 2020 20:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbgJRSuu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 18 Oct 2020 14:50:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbgJRSut (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 18 Oct 2020 14:50:49 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D50F7C061755;
        Sun, 18 Oct 2020 11:50:49 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a1so4332722pjd.1;
        Sun, 18 Oct 2020 11:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p3YiCTiAFbX/Gmg1awU3t3P6S3a7w4v1beKYXNj4/dQ=;
        b=dx/uHL8qWS0dPYXJuEsdGYld4HjBmg+zX+pY4wuXDMEl+Anl+J5SNH2CD8LM1DuiM5
         R6Gu2o4EMoL/60NcgZz8CRgG1Fiig6T+CZKuHWzwz/8R2vn5bahLKz/MZ7sPKAv4APUK
         IJzsOI3cpJpSa0ob8qgb3t8RXzy/WFYdf5vbH4J4IvFk8I40uRW7yjUS5unGGhfBg7Ih
         JdThp74pR463jt7An/sGTzBPQ54Bxc6EvgivcIDcFLxXgpuGYRm6O4guWGx+GLj28iTx
         fzK78LU13eP6SWa30blxU+GRMOYqZuMi7BAE+8ScCNJ1VeeBH0/td9sT4dV2xUIdJoer
         fRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p3YiCTiAFbX/Gmg1awU3t3P6S3a7w4v1beKYXNj4/dQ=;
        b=AD/IHRSNcsLMu4thr8dG+lF7lVMO0HshO0G0nDRQXg0At683oyxcjj9s89Yfib/KPr
         33Y2QdfHE1AgVJiKo9QCorIJZ2A2aEPyZyWritIBS43IlEaZxRqimszvH8TesmzVPPsm
         uIhGPY6PMarFJdPt//F/gEO9bfDuVBc8sBpqa9zBHnbK4pPAc0ZJRgsTHJWy/L7ulPqY
         4VY7ISDKJqcy8MGEnRzgv7kl843X1RQ73kT673kHyLNSu6hqWEb5qBIjDkKnb5zxkrSX
         yTZM9XtOPVssJ/ng49JOLi3gWwsKku++HULSatECMLrRxoxKrjTxNWMiWlPXm7FNbpGF
         nc1A==
X-Gm-Message-State: AOAM531K63IE2V7bA6sGUnHEbFAtHmTDdGG62zkNJE1anndLvcVTpQQX
        8gVRsukNQORFWu+mNcbohrkytOitVTe+60syhVI=
X-Google-Smtp-Source: ABdhPJx7KOXioaWsrCOKqX/TfV9NiRJ7ADS9suogUzjnMYiwt3jpQTA2AJIMtPIxVj94oN68ppD7hwpmjJf+gxwYllA=
X-Received: by 2002:a17:90a:fb92:: with SMTP id cp18mr14588785pjb.228.1603047049318;
 Sun, 18 Oct 2020 11:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201017211035.257110-1-luka.kovacic@sartura.hr> <20201017211035.257110-5-luka.kovacic@sartura.hr>
In-Reply-To: <20201017211035.257110-5-luka.kovacic@sartura.hr>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 18 Oct 2020 21:50:33 +0300
Message-ID: <CAHp75VdQnNXdhs52+WFt4bQKwZ3u5euFd3d65XU+-sMSFjt8jA@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] drivers: leds: Add the iEi WT61P803 PUZZLE LED driver
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
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

On Sun, Oct 18, 2020 at 12:18 AM Luka Kovacic <luka.kovacic@sartura.hr> wrote:
>
> Add support for the iEi WT61P803 PUZZLE LED driver.
> Currently only the front panel power LED is supported.
>
> This driver depends on the iEi WT61P803 PUZZLE MFD driver.

...

> +/**
> + * struct iei_wt61p803_puzzle_led - MCU LED Driver
> + *
> + * @mcu:               MCU struct pointer
> + * @response_buffer    Global MCU response buffer allocation
> + * @lock:              General mutex lock to protect simultaneous R/W access to led_power_state
> + * @led_power_state:   State of the front panel power LED
> + * @cdev:              LED classdev
> + */
> +struct iei_wt61p803_puzzle_led {
> +       struct iei_wt61p803_puzzle *mcu;
> +       unsigned char *response_buffer;
> +       struct mutex lock;
> +       int led_power_state;

> +       struct led_classdev cdev;

If you are using container_of() and move this member to be first, you
will effectively make the container_of() a no-op.

> +};
> +
> +static inline struct iei_wt61p803_puzzle_led *cdev_to_iei_wt61p803_puzzle_led
> +       (struct led_classdev *led_cdev)
> +{
> +       return dev_get_drvdata(led_cdev->dev->parent);

Why not simply call container_of()

> +}

...

> +       ret = fwnode_property_read_u32(child, "reg", &reg);
> +       if (ret || reg > 1) {
> +               dev_err(dev, "Could not register 'reg' (%lu)\n", (unsigned long)reg);

When you cast explicitly during printf() you are doing something wrong
in 99.9% cases.
What's wrong with %u in this case?

> +               ret = -EINVAL;
> +               goto err_child_node;
> +       }

-- 
With Best Regards,
Andy Shevchenko
