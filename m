Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3350145AEEA
	for <lists+linux-leds@lfdr.de>; Tue, 23 Nov 2021 23:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbhKWWUy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Nov 2021 17:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbhKWWUy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Nov 2021 17:20:54 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEA1EC061574;
        Tue, 23 Nov 2021 14:17:45 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id g28so340593pgg.3;
        Tue, 23 Nov 2021 14:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=riM6n3FKXPnBbZpz8xDj88S9+02ymlAL73plCzbpCUM=;
        b=UlM8A0aWxK7uD7yPaUWG+PnC0Co4lMl3miYyPkxkSPdv/gO98XQKxpuMcpV37tEA1l
         nUSMzY1PuuPIiDku689Z0JGG9kY07D965eTuv0wt0YmPXRCCA/0PA2WYK7yz0x2J9HLc
         L4j9zk72hncwDE6+3d1W8y4DPGsnrDm1MdKn7qEEVviS24CBL9LTzZZxu+KBcre+acQo
         yUFySFK8eVNYpDdX4QjJqAqIVR+ScY5qCaw/SKcV35+8C9D+py6tXpWKXxUJ/6FJgbdq
         2LKFYjYEeDjqETwJAFXazrH2M16ibsrw8D3h8c1hlFfnA8RSToGNG7zWTlJdb1XBQMTK
         1Tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=riM6n3FKXPnBbZpz8xDj88S9+02ymlAL73plCzbpCUM=;
        b=2yu5cd8rNli5GP4EtMn39WVMmxM7jEgJClrpQ2kbCGNNHEVEwuW6rsAXJQssvdUZBZ
         rOZIKO0lDs7be+lRtgiNo46IBcgTHDnmangvVT8G983Trjlvr3dRP/nnfGJZlysF6yUA
         v7MULPJkJPgMcR8ffPmauCwT6+PUgxl/yoBtyXTBw5XuPxgfS2/D6RMNxxDnKE6g/quI
         vPUQypdPi9WzToBOJ0SNKELrFdKVwIenPnmM0LEKY4REq7b/RmHdVFBF6te4YYOa6TzV
         0jtXxIuPz71/PzL4Q6+KvxrDJPlvKGTSl4ZSTuByLoQfa2ghArOSlQeIYqH/ErvwrH3r
         loSQ==
X-Gm-Message-State: AOAM532ytPbH/Cl/pHaW1AUqo69+KUcgktewMJqXfOh0doPhazj8b+DQ
        L+6KxIOYBm/gwmV8lm+ObNY=
X-Google-Smtp-Source: ABdhPJwRMY1l0h3M7z8ZWH7kogdpeYo1lF8Tns9RZvAtkRkSP1OZ1By6TrNUDPORS0TgbidaE+YNEA==
X-Received: by 2002:a63:8143:: with SMTP id t64mr6244139pgd.43.1637705865375;
        Tue, 23 Nov 2021 14:17:45 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id d9sm3192077pjs.2.2021.11.23.14.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 14:17:44 -0800 (PST)
Subject: Re: [PATCH 1/2] dt-bindings: leds: add Broadcom's BCM63xxx controller
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211115091107.11737-1-zajec5@gmail.com>
 <495a94ce-984e-f5c5-f5a2-74dc1b61e345@gmail.com>
 <5113880f-d37d-0835-c140-c3749048c519@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <0795ecb9-f638-bb95-1e97-4c10800eb37c@gmail.com>
Date:   Tue, 23 Nov 2021 14:17:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5113880f-d37d-0835-c140-c3749048c519@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 11/22/21 2:00 PM, Rafał Miłecki wrote:
> On 22.11.2021 22:51, Florian Fainelli wrote:
>> On 11/15/21 1:11 AM, Rafał Miłecki wrote:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> Broadcom used 2 LEDs hardware blocks for their BCM63xx SoCs:
>>> 1. Older one (BCM6318, BCM6328, BCM6362, BCM63268, BCM6838)
>>> 2. Newer one (BCM6848, BCM6858, BCM63138, BCM63148, BCM63381, BCM68360)
>>
>> Just so the existing pattern/regexps continue to work, I would be naming
>> this "bcm63xx" to be consistent with the rest of existing code-base.
> 
> The problem I saw with "bcm63xx" is that it seems to match all SoCs:
> those with old block and those with new block. So I guess both groups
> have the same right to use that "bcm63xx" based binding.
> 
> To avoid favouring old or new block I decided to avoid "bcm63xx".
> 
> Given above explanation: do you still prefer using "bcm63xx" based
> binding for the new block? I'm OK with that, I just want to make sure
> you're aware of that minor issue. Please let me know :)

Maybe we use leds-bcm63138.c then since this is the first chip in the
list that featured that block, similar to how leds-bcm6328.c was
created? Then my second choice would be leds-bcm63xx.c just so the
existing patterns match, really and because it's easy to visually not be
able to tell the difference between two x versus three x.

Thanks
-- 
Florian
