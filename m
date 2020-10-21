Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6F4E29536E
	for <lists+linux-leds@lfdr.de>; Wed, 21 Oct 2020 22:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505286AbgJUUX7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 21 Oct 2020 16:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505285AbgJUUX7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 21 Oct 2020 16:23:59 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1197C0613CE
        for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2020 13:23:57 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id u8so5140200ejg.1
        for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2020 13:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VOMYR7I6tppRcm25XJ3IlnDwPcHal3U4V1WTzXEskaY=;
        b=Y+MAi+WSl6+RlrT1iMeBLZ5AFgfqerxp0B53ACbs5J4+S4aHR90Bb+9AIHzgTkxN/0
         ZO1iXwStYMIEw2CGsnGSliOKHh296mHseCyUONo0UPmAaIlR9KAaNEuHxUEQ7jEBCXvj
         sjM9DNB+kFfYY0DW3/Ng/HVqO41h2DVCICPXZW0oHv2etmU8SKDo4NcGOBm71MYuJdnT
         vHf/JfKM5odmZtGL4UKnvBy/fQRlBYhBKRjeN3WW7RQMS30xT3uQU/Jk9RJZWO51ndOe
         LQ74XMBvbfIvvEvqkSqP1Z7ZXGc6c/I5r9+B1Lw8cjtMv9B01MsfehnVBtawFDFJ7m4i
         MYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VOMYR7I6tppRcm25XJ3IlnDwPcHal3U4V1WTzXEskaY=;
        b=gAalGEZR3DUzcrgouijxft67GxWUP47Mwwv0bkgcv3Y+jRxELCtppnSNPPhw0VTEM5
         5tLwTFVTcJg1seEyduymFR8o8NIvKNE+j54xRMqRIfvlW2E1yYcqgwwTz3DZXMErtd/R
         bJbmPF2oZytCed4trjc8TT67Fndr51cPti0eUkyLiquSgk9Q0Z/oyW2hoKIFgC3HOzi9
         YDG2ZIw+woXp7dFI3IEIZHobMNUu6DpADPFbtob9UHZcigexUxWd88PdIcv4vSZk8BL6
         h/g9jv8FuNKU9omf0cNL3COUz71rodySoVi2OdSHpxiRwzLramJScOUobph6ysJ193W9
         Ui2w==
X-Gm-Message-State: AOAM533i1uyN9XORTx4CKABf9CHOW133Iaen3A65aHS+5/ow63sldB9C
        2hvGUFymCsocsTsIy4m/pgE=
X-Google-Smtp-Source: ABdhPJwRMrG3Utr47rR/pDD6tDonfj/Cpf0xCThixcJU77k8sWoLwdyBNuZSzyZBI+fdKkPgtbwrQg==
X-Received: by 2002:a17:906:564d:: with SMTP id v13mr5502258ejr.217.1603311836347;
        Wed, 21 Oct 2020 13:23:56 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:599f:b8ad:89c7:99e7? ([2a01:110f:b59:fd00:599f:b8ad:89c7:99e7])
        by smtp.gmail.com with ESMTPSA id q25sm2708298eja.86.2020.10.21.13.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2020 13:23:55 -0700 (PDT)
Subject: Re: Strange timer LED behavior
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Seth Bollinger <seth.boll@gmail.com>
References: <A2C38AF0-0CE8-4312-8329-54B7E9653223@digi.com>
 <20201019140617.GA25480@duo.ucw.cz>
 <3D108EE8-F4B6-490B-9B97-59B8E008F63B@digi.com>
 <2A80CF0E-1022-4673-86E8-12BF0696708E@digi.com>
 <20201020122149.GA19856@duo.ucw.cz>
 <DF67F732-7B99-4C32-A7E9-4595E2B1E82A@digi.com>
 <20201020180813.GA25906@duo.ucw.cz>
 <CF36FC5F-6FA9-4797-A6D6-6533D795DAD1@digi.com>
 <20201020183300.GB25906@duo.ucw.cz>
 <78785807-3DB7-4A70-B135-2B20A260EA57@digi.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <1a86fe05-d8a3-b4b9-4065-b31abce287e2@gmail.com>
Date:   Wed, 21 Oct 2020 22:23:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <78785807-3DB7-4A70-B135-2B20A260EA57@digi.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Seth,

On 10/20/20 8:35 PM, Bollinger, Seth wrote:
> 
>>>
>>> In this case we’re switching from on:86400, off:0 -> on:0, off:86400.  We write off first, then on using fwrite() to a file.  From the trace, it looks like on is always stored first.  So, the first store is on:0, off:0 for a brief period (enough to trigger the default), and then off is stored.  We’re already trying to not have them not both be zero at the same time.  I tried putting fflush() between them, but that didn’t help.  I suppose we could try to sleep some period of time, but this seems bad as well.  Maybe write and read to verify the value is correctly stored?
>>>
>>
>> I don't understand. Why would you use blink with on:86400, off:0?
> 
> In this case we’re using the api to turn the LED on and off, without blinking (in this case only).
> 
>>
>>>> If there's no reasonable value to change the frequency, we'll need to
>>>> fix that.
>>>
>>> I think if we could control the delays with trigger set to none, then we could set the delays and enable the timer trigger for a no glitch operation.  I suppose if there was a timer-off trigger, that would work as well, but seems kind of silly.
>>>
>>
>> You may want to look at ledtrig-transient and ledtrig-oneshot...?
> 
> Ok, I’ll take a look.  Thanks!

You might want to check also ledtrig-pattern and paragraph 2.
of its documentation [0].

[0] Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt

-- 
Best regards,
Jacek Anaszewski
