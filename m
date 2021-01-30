Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2F3309839
	for <lists+linux-leds@lfdr.de>; Sat, 30 Jan 2021 21:32:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhA3UcR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 30 Jan 2021 15:32:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbhA3UcP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 30 Jan 2021 15:32:15 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69DE7C061573;
        Sat, 30 Jan 2021 12:31:35 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id h7so17393977lfc.6;
        Sat, 30 Jan 2021 12:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KVwPoYz7xF78gp1Ueiaj+rkpwN7GCQBoc9c1s+DZAHM=;
        b=Dkt3hitp7hGfRD4WW0EW4kVOyNTkl7lxF5idLvph+oAhOAWtwXOHbSEZaCZoyYHfJl
         vvk0wjUHljOV2Mcq9s/Bj4UAmJ+Eaj2VfMfp0wmfneE3YriHvQcrbhhlZEwQm12jFvyi
         bEJseHM9w08VFDqyxi8clE2/guMsZ9oCw8QPV4FhNMEmM81z9NcU6+j8ZFzQOaM9xHjW
         mgWvPOXsTR1OTAolDbgslo6Rd5MoPtUs5aTrlbui3e+WICG+/8dEJzDPWkDU5sLtneqY
         QDhMCMcH6GYzOrSiEJdUShP8uAl9HSvEwdsJwZUy42GE87fazBCItZf6Mkk4XHANrl9g
         +cTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KVwPoYz7xF78gp1Ueiaj+rkpwN7GCQBoc9c1s+DZAHM=;
        b=LPtjp88CUnzghjiaX1Cs09jfi6hVUs20fXPoe39NLBhnO6tLxcH84hQ2LAvF8A8Gqi
         Eh0yhnLGwvALdNPfqYMV86Pfjd2sngJpAGcV4GrCE2+vrCwh/EAZ0MoRhPZUlodJxd6Q
         sXsIVGj5CcqOM/NrCZXMZlwkkLKMTjccttC4IMqzH9n8+zXZnU7gzc6O80bkeHxrlhTy
         AmQPt/Wd3PWEpGwBpiR14ywWwGWKRAC1QaBg9ZkpAHljO+h6AIhKVo0+H4iXSDeCrvap
         7PQZeD0lgAcqoxeMy5ljXmjZtYYKu6W/vKM6drnNiQCcdkTh8N+GoUamMJwD1OSl6G5r
         fLiQ==
X-Gm-Message-State: AOAM530+pDgNgQHam5MjKycahF+ewClE5KfKi2IQVo35LdkAv90QVVAF
        GZ9oQm/pSGeRUbiQ/cv4G1Y=
X-Google-Smtp-Source: ABdhPJxJQNwWiYhQq6jCt57t2YFO9gqlde5T0oVGCv0vaJYtNHMZ6jIXMk5XwGFMtydomBK9Kx9Erw==
X-Received: by 2002:a05:6512:745:: with SMTP id c5mr5009700lfs.489.1612038693911;
        Sat, 30 Jan 2021 12:31:33 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id z5sm601049ljo.118.2021.01.30.12.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Jan 2021 12:31:33 -0800 (PST)
Subject: Re: [PATCH v2 0/4] Add support for QCOM SPMI Flash LEDs
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@protonmail.com>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
References: <20210126140240.1517044-1-nfraprado@protonmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <8323f365-e07e-6206-86f2-126690553d09@gmail.com>
Date:   Sat, 30 Jan 2021 21:31:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126140240.1517044-1-nfraprado@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Nicolas.

On 1/26/21 3:03 PM, Nícolas F. R. A. Prado wrote:
> Hi,
> 
> this patch series adds support for Qualcomm's SPMI Flash LEDs present in the
> PM8941 PMIC. It is used as part of MSM8974 based devices, like the Nexus 5
> (hammerhead), as a camera flash or as a lantern when in torch mode.
> 
> Patch 1 adds the dt-bindings for the driver, together with a header for the
> values of some properties.
> 
> Patch 2 adds the driver, which was ported from downstream [1], and is now using
> the flash LED class framework.
> 
> Patch 3 enables the driver as a module in qcom_defconfig, and also enables
> CONFIG_LEDS_CLASS_FLASH since it is required by the driver.
> 
> Patch 4 adds the device tree nodes configuring the driver in the pm8941 dtsi.
> 
> After the feedback I received from the v1 RFC patch (thank you Jacek and
> Bjorn!), I implemented the flash LED class framework, renamed the driver to
> qcom-spmi-flash and added the dt-bindings. I also did a whole lot of cleanup.
> 
> Some caveats:
> - I still didn't implement get_strobe() and get_fault() for the flash LEDs,
>    because I'm still not sure how to do it. get_strobe() in particular I'm not
>    even sure if is possible, since after the flash turns off automatically after
>    the timeout, I don't see any change in the SPMI registers. So I'm unsure how
>    one would get the current strobe state.

strobe_get is optional - you can leave it uninitialized if there is no
obvious way to get strobe status.

Regarding faults - I see you have FLASH_FAULT_DETECT but have no
information on its impact whatsoever. Usually devices report the faults
by settings some register bits and then we can map those errors to
LED flash framework generic errors.

> - I have yet to add the V4L2 flash wrapper for the flash LEDs. I still didn't do
>    it because I wasn't sure if it was needed, so wanted to double check. But
>    being a camera flash it seems that would be useful. Also, it would be great if
>    someone could point me how I would go about testing the flash usage through
>    V4L2.

You need a V4L2 media device driver with which this driver would
register a V4L2 flash LED sub-device. Such a device is usually
implemented for platform ISP devices. Provided it is present in the
mainline you would have to associate this driver DT node with the
media device DT node. Then you can test the V4L2 Flash control with
v4l2-ctl or yavta user space tools.

Let's skip the V4L2 support for now - it can be added later, if needed.

> Another thing worth mentioning: for v1 the dt nodes were added in hammerhead's
> dts (just to simplify testing), but I have now moved them to pm8941's dtsi,
> since it was like that in downstream. So if folks using devices based on
> PM8941/MSM8974 other than the Nexus 5 could test it, that would be great, since
> I have only tested on the Nexus 5.
> 
> v1 RFC: https://lore.kernel.org/lkml/20201106165737.1029106-1-nfraprado@protonmail.com/
> 
> [1] https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/drivers/leds/leds-qpnp.c
> 
> Nícolas F. R. A. Prado (4):
>    dt-bindings: leds: Add binding for qcom-spmi-flash
>    leds: Add driver for QCOM SPMI Flash LEDs
>    ARM: qcom_defconfig: Enable QCOM SPMI Flash LEDs
>    ARM: dts: qcom: pm8941: Add nodes for QCOM SPMI Flash LEDs
> 
>   .../bindings/leds/leds-qcom-spmi-flash.yaml   |   94 ++
>   arch/arm/boot/dts/qcom-pm8941.dtsi            |   38 +
>   arch/arm/configs/qcom_defconfig               |    2 +
>   drivers/leds/Kconfig                          |    8 +
>   drivers/leds/Makefile                         |    1 +
>   drivers/leds/leds-qcom-spmi-flash.c           | 1153 +++++++++++++++++
>   .../dt-bindings/leds/leds-qcom-spmi-flash.h   |   15 +
>   7 files changed, 1311 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-spmi-flash.yaml
>   create mode 100644 drivers/leds/leds-qcom-spmi-flash.c
>   create mode 100644 include/dt-bindings/leds/leds-qcom-spmi-flash.h
> 

-- 
Best regards,
Jacek Anaszewski
