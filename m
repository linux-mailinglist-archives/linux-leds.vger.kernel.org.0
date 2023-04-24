Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5CF06ED6A9
	for <lists+linux-leds@lfdr.de>; Mon, 24 Apr 2023 23:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbjDXVR5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Apr 2023 17:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232678AbjDXVR4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Apr 2023 17:17:56 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B57655A8
        for <linux-leds@vger.kernel.org>; Mon, 24 Apr 2023 14:17:55 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4eed764a10cso5250906e87.0
        for <linux-leds@vger.kernel.org>; Mon, 24 Apr 2023 14:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682371073; x=1684963073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LQLtpwk9f5qFjmqcZbdXRkUkv+47kg5LP381yyuCyO4=;
        b=ERIxMAdUIblyact9dUNPrpeFIEveOMEN6LM7urZOi9B13PYogGoYZqV3Qx59gN2GlO
         G0gV9/CXtsPpwo1a7scD5E/aYGCJo1QkxSKTPspabWaTuA4A+vhtmt4VSR1gICq3AHbV
         ohzSCP1JFZlpm4wjlR11mKmaYLJEpigD8egYtMYcVT57AwZEU8kgtOq5M3dMNEGtK4gK
         8KRm3csnm+vWkifRyrpQjzxmICiNw8JOS+S5wMBEs2QJ3Dd+xvMI6U3tipYuzWcewFKq
         VtHOMeCpsZnldjMS0HzI+9FGA201A9KhemXCElK4z4IcqlCwoE4if7j0Fg4ijg6MI2UO
         I+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682371073; x=1684963073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LQLtpwk9f5qFjmqcZbdXRkUkv+47kg5LP381yyuCyO4=;
        b=DpekXWj/AmkrNOb5nJ1mjcktZKyG2nJ32Ca9FOWINHFdyGJQHK86p5DfHjxPg1Udv8
         lYmM4feW4JoAh+hOE51sW3jnhbGGad2Vwo5Rul3+4LF4YRHh8siavT4SfLL6N5wbk/Mo
         4wlP95NHT9JvM/jlQbwLoqGuM3be7Hij1SDC9eAkc3/UZyerXutB018eURDOsRWTmwh6
         RRDUkH+xfjSYrjajZ1vGPmuNGSMg4yV4NKIsyQynWTGNbkNKYLmH90q/LNG0nbXm+W/C
         it3VION0sRhxB0bxGXT2dXFSbMaF+S31TrUDpA4/gglfXYenlqY/Aa9umyBag7d9h+gV
         8xSg==
X-Gm-Message-State: AAQBX9d8DUq9v7PRrb1E9bVl/2hScFCBwA0Jn9jIKz1XezBWo/KteSfU
        wE2fTUz8Z7FhhTn1tN4HGco=
X-Google-Smtp-Source: AKy350ZilrMdaASgHkXeQfR3G6D5pyItorpuQSs3FyOMVkzkleGPdGAErBMmwUfG/pQ6Dv/EEgBM7A==
X-Received: by 2002:ac2:5329:0:b0:4eb:20f:99ee with SMTP id f9-20020ac25329000000b004eb020f99eemr4777152lfh.63.1682371073240;
        Mon, 24 Apr 2023 14:17:53 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a23-20020ac25217000000b004d887e0e9edsm1798754lfl.168.2023.04.24.14.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 14:17:52 -0700 (PDT)
Message-ID: <a02bbd69-0dbd-4b26-f703-444ab29a4933@gmail.com>
Date:   Mon, 24 Apr 2023 23:17:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/5] leds: cht-wcove: Add support for breathing mode
 use hw_pattern sysfs API
To:     Lee Jones <lee@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Yauhen Kharuzhy <jekhor@gmail.com>,
        linux-leds@vger.kernel.org
References: <20230420123741.57160-1-hdegoede@redhat.com>
 <20230420123741.57160-4-hdegoede@redhat.com>
 <20230424141626.GM50521@google.com>
Content-Language: en-US
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20230424141626.GM50521@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 4/24/23 16:16, Lee Jones wrote:
> Jacek,
> 
> On Thu, 20 Apr 2023, Hans de Goede wrote:
> 
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
> 
> Is this what you were after?

I remember I recommended to Hans using pattern trigger for hw patterns
somewhere in 2019, so yes.

>> Link: https://lore.kernel.org/all/6beed61c-1fc6-6525-e873-a8978f5fbffb@gmail.com/
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v2
>> - Improve/extend Documentation/leds/leds-cht-wcove.rst a bit

-- 
Best regards,
Jacek Anaszewski
