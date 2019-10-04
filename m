Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0998CC475
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2019 22:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbfJDUzZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Oct 2019 16:55:25 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:38271 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfJDUzY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Oct 2019 16:55:24 -0400
Received: by mail-wr1-f47.google.com with SMTP id w12so8714990wro.5;
        Fri, 04 Oct 2019 13:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LTkMEJBsKkeXqsqeSzZYk6ZI75fZWAdZcjtGy04cHBs=;
        b=O78VDnnIwogsY8nkCznTnChQeA8YCanhUesI2b/F/wpXGPCjHQT5JsTNCTJWaey/ms
         5wnShF7bIN1hF9axh1TFE45nPdHuQEaAwX2fuNX/nBk5YMcfrq4qOMBMNS5idzy1Yu4N
         EVPXE3d2jbUPeu6YLE/QK0j/GggYTqK3JkJYXMazJ66JYN9C0H2cqMjJ3uh41sJkR9Dq
         r6OFh5EK6xD0FfCZE7Q0xZKIsTB9yTTKCzZpyFIVV3Q9DzodzzkLA0ResHD5Tn0GB23/
         9Y9pwZMLMbdTVrUK8OAfKuWk5QhpjvDGcZ+3167nl5Kslee5B9u6InIi7Ak4SQFW3ZEE
         sPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LTkMEJBsKkeXqsqeSzZYk6ZI75fZWAdZcjtGy04cHBs=;
        b=Oz94hZAeGEzCExo/TUEnPqS+SYjDfHhNdfccDnFnIFTdpf38D01ubNIRuBs+b2qVlq
         n/sWzBcywHetosuKLzFzr5RmNc0T/3DSxCas+cr4cbO4kQHWN//bU62gqC+x/uXLmDhI
         8pOBR5QzwhrLZ63ANuA66CGM6QJpAveXFjuu0RPSsZPk7ud+NKhlX8gDdFxtOixHLRNZ
         BUwTgKvZztxDU3LGQfecRgSZ0jpDRlPcK9eP0wpEPPQPMUdCcN/fuXKeQseTtlyCpChn
         sP2lHuZyifyk7K+GZFsEMtFFVn8szM2BK000DMgiClEJZMYDJezie5U13gJNc5/BuHUP
         hkrg==
X-Gm-Message-State: APjAAAUDSpEl1pVfbOmSpvt3Gv2bKvfTdIKaum3hNvoCz0P09KLEiCMV
        jkNhZbvUi/hOK6LP5mmSRv8=
X-Google-Smtp-Source: APXvYqzvXXohn1AzaUdkt3xKosYCb3DRxyPX/+eIs2tix0p4uxjJvNhI1QGUXrvzGs20fXz/q7vCwA==
X-Received: by 2002:adf:e849:: with SMTP id d9mr13345989wrn.358.1570222521353;
        Fri, 04 Oct 2019 13:55:21 -0700 (PDT)
Received: from [192.168.1.19] (civ244.neoplus.adsl.tpnet.pl. [83.31.45.244])
        by smtp.gmail.com with ESMTPSA id 36sm10124390wrp.30.2019.10.04.13.55.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 13:55:20 -0700 (PDT)
Subject: Re: Should regulator core support parsing OF based fwnode?
To:     Mark Brown <broonie@kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     mark.rutland@arm.com, daniel.thompson@linaro.org,
        Liam Girdwood <lgirdwood@gmail.com>, tomi.valkeinen@ti.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, pavel@ucw.cz, lee.jones@linaro.org,
        linux-leds@vger.kernel.org, dmurphy@ti.com
References: <20191003183554.GA37096@sirena.co.uk>
 <25b9614f-d6be-9da5-0fe5-eb58c8c93850@gmail.com>
 <20191003194140.GE6090@sirena.co.uk>
 <a9f668f9-ad26-4e18-178a-8403b8b3b1db@gmail.com>
 <20191004113942.GB4866@sirena.co.uk>
 <b6318ba5-e76e-dc1c-6921-a702abf6749c@ti.com>
 <20191004144029.GC4866@sirena.co.uk>
 <6df68ecb-f92e-fd9c-7f55-f66fa463263a@ti.com>
 <20191004155838.GE4866@sirena.co.uk>
 <95a43632-57d0-2705-a2d3-d64827212692@ti.com>
 <20191004174233.GF4866@sirena.co.uk>
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
Message-ID: <1a81148b-7445-6b49-9cef-99c12549f715@gmail.com>
Date:   Fri, 4 Oct 2019 22:55:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191004174233.GF4866@sirena.co.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/4/19 7:42 PM, Mark Brown wrote:
> On Fri, Oct 04, 2019 at 06:12:52PM +0200, Jean-Jacques Hiblot wrote:
>> On 04/10/2019 17:58, Mark Brown wrote:
> 
>>> Regulator supplies are supposed to be defined at the chip level rather
>>> than subfunctions with names corresponding to the names on the chip.
> 
> ...
> 
>>> good chance that they come up with the same mapping.  The supply_alias
>>> interface is there to allow mapping these through to subfunctions if
>>> needed, it looks like the LED framework should be using this.
> 
>> In case of current-sink LED drivers, each LED can be powered by a different
>> regulator, because the driver is only a switch between the LED cathod and
>> the ground.
> 
> Sure, it's common for devices to have supplies that are only needed by
> one part of the chip which is why we have the supply_alias interface for
> mapping things through.
> 
>>> That said if you are doing the above and the LEDs are appearing as
>>> devices it's extremely surprising that their of_node might not be
>>> initialized.
> 
>> That is because this is usually done by the platform core which is not
>> involved here.
> 
> The surprise is more that it got instantiated from the DT without
> keeping the node around than how it happened.

This is LED class driver that is instantiated from DT and it in
turn registers LED class devices - one per corresponding DT child
node found in the parent LED controller node.

LED class device is created via device_create_with_groups() that
returns struct device with uninitialized of_node. This is the point
we're discussing. In order to be able to obtain regulator handle
in the LED core from DT we need to have exactly of_node
(of course provided it contains *-supply property).

Here the question may arise why it is not the LED core that instantiates
LED class devices per child nodes - well it is tricky to implement
due to disparate possible LED channel routings across devices.
We can think of adding it to the TODO list, but this is another story.

This is the background. However, since Jean pointed to the few
other similar cases when of_node is being initialized in addition
to fwnode I deem there is no issue and we can do the same in the
LED core.

No action in regulator core is required then.

-- 
Best regards,
Jacek Anaszewski
