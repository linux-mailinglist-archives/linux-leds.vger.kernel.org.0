Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A31771C2875
	for <lists+linux-leds@lfdr.de>; Sat,  2 May 2020 23:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728552AbgEBVvZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 2 May 2020 17:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728523AbgEBVvZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 2 May 2020 17:51:25 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE110C061A0C;
        Sat,  2 May 2020 14:51:24 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id v8so12468987wma.0;
        Sat, 02 May 2020 14:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/sUJbHpXs/74rGqujOvXwb+/vrMllmKdL9NZjRA0BV0=;
        b=eImR+I+los96h312gAuW1ifMwwBPn6C/BovQ638AIvAems6f/ofzcE53IY9zmlQopy
         yBQqofGsBdPb1V662GRMtnPevHITBq+Ok3qN2KkU88ed25uhIdeNmxN2ynvKGSvbmaZM
         Bfk/i/JSsbotJ7K/z/r9Asr7atA87IU9Cq7cmLySRYRNB6gYW8xwSUIkUa9HaMC4zUqr
         sQFPc3xq5wjQ5JlKii2a0ZU3Rmk1MC0BLeskUia/Mow1Wtnz0RC8WObzjsfyD51DeMC5
         lkBdNvhGfdsV1XxWSUruoj2P2mSUMgpLL2H6i1zUiDTodN5S/Y6kbJUsXLv48yTAW5ZL
         v86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/sUJbHpXs/74rGqujOvXwb+/vrMllmKdL9NZjRA0BV0=;
        b=OtnRKSWDQWpsi+eKMzh91OGKMB8aTL+Ojc83qEGWVVT7vpkEXBQcSg/PetozzuXX77
         jWjm2Bj4wzVb7f79/cDdRuaTHMO8xD/QZV0x/3V08rlcdL6mWWxSw8k5KM6qUJ3KlrDK
         oHbQgjw2kIUP17dGXlF2hsX93aEc5z39XEJ5Zf2TBnmabkNiqxQr42BcnwlFi0I4DohB
         p6DHCEWAc0A+rZpJRyNWFLddHj6iz3AfY/ICyIXp5u/B68TqOjatOWlCz3IQOhAu4DnJ
         msoM2pkJJnxB+hdPht9nnevwMa8uLWWpGjCIKhHYscFCoZkBRuMWNQHNco7sPqAQkHvC
         x8yQ==
X-Gm-Message-State: AGi0PuapLWNKXSJkH9oKpzII+S8XA3tDXhIfALEAleK4VqC6vv6XTkpV
        Lke3QsF5FIpWmh2BosvdzBTkBEOWJco=
X-Google-Smtp-Source: APiQypIQfM3Qwbrh8n55UUQQxqvr5kgN+7FplG9lNj9OlBjeZojSZjEE9TWNRdRa+g/SH8ofQ6kLng==
X-Received: by 2002:a7b:c390:: with SMTP id s16mr6090233wmj.14.1588456283175;
        Sat, 02 May 2020 14:51:23 -0700 (PDT)
Received: from [192.168.1.23] (acen178.neoplus.adsl.tpnet.pl. [83.9.189.178])
        by smtp.gmail.com with ESMTPSA id j22sm11504981wre.84.2020.05.02.14.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2020 14:51:22 -0700 (PDT)
Subject: Re: [PATCH v23 02/16] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200429202816.26501-1-dmurphy@ti.com>
 <20200429202816.26501-3-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <5533a7b4-12b4-90b8-2731-a9cdfbee5e12@gmail.com>
Date:   Sat, 2 May 2020 23:51:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429202816.26501-3-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

I've converted drivers/leds/leds-an30259a.c to LED mc framework
and tested it on Samsung Galaxy S3 (exysnos4412-trats2 board).
Works as expected. And now the framework usability is indeed neater.

One thing to improve: LED mc based drivers' entries in Kconfig should 
have this dependency:

depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR

It is required to enforce building driver as a module if
LED mc framework is configured as such.

With this (and DT bindings nits) addressed, for patches 1-6:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

It's been a long journey. Thank you for your determination to drive
this work to the end.

Best regards,
Jacek Anaszewski

On 4/29/20 10:28 PM, Dan Murphy wrote:
> Introduce a multicolor class that groups colored LEDs
> within a LED node.
> 
> The multi color class groups monochrome LEDs and allows controlling two
> aspects of the final combined color: hue and lightness. The former is
> controlled via the intensity file and the latter is controlled
> via brightness file.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   .../ABI/testing/sysfs-class-led-multicolor    |  34 +++
>   Documentation/leds/index.rst                  |   1 +
>   Documentation/leds/leds-class-multicolor.rst  |  86 +++++++
>   MAINTAINERS                                   |   8 +
>   drivers/leds/Kconfig                          |  10 +
>   drivers/leds/Makefile                         |   1 +
>   drivers/leds/led-class-multicolor.c           | 210 ++++++++++++++++++
>   include/linux/led-class-multicolor.h          | 121 ++++++++++
>   8 files changed, 471 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>   create mode 100644 Documentation/leds/leds-class-multicolor.rst
>   create mode 100644 drivers/leds/led-class-multicolor.c
>   create mode 100644 include/linux/led-class-multicolor.h
[...]
