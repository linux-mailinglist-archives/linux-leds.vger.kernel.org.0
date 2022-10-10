Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 217185F9C9D
	for <lists+linux-leds@lfdr.de>; Mon, 10 Oct 2022 12:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbiJJKWT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 Oct 2022 06:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbiJJKWQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 Oct 2022 06:22:16 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAFA053006
        for <linux-leds@vger.kernel.org>; Mon, 10 Oct 2022 03:22:15 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id fb18so6188210qtb.12
        for <linux-leds@vger.kernel.org>; Mon, 10 Oct 2022 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3JugR0wXqXeul5wpSqtBdhiS7Wbp8HDTmn20QiGNTaw=;
        b=KbbI6ii88jgo85TkEEyiRnK2UBqAa61DcFPGsIPQTzyxtvQrO8koU/SMDFNjGiRaRo
         CHr5QPIjMkfV/dn7lKZqGNqRy+/aB4CpMxc+DWGeNvA9npGdl9nuEE8vOvEul6ii08W6
         VeZJFteIJYSFkIkifSgLiUoOdMDwMIXD2jw3DexaIkRYAkf4npiVOdryWyY5IeYZl3eM
         3pd4+1swtV+APWENyt8G/sew4ayppS+aV6pQJvE+4anU7m3pAONS69hCEfLPcmWlUUEH
         wXeyDbkqcbGyHlG4YHmV1V38a2CBCYWQO10pwSVVQksG/4ENF8GFkIfndqNtTzOIyYxN
         NYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3JugR0wXqXeul5wpSqtBdhiS7Wbp8HDTmn20QiGNTaw=;
        b=Dpo8ehpvWGtd3Ft0Jp/BbuhwLQ5hmXiWpEsF4g4+soxEmAnU84+1yG/nYoA1D1REXg
         dDI1IupxMVAQTP1mi7UVM7hrA47wP8jm+DHXDcfp0PrGJTv93EMKDXvITRtGlIdfP7re
         QpQWHKjLYAHpIeaeUM99NSDcvUwngGhAo+5gH3rke6mOOnZh864X67FvDPNnBR29Qm2g
         YMavarKijNHITGXTAdIvHZ2seoI/UXr9Hr6zEiA6HmuQdwT9dcYLT4LV8YasIO4dqJ3k
         nw7XYwh35yyWJ0baPCbKCtqPSFLH4HCYUgq/Y/B94bONq+8/ZZwDWQG0Kd6UjTyHVojL
         V/4A==
X-Gm-Message-State: ACrzQf3hUjoz26/SZbuYcRmOo7s9Z65zuXy6LL3dMUjFzypmId1R7Uyu
        2GLUsnHtz03aObMrbY4dcERjihhcY+6YYA==
X-Google-Smtp-Source: AMsMyM5Ctysi6szWTnY8vngUoTHofHE7clu8I8y5w+qp7KhLeDgjJXmWboJScSeEkTpUXf6uYeuo0Q==
X-Received: by 2002:a05:622a:1a86:b0:35b:b48d:3f37 with SMTP id s6-20020a05622a1a8600b0035bb48d3f37mr14220327qtc.310.1665397335050;
        Mon, 10 Oct 2022 03:22:15 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id o21-20020a05622a009500b00394d7000941sm7546402qtw.85.2022.10.10.03.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 03:22:14 -0700 (PDT)
Message-ID: <8bace7e0-02e8-49a9-3234-39a76e2ed8f6@linaro.org>
Date:   Mon, 10 Oct 2022 06:20:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 1/2] leds: flash: add driver to support flash LED
 module in QCOM PMICs
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Gene Chen <gene_chen@richtek.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
Cc:     collinsd@codeaurora.org, subbaram@codeaurora.org
References: <20220929121544.1064279-1-quic_fenglinw@quicinc.com>
 <20220929121544.1064279-2-quic_fenglinw@quicinc.com>
 <5b326c52-90e4-6779-8b76-6137309c6f20@linaro.org>
 <029efa02-a983-1c71-d5d5-e3e501c044be@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <029efa02-a983-1c71-d5d5-e3e501c044be@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/10/2022 06:00, Fenglin Wu wrote:
>>> +
>>> +static const struct qcom_flash_reg mvflash_3ch_reg = {
>>> +	.chan_timer	= 0x40,
>>> +	.itarget	= 0x43,
>>> +	.module_en	= 0x46,
>>> +	.iresolution	= 0x47,
>>> +	.chan_strobe	= 0x49,
>>> +	.chan_en	= 0x4c,
>>> +	.status1	= 0x08,
>>> +	.status2	= 0x09,
>>> +	.status3	= 0x0a,
>>> +};
>>> +
>>> +static const struct qcom_flash_reg mvflash_4ch_reg = {
>>> +	.chan_timer	= 0x3e,
>>> +	.itarget	= 0x42,
>>> +	.module_en	= 0x46,
>>> +	.iresolution	= 0x49,
>>> +	.chan_strobe	= 0x4a,
>>> +	.chan_en	= 0x4e,
>>> +	.status1	= 0x06,
>>> +	.status2	= 0x07,
>>> +	.status3	= 0x09,
>>
>> Don't reinvent the wheel. Use regmap fields.
>>
> 
> Do you mean defining regmap_filed pointer in struct qcom_flash_chip
> for all these registers instead of creating the data structure 
> qcom_flash_reg to include all the registers? Similar like this
> 
> struct qcom_flash_chip {
> 	....
>          struct regmap_field     *chan_timer;
>          struct regmap_field     *chan_timer;
>          struct regmap_field     *itarget;
>          struct regmap_field     *iresolution;
>          struct regmap_field     *chan_strobe;
>          struct regmap_field     *chan_en;
>          struct regmap_field     *status1;
>          struct regmap_field     *status2;
>          struct regmap_field     *status3;
> 	....
> };

This is one way, other is with allocated array and indexing by some enum.

> 
> This won't make the code cleaner actually. If this is the preferred way, 
> I will update it accordingly.

A bit it will, because regmap fields will replace most of your shifts
and masks. The point is rather not doing something by your own, but
using frameworks which are exactly for this purpose.



Best regards,
Krzysztof

