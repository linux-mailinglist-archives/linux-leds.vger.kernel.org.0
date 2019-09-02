Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11A44A5C60
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2019 20:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbfIBSrI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 2 Sep 2019 14:47:08 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40238 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726887AbfIBSrI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 2 Sep 2019 14:47:08 -0400
Received: by mail-wm1-f68.google.com with SMTP id t9so15568835wmi.5;
        Mon, 02 Sep 2019 11:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1gck3Y1S/2H7u4PQmy5W56nvn/ZFpUz5KRSMjK1VeS0=;
        b=aVZ5xTxRfhTNHHYfeNOR6fj99zcpjpgzXz+TubXJmwBpL0KFZkbeyHMHJjzjxffkRn
         fZGmaRT29W2nHTIikVTOCTBB9E0ZymJ+yFvh5VfsRKOvul1MN9jKQNtepaELRlbjkje+
         tIlMm2pYqNInUoTwenTVcoDmDrWtWMJiRXpHkHMZhaOdPHBc6p4rKNEiNRi4vt3Jyi6x
         ltIBu0gxBqmHPzyChmemgkvpGKvSU106Wu9zCc4bYCxZytx8YMySn+Woa5+fBGs/1SxU
         bPZqG/kqmEK6c8DW0025i9Ntbi6PSf5g40+d2R3sUkyHC7l5iJdhXWzE5A9XDeFfu21x
         N4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1gck3Y1S/2H7u4PQmy5W56nvn/ZFpUz5KRSMjK1VeS0=;
        b=tNnUefjHJtp9OvQoyBV8wJw68iskUIPR5mvjzJNUKD932XYyYa3WEHW4NgklIoMjiQ
         lXbIird+FP9bnpEbrTyWkp1oCigaGz23JzMedDtBX2zht0RYKAttixY7i35ztu7P5CMB
         4NSKa0BOvNBKf5SaTredPl5Jbk7F/U/VGShhSKTFxqP88hV9Vp2aRY0xph8gzRN3YgGW
         DBbmXuJlnBkpfjw/yOQvqtq7OuuYJa3HC/t/4+gqtGfc0PHx2w64jTy7ZJ88TakXD/8v
         h/dehYO4Vu7Nic1jn4ImXFVbmx80P8wAMVV7UxIvdQkeIjhAHp5PjOWcq7wab0TWlXS6
         QY7w==
X-Gm-Message-State: APjAAAVeZtS+rzfsDf4Q7S05fB7mKeiKW2AGiV+g2GdFXmSHQ1aL6ZeR
        hMnzEgC1fifbZOJfv36nj+/adIWI
X-Google-Smtp-Source: APXvYqy1TMB7FOLambRYHeEaVE3ZgPP7N/RVW0/qhjX7U6Z1bqc60ow7OaOb/SBZc58/DJ3bYyoIyg==
X-Received: by 2002:a1c:b745:: with SMTP id h66mr17042106wmf.70.1567450024971;
        Mon, 02 Sep 2019 11:47:04 -0700 (PDT)
Received: from [192.168.1.19] (bky183.neoplus.adsl.tpnet.pl. [83.28.192.183])
        by smtp.gmail.com with ESMTPSA id l20sm13840524wrb.61.2019.09.02.11.47.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 11:47:04 -0700 (PDT)
Subject: Re: [PATCH] leds: remove PAGE_SIZE limit of
 /sys/class/leds/<led>/trigger
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Akinobu Mita <akinobu.mita@gmail.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>
References: <1567090164-6819-1-git-send-email-akinobu.mita@gmail.com>
 <6ebeedab-4a7f-14ea-d62e-9184e911047f@gmail.com>
 <20190902181207.GA18577@kroah.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <1cd468a3-b6e5-a93b-739a-f30288318356@gmail.com>
Date:   Mon, 2 Sep 2019 20:47:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902181207.GA18577@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/2/19 8:12 PM, Greg KH wrote:
> On Sun, Sep 01, 2019 at 06:53:34PM +0200, Jacek Anaszewski wrote:
>> Hi Akinobu,
>>
>> Thank you for the patch.
>>
>> I have one nit below but in general it looks good to me.
>> I've tested it with 2000 mtd triggers (~14kB file size)
>> and it worked flawlessly.
>>
>> Still, I would like to have ack from Greg for it.
>>
>> Adding Greg on Cc.
>>
>> On 8/29/19 4:49 PM, Akinobu Mita wrote:
>>> Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
>>> However, the size of this file is limited to PAGE_SIZE because of the
>>> limitation for sysfs attribute.
>>>
>>> Enabling LED CPU trigger on systems with thousands of CPUs easily hits
>>> PAGE_SIZE limit, and makes it impossible to see all available LED triggers
>>> and which trigger is currently activated.
>>>
>>> This converts /sys/class/leds/<led>/trigger to bin attribute and removes
>>> the PAGE_SIZE limitation.
> 
> But this is NOT a binary file.  A sysfs binary file is used for when the
> kernel passes data to or from hardware without any parsing of the data
> by the kernel.
> 
> You are not doing that here, you are abusing the "one value per file"
> rule of sysfs so much that you are forced to work around the limitation
> it put in place on purpose to keep you from doing stuff like this.
> 
> Please fix this "correctly" by creating a new api that works properly
> and just live with the fact that this file will never work correctly and
> move everyone to use the new api instead.
> 
> Don't keep on abusing the interface by workarounds like this, it is not
> ok.

In the message [0] you pledged to give us exception for that, provided
it will be properly documented in the code. I suppose you now object
because the patch does not meet that condition.

Provided that will be fixed, can we count on your ack for the
implementation of the solution you proposed? :-)

[0] https://lore.kernel.org/lkml/20190329102606.GB7286@kroah.com/

-- 
Best regards,
Jacek Anaszewski
