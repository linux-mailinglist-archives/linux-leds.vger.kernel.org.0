Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A119A2650AE
	for <lists+linux-leds@lfdr.de>; Thu, 10 Sep 2020 22:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbgIJUZN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Sep 2020 16:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgIJUXZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Sep 2020 16:23:25 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72470C061756;
        Thu, 10 Sep 2020 13:23:22 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id a12so7645397eds.13;
        Thu, 10 Sep 2020 13:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dW7YjxHc1ZzJ6SX3ZapZTyVcg2BZ2MrVhHy85wYAM7s=;
        b=Md9/FDi2UjXqMZ/r9zTDvWPc7EStWF1BrZkVX0n0rB6Plr9i6GajBhtdIytxV3tKuX
         rgEuLKaAvTuXJnRCs8eDnunMlw7oe9kT+MLG4tXOH6el8N3ZQwISu5/L/Bu9YEtUicla
         iOhWNNLMURqUJ+LO3LLtuDmtQvpHsdwz+WDLjF0vvuDVySEH1qig9lfrF6nu2cVQGcQr
         I/87h+NoyYId+iaX2/sZQrMw342JCxOwhgjf+hW2vos7DOoRnmVTIjgUEBcOe2Qow6v3
         u4UxPzPTvmwMl5FZv9AvU3DuxVXQU+vpkM6rEpSe99BS+70BxtwObtsc056guNjXKbmx
         Mwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dW7YjxHc1ZzJ6SX3ZapZTyVcg2BZ2MrVhHy85wYAM7s=;
        b=iI74UfLJe5BosuLAaH8M6rBgEGu3kEIe6sr02T/KLlORmyDMPscfva1fvJpTUlME9e
         hUnjrTYyNvPU4HfMZjxyOp0+zjLyU9twd1YrJo0sWgzBDNDMRGKAtmm3NXO5ksSkkZgZ
         Xl1zmfS83tUn1x3CiFx5UQoWGJDw5a3Lnoqsnx6P43jcXWMpDV4bZRH1JFpYPoIvGKso
         5k86UUJd6komcV9iHgVAkCf04m9TfBYQ3Mz+DbDY4GrOvHA/aPWgoHAJWNJu59LKaNyP
         +6d9pOptRm54R5EdbMJSRwYX/OANOPIv5oCOCV1bOVXqxXkVmLlrZonLRnenqdw9GLNU
         Oixw==
X-Gm-Message-State: AOAM530/BRECKKYQ2FZ90bCGv8/DK6lASR3Tti+Vyid9+Pi0cmhGiVst
        XX023RHeMdbb/yhTNTu1IZ4=
X-Google-Smtp-Source: ABdhPJz5MaQV71/AFS75F/hFw0qE/EwQO1ZoaAl2WyDBhKG+riuqvQJ28JycZSAGOmthz7MbQu3otw==
X-Received: by 2002:aa7:dc16:: with SMTP id b22mr11083008edu.252.1599769401165;
        Thu, 10 Sep 2020 13:23:21 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a856:4fc0:9f1:73f6? ([2a01:110f:b59:fd00:a856:4fc0:9f1:73f6])
        by smtp.gmail.com with ESMTPSA id dh3sm8455572edb.84.2020.09.10.13.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 13:23:20 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To:     Pavel Machek <pavel@ucw.cz>,
        Gene Chen <gene.chen.richtek@gmail.com>
Cc:     robh+dt@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <20200908222544.GF1005@bug>
 <CAE+NS34h9qbdHkYDYDnHGgk+9mFNTRpKEMKNEFZ+Secf6JyoZg@mail.gmail.com>
 <20200910122958.GF7907@duo.ucw.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <489fc92f-f6f5-839e-e417-7761d404e6ae@gmail.com>
Date:   Thu, 10 Sep 2020 22:23:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910122958.GF7907@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/10/20 2:29 PM, Pavel Machek wrote:
> Hi!
> 
>>>> +{
>>>> +     struct mt6360_led *led = container_of(lcdev, struct mt6360_led, flash.led_cdev);
>>>> +     struct mt6360_priv *priv = led->priv;
>>>> +     u32 enable_mask = MT6360_TORCHEN_MASK | MT6360_FLCSEN_MASK(led->led_no);
>>>> +     u32 val = (level) ? MT6360_FLCSEN_MASK(led->led_no) : 0;
>>>> +     u32 prev = priv->fled_torch_used, curr;
>>>> +     int ret;
>>>> +
>>>> +     dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level);
>>>> +     if (priv->fled_strobe_used) {
>>>> +             dev_warn(lcdev->dev, "Please disable strobe first [%d]\n", priv->fled_strobe_used);
>>>> +             return -EINVAL;
>>>> +     }
>>>
>>> So... how does its userland interface look like?
>>>
>>
>> 1. set FLED1 brightness
>> # echo 1 > /sys/class/leds/white:flash1/flash_brightness
>> 2. enable FLED1 strobe
>> # echo 1 > /sys/class/leds/white:flash1/flash_strobe
>> 3 . turn off FLED1 strobe (just used to gaurantee the strobe mode
>> flash leds must be turned off)
>> # echo 0 > /sys/class/leds/white:flash1/flash_strobe
> 
> I believe I'd preffer only exposing torch functionality in
> /sys/class/leds. .. strobe can be supported using v4l2 APIs.

Actually having LED flash class without strobe is pointless.
If you looked at led_classdev_flash_register_ext() you would see that
it fails with uninitialized strobe_set op. And V4L2 API for strobing
flash calls strobe_set from LED flash class beneath.

That was the idea behind LED and V4L2 flash API unification - there
is one hardware driver needed, the V4L2 Flash layer just takes over
control over it when needed.

-- 
Best regards,
Jacek Anaszewski
