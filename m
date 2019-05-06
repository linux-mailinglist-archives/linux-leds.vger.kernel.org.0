Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0C451542A
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 21:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbfEFTHD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 15:07:03 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46579 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbfEFTHD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 May 2019 15:07:03 -0400
Received: by mail-lf1-f66.google.com with SMTP id k18so9934684lfj.13;
        Mon, 06 May 2019 12:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2vbakjCXJ75x+nBKeNz4TrHfuUxzZuo0lJ/KN5j3lug=;
        b=JSqzHVbyeR4rInhFH1Eqbfcm773JbFyVVAA8P9I1LUgxcvSqeE3NX+0ew2Drl113QT
         cgaLGp8Qm6fu6ip0Wk2fX2ggiCqa7XUxlmqzaR8nOThIOrQMVM4H2eyTnSrfFWlPJxUI
         P6lxVu2sURkaTvZkMUB3v3A2NxG+Qwk4/CXKSBm8/s61aLJvallgWuSgH/jMaJgidJHx
         7T+iYDYMeZvypmUnD7QDN80lEmcNks34KPnolpdS3H+2h/SAI5N/pkzZBEhNWRFz0zeM
         dlLsBsmJq7XnJq4mvf1gHtWd042LruFXMPY4dWZGOcCOBVFT4AGD/WtcY1NmJN/eY2Iu
         7hWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2vbakjCXJ75x+nBKeNz4TrHfuUxzZuo0lJ/KN5j3lug=;
        b=kxQ6cYKr0CD/wYE8NDp5bbX5vWqa+GqZN7azBWwSNba42yvaXlT4fbjWgIyBaOvLLh
         0KS6DULVpEslmlesYzuPSNnGq7n98oVLfs6TU+Mp4eOMdEFtnicY3Mhgpvd1eiUIZ3TE
         fo+03BpZxssFzqHI/7xHN3l8XRFvXOnn7zo8lKLEgM1r6nHmd9SS711pZ6BRv1Ltfcjb
         6szd+DUASMJgMIJaw4x/l/hPD9mQHJ4VHVMw2BAI9vHKI0ahnULoUiwB/cNNYTSspC3+
         rxnuHzYK0mzorLepLsotOWFa2cCNkDN9FOfv/fvcSFpY6YJY+p+MEgTQFDe/y1ZT2AAa
         hQyQ==
X-Gm-Message-State: APjAAAXietFCj661XJ0DrSAgVhTPnNbreGVtZO50Ls4fpM9rYxVpB2+Y
        lNSHg121GTPUqhxlRUOj2vA=
X-Google-Smtp-Source: APXvYqzhGglCkPBxO3lioCIfuG3FO2k2lp1IYCkCOmFTPoz31fLdNbXBueEZFsA/1f70EXkBbSawdg==
X-Received: by 2002:ac2:44ac:: with SMTP id c12mr3284061lfm.155.1557169621376;
        Mon, 06 May 2019 12:07:01 -0700 (PDT)
Received: from [192.168.1.19] (chs110.neoplus.adsl.tpnet.pl. [83.31.16.110])
        by smtp.gmail.com with ESMTPSA id t17sm2660082lfp.82.2019.05.06.12.06.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 12:07:00 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add binding for spi-byte LED.
To:     Christian Mauderer <oss@c-mauderer.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <CAL_JsqKmKzSw2-mfmBbhpyY=Ku6H7cE2KZrgkcPD7kAS_GqbFw@mail.gmail.com>
 <4e91d5e7-a583-58d5-9c14-ad86029ed9e7@c-mauderer.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <98a6b6bb-0a45-39f1-f453-312340d9019d@gmail.com>
Date:   Mon, 6 May 2019 21:06:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4e91d5e7-a583-58d5-9c14-ad86029ed9e7@c-mauderer.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Christian,

On 5/6/19 7:03 PM, Christian Mauderer wrote:
> On 06/05/2019 18:21, Rob Herring wrote:
>> On Sun, May 5, 2019 at 3:00 PM <oss@c-mauderer.de> wrote:
[...]
> 
> I had a look at the functions in "struct led_classdev". There is a
> blink_set(..) function that expects that delay_on and delay_off can be
> set independent. That's not possible for hardware supported blinking on
> this device. 

If delay_on and delay_off values are not supported by the hardware,
then blink_set should return -EINVAL, which will result in activating
software blink fallback for given LED class device.

-- 
Best regards,
Jacek Anaszewski
