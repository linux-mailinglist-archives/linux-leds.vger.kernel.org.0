Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDE314FF2
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 17:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfEFPUd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 11:20:33 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38090 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbfEFPUd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 May 2019 11:20:33 -0400
Received: by mail-pf1-f195.google.com with SMTP id 10so6951968pfo.5;
        Mon, 06 May 2019 08:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WSqwoJIq83LdnLBResj/Lpi0ldlfcksK6t8+FIatPzg=;
        b=OcndmoKNv0NFLtL4ikMqDqmABuIX+D+rhPYJgsE28n4dGOnawEW3FUVqmYyGpBzue3
         Y6gB/WowJsFcQs1i8dVvaVpALLSBdX+Ochn84u3Ype82MxrNyMFyS/IEgbQ74MOWOc8Q
         3g0j07rTPVV1o0wbPhB4QIKoHWvWFYfujHGriY8LuaAGUe9dFMQvDvWMRXtbwrQLink+
         O2wV5ONK5rmsNPFCRyl/vrJub01aIP3PluBg1v0t3V2HXvKlZ0/vC8bVz46wlCJNK5bW
         l6G9e8dBp9eM1q06OOaKlz3u5vAMwNZON2R/+oQ7W+vpVE0/Vp3tf5FICHjCpzs9FARY
         CUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WSqwoJIq83LdnLBResj/Lpi0ldlfcksK6t8+FIatPzg=;
        b=SDzrIGjnIHPmLmWCE/qq3pmN+iUPtPypFzNvGjmoxfoeKU5jIkZRAmDhTJ5CUw4erD
         GCbeDgRQusFqqwV5ggB4xuP1vzDh02Ux4EtsXYTfWjVfdaruu+yC4vpm2UIkjisRAQ5u
         zTrEGOHqqJqifAOhFFxzWYpvDKWQCfQsrT+ZCJfxgiEfDR7c73KaoSAMVS83X0d4/eXe
         VLhhnjymJSy3gfNTAagzBaJ8ihBHwXhzjLAF8aKOl0vqzWw70KJzMPNsiRJLEXk1P/RU
         Vh8cDT1UFp1SREItEy39BQBWqw2Z3BG6EoQEI0bemd0HZYCNzSn00mN02HmpuGFhEqn2
         KTYQ==
X-Gm-Message-State: APjAAAV3ftcbnv2ql9AfU88eoBwmTWDJtN26Jb9JCNFIgjh3L2X1/jmR
        T9yDjQAZs4UgAZKBp4Fstjpl37AjI/v25UpS7AzBxFImbn9Wvg==
X-Google-Smtp-Source: APXvYqxgJM/cnaqBuMcnSztrB/6cmvkX2dOKEIvfShui1WA4ljvvmJO77aalM5I862t/cNyaRU4OI14tb0/zeuiYDJs=
X-Received: by 2002:a62:ee04:: with SMTP id e4mr7269562pfi.232.1557156032819;
 Mon, 06 May 2019 08:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190426123513.GA18172@amd> <20190426214246.GA24966@amd>
 <84fac57d-1121-a1da-fb45-16a2521bdef9@gmail.com> <20190427193411.GA9709@amd>
 <2578a614-beb9-1c9d-9f74-208a8a7ab64f@gmail.com> <20190427223207.GA3585@amd>
 <d2373c8b-5c66-c875-16c7-0c5a93470793@gmail.com> <20190429152148.GA10501@amd>
In-Reply-To: <20190429152148.GA10501@amd>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 6 May 2019 18:20:22 +0300
Message-ID: <CAHp75VcrW_9pyiG6N75CWkxc1S7mKknfDT_W87vSQNnzjf2uRw@mail.gmail.com>
Subject: Re: [PATCH] leds: tpacpi: cleanup for Thinkpad ACPI led
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Apr 29, 2019 at 6:22 PM Pavel Machek <pavel@ucw.cz> wrote:
>
>
> Make error returns more consistent... no behaviour change intended.
>

Pushed to my review and testing queue, thanks!

P.S. I fixed prefix accordingly.

> Signed-off-by: Pavel Machek <pavel@ucw.cz>
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 726341f..7008a7f 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -5808,7 +5808,7 @@ static int led_set_status(const unsigned int led,
>                         return -EPERM;
>                 if (!acpi_evalf(led_handle, NULL, NULL, "vdd",
>                                 (1 << led), led_sled_arg1[ledstatus]))
> -                       rc = -EIO;
> +                       return -EIO;
>                 break;
>         case TPACPI_LED_OLD:
>                 /* 600e/x, 770e, 770x, A21e, A2xm/p, T20-22, X20 */
> @@ -5832,10 +5832,10 @@ static int led_set_status(const unsigned int led,
>                         return -EPERM;
>                 if (!acpi_evalf(led_handle, NULL, NULL, "vdd",
>                                 led, led_led_arg1[ledstatus]))
> -                       rc = -EIO;
> +                       return -EIO;
>                 break;
>         default:
> -               rc = -ENXIO;
> +               return -ENXIO;
>         }
>
>         if (!rc)
>
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html



-- 
With Best Regards,
Andy Shevchenko
