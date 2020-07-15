Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5F9F221526
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2020 21:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgGOTcf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Jul 2020 15:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgGOTce (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Jul 2020 15:32:34 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33568C061755;
        Wed, 15 Jul 2020 12:32:34 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id n26so3430982ejx.0;
        Wed, 15 Jul 2020 12:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+qRKnkS0l/5+dReHrPFaB3lJpeJ/drPMSf8yw4099q4=;
        b=km99CtKFXqmaMoFN/9hZ2vfU3M9rn9VXa0Wddi68s8J9FsBJ8mWSLNO5DBIuGn65+P
         Laa+wzzJWf4NO8vfEFptU9T1uqWWVuMD88WeO+GvXICa6TSRX0pG0CqHSLS5IILRGOPK
         N0sVitdg01ogrDBvGLmTD4fPMmZjj1mpWEfa3ZCaH/3GaYyF5UeOyJjp+KheigZ6YrMZ
         mkJtq8+gfL+RUteDOpmEBaV2JtHCvmkZ4t+FW3Usy5KZ7oPyHC20bf8t3AvIds2VLQ+T
         lmgvOvSsDG6j3j30M+znQ5JbDeJvCAnT/HR4Uqlw2hi0XKpMvmzErSL0+FQpc4jSTfOU
         Up7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+qRKnkS0l/5+dReHrPFaB3lJpeJ/drPMSf8yw4099q4=;
        b=EYYyl7DZp3cyECvpQ/U1MzxO+R9cyfFX3LGe5ElRvcVK6wlkuNTHmndzsln/q8GbVF
         c1jkejYGSF+I8UZuNJWFUkt2NIoRxHLSe4ZjqLatrLZmxHXeU4oPrQx0s0KVc/PR59v+
         BBehOkmNtXPfCmzLpBPD8VQmyeHB0gedCOySbv6ikZoNOZ6FpjOSefGSKJKFQMRrptGn
         670AOh4BMDz7sohb4TIuwWIL1yQG83aQk6QX89E/vwkTPk/+q/dQ6LTxq19tAffzzUih
         MDr1cLmvFwTUHg2m2tUH8Nz5/JM6TON/CKP58c7GZdUVCcxy3p1iOik2x45+exZlYCCr
         kzow==
X-Gm-Message-State: AOAM5329bzPmacQShMTzu29LpuN/QosadCMg5oZMOshoXgPLQruvBUjG
        iK/gIVoozqRlIDkZssoy9kqae1o4
X-Google-Smtp-Source: ABdhPJyg6GYM0hmAM0FigvjKQ2H3ifxf3ZIbxnOmQoCXVh4NMOSzihd1rNORYEVslV757YPGB1xB9A==
X-Received: by 2002:a17:906:6dda:: with SMTP id j26mr518486ejt.336.1594841551741;
        Wed, 15 Jul 2020 12:32:31 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:4863:80a3:c4db:39e? ([2a01:110f:b59:fd00:4863:80a3:c4db:39e])
        by smtp.gmail.com with ESMTPSA id a25sm2989970eds.77.2020.07.15.12.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 12:32:30 -0700 (PDT)
Subject: Re: [PATCH] leds: add NCT6795D driver
To:     Alexandre Courbot <gnurou@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
References: <20200713134114.137265-1-gnurou@gmail.com>
 <20200714223344.GA20740@amd>
 <CAAVeFuKomLcAue9rGXhK3Uc=H+v9ZLBA84Ozr_rZDRQMYeC=dg@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <17fe52a2-73ff-b547-8a59-5df009c929c8@gmail.com>
Date:   Wed, 15 Jul 2020 21:32:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAVeFuKomLcAue9rGXhK3Uc=H+v9ZLBA84Ozr_rZDRQMYeC=dg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Alexandre,

On 7/15/20 3:54 AM, Alexandre Courbot wrote:
> Hi Pavel,
> 
> On Wed, Jul 15, 2020 at 7:33 AM Pavel Machek <pavel@ucw.cz> wrote:
>>
>> Hi!
>>
>>> Add support for the LED feature of the NCT6795D chip found on some
>>> motherboards, notably MSI ones. The LEDs are typically used using a
>>> RGB connector so this driver creates one LED device for each color
>>> component.
>>
>> Ok, let me take a look. What entries does it present in /sys?
> 
> Right now these 3 directories in /sys/class/leds:
> 
> nct6795d:blue:
> nct6795d:green:
> nct6795d:red:
> 
> with the usual suspects `brightness` and `max_brightness` in each. I
> am not 100% sure I got the names right so please let me know if that
> is not correct.

You miss LED function, that should be in the second section.

-- 
Best regards,
Jacek Anaszewski
