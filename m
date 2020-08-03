Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73EB523AAAD
	for <lists+linux-leds@lfdr.de>; Mon,  3 Aug 2020 18:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbgHCQmd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 Aug 2020 12:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbgHCQmd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 Aug 2020 12:42:33 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D1EC06174A;
        Mon,  3 Aug 2020 09:42:33 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id z5so20192478pgb.6;
        Mon, 03 Aug 2020 09:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xdp/fS6+v2ditkJk+cvQMgK9TUqlS62v6zpMnXOv3Ic=;
        b=a7MqE6FIile7iIvKc0LEMZJMZ6mV1ZL3hknPiZcAHiLJZJVxqLexKXD7MUs4PplR1k
         32tgmF4SfgrHJDOiSxssO06fHJJU2C0I3z3YIyYXntvBRx5Y/eU7XbilTMMT6KQ65rDR
         Fa4nsG/JJ/HRkbYr8blHKxHZ2JZ4km4rb/SInDaPLRiyac0407/0kMVuErVAGusfJ7NB
         wLIHJ7wlCx+F2Av/UvG8cloZM9VRMUr6nuPyLZ+HcNFi8D+DV5kS6kdiOXeRYO6v+xre
         FKbJmQ7nSvTLIvBS+5Fgn2BXAZIaEq4cQVM2Y6ch8o9/gIfZR5OSv/J4WL8Hfjwmmd6x
         Wm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xdp/fS6+v2ditkJk+cvQMgK9TUqlS62v6zpMnXOv3Ic=;
        b=rdG4jbsyrsLLgnMYuhYN9cQrOtEAakbG5hI8lYnFZIev20N93bHYAPOO81mJgC8gev
         TSfZZw90hI0DsbDQTnaiC1np/Y/NAprvxJQzkWHqTOprTJzHzrtkuo4spYc37zhXoIvM
         VDtvvMPPQqKAlncIA1fMY3MbaB9dKbRGY3z4wBh4UP8edUdha7LWTmev4IhlihAKD6JR
         kqpETh9YYqvIH+J9P3Uw2mNvnuYguNsjN4oy9n16DCUuo+t46/lPh6ntiyD1w8n16hCT
         fMwO/DBzvDUwbsUuXELkjQeMZ/ZMwHVjICLuNB5pHSLD871Gov1xS3jhRXVZZL1Dq7HY
         vkyw==
X-Gm-Message-State: AOAM5337igv9+Pre58yc8pKs5QvyPLs31CNulbBblo2qptlUsB690pC7
        MV0vEgzIyj2ElOO+9u6paBtt1f7R6nTLTPsZa1I=
X-Google-Smtp-Source: ABdhPJyLd0xKU1fFXwew/qnMkherfYLTaf5EOHygn2taxpTZTjjFC3duVTdf5UT0qujpqNr/70s7InpKhau8tw1JCjM=
X-Received: by 2002:a62:758f:: with SMTP id q137mr16020137pfc.170.1596472952830;
 Mon, 03 Aug 2020 09:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200803145055.5203-1-eajames@linux.ibm.com> <20200803145055.5203-3-eajames@linux.ibm.com>
In-Reply-To: <20200803145055.5203-3-eajames@linux.ibm.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 3 Aug 2020 19:42:17 +0300
Message-ID: <CAHp75VevG65uuE4Vv49tSdvpNnxE7AC7W_QR2s8twCPZ=4da_g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] leds: pca955x: Add an IBM software implementation
 of the PCA9552 chip
To:     Eddie James <eajames@linux.ibm.com>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
        Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        vishwa@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Aug 3, 2020 at 5:51 PM Eddie James <eajames@linux.ibm.com> wrote:
>
> IBM created an implementation of the PCA9552 on a PIC16F
> microcontroller. The I2C device addresses are different from the
> hardware PCA9552, so add a new compatible string and associated
> platform data to be able to probe this device.

...

>         pca9550,
>         pca9551,
>         pca9552,
> +       ibm_pca9552,
>         pca9553,

I would rather not mix like this, but use alpha order, for example.
It's better to read and see which devices are supported by vendor.

...

>         },

> +       [ibm_pca9552] = {

> +       },
>         [pca9553] = {

Ditto.

...

>         { "pca9550", pca9550 },
>         { "pca9551", pca9551 },
>         { "pca9552", pca9552 },
> +       { "ibm-pca9552", ibm_pca9552 },
>         { "pca9553", pca9553 },

Ditto.

...

>         { .compatible = "nxp,pca9550", .data = (void *)pca9550 },
>         { .compatible = "nxp,pca9551", .data = (void *)pca9551 },
>         { .compatible = "nxp,pca9552", .data = (void *)pca9552 },
> +       { .compatible = "ibm,pca9552", .data = (void *)ibm_pca9552 },
>         { .compatible = "nxp,pca9553", .data = (void *)pca9553 },

Ditto.

-- 
With Best Regards,
Andy Shevchenko
