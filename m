Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD9C44B6462
	for <lists+linux-leds@lfdr.de>; Tue, 15 Feb 2022 08:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234829AbiBOHb1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Feb 2022 02:31:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232298AbiBOHb0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Feb 2022 02:31:26 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1813110F99A
        for <linux-leds@vger.kernel.org>; Mon, 14 Feb 2022 23:31:17 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E009340334
        for <linux-leds@vger.kernel.org>; Tue, 15 Feb 2022 07:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644910275;
        bh=5KIzTmaU7Td0HdHjYzNLRhA3qi5eAUjP5mwcTbkjBL4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=jkBPjI+/Wuf64H/qB4m0l7CcahMlqoIsLaLbSQZrFbQp7jFwIliEDy/l2OPEgogX3
         y9EdD//vNQeUr0blgLzxirk8JVHaH/JChPlSa1NhbFauVjpBBS5WD0Wgccu2ECZXus
         AGjrmTKFisxUIAC3fbTt3zDPTHj/O+i9A8H+fW8nNtfoOgHOhpI4URuio4IZWfKinp
         QHCWOzdmUDu7PQRS9oyyx/aFF/+c7LY5184qqIEygTwilI9efz/1RXkSRC3j871Lgn
         /IOd4gRky8buUeb722Jv3Dm9FuOZp7wJEc9YInQuFHTllFFTeY2GYlK3bM5OJUtMid
         UMgGkuUh2PI2Q==
Received: by mail-ed1-f70.google.com with SMTP id g5-20020a056402090500b0040f28e1da47so11863200edz.8
        for <linux-leds@vger.kernel.org>; Mon, 14 Feb 2022 23:31:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5KIzTmaU7Td0HdHjYzNLRhA3qi5eAUjP5mwcTbkjBL4=;
        b=kE5y/UonzaKqkxLV55Z6KqrRopCcnSi5mpOEkvrC+G8PaR2wF1u5jVbihRUNRu8UdG
         SEI4CLtUFkRxSKGaF9qjh2AG9e8P6a8Jc7Mt6Q3RFrAMOOynargB7MUNRcvvrRM4XNCh
         WAwAOWjRfZaeHv9yKSRxyg5M4eaN3z/xncRRsLTeEvg/vCOEfpvDVmGnoS9WTv+FBNC8
         4o1EMrYBWVITKo8xqtMhJl4TDUS+AovV5wXYTa8KUkBxLcdjQ7Tfmlm4ny24L0q9Q2vj
         AFycCPBw/46arAzhh86Rp23aGtMAq6Q1gi6PocbL9vSoTp7cInTPYd0TkScEO1E+5n/s
         nbmg==
X-Gm-Message-State: AOAM532fB15I0TgQMbcq8wYkQCraxvSJfoGmOw/S7HeDSpoKRGpdyKpq
        BNlpDPWrwjn8b3pSEhfLWV4JMJnfJipERIJTXcC8qV30nJmifEb+qpnDHFQgfHVLLnOs5b5NE/W
        OdCc/sj7Suga3j7Pgn41JJtEMWw0wlo5/+8Jo/Ek=
X-Received: by 2002:a05:6402:5156:: with SMTP id n22mr2554586edd.261.1644910275308;
        Mon, 14 Feb 2022 23:31:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKEdMrtFtr9+fyCK4bQAUhQJXP3ooGayJ+Qk+5aqufpIctM2yIOqsBaMB7ldhmHuU7FiXKuQ==
X-Received: by 2002:a05:6402:5156:: with SMTP id n22mr2554575edd.261.1644910275144;
        Mon, 14 Feb 2022 23:31:15 -0800 (PST)
Received: from [192.168.0.106] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id h26sm570843eje.146.2022.02.14.23.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 23:31:14 -0800 (PST)
Message-ID: <bfa33105-88fc-5e51-8bec-594e89ce6acf@canonical.com>
Date:   Tue, 15 Feb 2022 08:31:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/3] regulator/mfd: dt-bindings: maxim,max77802:
 convert to dtschema
Content-Language: en-US
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Liam Girdwood <lgirdwood@gmail.com>
References: <20220111175430.224421-1-krzysztof.kozlowski@canonical.com>
 <f0a9e656-cf18-f212-b701-a1c9d10c4a59@canonical.com>
 <YgDoG8Xlhq5L3Bii@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YgDoG8Xlhq5L3Bii@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 07/02/2022 10:36, Lee Jones wrote:
> On Sun, 06 Feb 2022, Krzysztof Kozlowski wrote:
> 
>> On 11/01/2022 18:54, Krzysztof Kozlowski wrote:
>>> Hi,
>>>
>>> Changes since v1
>>> ================
>>> 1. MFD: Use absolute path to schemas.
>>> 2. Regulator: skip properties.
>>>
>>> Dependencies
>>> ============
>>> 1. DTS patch: nothing depends on it, sending here so Rob's automatic
>>>    checker won't complain about DTS.
>>>    I will take it via Samsung SoC tree.
>>>
>>> 2. Final MFD patch depends on regulator, so the two last patches could
>>>    go via Rob's, Mark's or Lee's trees.
>>>
>>
>> Dear Lee,
>>
>> This patchset was reviewed and there are no outstanding issues. Could
>> you pick up entire set via MFD tree?
> 
> Nothing from LED or Regulator?
> 

I will send a v3 of this with all acks and a minor change.

Best regards,
Krzysztof
