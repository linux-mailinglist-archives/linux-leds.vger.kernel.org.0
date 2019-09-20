Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3680EB9877
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2019 22:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbfITU3g (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Sep 2019 16:29:36 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38903 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728259AbfITU3g (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Sep 2019 16:29:36 -0400
Received: by mail-wm1-f67.google.com with SMTP id 3so3415524wmi.3;
        Fri, 20 Sep 2019 13:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tORgamMeFxE0aKietPttjgWj7GfkU1uIlscm8UxYn2k=;
        b=TbHsV8xUplJWj/zhKPmdVwqbItDcuJBoTKs2v27AyJ5IqCd0WRdwASOUNB5ekah3Mc
         1QX2nCJN6lgDKX0XvrL6bVYxz3G8dLmz8/6gLAVD7ioaZd31WptVMV6QTOPBJwecRvZj
         g6lXFjtZmsTC51S+jfjmb95bWKgCAvfQRV+kZDGTr+6IaRYAOeHSwOuZ71m04ECM+CR/
         Rnu6h8H4XoSYIHJCDVSO7WQcxdjSBP34MjqJFFMCMYwi+xv8oHbqiiUqwf645LY4nu+L
         Wl3g5zWXSEIcJAq5u9esPtzOWaDBlfjK91EeEK++R7PrIY+o1f+9j/olzaPHAuju69XG
         OefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=tORgamMeFxE0aKietPttjgWj7GfkU1uIlscm8UxYn2k=;
        b=Z0ksavWWeHCtCSAT/wdFcF6LcEH7U/FnUUu7gDcb7VVSS7ADWzdOVLK6RIJ6KpWw1S
         Sbkl/egC9ja9TPlhKdtbdvpAL9UTKlPV7+b75ENsw4Ag/s6jEviaO7VXi6dusurPAdkt
         pmwyP0XG2RBsR/KfjxzPiBNkBf07d/mYSJdwl4KLToqdieOZL5DnPZy3wuZ/GcnqMeB/
         2ElgoGSlsxVGsAh4dcoFE2oZckZeXhl2xGReZMSgat4u40Ewqmox2V3KSigEZ/UoetHP
         7dEQQ9efcZMnNwtG1u6oxC86Tx2ym2YEpGtRcpGYeJc30WiRJTDizyBYNW1KPQGMZIcp
         +nPg==
X-Gm-Message-State: APjAAAXvta52n68QHoIge4OPWEMDWub0VQifU2GV8Swx+pm9WKjeognQ
        e5R3lMzs8GDFn8fn7oalQfWqUBgg
X-Google-Smtp-Source: APXvYqxq1UtJJZIRGU+518luXzWcohyYvza+JO7D9H/jc1l7vOd5AeiuTGIyUndW1LEpxHYrn+yH+A==
X-Received: by 2002:a1c:9d0b:: with SMTP id g11mr4616942wme.22.1569011372830;
        Fri, 20 Sep 2019 13:29:32 -0700 (PDT)
Received: from [192.168.1.19] (chi109.neoplus.adsl.tpnet.pl. [83.31.6.109])
        by smtp.gmail.com with ESMTPSA id 189sm2808496wmz.19.2019.09.20.13.29.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2019 13:29:32 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] leds: tlc591xx: use
 devm_led_classdev_register_ext()
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>, pavel@ucw.cz, dmurphy@ti.com
Cc:     tomi.valkeinen@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190920115806.14475-1-jjhiblot@ti.com>
 <20190920115806.14475-3-jjhiblot@ti.com>
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
Message-ID: <b4387d66-febd-ff20-7b5e-e66e5de8a988@gmail.com>
Date:   Fri, 20 Sep 2019 22:29:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190920115806.14475-3-jjhiblot@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jean,

Thank you for the update.

On 9/20/19 1:58 PM, Jean-Jacques Hiblot wrote:
> Use devm_led_classdev_register_ext() to pass the fwnode to the LED core.
> The fwnode can then be used by the firmware core to create meaningful
> names.
> 
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>  drivers/leds/leds-tlc591xx.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
> index bbdaa3148317..8eadb673dc2e 100644
> --- a/drivers/leds/leds-tlc591xx.c
> +++ b/drivers/leds/leds-tlc591xx.c
> @@ -186,6 +186,9 @@ tlc591xx_probe(struct i2c_client *client,
>  
>  	for_each_child_of_node(np, child) {
>  		struct tlc591xx_led *led;
> +		struct led_init_data init_data = {};
> +
> +		init_data.fwnode = of_fwnode_handle(child);
>  
>  		err = of_property_read_u32(child, "reg", &reg);
>  		if (err) {
> @@ -200,8 +203,6 @@ tlc591xx_probe(struct i2c_client *client,
>  		led = &priv->leds[reg];
>  
>  		led->active = true;
> -		led->ldev.name =
> -			of_get_property(child, "label", NULL) ? : child->name;
>  		led->ldev.default_trigger =
>  			of_get_property(child, "linux,default-trigger", NULL);
>  
> @@ -209,7 +210,8 @@ tlc591xx_probe(struct i2c_client *client,
>  		led->led_no = reg;
>  		led->ldev.brightness_set_blocking = tlc591xx_brightness_set;
>  		led->ldev.max_brightness = LED_FULL;

I was asking for removing tabove assignment, but we can always do that
in the incremental patch.

Patch set applied to the for-5.5 branch. Thanks.

> -		err = devm_led_classdev_register(dev, &led->ldev);
> +		err = devm_led_classdev_register_ext(dev, &led->ldev,
> +						     &init_data);
>  		if (err < 0) {
>  			dev_err(dev, "couldn't register LED %s\n",
>  				led->ldev.name);
> 

-- 
Best regards,
Jacek Anaszewski
