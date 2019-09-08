Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C401ACFA7
	for <lists+linux-leds@lfdr.de>; Sun,  8 Sep 2019 18:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729442AbfIHQR4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Sep 2019 12:17:56 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45043 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729409AbfIHQR4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Sep 2019 12:17:56 -0400
Received: by mail-wr1-f68.google.com with SMTP id 30so11206680wrk.11;
        Sun, 08 Sep 2019 09:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fX2RgGMKJSfSxbUrxSWdGN7Yeuu0S7li8+KEw9fT10A=;
        b=bgTjK6s0zFpLAP4yPSlRNj778eFDLvQExj/lCf6+SSDqOxuRXjI0K6++m6eHsMDXt/
         FkpgEjOmxOf/vi+1vn0arRZqaul+6GNBzChfcorsVMoJA2YYe2Iq7oS0r+M08XAPKPVL
         al0tKtNTRPgcHZMrAD3otmuRl5YxzDxPoGYYNx+1HNZm0MwmDRBJ9XE1YJwyHs5aiIrr
         YhvVGbJNRfOIBohBUPBEMEJn821uv1l5G0/ydMMDLc7JKkGPH/zmZLF88QJnEfnm+xnV
         GyC2jiv1nSablYBcZz+4sjlYM4IFMCy/WTyvKSpDpq7CMc0qAtMTiVBeHXoqPeKShkfG
         HFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fX2RgGMKJSfSxbUrxSWdGN7Yeuu0S7li8+KEw9fT10A=;
        b=b835MpmdZHDl/Ks2dXisGSSNypPY+ldwfx+9hOPWNGSji2ueSrGo64u2MoBr5gqaDV
         WhGuMkKPnEa49tR++E6omAXH1PiVbiBsuLj7eV6F6yMQAU/ekbCk3vAPmzjsCpS99PaB
         fcbl8HeHTBS652F3SIL7XWz6wW/Y3/T/FiFPB1/+Sq9v5NV+p45qbnFvt3GjvXRskFdT
         PGWXc7IBi2sgodhIbX+pa4Nr0DQ1PcjpntVaegpchNgLbkVBfGRqhgbt2DEGz0ChGAfx
         /3dkhCwra8IP5pVTtmeyVJJW8k+h2gtWAYAjwQ93BKjLTGDWJygFHsQK41n49+lvBU+H
         /Cfg==
X-Gm-Message-State: APjAAAWysQBacQs1+rsObzQt6X3m7q8ixUQp9XujLz+Eir/bVOLfd3Hg
        Q0f0LlLS09UZEhU9/YX83C8=
X-Google-Smtp-Source: APXvYqxrlCEocJxDiHeReVme5I5AOLPWGs1nTcQ+s0jYqBz7/DGeF7ASE15ImzRgIfyVktuk60iTYA==
X-Received: by 2002:a05:6000:12c9:: with SMTP id l9mr15291358wrx.163.1567959473555;
        Sun, 08 Sep 2019 09:17:53 -0700 (PDT)
Received: from [192.168.1.19] (bdt94.neoplus.adsl.tpnet.pl. [83.28.5.94])
        by smtp.gmail.com with ESMTPSA id k9sm23961065wrd.7.2019.09.08.09.17.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Sep 2019 09:17:53 -0700 (PDT)
Subject: Re: [PATCH v4 0/4] Add a generic driver for LED-based backlight
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>, daniel.thompson@linaro.org
Cc:     Jean-Jacques Hiblot <jjhiblot@ti.com>, pavel@ucw.cz,
        robh+dt@kernel.org, mark.rutland@arm.com, jingoohan1@gmail.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ti.com
References: <20190717141514.21171-1-jjhiblot@ti.com>
 <283d9044-df2d-b176-bea9-7e1520d9cf56@gmail.com> <20190722070620.GD8402@dell>
 <9cbd9cf6-3422-85df-885f-904f52e9cabd@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e8b4bf9a-2ee2-a496-c4de-1ed643211ec7@gmail.com>
Date:   Sun, 8 Sep 2019 18:17:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9cbd9cf6-3422-85df-885f-904f52e9cabd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/22/19 11:23 PM, Jacek Anaszewski wrote:
> On 7/22/19 9:06 AM, Lee Jones wrote:
>> On Thu, 18 Jul 2019, Jacek Anaszewski wrote:
>>
>>> On 7/17/19 4:15 PM, Jean-Jacques Hiblot wrote:
>>>> This series aims to add a led-backlight driver, similar to pwm-backlight,
>>>> but using a LED class device underneath.
>>>>
>>>> A few years ago (2015), Tomi Valkeinen posted a series implementing a
>>>> backlight driver on top of a LED device:
>>>> https://patchwork.kernel.org/patch/7293991/
>>>> https://patchwork.kernel.org/patch/7294001/
>>>> https://patchwork.kernel.org/patch/7293981/
>>>>
>>>> The discussion stopped because Tomi lacked the time to work on it.
>>>>
>>>> changes in v4:
>>>> - fix dev_err() messages and commit logs following the advices of Pavel
>>>> - cosmetic changes (indents, getting rid of  "? 1 : 0" in
>>>>   led_match_led_node())
>>>>
>>>> changes in v3:
>>>> - dt binding: don't limit the brightness range to 0-255. Use the range of
>>>>   the underlying LEDs. as a side-effect, all LEDs must now have the same
>>>>   range
>>>> - driver: Adapt to dt binding update.
>>>> - driver: rework probe() for clarity and remove the remaining goto.
>>>>
>>>> changes in v2:
>>>> - handle more than one LED.
>>>> - don't make the backlight device a child of the LED controller.
>>>> - make brightness-levels and default-brightness-level optional
>>>> - removed the option to use a GPIO enable.
>>>> - removed the option to use a regulator. It should be handled by the LED
>>>>   core
>>>> - don't make any change to the LED core (not needed anymore)
>>>>
>>>> Jean-Jacques Hiblot (2):
>>>>   leds: Add managed API to get a LED from a device driver
>>>>   dt-bindings: backlight: Add led-backlight binding
>>>>
>>>> Tomi Valkeinen (2):
>>>>   leds: Add of_led_get() and led_put()
>>>>   backlight: add led-backlight driver
>>>>
>>>>  .../bindings/leds/backlight/led-backlight.txt |  28 ++
>>>>  drivers/leds/led-class.c                      |  92 ++++++
>>>>  drivers/video/backlight/Kconfig               |   7 +
>>>>  drivers/video/backlight/Makefile              |   1 +
>>>>  drivers/video/backlight/led_bl.c              | 268 ++++++++++++++++++
>>>>  include/linux/leds.h                          |   6 +
>>>>  6 files changed, 402 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
>>>>  create mode 100644 drivers/video/backlight/led_bl.c
>>>>
>>>
>>> For the whole set:
>>>
>>> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>>>
>>> Lee - we need to create immutable branch for this set since there will
>>> be some interfering changes in the LED core in this cycle.
>>>
>>> I can create the branch and send the pull request once we will
>>> obtain the ack from Rob for DT bindings, unless you have other
>>> preference.
>>
>> We also require a review to be conducted by Daniel Thompson.
>>
>> After which, an immutable branch sounds like a good idea.  I'd like to
>> create this myself if you don't mind.
> 
> Sure, thanks.

Unfortunately that hasn't happened and it will miss 5.4 merge window.

Daniel, we need your ack for this patch set.

-- 
Best regards,
Jacek Anaszewski
