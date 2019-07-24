Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05B9C7408C
	for <lists+linux-leds@lfdr.de>; Wed, 24 Jul 2019 23:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727721AbfGXVC6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Jul 2019 17:02:58 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53371 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726238AbfGXVC6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Jul 2019 17:02:58 -0400
Received: by mail-wm1-f67.google.com with SMTP id x15so43029223wmj.3;
        Wed, 24 Jul 2019 14:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7YgJqjEfdgZXnXeTvJ4PZQHPEn5PQ4I8CGg8M9y1/NY=;
        b=NXRtSpQnbhspUOKyvA4vYLPHtv7ovVVB269NAGzsXKdHQTxx/wSAPrWOz7VnSQaon+
         BNA4ahkDPqHgmLWg5B2gPMpdDyBV3lIigkELBFm7UEHhUbkgsdUln2MlSebD5BmpvTTX
         AvlKx5xgJ27bRBwKZp1sDw31zPqjnIfEdRGeYRpSULFAixsQ9fKPUG350Mg5azB2qWbc
         zQ6aniZU9aXPYxjOgRqWVVajHpDrVuUD9ovJA7TFAvq1/duUtIUVbzYFZrnKPWNNJUfp
         dHIBXuvhmdrQp4t1l7BOn+oSQYjrfT5021OUrXmHBOp4Sxkd4ImPywkhH0z+c0Nu5jgM
         jj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7YgJqjEfdgZXnXeTvJ4PZQHPEn5PQ4I8CGg8M9y1/NY=;
        b=Or4VtYgglrkQFkftFP+EPMxj9xAPDGNKDoJIASQ6Pi8aDzyBxLNWh06nQsIkHSZXZH
         IM+KeWGgtDkEY85USuwrEsp/RFWcxiaI/h0aX4HIPRRB0bF5mT++OsUbswwq5xp0ht0d
         uLDLHTUi+BBoOPsmqbzHlMy/+6MYZx7KGVUTdhGuM05StWihh5vCKcXbZOsEV8r2RFoi
         e3N20gbU2+5oIjmvYmpm6lSNd6gdPgn/Vw3tgykVav/6RN6wSCDYyb9c3jbWACPlj1HK
         mss3UWgTXFT0Ot07jTsfCk1f2x03Kvg1xyin9dGJ0fwQsfgGIEj3Vd2v/qT3NqaS9NP1
         /fDg==
X-Gm-Message-State: APjAAAWjR1ls5I5LCu77hYX6SPgL8r5OGV3jbdPquZUYZy/eMSevX/gj
        kQWdqJ5C+DUqfht45fEyN50=
X-Google-Smtp-Source: APXvYqyL88aMFz4WzOJeQkMPvXkNK8S4wy/OwQKWC9RR1vtpvxV36XzBzkBfVkfIIkrUy95eK68ZRg==
X-Received: by 2002:a7b:c954:: with SMTP id i20mr77168269wml.169.1564002175217;
        Wed, 24 Jul 2019 14:02:55 -0700 (PDT)
Received: from [192.168.1.19] (bko238.neoplus.adsl.tpnet.pl. [83.28.182.238])
        by smtp.gmail.com with ESMTPSA id e3sm41762283wrt.93.2019.07.24.14.02.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 14:02:54 -0700 (PDT)
Subject: Re: [PATCH v5 00/26] Add generic support for composing LED class
 device name
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, dtor@google.com, linux@roeck-us.net
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
 <405b2806-342a-952d-67ab-47516225c54e@gmail.com> <20190718105233.GA3859@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFWjfaEBEADd66EQbd6yd8YjG0kbEDT2QIkx8C7BqMXR8AdmA1OMApbfSvEZFT1D/ECR
 eWFBS8XtApKQx1xAs1j5z70k3zebk2eeNs5ahxi6vM4Qh89vBM46biSKeeX5fLcv7asmGb/a
 FnHPAfQaKFyG/Bj9V+//ef67hpjJWR3s74C6LZCFLcbZM0z/wTH+baA5Jwcnqr4h/ygosvhP
 X3gkRzJLSFYekmEv+WHieeKXLrJdsUPUvPJTZtvi3ELUxHNOZwX2oRJStWpmL2QGMwPokRNQ
 29GvnueQdQrIl2ylhul6TSrClMrKZqOajDFng7TLgvNfyVZE8WQwmrkTrdzBLfu3kScjE14Q
 Volq8OtQpTsw5570D4plVKh2ahlhrwXdneSot0STk9Dh1grEB/Jfw8dknvqkdjALUrrM45eF
 FM4FSMxIlNV8WxueHDss9vXRbCUxzGw37Ck9JWYo0EpcpcvwPf33yntYCbnt+RQRjv7vy3w5
 osVwRR4hpbL/fWt1AnZ+RvbP4kYSptOCPQ+Pp1tCw16BOaPjtlqSTcrlD2fo2IbaB5D21SUa
 IsdZ/XkD+V2S9jCrN1yyK2iKgxtDoUkWiqlfRgH2Ep1tZtb4NLF/S0oCr7rNLO7WbqLZQh1q
 ShfZR16h7YW//1/NFwnyCVaG1CP/L/io719dPWgEd/sVSKT2TwARAQABtC1KYWNlayBBbmFz
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAj4EEwEIACgCGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQJVo39tBQkJZgNMAAoJEL1qUBy3i3wmxLQQAK8QEQ0JqZEv
 5hrxiwT+Qtkx1TULYriK9sYcY9zbi18YxbKB0C4Znh5iP5o7k26WnPGLM+w4qWvTAkHjuAI7
 aBrvb4nGRvE5s14PQ9IHgL7iL3zAAHT1azIZng9dUCCSontB+vQZu1x/Un0lVlVCvsvO7QVt
 hAZUlT3iucNMO0jpCiS3raZkNfab8M+JWP/iplaV0Kn+O7LX3A/RdLmx5ZhuT+zvyHwl2c3K
 T56UHaQnjkuHB2Ytk8HtOjNXGNYnm4nLx3ok3jEN1nWDRV/DeiPn8zz4Zebsp686OH9vvX/0
 R4dk2YEjUCY/S7CbJxXzUnLjboUAGmtTVOu/uJ7y11iS9XEoJ09HEzijQwWctJXLojcTXCFw
 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
 eGGiEQ==
Message-ID: <3d8890a2-47e8-2dd0-9764-93676703df2a@gmail.com>
Date:   Wed, 24 Jul 2019 23:02:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190718105233.GA3859@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/18/19 12:52 PM, Pavel Machek wrote:
> 
>> Hi all,
>>
>> I need explicit acks for some patches from this series, that
>> were either requested improvements or I modified them by myself
>> after v4.
>>
>> The patches I am talking about are the following:
>>
>> 1/26
>> 21/26
>> 23/26
>> 25/26
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>

Applied the patch set without patch 26/26 for now.
I had to make some formatting related changes in leds-class.rst, in
part of the added text (we had leds-class.txt -> leds-class.rst
transition in the meantime) to fix resulting html formatting.
Basically they aimed to achieve nice bullets to compensate some
sphinx issue related to lack of line breaks after quoted strings.

Current shape of leds-class.rst on linux-leds.git for-next branch can
be looked up via [0].

>> 26/26 would be nice to have but I presume it needs more discussion
>> and analysis.
> 
> Idea is good, but I'd sort the file in different way.
> 
> Best regards,
> 									Pavel
> 

[0]
https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git/tree/Documentation/leds/leds-class.rst?h=for-next

-- 
Best regards,
Jacek Anaszewski
