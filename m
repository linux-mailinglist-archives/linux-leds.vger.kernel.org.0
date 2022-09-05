Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0C705AD483
	for <lists+linux-leds@lfdr.de>; Mon,  5 Sep 2022 16:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbiIEOKI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Sep 2022 10:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236412AbiIEOKG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 5 Sep 2022 10:10:06 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A8724BD5
        for <linux-leds@vger.kernel.org>; Mon,  5 Sep 2022 07:10:04 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id s15so9373347ljp.5
        for <linux-leds@vger.kernel.org>; Mon, 05 Sep 2022 07:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=FKN1JOpDZtlbeNH8OIC4d4elRGYKKYcfRFewHUVoXLQ=;
        b=nhCfu42JMTUoCYmeHuznAOkwdGoFHHmYtyOQsi0ncymt29bL0tZXsWJUKM6d96wpre
         VgluOotao0toEOAe1h3R7rChL5HrvPKvMtHLTznzsBbbLvZ0gQY6jKVLtXt1FDquRtHV
         kaSi4FGa2RH9Mz9rbtg4T02rAsO8vjxfMN4rQBAUSSLMMX3ki5DqgvO9BTnfeCv4zoOB
         ai2E5pPSDB2wvgPGRV7W6pPcqb9JchZ6vHz3MwEtJomobJ3GL++ImY+OpWL1eByTLnns
         0CNMzvPPK5JZiCwo+tpOpUNpiIohfNjeMAo7OtjbzZEEiAVlPdONjEjMAQ74qaaW2WGg
         3hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FKN1JOpDZtlbeNH8OIC4d4elRGYKKYcfRFewHUVoXLQ=;
        b=5PCumpRfL8bL3Z/3tz9YJHCOaDUg6WaweipCcjo6c1lmkdY70D5qsi4x1gGThwRB1M
         Th0bDsQOvH9LhoxZDJbRTZ3IGgN+SGpND082I6tZ6zV0IQOmRZ0uV0lalmi389Y37Ekt
         r/Zy5dJTcQAii2i/kqEF7N32RKOk9DjjLAvqarnfZz/9YKRupfFbDgz2K9115IvmvErC
         Q6fbY3CL5BlMB7835kohXdgz+rMlaWn00dLE2MtDwbaSSFCqT1TxVQJ5HijcGE/IBmuf
         QTITvgax9k9/SfV+iPVD9vKdySEW3awNcYXoiDicy4UyXRdjBFKGbVn0otbFuiFKp1tS
         xUEg==
X-Gm-Message-State: ACgBeo2jwoluDyTMNAumDAdFMgGrz4B6qOFE6/omaPtZVAogQgIVokr8
        /o5a7wZTvAyHjgjZeuy3FS2onQ==
X-Google-Smtp-Source: AA6agR4El7y4IT4lAlgQXtAOsrOIz7IkrRHCkD/A2S4p+/9tQvKZXU0lvZ2Q4JJsjuVfDdd/htYFGg==
X-Received: by 2002:a2e:b5d3:0:b0:267:4da0:ce3b with SMTP id g19-20020a2eb5d3000000b002674da0ce3bmr8215983ljn.420.1662387002553;
        Mon, 05 Sep 2022 07:10:02 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id e27-20020a05651c039b00b00264bb2351e8sm1436823ljp.7.2022.09.05.07.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 07:10:02 -0700 (PDT)
Message-ID: <1ea02712-eb1e-ca68-b954-c7d59a74926d@linaro.org>
Date:   Mon, 5 Sep 2022 16:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RESEND] dt-bindings: leds: qcom-wled: fix number of
 addresses
Content-Language: en-US
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>
References: <20220720163720.7099-1-krzysztof.kozlowski@linaro.org>
 <5db5da26-3689-928b-433e-72c690014b64@linaro.org>
 <YxYACwJmo/FlbVgk@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YxYACwJmo/FlbVgk@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 05/09/2022 15:56, Lee Jones wrote:
> On Thu, 25 Aug 2022, Krzysztof Kozlowski wrote:
> 
>> On 20/07/2022 19:37, Krzysztof Kozlowski wrote:
>>> On PM660L, PMI8994 and PMI8998, the WLED has two address spaces.  This
>>> also fixes dtbs_check warnings like:
>>>
>>>   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: leds@d800: reg: [[55296], [55552]] is too long
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> ---
>>>  .../devicetree/bindings/leds/backlight/qcom-wled.yaml    | 9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>>
>> The resent was a month ago. I assume this won't go via LEDs tree, so I
>> will resend (again) without Rob's review, so it could go via Rob's tree.
> 
> If you have not already done so, please resend this and Cc my
> kernel.org address, as per MAINTAINERS.  Thanks Krzysztof.
> 

Thanks, I resent and Rob already took it.

Best regards,
Krzysztof
