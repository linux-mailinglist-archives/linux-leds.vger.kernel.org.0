Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD19424A85C
	for <lists+linux-leds@lfdr.de>; Wed, 19 Aug 2020 23:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbgHSVUN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 Aug 2020 17:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbgHSVUE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 Aug 2020 17:20:04 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7776C061757;
        Wed, 19 Aug 2020 14:20:03 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id m22so105185eje.10;
        Wed, 19 Aug 2020 14:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dc/CKh07k5BEAnG6K045hmwNfZTVgVZZuWpippFAxow=;
        b=Wu6YQxWxxDSaNkkzuYVBZ28Ab3N73wT0L1egEq0DrP3Vm6rKoSUD/RyVw6Td4bUeJN
         kKMTebC5P+gbktxWxbGBjoDk7I2+W0D34Z303HWWHhzKCNpCj7XNoEkpkJ89Y3D+Om+/
         e1FHPV3OW9s0Xwydqkf6yjvy8S+N8AuBRtkYNl8yQRaBis/OVVb9a4KX8cSCnegfupSi
         f9zJrZVtLcbTIFhGCaZ4v2KTHwCTooK2dOYeVoyqZaoREWjKtW4XxPdT5sWrPgnfpyk9
         Vms7E2eG0gR5o4OcvIfO6L096M0Pzfgr/yHPzAvcFtAnozOkEBZLGIn2UpBYVbq/qoan
         HLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dc/CKh07k5BEAnG6K045hmwNfZTVgVZZuWpippFAxow=;
        b=n0pNllza5H+A7EYQ3bCaF5T5xCsYlH3a4FP0MtGkkKBVdb5//LWdbV3G2fYkFBB6VC
         81qNEe8n+bRa2jXTF91kk6rqSXa9RTvtO9G6+OmNS4HKF9g9wOvyOLdUKv7yQPRRNZwK
         pApPliyXThMGxoHrw+zi2DwNmKFFvPZoN5XS/MHWcjbfezqlK+sfjSy7RvdyZdWj0sLY
         vTbmWK97fMyN/QYJgiYFqomYixd0PASltsK5JZV7AtAogfkjNgnDhxcWobFuSesQTxe3
         sSLL+UmU4YNc8+em9bOylPvToCiWjEaQn0HBgeWrgT/haYGSdjC9XqrH+0/4l+G0BmJK
         37kw==
X-Gm-Message-State: AOAM532e5XFkflVKKzxturA6UAW8b+BUsbtZLFzVstk+sYSm1tGWSgDp
        4U1v4d6B+bv+/5J3C8YulKTmMFV64lA=
X-Google-Smtp-Source: ABdhPJxTx5eyyhyR3+blZB7fCmE/P88qywmpapA2jFXKvtcU9lbZpGIFY8L1YufKx7HlkO3v1lLUyQ==
X-Received: by 2002:a17:906:4e4f:: with SMTP id g15mr211728ejw.443.1597872002431;
        Wed, 19 Aug 2020 14:20:02 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:65ed:677d:9795:eae9? ([2a01:110f:b59:fd00:65ed:677d:9795:eae9])
        by smtp.gmail.com with ESMTPSA id b2sm29728ejg.70.2020.08.19.14.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2020 14:20:01 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add DT binding for Richtek RT8515
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20200812090711.2644688-1-linus.walleij@linaro.org>
 <e8d27b57-ac17-29e4-0e43-b72d7447d43a@gmail.com>
 <CACRpkdYcKthp9_482ptL7YSitN-YUU4_u57ra25Ko4_-102JaQ@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <e4ac5ea8-916d-1270-c9ae-64870b2f7c8d@gmail.com>
Date:   Wed, 19 Aug 2020 23:20:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdYcKthp9_482ptL7YSitN-YUU4_u57ra25Ko4_-102JaQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 8/19/20 11:05 PM, Linus Walleij wrote:
> On Thu, Aug 13, 2020 at 11:06 PM Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
> 
>>> +  led:
>>> +    type: object
>>> +    $ref: common.yaml#
> (...)
>>> +        led {
>>> +            function = LED_FUNCTION_FLASH;
>>> +            color = <LED_COLOR_ID_WHITE>;
>>> +            flash-max-timeout-us = <250000>;
>>
>> Constraints for this property are needed above.
> 
> Can you elaborate on what you expect this to look like?
> The property is from common.yaml, so should that be
> extended with a constraint?

Constraints are specific to the hardware, so those should
be provided in the related bindings.
Generally it is customary in similar cases to give min, max
and step values.

I don't have json-schema example, but see old txt DT bindings:

- Documentation/devicetree/bindings/leds/leds-lm3601x.txt
- Documentation/devicetree/bindings/mfd/max77693.txt

-- 
Best regards,
Jacek Anaszewski
