Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5CD55A9A36
	for <lists+linux-leds@lfdr.de>; Thu,  1 Sep 2022 16:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234800AbiIAO0G (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 1 Sep 2022 10:26:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234801AbiIAOZs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Sep 2022 10:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138D7F2E
        for <linux-leds@vger.kernel.org>; Thu,  1 Sep 2022 07:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662042283;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7t86a/Rwz4UEXAxEsqFbp8XPc3B6sw3pJVS11c5HqPA=;
        b=KUQyy4Hl5WIPUC2SjupxDGX07qIzRURYOs2YBznNs3Gt4moJPfp8mOGk2/CoRn9exHPSOC
        YujMll1EAqbDQ91/Z2C4HRIkNYL0mphC4jBxvAeqhKd6rWFosGBD+n/iqKy/ZEyMipTWUA
        2BP2Zzw09d21zy2Zscv2jN4aMMzYZe8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-44-GONX6bXgP_qUxfTGM5jdqA-1; Thu, 01 Sep 2022 10:24:42 -0400
X-MC-Unique: GONX6bXgP_qUxfTGM5jdqA-1
Received: by mail-ed1-f72.google.com with SMTP id x21-20020a05640226d500b0044856301c62so8786097edd.12
        for <linux-leds@vger.kernel.org>; Thu, 01 Sep 2022 07:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=7t86a/Rwz4UEXAxEsqFbp8XPc3B6sw3pJVS11c5HqPA=;
        b=kDRD8n/IvuBAhJ2at0OEWDNUIhkS1vZ3l+5RSqu1TZ80kPKIWR+AcreEIcUJaXMv38
         4vzFsenQF8BlATg9kA8PpQL536SusM9/IA0iZm1lj8jiRAY8TkYFcbGEIelAlGUssyX3
         e6O6O8hWdF9CFmU95ziKcfRzoBFYVbLCSSTmXCQ/keXpWF0fIVIu0fboUNlyZzkOzD6w
         KZIMZSbYzJj8R4/AQmzesZN7XA3Z65MtB5KeRL4zLvnG/TsbRmPJAPG90H5Df5pJ7WLZ
         kZoMOx2DgPqA6WlnfjnFpkvsTIozkNGu/adJCUYUEuQ28JswHoDtIagIG0h3VYi4aR9+
         CHCg==
X-Gm-Message-State: ACgBeo17fggMggqdbGiVBSXNGLlO5nJ/HtLUF65BRfAn6pIDAlpQ/Udd
        TR9A7OJigNc7RlIAUoNBGR3mZZIv2vGQLUdFGriXSHMRj2ZmUTgBx7r1xpD9Efm0D4rsNSnlx5/
        A4q1Bzse+Vs5f1U1nCI0MSA==
X-Received: by 2002:a17:907:75c1:b0:730:aa62:7f65 with SMTP id jl1-20020a17090775c100b00730aa627f65mr22949852ejc.355.1662042281148;
        Thu, 01 Sep 2022 07:24:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5DI8eVN0/lLCL/FWyzmn93gTICIv8j7zFdWsgS/8rt2Nnn952d50V+qMI+Rc0HZ4M9/tduTw==
X-Received: by 2002:a17:907:75c1:b0:730:aa62:7f65 with SMTP id jl1-20020a17090775c100b00730aa627f65mr22949832ejc.355.1662042280901;
        Thu, 01 Sep 2022 07:24:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id f20-20020a17090631d400b006fee7b5dff2sm8671735ejf.143.2022.09.01.07.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 07:24:40 -0700 (PDT)
Message-ID: <9a306d9d-1c47-e250-9cf5-fc6f5d2347de@redhat.com>
Date:   Thu, 1 Sep 2022 16:24:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v6 0/7] add support for another simatic board
Content-Language: en-US
To:     Henning Schild <henning.schild@siemens.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Pavel Machek <pavel@ucw.cz>, Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Sheng-Yuan Huang <syhuang3@nuvoton.com>,
        Tasanakorn Phaipool <tasanakorn@gmail.com>,
        simon.guinot@sequanux.org
References: <20220825104422.14156-1-henning.schild@siemens.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220825104422.14156-1-henning.schild@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi All,

On 8/25/22 12:44, Henning Schild wrote:
> changes since v5:
>   - adding patch to convert to pr_fmt
>   - adding patch to prefix macros with "f7188x_"
>   - rebased p1v4 to be p3v5 and added tag
> 
> changes since v4:
>   - remove int case from a printk in p1
>   - include tags into commit messages
> 
> changes since v3:
>   - update Kconfig as well
>   - drop chip names from comment in driver header
>   - add manufacturer check for Fintek again, Nuvoton not possible
>   - drop revision printing for Nuvoton
>   - restructure defines again
>   - add new model 427G
> 
> changes since v2: (p1 only)
>   - rename macros that change behavior
>   - use chip type not device id in the macros
>   - reorder defines a bit
> 
> changes since v1:
>   - remove unused define
>   - fix bug where (base + 2) was used as second data bit
>   - add macros for "inverted" and "single data bit"
> 
> The first two patches apply some style refactorings before actual
> functional changes are made.
> 
> Later, This series enables a SuperIO GPIO driver to support a chip from
> the vendor Nuvoton, the driver is for Fintek devices but those just are
> very similar. And in watchdog and hwmon subsystems these SuperIO drivers
> also share code and are sometimes called a family.
> 
> In another step the individual banks receive a label to tell them apart,
> a step which potentially changes an interface to legacy users that might
> rely on all banks having the same label, or an exact label. But since a
> later patch wants to use GPIO_LOOKUP unique labels are needed and i
> decided to assign them for all supported chips.
> 
> In a following patch the Simatic GPIO LED driver is extended to provide
> LEDs in case that SuperIO GPIO driver can be loaded.
> 
> Last but not least the watchdog module of that same SuperIO gets loaded
> on a best effort basis.
> 
> The very last patch enables a second model of that same board type.
> 
> Henning Schild (7):
>   gpio-f7188x: switch over to using pr_fmt
>   gpio-f7188x: add a prefix to macros to keep gpio namespace clean
>   gpio-f7188x: Add GPIO support for Nuvoton NCT6116
>   gpio-f7188x: use unique labels for banks/chips
>   leds: simatic-ipc-leds-gpio: add new model 227G
>   platform/x86: simatic-ipc: enable watchdog for 227G
>   platform/x86: simatic-ipc: add new model 427G

Despite the "leds: simatic-ipc-leds-gpio: add new model 227G" missing
an ack from the LED subsys maintainers I have decided to move forward
with this.

The LED changes in that patch are quite small / trivial, it actually
touches both drivers/leds and drivers/platform/x86 and the latter
changes are bigger and it also has been Reviewed by both me and Andy.
So I'm going for the it is easier to ask for forgiveness then ...
route here wrt the missing LEDs subsys ack.

I've just pushed a new platform-drivers-x86-simatec branch which
contains 6.0-rc1 + these 7 patches.

Next I'm to send out a pull-req (based on a signed tag)
to the involved subsys maintainers and merge that signed tag into
my review-hans branch (and from there it will go to pdx86/for-next).

Regards,

Hans




> 
>  drivers/gpio/Kconfig                          |   3 +-
>  drivers/gpio/gpio-f7188x.c                    | 275 +++++++++++-------
>  drivers/leds/simple/simatic-ipc-leds-gpio.c   |  42 ++-
>  drivers/platform/x86/simatic-ipc.c            |  10 +-
>  .../platform_data/x86/simatic-ipc-base.h      |   1 +
>  include/linux/platform_data/x86/simatic-ipc.h |   2 +
>  6 files changed, 216 insertions(+), 117 deletions(-)
> 

