Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B27651240F
	for <lists+linux-leds@lfdr.de>; Wed, 27 Apr 2022 22:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234899AbiD0UuW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 27 Apr 2022 16:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236898AbiD0UuT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 27 Apr 2022 16:50:19 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 150F6393F0;
        Wed, 27 Apr 2022 13:47:07 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id k23so5736062ejd.3;
        Wed, 27 Apr 2022 13:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=UMLAATBe4XKMmnDOB57cdsQRe9YmwoN3vzpf5IFt4DU=;
        b=VM4bQuGSVUmZD+tsZRRXxF33FdZz7JGSwXBhHB9nhnDkszgQCOJd0OjZPbO1rzg5XB
         WeMPNULIejSAqM+6PrKomWH6jE+urT0IEL0ldPfrUrCIYctkPxBFAoW7afkJnfiGxxf3
         z4Xt87imTBPzxIHKn92Fnc3/u7aUs3oPzTxsn26sd9zIXGnjCRLMP5zghBNGgHhvLoXC
         YZx+rxaZG7NXFVBYfsjn+5rNo+wnHSbQMLicf+I6t51IT0ORMbLIdWRlE2G8h1GYNTha
         UYhrdxNYcS78VOJfPfWIMjr0ugdV9k5MA2dBnBvAdgfepJpWze0fUTROG+RyWDVj4Xe0
         4Y0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UMLAATBe4XKMmnDOB57cdsQRe9YmwoN3vzpf5IFt4DU=;
        b=kkocIXnnwrYR1Qx36Cr4UHVd3vBhoYvbESEO1fJHcUKmqHkXWc8n2RFYEKKwLVJvk7
         uT8HiixrCEP/WlcvSKsRMFD7/ooyfTjijXn8BAB0exWyVIYgNX+zy77BnnsId9JTmdQo
         Wb3xeTs4cP9A9WE+tB8ZNFr2sZq0ygrkrCl37YAJIeD3EC71TC8hOwnNLJYUCiWfJuWv
         m5rAr+M/7yKZwGoS6hnhyPFHKrQBM73T78LKuvYeGfO5Tbszfko67fA/1EX0kM2v0IG0
         JS0cxUBrqaV8yVLlxQyEi50dn6YtcrkGUSeeVHoS9W1KL+EP5EPGb60i/0ypQn8VAVdS
         ot9w==
X-Gm-Message-State: AOAM530Nymxep1OggUYK0HHuSp/adRXyMkYDN0XwxA1ndkl79tThfZqh
        l4SLuJwbHHTewkz0BiA/Wo4m0BoRjds=
X-Google-Smtp-Source: ABdhPJy8lrwWq3ch6p48XNEA66UnRBppKWh2cDumJCRhlQV/OOXR5T1eoTLzticKLzEF/v/CK9ZFxQ==
X-Received: by 2002:a17:907:9805:b0:6db:4c33:7883 with SMTP id ji5-20020a170907980500b006db4c337883mr28954211ejc.555.1651092425270;
        Wed, 27 Apr 2022 13:47:05 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id b7-20020a170906708700b006da8440d642sm7376533ejk.113.2022.04.27.13.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 13:47:04 -0700 (PDT)
Message-ID: <1273c272-b6fe-2980-ce66-582738722634@gmail.com>
Date:   Wed, 27 Apr 2022 22:47:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V3 1/2] dt-bindings: leds: add Broadcom's BCM63138
 controller
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
References: <20211227145905.2905-1-zajec5@gmail.com>
 <1ca1d83d-9803-77a3-e5bb-2380a2dc03b0@gmail.com>
 <223aabc8-7ec3-2719-866a-8f35ab97a11f@gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <223aabc8-7ec3-2719-866a-8f35ab97a11f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On 27.03.2022 11:28, Rafał Miłecki wrote:
> On 7.03.2022 07:27, Rafał Miłecki wrote:
>> On 27.12.2021 15:59, Rafał Miłecki wrote:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> Broadcom used 2 LEDs hardware blocks for their BCM63xx SoCs:
>>> 1. Older one (BCM6318, BCM6328, BCM6362, BCM63268, BCM6838)
>>> 2. Newer one (BCM6848, BCM6858, BCM63138, BCM63148, BCM63381, BCM68360)
>>>
>>> The newer one was also later also used on BCM4908 SoC.
>>>
>>> Old block is already documented in the leds-bcm6328.yaml. This binding
>>> documents the new one which uses different registers & programming. It's
>>> first used in BCM63138 thus the binding name.
>>>
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
>>
>> Pavel: can I get this patchset finally accepted, please?
> 
> It has been 3 months now. I kindly pinged you in January, February and
> March. Please let me know how can I get those patches accepted.

did you maybe have a chance to look at my patches?
