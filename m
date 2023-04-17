Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC296E5159
	for <lists+linux-leds@lfdr.de>; Mon, 17 Apr 2023 22:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbjDQUAg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 Apr 2023 16:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbjDQUAf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Apr 2023 16:00:35 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7F44232
        for <linux-leds@vger.kernel.org>; Mon, 17 Apr 2023 13:00:34 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id r9so14030578ljp.9
        for <linux-leds@vger.kernel.org>; Mon, 17 Apr 2023 13:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681761632; x=1684353632;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zGUXfPrsaA88oh9n11sKmw0qxfcIFLD/ybhicnFimOg=;
        b=kC6x9YT5pF24IqwjBbu348xLMPfJSfkQff0glzm9iI4px2o61H7Z0mP+cAeyrQ2Ipg
         B4rOtRzCwEMvJ70K8FUX8v0GJZFtaReatXvcp78UU9jWDyJcYOkv4oKrfJMk7l8BUS2c
         /qJDPJoru/pvvUQAr/2QyC0iv1jqsEn/cCGpardtqozLwoQMYU098MNK2OYAX1VyGdnz
         LNYbD/GmwCrndzEPzUhcA+YMb8sdKuyVbxzO9mjORHQX84yZimZD5eA63atcEipZ/hXI
         sZKtA9yeywkOHTgoCMV8ZCJ0+MDEaTaBFdlufCCB+UgmCQonzwqCE9h7xdFZa5lsT6dx
         AOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681761632; x=1684353632;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zGUXfPrsaA88oh9n11sKmw0qxfcIFLD/ybhicnFimOg=;
        b=a9FdGuXuWxASbeEM5j408FXE7rxsbimDreulXU5Bi7ivL+y2CBc+VB5DrU3qHaNdqG
         Y6wbMcjqT1+IDRKXInMJvoUCK+eEKZJrJnmt5ch8zMvco6YhyS40aRJg7j3iWOsFF1+4
         MnAfByAMv2MJ6FSgXZNjX24ADvMufSX/MsDQNoqTmBAUojhvwqVhXCizbiZ3kTdknQ08
         796nu5EyrMmdiYKLpkmP0uezoXtCST2R/TsAajiX69nHN50cyT0kpsKEApWrToF44s1V
         8/OrJWDjjIiCNSKYfRMxF9cf2RKeFiha9Ewhr79ZpLSW7wN/rVFE2TkK3ys+Q0CBwbvi
         HNDQ==
X-Gm-Message-State: AAQBX9e6KRC9qzOFtODG3fQHRALjvybj8p7mZUHbVNSh0JrMQmmLYuk2
        pIQ/XJ45MJes4ZWsgAViUqI=
X-Google-Smtp-Source: AKy350ZnIGbW1C3sYDkSaWD8o2aOwp1eCKxGop0g35YFgzvWgzLFjFmFKa/NEQkDAQeJ981ONLMEJQ==
X-Received: by 2002:a2e:90c1:0:b0:2a8:d08e:b7dc with SMTP id o1-20020a2e90c1000000b002a8d08eb7dcmr30860ljg.28.1681761632363;
        Mon, 17 Apr 2023 13:00:32 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id o6-20020a2e7306000000b002a77792f2c5sm2256347ljc.62.2023.04.17.13.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 13:00:31 -0700 (PDT)
Message-ID: <f3b16d48-50c0-0bf9-afe3-898434964e67@gmail.com>
Date:   Mon, 17 Apr 2023 22:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/5] leds: cht-wcove: Add support for breathing mode use
 hw_pattern sysfs API
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     linux-leds@vger.kernel.org
References: <20230413151808.20900-1-hdegoede@redhat.com>
 <20230413151808.20900-4-hdegoede@redhat.com>
 <40704530-4242-8d3a-91d3-4c6f4e375808@gmail.com>
 <6bcc6bfd-4e9f-a4e1-03ed-942502e13a92@redhat.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <6bcc6bfd-4e9f-a4e1-03ed-942502e13a92@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Hans,

On 4/16/23 22:31, Hans de Goede wrote:
> Hi Jacek,
> 
> On 4/16/23 17:17, Jacek Anaszewski wrote:
>> Hi Hans,
>>
[...]
>>> +===========================================================
>>> +Kernel driver for Intel Cherry Trail Whiskey Cove PMIC LEDs
>>> +===========================================================
>>> +
>>> +/sys/class/leds/<led>/hw_pattern
>>> +--------------------------------
>>> +
>>> +Specify a hardware pattern for the Whiskey Cove PMIC LEDs.
>>> +
>>> +The only supported pattern is hardware breathing mode::
>>> +
>>> +    "0 2000 1 2000"
>>
>> Why 1? What is the peek brightness in this mode?
> 
> 255, but the pattern only controls the timing. For max brightness
> the last set brightness is used and the max brightness can be changed
> while breathing by writing the brightness attribute.
> 
> This is just like how blinking works in the LED subsystem,
> for both sw and hw blinking the brightness can also be changed
> while blinking. Breathing on this hw really is just a variant
> mode of blinking.

Thanks for the explanation. So it would be nice to have it
also mentioned explicitly here.

-- 
Best regards,
Jacek Anaszewski
