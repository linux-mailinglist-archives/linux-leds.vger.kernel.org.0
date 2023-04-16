Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 940496E3BEA
	for <lists+linux-leds@lfdr.de>; Sun, 16 Apr 2023 22:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjDPUb4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 Apr 2023 16:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjDPUbz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 16 Apr 2023 16:31:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB5E1FD4
        for <linux-leds@vger.kernel.org>; Sun, 16 Apr 2023 13:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681677068;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=90/QyNKo3GFgH1LYBqlwFdSUDiCZ1X8IYAa2h7Zi2Lw=;
        b=bQK7OJL+LG2jOxAf0Pahq0ABEhg9QzybXk670oDzRe2S1JazcLJ8z0M3AG+9rorM0lPu7b
        ekPczu55v2DvlFj43xCaR1ME5Ax5/q/IhlzFshiaeV0bIZiTZ+fTlTVnwVuqBK2hQ/9S2f
        4aNIjuUsGFeyGkrJUMSFHQscHxLD5P0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-mNqp0sO8MUKWWU2Y542swQ-1; Sun, 16 Apr 2023 16:31:06 -0400
X-MC-Unique: mNqp0sO8MUKWWU2Y542swQ-1
Received: by mail-ed1-f71.google.com with SMTP id e30-20020a50a69e000000b0050690ba4f68so2270538edc.15
        for <linux-leds@vger.kernel.org>; Sun, 16 Apr 2023 13:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681677065; x=1684269065;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=90/QyNKo3GFgH1LYBqlwFdSUDiCZ1X8IYAa2h7Zi2Lw=;
        b=h/Ln3obKYHoHX+cJajhEWfx89VanPzkTydfZelulgKA2Pd1lZ5YU4SJCstKpCTAYQf
         AHbJSLtghoUiooT6EHf75nywPFQ9yJ3frEiVuqUh95a2TZtwVM0hhRwRNG/SeIQAyfnd
         4bbzKpPxUcWV4paYIbO2tgKZDxW9RtvbuAghWg0pspEhpMQx4RCe0sTRMcy0emaeuVge
         j0IWiFLaGfiypHa2KrL5vx9oNbf3GGU2or4XnhWcbHXkRj38rj6wsiHVTB9KuXjEgzoX
         hJF9OM0yNXRyuhHPBTHYEsOZEKp/hiVzUgciGBSi//VCIaALWbeXr/2NbfwPit9DcGtV
         PcsQ==
X-Gm-Message-State: AAQBX9epIKm1aSwEUU7YgtPqePwxzWRb/rjgW6vqgC4Ql64v793Cji91
        yQEZDzGg6zP1VBSjB5jqChrX7tHcQh4KZ/+KJlQ6Sly5sPnRmtt+Ra7ZIRJHc+wvttsUHIUCjrS
        6Ntoiy3XSqeQtBaYHwNKZKDoUjX6uYg==
X-Received: by 2002:a17:906:a3d8:b0:94e:fe77:3f47 with SMTP id ca24-20020a170906a3d800b0094efe773f47mr5855520ejb.67.1681677065169;
        Sun, 16 Apr 2023 13:31:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350asN88iS3qUnhtJcMztZ32Ae957A+h9tPOQagJGEnTNJ/llvweLgx6Sn1MrBYUbxEYhUZw5gg==
X-Received: by 2002:a17:906:a3d8:b0:94e:fe77:3f47 with SMTP id ca24-20020a170906a3d800b0094efe773f47mr5855504ejb.67.1681677064845;
        Sun, 16 Apr 2023 13:31:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lr21-20020a170906fb9500b00927f6c799e6sm5567405ejb.132.2023.04.16.13.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 13:31:04 -0700 (PDT)
Message-ID: <6bcc6bfd-4e9f-a4e1-03ed-942502e13a92@redhat.com>
Date:   Sun, 16 Apr 2023 22:31:03 +0200
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <40704530-4242-8d3a-91d3-4c6f4e375808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

On 4/16/23 17:17, Jacek Anaszewski wrote:
> Hi Hans,
> 
> Thanks for the patch.
> 
> On 4/13/23 17:18, Hans de Goede wrote:
>> The hw-blinking of the LED controller in the Whiskey Cove PMIC can also
>> be used for a hw-breathing effect.
>>
>> As discussed during review of v2 of the submission of the new
>> leds-cht-wcove driver, the LED subsystem already supports breathing mode
>> on several other LED controllers using the hw_pattern interface.
>>
>> Implement a pattern_set callback to implement breathing mode modelled
>> after the breathing mode supported by the SC27xx breathing light and
>> Crane EL15203000 LED drivers. The Whiskey Cove PMIC's breathing mode
>> is closer to the EL15203000 one then to the SC27xx one since it does
>> not support staying high / low for a specific time, it only supports
>> rise and fall times.
>>
>> As such the supported hw_pattern and the documentation for this is almost
>> a 1:1 copy of the pattern/docs for the EL15203000 breathing mode.
>>
>> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Link: https://lore.kernel.org/all/6beed61c-1fc6-6525-e873-a8978f5fbffb@gmail.com/
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   Documentation/leds/index.rst          |  1 +
>>   Documentation/leds/leds-cht-wcove.rst | 29 ++++++++++++++++++
>>   drivers/leds/leds-cht-wcove.c         | 42 ++++++++++++++++++++++++---
>>   3 files changed, 68 insertions(+), 4 deletions(-)
>>   create mode 100644 Documentation/leds/leds-cht-wcove.rst
>>
>> diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
>> index b9ca081fac71..c92612271e25 100644
>> --- a/Documentation/leds/index.rst
>> +++ b/Documentation/leds/index.rst
>> @@ -17,6 +17,7 @@ LEDs
>>      uleds
>>        leds-blinkm
>> +   leds-cht-wcove
>>      leds-el15203000
>>      leds-lm3556
>>      leds-lp3944
>> diff --git a/Documentation/leds/leds-cht-wcove.rst b/Documentation/leds/leds-cht-wcove.rst
>> new file mode 100644
>> index 000000000000..fa79d8fd7ef8
>> --- /dev/null
>> +++ b/Documentation/leds/leds-cht-wcove.rst
>> @@ -0,0 +1,29 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +===========================================================
>> +Kernel driver for Intel Cherry Trail Whiskey Cove PMIC LEDs
>> +===========================================================
>> +
>> +/sys/class/leds/<led>/hw_pattern
>> +--------------------------------
>> +
>> +Specify a hardware pattern for the Whiskey Cove PMIC LEDs.
>> +
>> +The only supported pattern is hardware breathing mode::
>> +
>> +    "0 2000 1 2000"
> 
> Why 1? What is the peek brightness in this mode?

255, but the pattern only controls the timing. For max brightness
the last set brightness is used and the max brightness can be changed
while breathing by writing the brightness attribute.

This is just like how blinking works in the LED subsystem,
for both sw and hw blinking the brightness can also be changed
while blinking. Breathing on this hw really is just a variant
mode of blinking.

Regards,

Hans





> 
>> +
>> +    ^
>> +    |
>> +    Max-|     ---
>> +    |    /   \
>> +    |   /     \
>> +    |  /       \     /
>> +    | /         \   /
>> +    Min-|-           ---
>> +    |
>> +    0------2------4--> time (sec)
> v);
> 

