Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7F6D56DD
	for <lists+linux-leds@lfdr.de>; Sun, 13 Oct 2019 18:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728839AbfJMQrS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 13 Oct 2019 12:47:18 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45700 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfJMQrS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 13 Oct 2019 12:47:18 -0400
Received: by mail-wr1-f65.google.com with SMTP id r5so16901242wrm.12;
        Sun, 13 Oct 2019 09:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L7SrkuU+SBZM7Dq5DKaJYDRokqS1TC03YIonaVv7A1s=;
        b=Uva+87G7uOIz87dZKh+y9kp1tPBOeNYLQHGWAnFfIdScyOzCkAsT5yDjEpHoSKgHI1
         1dKWAZIoWKXqbWwpH9A9WcQQLGcOFW6U20HTkrtCUA5ez5PwQbrVss3SoZTunFNdLhwN
         uWUHam0pddkH1EuaY8l6ykc5QAX44nBurlvAO//h3QkawL7ZlsRoPp4HttKTAotlsmYT
         2JDvvpbt474Ap3aHyeSnKQKRJaI4Bk4Y4yk77O4+sAJWfYXD+8LqMAHEmxQCFF1rkrk2
         Nf+SQCJet58tBBwIUEgwe1wUjUm0J4XNR8F2lazAK4bzS00zDCcuBJkWBtiKHxpp/gxq
         aL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=L7SrkuU+SBZM7Dq5DKaJYDRokqS1TC03YIonaVv7A1s=;
        b=GT86Y3j0O5QgVJXXTPwlnvm7HePBee1eoLREDsA2VHODN7IJIkCexiz1i17ClZrUgR
         1RkpP13usmKhuRakq1HjQaEKKjLxk5bBaebhO//cOz1ckJ8y5+UK5OGxs0DXfW/gh2J4
         bPkxSsLit2ZxzfO0ORrefvYuCQPSdVK8G5Q0w3AQB7/MuVnyjwIBxtv1vX0fOc0QNU3B
         3W2aZYctpOO1hkIZM0FZvhFsm1FdwFHN6YFpcuS9vr4eEBbOHSiAEgA4+FrD4QL9dlan
         d6xr6sbdQBWgxHIrqVH/tZrYVvCtLDPHa/6+B9pAkNSGbSmsN0VxIJHfAdxBMqiK7OsM
         gcIw==
X-Gm-Message-State: APjAAAVfMTCEd/8L/D23ke0jcK7sLIKOYBpNz4AQnnuTzGF0UqIXwpYH
        qWtWzVjEqM+5Y840dvckyac=
X-Google-Smtp-Source: APXvYqxqf4YDSNJkFDHvOZSItTriFT3eBs+hG9I7S47/sefrTxdXDr2RBXJg91ZwzHDGEI3SUee6eQ==
X-Received: by 2002:a05:6000:49:: with SMTP id k9mr23019416wrx.289.1570985235276;
        Sun, 13 Oct 2019 09:47:15 -0700 (PDT)
Received: from [192.168.1.19] (ckd148.neoplus.adsl.tpnet.pl. [83.31.79.148])
        by smtp.gmail.com with ESMTPSA id z15sm1787254wrr.19.2019.10.13.09.47.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Oct 2019 09:47:14 -0700 (PDT)
Subject: Re: [PATCH v9 1/2] dt-bindings: Add docs for EL15203000
To:     Pavel Machek <pavel@ucw.cz>, Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
References: <20190918105250.22855-1-oleg@kaa.org.ua>
 <20190918105250.22855-2-oleg@kaa.org.ua>
 <5219879e-84af-a98e-2fca-10684548d416@gmail.com>
 <2ac88d9d-afe6-9629-eb11-28dff59461eb@kaa.org.ua> <20191013121110.GP5653@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <6cd93ad2-4622-4f11-037c-9799dff4c772@gmail.com>
Date:   Sun, 13 Oct 2019 18:47:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191013121110.GP5653@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel.

On 10/13/19 2:11 PM, Pavel Machek wrote:
> Hi!
> 
>>> Regarding this ASCII art - I presume you wanted to follow
>>> Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt.
>>>
>>> It was added to bindings because we support 'pattern' value
>>> for linux,default-trigger, which in turn looks for 'led-pattern'
>>> property, whose format needs to be documented in the LED bindings.
>>>
>>> leds-trigger-pattern.txt documents only common syntax for software
>>> pattern engine. Currently we don't have a means to setup hw_pattern
>>> for the pattern trigger from DT, which is obvious omission and your
>>> patch just brings it to light.
>>>
>>> That said, I propose to fix it alongside and introduce led-hw-pattern
>>> property. When present, ledtrig-pattern would setup the pattern
>>> using pattern_set op, similarly as if it was set via sysfs hw_pattern
>>> file.
>>>
>>> Only in this case placing the pattern depiction here would be justified.
>>> Otherwise, it would have to land in the ABI documentation.
>>
>> You are okay, if I move it to Documentation/ABI/testing/sysfs-class-led-driver-el15203000 ?
> 
> I don't see if this got a reply. Yes,
> Documentation/ABI/testing/sysfs-class-led-driver-el15203000 sounds
> like a right place for the sysfs description.

There was no explicit reply because Oleh sent the update with this
change before I managed to respond. And the patch is already in the
for-next branch with the file in the discussed location. So the reply
was in the form of my later confirmation that the patch was applied.

-- 
Best regards,
Jacek Anaszewski
