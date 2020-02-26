Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8DE1709FC
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 21:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbgBZUp7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 15:45:59 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34092 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727379AbgBZUp7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 15:45:59 -0500
Received: by mail-wr1-f68.google.com with SMTP id z15so497692wrl.1;
        Wed, 26 Feb 2020 12:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RQPjGZt/jTG0wtQN7H76rxOnoZw/q/6TIuTEg4fX1N8=;
        b=K81tSiX2qakaVhGASWoFdTWuNAkPSzjWYa8cSEBAm4RcF/VDND35VIgBpEVA+pqTrE
         Ipd9ZoArjH8BdP+b8BYFbmAwmL9u7sC+YSelpPQfcva8/2S0owxjWfeK4hLfGO0i1quJ
         XV08Xm3m4fcerfK3otDRtA3G917dbu9omjn/Y+ea7SXTjlUM2EOw0b0nkPOR+7HW6abU
         xjWrBvH4rSDHSo+Yxzn6UJqxe/xCNFpjz15xhkxOMHo6yxHfCv0Q9f6G2Oy2WyHnik4l
         utO0ZqHj2B9nlv2NPOS99I2waIVPF8lBDuKP/gpC1JNaxsi8VW+3ve5ZBDty3spX6tQT
         TM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=RQPjGZt/jTG0wtQN7H76rxOnoZw/q/6TIuTEg4fX1N8=;
        b=nVFdGdV37z3qkitySkTK8ypADDBbyjBukD/4QDty8Bya5owgA3JfHKcJESCc05lhhh
         tQgg8Yk/NALwKl+RuGsx31JG075ZNfqQIR5iYRn42VAq/uVdIUbPx2SZU5f4b1dlWXnd
         8fZ1dQg2prXCgADbwvwKx8a5mvrrzbCEdRrRnVeYPCjzKJQKM073xWGEhuN/1OBxloZI
         m8Xq/0sXjnqIq42OnlZt6z2lUpLOn8bW/zhPM9zalL1LBXWn7EjSJb828gvttnnI0PJE
         sTcDBLZpV343iyDNeMXxVAc8TVY4prsRg/4pearCAubeGDRJesJso3D6hnZwzGqJ4zrh
         hIkQ==
X-Gm-Message-State: APjAAAUiZz3JqCaZE+Tm56tU8atcuJaebs1I9vyE/GLX4l3ZJvqD3wmy
        rq7UPeQZuR3FwXrKqKJ3dyifozNx
X-Google-Smtp-Source: APXvYqw9VuxcevD2mah9vm0QF9dkpouk6SzlzWX3yIki6S9+eeICiirhlijA38K8EoGHiSKIdLHQ4w==
X-Received: by 2002:adf:90e1:: with SMTP id i88mr486438wri.95.1582749956185;
        Wed, 26 Feb 2020 12:45:56 -0800 (PST)
Received: from [192.168.1.23] (affz246.neoplus.adsl.tpnet.pl. [95.49.155.246])
        by smtp.gmail.com with ESMTPSA id i18sm1610401wrv.30.2020.02.26.12.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 12:45:55 -0800 (PST)
Subject: Re: [RESEND PATCH v17 00/17] Multi Color LED Framework
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200127150032.31350-1-dmurphy@ti.com>
 <42d9687b-b488-22cf-0e9a-ff635b2094e3@ti.com> <20200225101940.GB16252@amd>
 <be76fdac-9d32-b9b2-c01d-3aa315b14463@gmail.com>
 <20200226125903.GA2800@duo.ucw.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <20f6bdd5-e899-aead-8c35-1c3a3d09145f@gmail.com>
Date:   Wed, 26 Feb 2020 21:45:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226125903.GA2800@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Greg,

We have here long lasting discussion related to LED multicolor class
sysfs interface design. We went through several iterations and worked
out the solution with individual file per each color sub-LED in the
color directory as shown below:

/sys/class/leds/<led>/colors/<color>_intensity

This is in line with one-value-per-file sysfs rule, that is being
frequently highlighted, and we even had not so long ago a patch
for led cpu trigger solving the problem caused by this rule not
being adhered to.

Now we have the voice below bringing to attention another caveat
from sysfs documentation:

"it is socially acceptable to express an array of values of the same
type"

and proposing the interface in the form of two files:

channel_intensity (file containing array of u32's)
channel_names (usually containing "red green blue")

In order to have this clarified once and for all, could you please
provide us with guidance on whether the fragment from
Documentation/filesystems/sysfs.txt is still in force and we
can benefit from it for LED multicolor framework, or not and then
it should be removed from the doc then?

Best regards,
Jacek Anaszewski

On 2/26/20 1:59 PM, Pavel Machek wrote:
> Hi!
> 
>>> The fact that it changes API makes it important to get it right, and
>>> hard/impossible to fix it once it is merged... and I don't think this
>>> is the right interface (sorry).
>>>
>>> In particular, I don't think having directory per channel is a good
>>> idea. It makes atomic updates impossible (minor), 
>>
>> It is possible via brightness file, although it will need first writing
>> intensity files, which only will cache colors, and actual write to hw
>> occurs on write to brightness file. This has been discussed dozen of
>> times throughout last year, and you even proposed the formula for
>> calculating per-color-subled brightness basing on global brightness and
>> intensity set for each color.
> 
> You are right, it is possible to make updates atomic with right kind
> of latching (which is quite confusing).
> 
>>> but will also
>>> increase memory consuption (to a point where led-per-channel might
>>> be cheaper), and will make userspace do 3x ammount of syscalls in the
>>> common case.
>>>
>>> And we can do better; sysfs files with arrays are okay. So I'd like to
>>> see
>>
>> Let's first achieve broader consensus on this statement before we
>> move forward with such design. Sysfs maintainer seems to be the best
>> person to consult at first.
> 
> This is actually documented:
> 
> Documentation/filesystems/sysfs.txt
> 
> <quote>
> Attributes should be ASCII text files, preferably with only one value
> per file. It is noted that it may not be efficient to contain only one
> value per file, so it is socially acceptable to express an array of
> values of the same type.
> 
> Mixing types, expressing multiple lines of data, and doing fancy
> formatting of data is heavily frowned upon. Doing these things may get
> you publicly humiliated and your code rewritten without notice.
> </quote>
> 
> Best regards,
> 									Pavel
> 


