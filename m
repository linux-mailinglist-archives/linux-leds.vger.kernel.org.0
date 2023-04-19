Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D32436E7A47
	for <lists+linux-leds@lfdr.de>; Wed, 19 Apr 2023 15:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233086AbjDSNGE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 Apr 2023 09:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232832AbjDSNGD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 Apr 2023 09:06:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935B6A5F8
        for <linux-leds@vger.kernel.org>; Wed, 19 Apr 2023 06:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681909515;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3+9xhViEB65A8ru/50MqyideIenBPleDe7JxP0E//uc=;
        b=DKd+1yiRZDsTb2aT2youLNdCJSVlK07Ugh3hNJrSyDzI1oLCuEsFaTMUeAgefZlmK+Ads4
        9XBwK3HMY/o8tN1MSX6Q5z373o6qMZVTaeKboEVdpdeCkVdhUfxHve3R63b6lzVMUlufU5
        4EI4QxYRRtYtVFzSqMQz6/6SerruFnE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-jXR0xZESOxiSb0z3OB1EJw-1; Wed, 19 Apr 2023 09:05:14 -0400
X-MC-Unique: jXR0xZESOxiSb0z3OB1EJw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f1763fac8bso12596025e9.1
        for <linux-leds@vger.kernel.org>; Wed, 19 Apr 2023 06:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681909513; x=1684501513;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3+9xhViEB65A8ru/50MqyideIenBPleDe7JxP0E//uc=;
        b=JYYT3jG/0u6TpoYWyDK2IYYQVuuxd/ruujS4wy14ZQ2PW4YXcoGisoxtG3tiGB+Qhz
         GqtbXIDyT+lX+ffG6fA/3kPwV9Ca/GS5tEhLc2dbdOLQvtmHA3zogKqhLRzEAz1af8ll
         9cRjZve5Aq2fPVuS+SPcNVRuLx1IkvNzdRj7Iow0f+3YPDeWaYcJJGLecIVgV0nMhr2B
         J0Gq7YuubbRLKJnBPgbDzVnUuxmj8Lf8cLqxm7/rQ073w+mBY3MDtnxUopu6FFUCZl/4
         tEFnOMvevDZ1SIZ2re1MRRTX5d49DSFhIK55VWLGuA09ZgxyETa+CbY6MuTZ2eY0ev4L
         wYLQ==
X-Gm-Message-State: AAQBX9emLPkxQ44XgR+MSQ3JVj1VPRUCtHy4mY+4+p+eKru2cKE6FGPx
        PZei9oyul77hUJtzWWtMj3CUNOwEn41nY+QtiM3+z3HWPltTRu/NUeakj7I+8BCeZusCc0wtMoP
        4AfydKm9r5NvWEU5awa/D4Q==
X-Received: by 2002:adf:df07:0:b0:2ff:f37:9d0e with SMTP id y7-20020adfdf07000000b002ff0f379d0emr1601256wrl.61.1681909513371;
        Wed, 19 Apr 2023 06:05:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZA/zKMbRQEsfohAx1gI7Q2LWk4m5U/X9bVnEmFDFv/4EKA8zc61bm8K+Giiv/lfASMD9lElw==
X-Received: by 2002:adf:df07:0:b0:2ff:f37:9d0e with SMTP id y7-20020adfdf07000000b002ff0f379d0emr1601243wrl.61.1681909513212;
        Wed, 19 Apr 2023 06:05:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f19-20020a056402005300b005068fe6f3d8sm5715910edu.87.2023.04.19.06.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 06:05:12 -0700 (PDT)
Message-ID: <1b574301-3b13-61da-01e9-0c89f1546a1c@redhat.com>
Date:   Wed, 19 Apr 2023 15:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/5] leds: cht-wcove: Add support for breathing mode use
 hw_pattern sysfs API
Content-Language: en-US, nl
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     linux-leds@vger.kernel.org
References: <20230413151808.20900-1-hdegoede@redhat.com>
 <20230413151808.20900-4-hdegoede@redhat.com>
 <40704530-4242-8d3a-91d3-4c6f4e375808@gmail.com>
 <6bcc6bfd-4e9f-a4e1-03ed-942502e13a92@redhat.com>
 <f3b16d48-50c0-0bf9-afe3-898434964e67@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f3b16d48-50c0-0bf9-afe3-898434964e67@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 4/17/23 22:00, Jacek Anaszewski wrote:
> Hi Hans,
> 
> On 4/16/23 22:31, Hans de Goede wrote:
>> Hi Jacek,
>>
>> On 4/16/23 17:17, Jacek Anaszewski wrote:
>>> Hi Hans,
>>>
> [...]
>>>> +===========================================================
>>>> +Kernel driver for Intel Cherry Trail Whiskey Cove PMIC LEDs
>>>> +===========================================================
>>>> +
>>>> +/sys/class/leds/<led>/hw_pattern
>>>> +--------------------------------
>>>> +
>>>> +Specify a hardware pattern for the Whiskey Cove PMIC LEDs.
>>>> +
>>>> +The only supported pattern is hardware breathing mode::
>>>> +
>>>> +    "0 2000 1 2000"
>>>
>>> Why 1? What is the peek brightness in this mode?
>>
>> 255, but the pattern only controls the timing. For max brightness
>> the last set brightness is used and the max brightness can be changed
>> while breathing by writing the brightness attribute.
>>
>> This is just like how blinking works in the LED subsystem,
>> for both sw and hw blinking the brightness can also be changed
>> while blinking. Breathing on this hw really is just a variant
>> mode of blinking.
> 
> Thanks for the explanation. So it would be nice to have it
> also mentioned explicitly here.

Ack, I'll add something like the above explanation to the
docs for v2.

Regards,

Hans

