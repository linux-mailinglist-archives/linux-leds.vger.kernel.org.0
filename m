Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 082B22669FC
	for <lists+linux-leds@lfdr.de>; Fri, 11 Sep 2020 23:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbgIKVVj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Sep 2020 17:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgIKVVg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Sep 2020 17:21:36 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74181C061573;
        Fri, 11 Sep 2020 14:21:36 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id j2so820488eds.9;
        Fri, 11 Sep 2020 14:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AdOFtW4+OTIfp7Vou5995FqSxqsP8JuVzsLCHo5nrGw=;
        b=iwx2YXfAln6p3+zUP1hzFoV8htJuprZmjPd2GMeVHLV95xIUBZ0d5kbG/zN0idAJZR
         CW420ks8syqWX+2MiN9x1egEJbYq6ia6v6uBT4Mn6BGQZ501QvqklbRxxbPomAkdHG2s
         VH+TyXl/AifpbFN2iDgXavo7b2SXiy9kbQOo4LdGoT2SYQdx87zlsOnUkH/a2RyziGnq
         q17UG/ZDvz+FSf5JCOpBjuiSczlBwJz7ESoPAjKHsFu2nvXFV1CDhOSEHk+tgaIamwow
         hEMXayvrrYu7sm1LSaOfY6zeTQiaYSQ2n0owQeMkDo3DKVSa/naw+QHhfeyBS502+0QX
         CCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AdOFtW4+OTIfp7Vou5995FqSxqsP8JuVzsLCHo5nrGw=;
        b=EA9lkMLKoFy6y8HFTFjoApDrYTu/805hzooA9ukspGzlfMnCIeATcm9KrNq5YmJTMr
         IZDF6LF7cZ8tWCpGdNQgXLNv8MjFlWrDO3r7+sHebSB9HoNzUHBFtnkULC+y3QRhe+31
         nIbHUNqUVCjDpCp/CmY7yf7Ad3IXhMN61s+Jq5kak4M9DhY8Izz4G7HMGItdKATAzjHL
         luvwmk/6eGBTYo8zaeKOzPHJPrICsE0p4GyRYw14HHeClpIZ1hpkNDMkRe89giGlLGOt
         XdzASL13yCv2qlrsVBko5b5y67ymqGSmDQejVaSHr8wAaL0cHU77fN5gty6+ZF7Q1I51
         q1Lg==
X-Gm-Message-State: AOAM530uhhUK+kZ9NLCiAxkxw+5yg3IxOu3U+DaNcF8btUrNwGyHJdtL
        cJ1/qSn9ysZXmMkKWyknLOY=
X-Google-Smtp-Source: ABdhPJwjd7y5MMCMMarDa3tCNp2fu5QkfRwhlPlnzt92v+gipu179RrQr1jgubq+d5d0CcG2FGf/+g==
X-Received: by 2002:aa7:d296:: with SMTP id w22mr4581288edq.327.1599859295171;
        Fri, 11 Sep 2020 14:21:35 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:e953:3254:5e71:3177? ([2a01:110f:b59:fd00:e953:3254:5e71:3177])
        by smtp.gmail.com with ESMTPSA id z18sm2200844ejb.92.2020.09.11.14.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 14:21:34 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To:     Gene Chen <gene.chen.richtek@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     robh+dt@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <559a568e-3a2e-33c6-43aa-547a18f8e26b@gmail.com> <20200911070503.GA9818@amd>
 <CAE+NS34aKmu0tjnCPg3nF_vB0ELKsKwZSOeEXsm5V9aPAqqSbQ@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <7e67c8f7-7f79-72f8-05bc-022ed0655a3f@gmail.com>
Date:   Fri, 11 Sep 2020 23:21:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS34aKmu0tjnCPg3nF_vB0ELKsKwZSOeEXsm5V9aPAqqSbQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/11/20 1:24 AM, Gene Chen wrote:
> Pavel Machek <pavel@ucw.cz> 於 2020年9月11日 週五 下午3:05寫道：
>>
>> Hi!
>>
>>>> +{
>>>> +    struct mt6360_led *led = container_of(lcdev, struct mt6360_led, flash.led_cdev);
>>>> +    struct mt6360_priv *priv = led->priv;
>>>> +    u32 enable_mask = MT6360_TORCHEN_MASK | MT6360_FLCSEN_MASK(led->led_no);
>>>> +    u32 val = (level) ? MT6360_FLCSEN_MASK(led->led_no) : 0;
>>>> +    u32 prev = priv->fled_torch_used, curr;
>>>> +    int ret;
>>>> +
>>>> +    dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level);
>>>> +    if (priv->fled_strobe_used) {
>>>> +            dev_warn(lcdev->dev, "Please disable strobe first [%d]\n", priv->fled_strobe_used);
>>>
>>> Doesn't hardware handle that? IOW, what happens when you have enabled
>>> both torch and flash? If flash just overrides torch mode, than you
>>> should not prevent enabling torch in this case.
>>
>> Yep, this is strange/confusing... and was reason why I asked for not
>> supporting strobe from sysfs.
>>
>> Could I get you to remove code you are not commenting at when
>> reviewing?
>>
> 
> MT6360 FLED register define is STROBE_EN/TORCH_EN/CS1/CS2 (current
> source) 4 bits.
> The STROBE_EN/TORCH_EN is shared by FLED1 and FLED2.
> If I want to enable FLED1 torch mode, I set TORCH_EN and CS1
> If I want to enable FLED2 strobe mode, I set STROBE_EN and CS2
> For example I set FLED1 torch, then I set FLED2 strobe.
> When I set FLED2 strobe, I will see the strobe current is FLED2 add
> FLED1 current which is not I want.
> So I need disable FLED1 torch first.
> Considering every circumstances is complicated when share same H/W
> logic control.
> And the other problem is torch mode switch to strobe mode needs ramp
> time because strobe and torch mode can't be co-exist.

Thank you for the explanation. So we have to keep your guards
but I would return -EBUSY instead of -EINVAL.

This would be also consistent with what
drivers/media/v4l2-core/v4l2-flash-led-class.c
does in its v4l2_flash_s_ctrl(), case V4L2_CID_FLASH_STROBE - it returns
-EBUSY if __software_strobe_mode_inactive() returns false.

The advantage of V4L2 Flash interface is that it has LED_MODE that
can be set to torch or flash, but in LED subsystem we don't have
the counterpart.

-- 
Best regards,
Jacek Anaszewski
