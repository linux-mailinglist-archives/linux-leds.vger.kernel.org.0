Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4891C52C393
	for <lists+linux-leds@lfdr.de>; Wed, 18 May 2022 21:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242138AbiERTgr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 May 2022 15:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242137AbiERTgq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 May 2022 15:36:46 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E519F16D4B3
        for <linux-leds@vger.kernel.org>; Wed, 18 May 2022 12:36:43 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id e20so2291035qvr.6
        for <linux-leds@vger.kernel.org>; Wed, 18 May 2022 12:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=SQ94+c3fNXaYgBb0cY7kW3nwmo27quvjSUenWsN6g2c=;
        b=MQK2+mfMUIv2jYTAJvXnJzIAFkX65qVPRKpMFy+pmz3ewbIL9jZxth6fqUWHd8VXOo
         9mU1pfuMFVSYM5p/0Vr+rLmXk2HEBllTe8fHh2nPTK0LqOCAAFbfia6pKywRrUO4rLP/
         H0uhMGVNyC6/8NnYruH47Tgbkskle/VGdgVBltPW1Oqchhnrd81NRaaicRc40r6K/KWK
         3IDj7+x1Pc6qS1NcthiEPdmPSPgf7h7ecnMAe81ERodhd3Psc7dZTGN8eOCoGD0RFBit
         ewHhRT/avEDX2YcvsPtVWmhGvNkJpb4Xdtkny5BAET6pF+HGQjMy4Pvm8sbCZM+P4p5f
         JLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=SQ94+c3fNXaYgBb0cY7kW3nwmo27quvjSUenWsN6g2c=;
        b=6nTgApg6eOb2I9ryjphDW09oOyLGxSbAidagNn2doN6Sy/CLppRYJLdrPW14REPegA
         d6JksF4IKzSTmjMpscQ3h85PtpP7rvGus0guukmd6LkGY2C09e9q5ONzrlbeokfJZTBD
         eT6PIJ2btYFDZ/MsETke/ODV7rd/ldJpE3FIJY29CkExXeslbxbH5d+4ZOntRORLDg5L
         pjJO+yx3pRmred1Gap02D1OhvM4uMp46QOsnKXZBpSlMUrWNrU1eJc4QMzeIiZZ0Mz44
         VUFXtHdia8KGiSljrbhh9LSM9cdFXGeZLN0TjdYyscYvZq/gAmh7jxWKCTdh55+4W5HK
         hp9Q==
X-Gm-Message-State: AOAM530Qvqrlf3b7tj26bSwJQD+orBGq2mpNjmIi2UEC7ddlAYZ9dPBv
        gZV1hnigV6fcTSiN6VcGgaaNjZWaUSM=
X-Google-Smtp-Source: ABdhPJxxZpnaTZ14LvPySvs9USnHwds3Ta1lei2GkkJ3HLh3eu6ILPEp/ekcETEd2AFSX9TB1nMrHg==
X-Received: by 2002:a05:6214:627:b0:461:f1be:50d9 with SMTP id a7-20020a056214062700b00461f1be50d9mr1128613qvx.40.1652902603056;
        Wed, 18 May 2022 12:36:43 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id x139-20020a376391000000b006a0ff3ec18bsm30235qkb.122.2022.05.18.12.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 12:36:42 -0700 (PDT)
Message-ID: <7446cf35-497d-b233-cb6d-e8f3e73a4145@gmail.com>
Date:   Wed, 18 May 2022 21:36:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] led: multicolor: Don't set brightness when blinking
Content-Language: en-US
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     Sven Schwermer <sven@svenschwermer.de>, linux-leds@vger.kernel.org
Cc:     Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        schuchmann@schleissheimer.de, pavel@ucw.cz
References: <4f672091-07da-8815-a00f-659f5a478b0e@gmail.com>
 <20220518082216.160413-1-sven@svenschwermer.de>
 <76883915-8c7f-a14d-1a34-f41ed7899d62@gmail.com>
In-Reply-To: <76883915-8c7f-a14d-1a34-f41ed7899d62@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/18/22 21:29, Jacek Anaszewski wrote:
> Hi Sven,
> 
> On 5/18/22 10:22, Sven Schwermer wrote:
>> From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
>>
>> When writing to the multi_intensity file, don't unconditionally call
>> led_set_brightness. By only doing this if blinking is inactive we
>> prevent blinking from stopping if the blinking is in its off phase while
>> the file is written.
>>
>> Instead, if blinking is active, the changed intensity values are applied
>> upon the next blink. This is consistent with changing the brightness on
>> monochrome LEDs with active blinking.
>>
>> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Signed-off-by: Sven Schwermer 
>> <sven.schwermer@disruptive-technologies.com>
>> ---
>>   drivers/leds/led-class-multicolor.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/led-class-multicolor.c 
>> b/drivers/leds/led-class-multicolor.c
>> index e317408583df..5b1479b5d32c 100644
>> --- a/drivers/leds/led-class-multicolor.c
>> +++ b/drivers/leds/led-class-multicolor.c
>> @@ -59,7 +59,8 @@ static ssize_t multi_intensity_store(struct device 
>> *dev,
>>       for (i = 0; i < mcled_cdev->num_colors; i++)
>>           mcled_cdev->subled_info[i].intensity = intensity_value[i];
>> -    led_set_brightness(led_cdev, led_cdev->brightness);
>> +    if (!test_bit(LED_BLINK_SW, &led_cdev->work_flags))
>> +        led_set_brightness(led_cdev, led_cdev->brightness);
>>       ret = size;
>>   err_out:
>>       mutex_unlock(&led_cdev->led_access);
>>
>> base-commit: 210e04ff768142b96452030c4c2627512b30ad95
> 
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> 

However I'd change patch title because now it is misleading.

How about

"led: multicolor: Fix intensity setting while SW blinking"

-- 
Best regards,
Jacek Anaszewski
