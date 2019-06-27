Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC8758B7C
	for <lists+linux-leds@lfdr.de>; Thu, 27 Jun 2019 22:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfF0UTc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 27 Jun 2019 16:19:32 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:39326 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbfF0UT3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 27 Jun 2019 16:19:29 -0400
Received: by mail-wr1-f44.google.com with SMTP id x4so3923975wrt.6;
        Thu, 27 Jun 2019 13:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aTJRn59bHOkcManKFhWb92iKXcDAJAI93lrWRsgpStw=;
        b=kio4VyN5VBBKgotFt39Swqjz7+zKBWaqpgkBW6UJGl11ixC89A6nnk8G6DGMoeaK1U
         W9+tRkdLf8B2KgypHwGamBmDLpMzM0n8Ck7++uceW4EL2UMdeTlKHSpAwwOx3AbTL7Pc
         1Ruc6E+Wh31IvXaWLmczJ4Wc+AhCSgs9nw8cOmvCe9Ar2GaDVGnd/b7E1U2rn8GaABxQ
         NheVNJ90RoFO7AtpQYu0a/ABNldWGvziUBiIpanGDhmVJkSIktlqa72Lkt5MCIGj7/mK
         q2QMuVKA1hhNN+YogPPdsxwUsHw4k8VIj2xlJPRtQ+Y2FkM1zQNb4T8C/tp58OORvocR
         YTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=aTJRn59bHOkcManKFhWb92iKXcDAJAI93lrWRsgpStw=;
        b=O/5EH3i70L9UiC/1E0QWXpEq3W+rEgHQ3kuNH8NP/gLaLS6Ylp2dUoRGi2ypm4JxLB
         Os7Oh1ifpMvWDNEbK4s77xL86Kc12Dr99EubTO/6GD/899sB5WMnLSerYsijIS1jY0gU
         FPCEDqRgR8GZIuMG1NQ+mqcUoQFIs6IRxNxSI54zI38O5nkUnSpzLq6CCSwXN1uGWbSv
         zC5eZLxWl9QjZ8U7SKO2CfIVpLtwqFfpqvNbswW4LJpws013+THAWViMLAWtbsW2/yiS
         QMa7VZouJNXE/RfeLuTFwpR5ZXS+sZ3pG8U+gzRyfQuSBSt5tcf9Vy6GOGNwPbJoL1Dr
         WXlw==
X-Gm-Message-State: APjAAAUtVojGvoUBmX60cPodPoKIkPpz9gpMNUh1UhBGQfikyUlO+DrH
        8AZtHjlFAGCsBRqSS+B/8k8=
X-Google-Smtp-Source: APXvYqy37ZMOcT2uek7Lphg4sgF9ecuTloI+GSMMajdpPMaW8T/9s+lnbprCv53VSLSWNUzQKK8uJA==
X-Received: by 2002:a5d:40ce:: with SMTP id b14mr1645643wrq.193.1561666766812;
        Thu, 27 Jun 2019 13:19:26 -0700 (PDT)
Received: from [192.168.1.17] (dkm129.neoplus.adsl.tpnet.pl. [83.24.16.129])
        by smtp.gmail.com with ESMTPSA id f204sm78254wme.18.2019.06.27.13.19.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:19:26 -0700 (PDT)
Subject: Re: devicetree bindings for a generic led-based backlight driver
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>, devicetree@vger.kernel.org,
        pavel@ucw.cz, linux-leds@vger.kernel.org, robh@kernel.org,
        "Valkeinen, Tomi" <tomi.valkeinen@ti.com>
References: <69f3a300-9e37-448d-e6fa-49c1c9ca0dd6@ti.com>
 <400ac00b-d3c7-b58f-52fa-8b18b6c7e4a2@gmail.com>
 <283a3b7c-c3ed-719e-14e3-fc73e08af880@ti.com>
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
Message-ID: <e7c5a500-4107-8895-d0fc-377c71cd3b34@gmail.com>
Date:   Thu, 27 Jun 2019 22:19:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <283a3b7c-c3ed-719e-14e3-fc73e08af880@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jean,

Side note: please use plain text in your messages.

On 6/27/19 3:14 PM, Jean-Jacques Hiblot wrote:
> Hi Jacek,
> 
> On 26/06/2019 20:55, Jacek Anaszewski wrote:
>> Hi Jean,
>>
>> On 6/26/19 5:34 PM, Jean-Jacques Hiblot wrote:
>>> Hi,
>>>
>>> A few years ago (2015), Tomi Valkeinen posted a series implementing a
>>> backlight driver on top of a LED device.
>>>
>>> https://patchwork.kernel.org/patch/7293991/
>>> https://patchwork.kernel.org/patch/7294001/
>>> https://patchwork.kernel.org/patch/7293981/
>>>
>>> The discussion stopped  because he lacked the time to work on it.
>>>
>>> I will be taking over the task and, before heading in the wrong
>>> direction, wanted a confirmation that the binding Tomi last proposed in
>>> hist last email was indeed the preferred option.
>>>
>>> It will probably require some modifications in the LED core to create
>>> the right kind of led-device (normal, flash or backlight) based on the
>>> compatible option.
>> I recall that discussion. I gave my ack for the LED changes but
>> now we have more LED people that might want to look into that.
> 
> Regarding the LED bindings as discussed by Tom and Rob in
> https://patchwork.kernel.org/patch/7293991/, what do you think of using
> a 'compatible' string to make a LED device also a backlight or a flash LED ?

After going through the referenced discussion and refreshing my memory
it looks to me the most reasonable way to go for backlight case.

Nevertheless I'd not tamper at LED flash support - if it's not broken,
don't fix it.

Best regards,
Jacek Anaszewski

> Here is the example from Tomi at the end of the discussion:
> 
> /* tlc59108 is an i2c device */
> tlc59116@40 {
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 	compatible = "ti,tlc59108";
> 	reg = <0x40>;
> 
> 	wan@0 {
> 		label = "wrt1900ac:amber:wan";
> 		reg = <0x0>;
> 	};
> 
> 	bl@2 {
> 		label = "backlight";
> 		reg = <0x2>;
> 
> 		compatible = "led-backlight";
> 		brightness-levels = <0 243 245 247 248 249 251 252 255>;
> 		default-brightness-level = <8>;
> 
> 		enable-gpios = <&pcf_lcd 13 GPIO_ACTIVE_LOW>;
> 	};
> };
> 
>> Regarding the bindings we have pending LED naming patch set,
>> that deprecates DT label property [0] and introduces standardized
>> LED functions.
>>
>> [0] https://lkml.org/lkml/2019/6/9/728
> 
> Thanks for the info.
> 
> 

