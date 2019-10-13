Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C975D56DA
	for <lists+linux-leds@lfdr.de>; Sun, 13 Oct 2019 18:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbfJMQnn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 13 Oct 2019 12:43:43 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37174 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfJMQnn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 13 Oct 2019 12:43:43 -0400
Received: by mail-wm1-f66.google.com with SMTP id f22so14437294wmc.2;
        Sun, 13 Oct 2019 09:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MX1zXgaX+X9ef/Z1zG/d5g/4qBYhVRp8VHXnKMwhz70=;
        b=igNR26SmcrrFxypwwA12mCNM1liIuy3mwI5pRn2xiFBcGf/pmr0p33VdlT+oFNphAL
         TS8i/W7YCU8br9N4AsdDoX4VD449GOHPF7LTqx+W0BZHLhFhKiKJMm9CfjgAYRRfQaCA
         w/gBMPYICFUIYoqeUNVLCWxc7wboMoUfsjxlxBmi6u6jElTNNQAp2KuHb2LBLX30EwwJ
         Yucr2NYhCQhgJqPDnxlqTryA0J7/OGi0u4em1ixsi/cFWlaBmrjatUEfk2oS6Q3gSnWN
         3J2+84x4fpstntNtv+JvUj3vF122CH4kGkgJ0m2uinwm73wn8QxzC6hJeugX+fFSTtMk
         qkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=MX1zXgaX+X9ef/Z1zG/d5g/4qBYhVRp8VHXnKMwhz70=;
        b=SpFGGLKQutnWGq59zUdMR5hqDjdKwKrDO79Ph+YmqF8qMdkUdHJTSNFn+3WRhsoXDu
         aYTVWzcF8odvxtWgZr88r9XccpEKIdBeGUJAy8jIssD/sx0HQDCohK9WiDbU9GSF2+uK
         Lb6TxOmZ551qdxIKFbdpTqcRMyQjn/mumhsoCE2qg1QTcbjqprpbSH5/V7WflgB3vFIu
         aZ/Zf0+oxNTLbylhXNstJ9mcZJYRlgkZhy00wiaa2R31OaJ0Qk/oU9SU3d/V7E49DlPz
         MpTk1qskUlPovI10dbKmzDe5c/j1lpdMT4AGnkExHHA6OOtHzpyWpDDl9eJG8MUIucBP
         2eEQ==
X-Gm-Message-State: APjAAAU5bSOUclFsAPXpAeDk5H2nVNnBiXS722Ry11c0BFwWRs7TcFAT
        6OuR5wIs0GF/jlkqG+GPTic=
X-Google-Smtp-Source: APXvYqwEX0fY7so4uuo5sNIXU6vy+iUgCbNGLGS7ijbJwHlPxK1Z3e20PdYe/0W0S84ecHDLYOKj0Q==
X-Received: by 2002:a05:600c:40f:: with SMTP id q15mr11682818wmb.30.1570984563891;
        Sun, 13 Oct 2019 09:36:03 -0700 (PDT)
Received: from [192.168.1.19] (ckd148.neoplus.adsl.tpnet.pl. [83.31.79.148])
        by smtp.gmail.com with ESMTPSA id b62sm19658641wmc.13.2019.10.13.09.36.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Oct 2019 09:36:03 -0700 (PDT)
Subject: Re: [PATCH] leds: tlc591xx: update the maximum brightness
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jean-Jacques Hiblot <jjhiblot@ti.com>, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Lunn <andrew@lunn.ch>
References: <20190923100250.22326-1-jjhiblot@ti.com>
 <91864098-a6e8-e275-4b07-e4bb15469f78@gmail.com> <20191013114508.GI5653@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <844845d6-01fe-50c4-94cd-e19ce8a5d060@gmail.com>
Date:   Sun, 13 Oct 2019 18:36:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191013114508.GI5653@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/13/19 1:45 PM, Pavel Machek wrote:
> Hi!
> 
>>> @@ -112,11 +113,11 @@ tlc591xx_brightness_set(struct led_classdev *led_cdev,
>>>  	struct tlc591xx_priv *priv = led->priv;
>>>  	int err;
>>>  
>>> -	switch (brightness) {
>>> +	switch ((int)brightness) {
>>>  	case 0:
> 
> Can we get a rid of the cast here? Do we need to move away from the
> enum for the brightness?

I at first also wanted to ask for dropping the cast but first tried
to do it myself. Then I found out compiler (or sparse, I don't recall
exactly) complains about TLC591XX_MAX_BRIGHTNESS not being a value of
enum led_brighteess type. That's the reason for the cast Jean added,
I presume.

>> Added tag:
>>
>> Fixes: e370d010a5fe ("leds: tlc591xx: Driver for the TI 8/16 Channel i2c
>> LED driver")
>>
>> and applied to the for-5.5 branch.
> 
> Actually, careful with the Fixes tag. -stable people will want to
> apply it, and it may not be a good idea in this case. Maximum
> brightness of 256 is pretty unusual, so I'd call this "a bit risky".

I entirely disagree. Not seeing anything risky in that since
max_brightness is also initialized to this value. If userspace properly
uses the ABI, then it will be safe.

> Best regards,
> 									Pavel
> 

-- 
Best regards,
Jacek Anaszewski
