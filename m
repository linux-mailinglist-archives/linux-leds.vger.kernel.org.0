Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37E1154634A
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jun 2022 12:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348351AbiFJKOJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Jun 2022 06:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238786AbiFJKOI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 10 Jun 2022 06:14:08 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7541D2ADA
        for <linux-leds@vger.kernel.org>; Fri, 10 Jun 2022 03:14:07 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 25so34336946edw.8
        for <linux-leds@vger.kernel.org>; Fri, 10 Jun 2022 03:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=B0o7AXQ0r9FjP17c3onrtPlUng/3FOneXR9q+r6CXZ4=;
        b=GteEZc/g+x6URVp3OrzaAOP5ced5M+SgT27OFHCtngEa6HPdA8AwnnoEzcPdWb8G9F
         zMdBrmzTyPWmmnO4plDNgeUaFF30bgoA52iRn+yajfbcORcNxXWJzJJSq0b4q/3iW6IB
         WtAXsKgr8OnK9SoQM4w01p+0xk/p1OtTDzYRLc2jsfz0xmWXsJI3RiTd/eyxuAXUQfvm
         n67N/R9k9INeDyN48Z1vtqo5HF3KLdDAjN/jaGd/O/g07Aeppq5nAUrPeYkJxtWdIwPy
         iVRMbC4hK/3186O2uubxMs65rdKDxwVOenmkZl48XB8rt+pXqfDZmyrlwhnL8VUvahhc
         aeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=B0o7AXQ0r9FjP17c3onrtPlUng/3FOneXR9q+r6CXZ4=;
        b=DKIep4k15aXBNR/yQOzyV16NRu5Ej861ZBBdlXbfmyU0x5v3n2J329FO29SWqYawXa
         1voFUA/7SaM5wvScjbRR5p0V5Yoq+/MYy7A+Tj24D7nTRHMFACOzldkBUiVAoCdn8TxK
         3wmZ9HJPNwJKWbemPgCqw1+CcNi9STOyTUZ+DyceCNmEmPu8ZUiXwqXXwH60FKk56Gu/
         6ob075PhDMNTzfcwM2eTxh9tkcfjo/3o/ToTY1kArYtF2awkmaNAODW1j9gv6vomu2yj
         aYrXDlvfJQ6yrgcZRg2rxIhlphwIhfFNyph5awdxwAPTiUrI3yoFRrimFsk8DESPKXrz
         XfPg==
X-Gm-Message-State: AOAM53200SHQFqoV+6OECd0ghO/9lW+vcB1/Bf1iPMbN5jGVReU9jyWH
        9W+FF5v7h/GIZsWy7pf9T6WZBg==
X-Google-Smtp-Source: ABdhPJz6TLCN00FmGgljepz6JlGgR9SZ91ZMZ+1zloxKFBoD/8uXAVfcTGMryf2GDivs3WF3/8R0lw==
X-Received: by 2002:a05:6402:2554:b0:42d:ee79:559d with SMTP id l20-20020a056402255400b0042dee79559dmr50152521edb.175.1654856045705;
        Fri, 10 Jun 2022 03:14:05 -0700 (PDT)
Received: from [192.168.0.202] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e1-20020a1709062c0100b0070bdc059ab2sm10532995ejh.138.2022.06.10.03.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 03:14:05 -0700 (PDT)
Message-ID: <ef62a7bb-2217-2947-17dd-fc4a51acdea5@linaro.org>
Date:   Fri, 10 Jun 2022 12:14:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] ARM: dts: exynos: add function and color to aat1290
 flash LED node in Galaxy S3
Content-Language: en-US
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20220607085343.72414-1-krzysztof.kozlowski@linaro.org>
 <20220607085343.72414-3-krzysztof.kozlowski@linaro.org>
 <4a7f8ab6-c061-3861-5790-b6c0fbd7cad1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4a7f8ab6-c061-3861-5790-b6c0fbd7cad1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 09/06/2022 22:31, Jacek Anaszewski wrote:
> Hi Krzysztof,
> 
> On 6/7/22 10:53, Krzysztof Kozlowski wrote:
>> Add common LED properties - the function and color - to aat1290 flash
>> LED node in Galaxy S3.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
>> index 72901772fcad..d76f3678dcab 100644
>> --- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
>> +++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
>> @@ -7,6 +7,7 @@
>>    */
>>   
>>   /dts-v1/;
>> +#include <dt-bindings/leds/common.h>
>>   #include "exynos4412-midas.dtsi"
>>   
>>   / {
>> @@ -27,6 +28,8 @@ led-controller {
>>   
>>   		led {
>>   			label = "flash";
>> +			function = LED_FUNCTION_FLASH;
>> +			color = <LED_COLOR_ID_WHITE>;
> 
> Addition of these two properties will not change anything because
> the label has precedence. It is deprecated, but if you introduce
> function and color to the binding instead of the label, the resulting
> LED class device name will change.

Which is not necessarily what we want, right? Adding these properties is
a proper description of hardware, regardless whether current Linux
implementation uses them or not.

Best regards,
Krzysztof
