Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E95D56E2B99
	for <lists+linux-leds@lfdr.de>; Fri, 14 Apr 2023 23:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjDNVSB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Apr 2023 17:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjDNVSA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Apr 2023 17:18:00 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A04B194
        for <linux-leds@vger.kernel.org>; Fri, 14 Apr 2023 14:17:59 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5027e589e20so7675722a12.3
        for <linux-leds@vger.kernel.org>; Fri, 14 Apr 2023 14:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681507078; x=1684099078;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V5AvGPmA06/gJPA23TlBPBxIabrtbwIccItOyaREqzg=;
        b=LIlyQWrYrfeVSSKeAHC81R3C5F66XFNiLs/MbPyBP0i7sY/4Xm38+exM4gF4BXXD/A
         1LAbkURHeMTjND1m7+yc2fr3tSmxps4VB752pvv5ZpvcDDgDwucpemOscHqWt18ytXX+
         mNlAkNJhljTvCxKGmxLJALwf40ZeQePtVANwZwX9Z72LDGu5TfeHVGwDcf4cJvslO4Jp
         Vgq/V2ev/b11kUWrPVVHc90IcvELY1bv+/LajBWUukuBeWix5hec6Frn/vjg7JCRS0Ad
         BKGP5Y7z1BvmfVxt+kwTjh643jeeIz+0fV19Vq1aWcFYeEMbzTlu4dAveZwQenApTCcL
         fn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681507078; x=1684099078;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V5AvGPmA06/gJPA23TlBPBxIabrtbwIccItOyaREqzg=;
        b=G2e+tbHUkjyfNCIdo2ThmaTTSTDDiN2vLV/s79NAXP7g6KbXlbxqI7TNe+HJqtndDl
         S8mBDUzlJAwVSSUYdcEzQmMDWH+57ZLAHqJU+6vX3BOWVkxCwfQQSqbvi1NCbTQPWI/J
         TtMHGG8U/4HZN1e0CdMEa8SdRCcIMFbkT7CQijXQ1r/x4s9kLZRFW6udW2p8H/gra//Y
         Vn97TCpwQWY03bBijviJnOKnjuHp5Rb9s4hlQaoTv3eR43v8YsvRzGa37Tlt6w+7G1R0
         2yFV0oCOC1roRaTacm0wxZ32e/o1iR5QE7yRE7M5iVtC6OpSEWmMQWlPaQi3PlOBeEbu
         GzBw==
X-Gm-Message-State: AAQBX9cCXPp8wmpLApsmWbZEiTPKeEXOizuU4U45BYKtnupCc/OXdoTV
        tUV/cqVvDMAnMqV5nWaMlFF02Q==
X-Google-Smtp-Source: AKy350YN+OC0BFkBYPm3KjRADVMUYORFXY1F7qNYllRDePU1n+HT4uyiBbYoAt5DsXmxzFYFrpw/Kg==
X-Received: by 2002:a50:ff02:0:b0:506:7cc8:7420 with SMTP id a2-20020a50ff02000000b005067cc87420mr4657401edu.31.1681507078029;
        Fri, 14 Apr 2023 14:17:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ffae:8aab:ae5a:4688? ([2a02:810d:15c0:828:ffae:8aab:ae5a:4688])
        by smtp.gmail.com with ESMTPSA id s11-20020a056402164b00b00504adfd77f6sm2486049edx.29.2023.04.14.14.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 14:17:57 -0700 (PDT)
Message-ID: <7fe8d6f5-ab0f-c6d5-2551-7beb3dfb16d7@linaro.org>
Date:   Fri, 14 Apr 2023 23:17:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: Add ROHM BD2606MVV LED driver
Content-Language: en-US
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     pavel@ucw.cz, lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matti Vaittinen <mazziesaccount@gmail.com>
References: <20230414055341.335456-1-andreas@kemnade.info>
 <20230414055341.335456-2-andreas@kemnade.info>
 <f9da7499-3fb3-1ce6-db0b-d87febee2052@linaro.org>
 <20230414175412.37a15572@aktux>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230414175412.37a15572@aktux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 14/04/2023 17:54, Andreas Kemnade wrote:
> On Fri, 14 Apr 2023 17:28:49 +0200
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 14/04/2023 07:53, Andreas Kemnade wrote:
>>> Document ROHM BD2606MVV LED driver devicetree bindings.  
>>
>> Subject: no improvements and no comments from your side. Why?
>>
> old subject (v2):
> 
> dt-bindings: leds: ROHM BD2606MVV LED driver
> 
> Your comment:
> Subject: maybe drop "driver" (suggests it is for Linux drivers, although
> maybe it matches the actual hardware here?) and add missing verb, e.g.
> "Add ROHM ..."
> 
> New Subject (v3/4):
> dt-bindings: leds: Add ROHM BD2606MVV LED driver
> 
> What is still missing?

There is still "driver". Comment was: drop "driver". Where is it dropped?

If you do not agree, sure, just respond with something.

Best regards,
Krzysztof

