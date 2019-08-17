Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53A5F912CB
	for <lists+linux-leds@lfdr.de>; Sat, 17 Aug 2019 22:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfHQUHt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 17 Aug 2019 16:07:49 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:32962 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfHQUHt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 17 Aug 2019 16:07:49 -0400
Received: by mail-wr1-f66.google.com with SMTP id u16so4796488wrr.0;
        Sat, 17 Aug 2019 13:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LD8Qjbb1bcqEhNQuvANwlKP16jgQXjo5ks/zYoQL4NQ=;
        b=Gh1dgv5yRs0qxI4GZk9J8EvAEFXcwJlN+5SvwWVqZwbB3nLaVAHUK1nKNHl+nLlSdb
         xmHp4HFDVSKv56VLFJ42njzb88uRVb2RIurNr33EfYtoQtHDJ+syWV+/9o0NHUGcy6rs
         CPpaBzohlBT3RnDlBAIIyHVfDc5qVSXI5QPtmHGL7hLIXfYqmKM0QYdgQ2oAalcMrgob
         a+2HNYXmR3Hf0WX9Wfd70ur3FnBheA3icBLAjv+VqhdP1JEBawxGoGn9OZEynSi3mJD/
         n2JHweAzzLKTnCJy6nIEQTOL9+sOBN8V6nXvOK3el2NvBjfP41lUnnTR7RG3bn1Y4gX2
         Tltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LD8Qjbb1bcqEhNQuvANwlKP16jgQXjo5ks/zYoQL4NQ=;
        b=hwAHdg0BfMYTFswqYSGvTvyjKgrQdCjFtVYlW6w9m7+nUJ7qwi3e5OrScWRxbwkaSK
         KTIEhHCp8B64m+cqDVNbtbHuZlKyn9VDunh6nAk0o1PW/vFkqrT5WlJdT1T5GF/meAmj
         8hC7kQmOiMlCpML7qJVuOUMhkPUIc+kaoaaK4XyG1Dj17Dzz+FnFQEt85B45bTHXAW7S
         w5HoGrLFhiod+QIXqbnn4cmRpgg0mn6Go5JKeGF1nlP4a3O8hgCjNE+iPnBGW2uFV0yd
         VgrBGI8lWj5QHd/73SDUjR0aZRbx1F8zPx8TKN8/CXWzHYyWPpOXSWqlZX2Ko08IyOfr
         yzMw==
X-Gm-Message-State: APjAAAXhoHWXG05zzHTnv7rSTDe4tctrQl0AzzxHSZR1zvPpoo/VouAF
        /v6A588XW3MBrsElxXcxIs0=
X-Google-Smtp-Source: APXvYqxzJ5z3T1S4siu+rWpK8U+MgZsNMpLJDhcsQ4vEQU/+BV+l8zljDOxK+NM8rXY7irSumJ59wg==
X-Received: by 2002:a5d:46d1:: with SMTP id g17mr17846055wrs.131.1566072466038;
        Sat, 17 Aug 2019 13:07:46 -0700 (PDT)
Received: from [192.168.1.19] (chd227.neoplus.adsl.tpnet.pl. [83.31.1.227])
        by smtp.gmail.com with ESMTPSA id r17sm24745415wrg.93.2019.08.17.13.07.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 17 Aug 2019 13:07:45 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 4/5] block: introduce LED block device activity trigger
To:     Pavel Machek <pavel@ucw.cz>, Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Dan Murphy <dmurphy@ti.com>, Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Hannes Reinecke <hare@suse.com>
References: <1565888399-21550-1-git-send-email-akinobu.mita@gmail.com>
 <1565888399-21550-5-git-send-email-akinobu.mita@gmail.com>
 <20190817145509.GA18381@amd>
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
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAlgEEwEIAEICGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQkJZgNMFiEEvx38ClaPBfeVdXCQvWpQHLeLfCYFAl05/9sC
 GQEACgkQvWpQHLeLfCarMQ/9FN/WqJdN2tf6xkP0RFyS4ft0sT04zkOCFfOMxs8mZ+KZoMU+
 X3a+fEppDL7xgRFpHyGaEel7lSi1eqtzsqZ5JiHbDS1Ht1G8TtATb8q8id68qeSeW2mfzaLQ
 98NPELGfUXFoUqUQkG5z2p92UrGF4Muj1vOIW93pwvE4uDpNsl+jriwHomLtjIUoZtIRjGfZ
 RCyUQI0vi5LYzXCebuzAjGD7Jh2YAp7fDGrv3qTq8sX+DUJ4H/+I8PiL+jXKkEeppqIhlBJJ
 l4WcgggMu3c2uljYDuqRYghte33BXyCPAocfO2/sN+yJRUTVuRFlOxUk4srz/W8SQDwOAwtK
 V7TzdyF1/jOGBxWwS13EjMb4u3XwPMzcPlEQNdIqz76NFmJ99xYEvgkAmFmRioxuBTRv8Fs1
 c1jQ00WWJ5vezqY6lccdDroPalXWeFzfPjIhKbV3LAYTlqv0It75GW9+0TBhPqdTM15DrCVX
 B7Ues7UnD5FBtWwewTnwr+cu8te449VDMzN2I+a9YKJ1s6uZmzh5HnuKn6tAfGyQh8MujSOM
 lZrNHrRsIsLXOjeGVa84Qk/watEcOoyQ7d+YaVosU0OCZl0GldvbGp1z2u8cd2N/HJ7dAgFh
 Q7dtGXmdXpt2WKQvTvQXhIrCWVQErNYbDZDD2V0TZtlPBaZP4fkUDkvH+Sy5Ag0EVaN9oQEQ
 AMPNymBNoCWc13U6qOztXrIKBVsLGZXq/yOaR2n7gFbFACD0TU7XuH2UcnwvNR+uQFwSrRqa
 EczX2V6iIy2CITXKg5Yvg12yn09gTmafuoIyKoU16XvC3aZQQ2Bn3LO2sRP0j/NuMD9GlO37
 pHCVRpI2DPxFE39TMm1PLbHnDG8+lZql+dpNwWw8dDaRgyXx2Le542CcTBT52VCeeWDtqd2M
 wOr4LioYlfGfAqmwcwucBdTEBUxklQaOR3VbJQx6ntI2oDOBlNGvjnVDzZe+iREd5l40l+Oj
 TaiWvBGXkv6OI+wx5TFPp+BM6ATU+6UzFRTUWbj+LqVA/JMqYHQp04Y4H5GtjbHCa8abRvBw
 IKEvpwTyWZlfXPtp8gRlNmxYn6gQlTyEZAWodXwE7CE+KxNnq7bPHeLvrSn8bLNK682PoTGr
 0Y00bguYLfyvEwuDYek1/h9YSXtHaCR3CEj4LU1B561G1j7FVaeYbX9bKBAoy/GxAW8J5O1n
 mmw7FnkSHuwO/QDe0COoO0QZ620Cf9IBWYHW4m2M2yh5981lUaiMcNM2kPgsJFYloFo2XGn6
 lWU9BrWjEoNDhHZtF+yaPEuwjZo6x/3E2Tu3E5Jj0VpVcE9U1Zq/fquDY79l2RJn5ENogOs5
 +Pi0GjVpEYQVWfm0PTCxNPOzOzGR4QB3BNFvABEBAAGJAiUEGAEIAA8FAlWjfaECGwwFCQlm
 AYAACgkQvWpQHLeLfCZqGxAAlWBWVvjU6xj70GwengiqYZwmW1i8gfS4TNibQT/KRq0zkBnE
 wgKwXRbVoW38pYVuGa5x/JDQMJDrLAJ0wrCOS3XxbSHCWOl/k2ZD9OaxUeXq6N+OmGTzfrYv
 PUvWS1Hy04q9AD1dIaMNruZQmvnRfkOk2UDncDIg0166/NTHiYI09H5mpWGpHn/2aT6dmpVw
 uoM9/rHlF5s5qAAo95tZ0QW2BtIceG9/rbYlL57waSMPF49awvwLQX5RhWoF8mPS5LsBrXXK
 hmizIsn40tLbi2RtWjzDWgZYitqmmqijeCnDvISN4qJ/nCLO4DjiSGs59w5HR+l0nwePDhOC
 A4RYZqS1e2Clx1VSkDXFpL3egabcIsqK7CZ6a21r8lXVpo4RnMlQsmXZTnRx4SajFvX7PrRg
 /02C811fLfh2r5O5if8sKQ6BKKlHpuuioqfj/w9z3B0aQ71e4n1zNJBO1kcdznikPLAbr7jG
 gkBUXT1yJiwpTfRQr5y2Uo12IJsKxohnNFVYtK8X/R6S0deKPjrZWvAkllgIPcHjMi2Va8yw
 KTj/JgcpUO5KN906Pf7ywZISe7Kbcc/qnE0YjPPSqFOvoeZvHe6EZCMW9+xZsaipvlqpByQV
 UHnVg09K9YFvjUBsBPdC8ef6YwgfR9o6AnPmxl0oMUIXkCCC5c99fzJY/k+JAq0EGAEIACAW
 IQS/HfwKVo8F95V1cJC9alAct4t8JgUCWwqKhgIbAgCBCRC9alAct4t8JnYgBBkWCAAdFiEE
 FMMcSshOZf56bfAEYhBsURv0pdsFAlsKioYACgkQYhBsURv0pdvELgD/U+y3/hsz0bIjMQJY
 0LLxM/rFY9Vz1L43+lQHXjL3MPsA/1lNm5sailsY7aFBVJxAzTa8ZAGWBdVaGo6KCvimDB8G
 7joP/jx+oGOmdRogs7mG//H+w9DTnBfPpnfkeiiokGYo/+huWO5V0Ac9tTqZeFc//t/YuYJn
 wWvS0Rx+KL0fT3eh9BQo47uF4yDiZIiWLNh4Agpup1MUSVsz4MjD0lW6ghtnLcGlIgoVHW0v
 tPW1m9jATYyJSOG/MC1iDrcYcp9uVYn5tKfkEeQNspuG6iSfS0q3tajPKnT1nJxMTxVOD2RW
 EIGfaV9Scrou92VD/eC+/8INRsiWS93j3hOKIAV5XRNINFqtzkagPYAP8r6wksjSjh01fSTB
 p5zxjfsIwWDDzDrqgzwv83CvrLXRV3OlG1DNUDYA52qJr47paH5QMWmHW5TNuoBX8qb6RW/H
 M3DzPgT+l+r1pPjMPfvL1t7civZUoPuNzoyFpQRj6TvWi2bGGMQKryeYksXG2zi2+avMFnLe
 lOxGdUZ7jn1SJ6Abba5WL3VrXCP+TUE6bZLgfw8kYa8QSXP3ysyeMI0topHFntBZ8a0KXBNs
 qqFCBWmTHXfwsfW0VgBmRtPO7eXVBybjJ1VXKR2RZxwSq/GoNXh/yrRXQxbcpZ+QP3/Tttsb
 FdKciZ4u3ts+5UwYra0BRuvb51RiZR2wRNnUeBnXWagJVTlG7RHBO/2jJOE6wrcdCMjs0Iiw
 PNWmiVoZA930TvHA5UeGENxdGqo2MvMdRJ54YaIR
Message-ID: <925633c4-a459-5e84-9c9a-502a504fdc82@gmail.com>
Date:   Sat, 17 Aug 2019 22:07:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190817145509.GA18381@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 8/17/19 4:55 PM, Pavel Machek wrote:
> On Fri 2019-08-16 01:59:58, Akinobu Mita wrote:
>> This allows LEDs to be controlled by block device activity.
>>
>> We already have ledtrig-disk (LED disk activity trigger), but the lower
>> level disk drivers need to utilize ledtrig_disk_activity() to make the
>> LED blink.
>>
>> The LED block device trigger doesn't require the lower level drivers to
>> have any instrumentation. The activity is collected by polling the disk
>> stats.
>>
>> Example:
>>
>> echo block-nvme0n1 > /sys/class/leds/diy/trigger
> 
> Lets use one trigger "block" and have the device as a parameter,
> please.
> 
> We already have 1000 cpu triggers on 1000 cpu machines, and yes, its a
> disaster we'll need to fix. Lets not repeat the same mistake here.
> 
> I guess it may be slightly more work. Sorry about that.

We should be able to list available block devices to set,
so the problem would be not avoided anyway. And Greg already proposed
a solution for trigger file PAGE_SIZE overflow, so this should not pose
a big problem in the future once that is implemented.

> 								Pavel
> 
>> +++ b/include/linux/leds.h
>> +#else
>> +
>> +struct ledtrig_blk {
>> +};
>> +
> 
> Is the empty struct neccessary?

Yeah, I didn't like that too and tried to play with the code to turn
it into a pointer but it turned out to be non-trivial.

The thing is that struct ledtrig_blk is made a property of
struct gendisk, which then allows to get a pointer to the struct gendisk
of the registrar in ledtrig_blk_work() via container_of macro.

Initially I did not realize the problem and asked Akinobu to move the
trigger implementation to the LED subsystem since it seems to have
likely broad use and it would be good to have it visible in the LED
triggers config menu.

That move unfortunately entails the cumbersome dependency we're
discussing now. It's to be decided then if it wouldn't be cleaner
to have that trigger entirely implemented on gendisk side.

>> +static inline void ledtrig_blk_enable(struct gendisk *disk)
>> +{
>> +}
>> +
>> +static inline void ledtrig_blk_disable(struct gendisk *disk)
>> +{
>> +}
>> +
>> +static inline int ledtrig_blk_register(struct gendisk *disk)
>> +{
>> +	return 0;
>> +}
>> +
>> +static inline void ledtrig_blk_unregister(struct gendisk *disk)
>> +{
>> +}
> 
> Normally we put such empty functions on single lines...
> 
> Best regards,
> 									     Pavel
> 

-- 
Best regards,
Jacek Anaszewski


