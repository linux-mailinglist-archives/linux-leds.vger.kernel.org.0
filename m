Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D2C22442E
	for <lists+linux-leds@lfdr.de>; Fri, 17 Jul 2020 21:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbgGQTZ3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Jul 2020 15:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727999AbgGQTZ3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Jul 2020 15:25:29 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2757C0619D2;
        Fri, 17 Jul 2020 12:25:28 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id e22so8521907edq.8;
        Fri, 17 Jul 2020 12:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lAfngc36kZYlc4tW+sOkNseftULD6JWmok1LgTejfag=;
        b=DqM3mLPk7gxNlLdRw61F5StlagNUswLd1ImGkFJ2QkfYISoBndeBOn/+gHX13mNwxG
         U7SCKf8QfBkiIWpT01Q/DJM1BYyEbgCmmLct/XEk7k3UjFJGIEY4oFaGnP2A4UAy34WP
         yLr0oSYbV3trnFjp+742iXbXvrAB3AD0R1ktxhbNlkToj4xNoceLM1GzVVChK54XVI3/
         p0ZTVpU4aF37yT9BCVA7CpmIFwU40K1rIg77nZYJf9BwlzzB80fThnQeIPrNvmgyDlUE
         pwSC6igKxoiwdG3OP5HGh9mYJX2oyplyyKJ3PdVMLoKRShqxD0YGauPXBPsh1C2/jpHC
         3MOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lAfngc36kZYlc4tW+sOkNseftULD6JWmok1LgTejfag=;
        b=rR3cuJnvCutpa1quWK2Z7gSgEO2SZHxgSYjRI5q8S9d1klQnALmv64bQU3JKxAWhqE
         EUAEdCIQYBEKjcQavT90J4rR0F2crF3lgY1E5Fp64IfEHwvt3TGlPLR/1unwFB0AWUcy
         xapyf8LRiaaHF4uJRR22R9XV/QSvh2k7aG0smWI+/b9bNynygvzlPB8tJGWbePi6GdYX
         JUmOCG0Vn5Y2yfwUdPwIKwpkIPuu0X8EigIMBPwkH/hy3veeX+nmxblQJatfh0aIEwFG
         f5+kkASRxrtGT2fooqS2y/7PPD0NVBYpzo6W7B0aQunEDssNjm7JX/FSw6TIfFfHMHOT
         tjXw==
X-Gm-Message-State: AOAM530J0FNsPAb+9Ms664BdakqiCye2a4i9FcESCKcmqBeJwGZR0g+J
        RBJhjGtK+JXCDgQrT9vOnkmeWme5
X-Google-Smtp-Source: ABdhPJzDYzyCYmLv3ddFKR2SPO7z6ZaxytPGCzyFdwoYdldNbaXrjFl7vOAd6HspPuMLJZiWv3xpxA==
X-Received: by 2002:a05:6402:363:: with SMTP id s3mr10432439edw.238.1595013927437;
        Fri, 17 Jul 2020 12:25:27 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:d533:5ce9:ffd3:d986? ([2a01:110f:b59:fd00:d533:5ce9:ffd3:d986])
        by smtp.gmail.com with ESMTPSA id cd11sm8626738ejb.57.2020.07.17.12.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 12:25:26 -0700 (PDT)
Subject: Re: [PATCH] leds: add NCT6795D driver
To:     Pavel Machek <pavel@ucw.cz>, Alexandre Courbot <gnurou@gmail.com>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
References: <20200713134114.137265-1-gnurou@gmail.com>
 <20200714223344.GA20740@amd>
 <CAAVeFuKomLcAue9rGXhK3Uc=H+v9ZLBA84Ozr_rZDRQMYeC=dg@mail.gmail.com>
 <17fe52a2-73ff-b547-8a59-5df009c929c8@gmail.com>
 <CAAVeFuJQCp7Fpqx3nUHMy29Jw1pLNoQtxRw3qxfEf3YKnrm0fw@mail.gmail.com>
 <20200717074410.GA8895@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <756fa49f-bf67-0447-cf45-1358b66c40f8@gmail.com>
Date:   Fri, 17 Jul 2020 21:25:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717074410.GA8895@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/17/20 9:44 AM, Pavel Machek wrote:
> Hi!
> 
>>>>>> Add support for the LED feature of the NCT6795D chip found on some
>>>>>> motherboards, notably MSI ones. The LEDs are typically used using a
>>>>>> RGB connector so this driver creates one LED device for each color
>>>>>> component.
>>>>>
>>>>> Ok, let me take a look. What entries does it present in /sys?
>>>>
>>>> Right now these 3 directories in /sys/class/leds:
>>>>
>>>> nct6795d:blue:
>>>> nct6795d:green:
>>>> nct6795d:red:
>>>>
>>>> with the usual suspects `brightness` and `max_brightness` in each. I
>>>> am not 100% sure I got the names right so please let me know if that
>>>> is not correct.
>>>
>>> You miss LED function, that should be in the second section.
> 
> third section?

Ekhm, right.

> 
>> The reason for not having a function at the moment is that I took a
>> look at include/dt-bindings/leds/common.h and could not find any
>> function that could reasonably apply. This basically controls a RGB
>> connector on the motherboard which serves no particular function - you
>> can plug a RGB fan or anything else you want and control it in any
>> fashion. Is there a function that applies to this use-case?

According to common LED bindings you should propose a new function
if none of the existing ones fits your needs.

> This is normally used for motherboard lightning, right? I believe this
> is getting common on gaming boards, and we want common support for
> that.

I agree.

-- 
Best regards,
Jacek Anaszewski
