Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A13C123746
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 21:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727492AbfLQU1V (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 15:27:21 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39535 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbfLQU1V (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Dec 2019 15:27:21 -0500
Received: by mail-wr1-f65.google.com with SMTP id y11so12734724wrt.6;
        Tue, 17 Dec 2019 12:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3ot3Q4kS/P89elj1WLUgcEKAhwKQxtn59FuKZhYJrEQ=;
        b=RoSGPFR+6rF3Mf8aSMSAKM3oZBVUYJR1rrFKv1rGlp25CsuEL7bSaXzH7uHBvfCIgd
         zy7BTxkm8YHyeStnAdW5NoVtu+KCaAt5IMV+e/JM+sJ965lZt5sEfIu22HYDrpdq7iOf
         YT5BHBYy9U+rC5GtvmNaBkUzC2/nGPbP6YUtOtOQXTlUKdgmkZGyfUV4BYAQHe2zbud+
         u/8zWdrzRGGtB1rz9YeiH3OFDQVpvSBh/xdLb/4xK0VMWPtXX5l5NbopqvFMNJu9bOPc
         dNuMm8Qb+3xYdLYHTdjn1SBa4YHI5jEecaXAOjFsKP1EuAMQHDFzJ5IG/j8YVf05VG3e
         g/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=3ot3Q4kS/P89elj1WLUgcEKAhwKQxtn59FuKZhYJrEQ=;
        b=TXyAGDNhYahcgcQEd2l/v/rEq16DRC21Fgka6po9edqj2SyMeFwFvXppH+zFrKQ8sk
         uVhLMktQY7fFg4YpSCgoSVTXvnXfn0xpNUyweJsHgG9Fn4tr3DXjb2YaN5ua2L6gdQvL
         tmE7fzOhXbmh8PKNRTTfwS9itagP3B4iLo7DvuR0XFUNqLgvzogO8apiJWQMfcqID+xE
         d1ZWi9WVbCnxWAqCoLx4eks637l9uh1VSaM9pqlup6aZdAcRJlU3iV89DiR7KTwB5tMF
         Kn8r15S5ophj3j2At+AGB6qJ30iedEaPutim6ratR/9RHEAZJ1GWQZATMJQ7+zGAFw+O
         kXuw==
X-Gm-Message-State: APjAAAVD4LbkBsw1JIr1rMY93doi2E7c629iljyYbfUz6tOjRulciNFS
        NvlDl/ZbPMI3Md9jN5ilSUnZAs0A
X-Google-Smtp-Source: APXvYqwqKOlFzDl7hAMe5Dj6GXuH3xffN1Jy4c8vzeSaP5UYl79RVtQKCJzbJqBYLfjVaLnX7KbwiA==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr36379711wre.58.1576614438417;
        Tue, 17 Dec 2019 12:27:18 -0800 (PST)
Received: from [192.168.1.19] (bfn146.neoplus.adsl.tpnet.pl. [83.28.51.146])
        by smtp.gmail.com with ESMTPSA id j12sm27973568wrw.54.2019.12.17.12.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 12:27:17 -0800 (PST)
Subject: Re: [PATCH v3 3/3] leds: trigger: implement a tty trigger
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jiri Slaby <jslaby@suse.com>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20191217150736.1479-1-u.kleine-koenig@pengutronix.de>
 <20191217150736.1479-4-u.kleine-koenig@pengutronix.de>
 <20191217152724.GA3667595@kroah.com>
 <20191217162313.5n3v7va5nw5lxloh@pengutronix.de>
 <20191217172102.GB3829986@kroah.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b2844f63-d580-ddc2-b4ed-817eaa89a2c6@gmail.com>
Date:   Tue, 17 Dec 2019 21:27:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191217172102.GB3829986@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 12/17/19 6:21 PM, Greg Kroah-Hartman wrote:
> On Tue, Dec 17, 2019 at 05:23:13PM +0100, Uwe Kleine-König wrote:
>> On Tue, Dec 17, 2019 at 04:27:24PM +0100, Greg Kroah-Hartman wrote:
>>> On Tue, Dec 17, 2019 at 04:07:36PM +0100, Uwe Kleine-König wrote:
>>>> Usage is as follows:
>>>>
>>>> 	myled=ledname
>>>> 	tty=ttyS0
>>>>
>>>> 	echo tty > /sys/class/leds/$myled/trigger
>>>> 	cat /sys/class/tty/$tty/dev > /sys/class/leds/$myled/dev
>>>
>>> Is this the correct instructions?  Aren't you looking for a major/minor
>>> number instead in your sysfs file?
>>
>> This is correct, yes, at least it works as intended on my machine.
>>
>> /sys/class/tty/$tty/dev produces $major:$minor and that's what the
>> led-trigger consumes.
> 
> Ugh, nevermind, I totally read that wrong, I was thinking "echo" instead
> of cat.  My fault, what you wrote is correct.  Should that be documented
> somewhere in a Documentation/ABI/ file so that people know how to use
> this new sysfs file?  How are led triggers documented?

LED triggers have their corresponding entries in Documentation/ABI.

Uwe, you already did that for netdev trigger:

Documentation/ABI/testing/sysfs-class-led-trigger-netdev

It would be nice to have one for this too.

There are also less formal docs in Documentation/leds, e.g.:

Documentation/leds/ledtrig-usbport.rst

-- 
Best regards,
Jacek Anaszewski
