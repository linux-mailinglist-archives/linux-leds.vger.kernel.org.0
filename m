Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 353D3D4892
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2019 21:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728938AbfJKTkv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Oct 2019 15:40:51 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46649 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728889AbfJKTkv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Oct 2019 15:40:51 -0400
Received: by mail-wr1-f68.google.com with SMTP id o18so13093981wrv.13;
        Fri, 11 Oct 2019 12:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=az5ld5XgdF0H2M1Bu2HqLoXmNMtXfnpvceh2+J0pVic=;
        b=SsKQK3U77EuN/5R69bkzCVSaFLrB8tGb54ccO4OzP7I82Klll+jYfpXeF4geEk6Diu
         kupieeMIG1tEqVQfSBHMQkaFOTRzewuy1Ny74OP5Kb95qy11Bza4onGC81daBm7ToDvJ
         N9wda6qs+PBs/QLBUaVgu+5Udi/5joGIATTzF1z6AqSQtQhsDQqBeUG42reK9pJWp2Fa
         t9Sg5pqHTFnC0uh/rm5GZEehpj0M6lB4Xn42hRv4bc0pfKpllVOC0Xj9flWvU/BPS/Ag
         ktiZjsWqDZrh9goHchuVp0nhdz7Tt0iXxw3KalotNIDYMMkbmHNitoqC9/CW4AiPCncD
         S/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=az5ld5XgdF0H2M1Bu2HqLoXmNMtXfnpvceh2+J0pVic=;
        b=kp3cZFU8ofLBpaqjA2DffzOrg/b+7LLpwHMZspYyHWNDDSf+xRubmk3FcTdrCAmjea
         qG5smlq61soc/NuQ1nztrtwXQBGznEms3NLjMnkWV0AHVK59EYtXcjPZMGwWB6mkqxAN
         pY07ju2xNDrf9tH73HM+aA8yiRddVsfFCU12RaiQEQjgQ/D5XecB3mPR3laBsAHZNLUs
         zJCJvDkykX1j5PsQfr1L6AzS2muOy98p1aRxVurZtq/JS69gxFnpyxHn2SBkET4mSNO6
         D/VOXWJjPHx30DM0A4KPvs9rDCTqkz9DZ/lQzCNv0mN9aE1hQU28BExxd+iLpp4aCQrN
         A9DA==
X-Gm-Message-State: APjAAAXdDolooguEoYADBu2S+CfuhtnFgumEexL7rcEvF8uV5CGAcCm3
        Ohc8nQimhYN/i9PUBepK/w+U8lcj
X-Google-Smtp-Source: APXvYqzbeIkxT2Rs4R77qx8P3jrkU4oPbxdbXt4zxEcZu7eQnZnxznzgbcc7aW9c/LkQZPajO392Zw==
X-Received: by 2002:a5d:5552:: with SMTP id g18mr1018560wrw.79.1570822848108;
        Fri, 11 Oct 2019 12:40:48 -0700 (PDT)
Received: from [192.168.1.19] (cjl71.neoplus.adsl.tpnet.pl. [83.31.61.71])
        by smtp.gmail.com with ESMTPSA id o18sm22622108wrw.90.2019.10.11.12.40.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 12:40:47 -0700 (PDT)
Subject: Re: [PATCH v12 00/16] Multicolor Framework v12
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191011130657.4713-1-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <47e924dd-ae75-b822-b79e-9156d09b8b1a@gmail.com>
Date:   Fri, 11 Oct 2019 21:40:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011130657.4713-1-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 10/11/19 3:06 PM, Dan Murphy wrote:
> Hello
> 
> Minor changes per review comments.
> https://lore.kernel.org/patchwork/project/lkml/list/?series=413385
> 
> Rebased the series on top of Pavel's next branch.
> 
> Multicolor changes:
> Rename led_mc_calc_brightness to led_mc_calc_color_components
> Updated the binding example for the function from STATUS to CHARGING

I see STATUS is still there, as well ass "Child".

> LP50xx changes:
> None
> 
> LP55xx changes:
> Changed color_component array allocation from COLOR_MAX_ID to MAX_GROUPED_CHANNELS
> Updated MC API to call led_mc_calc_color_components
> 
> Dan
> 
> Dan Murphy (16):
>   dt: bindings: Add multicolor class dt bindings documention
>   dt-bindings: leds: Add multicolor ID to the color ID list
>   leds: Add multicolor ID to the color ID list
>   leds: multicolor: Introduce a multicolor class definition
>   dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
>   leds: lp50xx: Add the LP50XX family of the RGB LED driver
>   dt: bindings: lp55xx: Be consistent in the document with LED acronym
>   dt: bindings: lp55xx: Update binding for Multicolor Framework
>   ARM: dts: n900: Add reg property to the LP5523 channel node
>   ARM: dts: imx6dl-yapp4: Add reg property to the lp5562 channel node
>   ARM: dts: ste-href: Add reg property to the LP5521 channel nodes
>   leds: lp55xx: Add multicolor framework support to lp55xx
>   leds: lp5523: Update the lp5523 code to add intensity function
>   leds: lp5521: Add multicolor framework intensity support
>   leds: lp55xx: Fix checkpatch file permissions issues
>   leds: lp5523: Fix checkpatch issues in the code
> 
>  .../ABI/testing/sysfs-class-led-multicolor    |  36 +
>  .../bindings/leds/leds-class-multicolor.txt   |  98 +++
>  .../devicetree/bindings/leds/leds-lp50xx.txt  | 148 ++++
>  .../devicetree/bindings/leds/leds-lp55xx.txt  | 155 +++-
>  Documentation/leds/index.rst                  |   1 +
>  Documentation/leds/leds-class-multicolor.rst  |  96 +++
>  arch/arm/boot/dts/imx6dl-yapp4-common.dtsi    |  14 +-
>  arch/arm/boot/dts/omap3-n900.dts              |  29 +-
>  arch/arm/boot/dts/ste-href.dtsi               |  22 +-
>  drivers/leds/Kconfig                          |  22 +
>  drivers/leds/Makefile                         |   2 +
>  drivers/leds/led-class-multicolor.c           | 271 ++++++
>  drivers/leds/led-core.c                       |   1 +
>  drivers/leds/leds-lp50xx.c                    | 799 ++++++++++++++++++
>  drivers/leds/leds-lp5521.c                    |  20 +
>  drivers/leds/leds-lp5523.c                    |  39 +-
>  drivers/leds/leds-lp55xx-common.c             | 198 ++++-
>  drivers/leds/leds-lp55xx-common.h             |   9 +
>  include/dt-bindings/leds/common.h             |   3 +-
>  include/linux/led-class-multicolor.h          | 143 ++++
>  include/linux/platform_data/leds-lp55xx.h     |   7 +
>  21 files changed, 2020 insertions(+), 93 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
>  create mode 100644 Documentation/leds/leds-class-multicolor.rst
>  create mode 100644 drivers/leds/led-class-multicolor.c
>  create mode 100644 drivers/leds/leds-lp50xx.c
>  create mode 100644 include/linux/led-class-multicolor.h
> 

-- 
Best regards,
Jacek Anaszewski
