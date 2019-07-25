Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E20EB75732
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2019 20:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbfGYSrE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Jul 2019 14:47:04 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44657 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfGYSrD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 Jul 2019 14:47:03 -0400
Received: by mail-wr1-f68.google.com with SMTP id p17so51812354wrf.11
        for <linux-leds@vger.kernel.org>; Thu, 25 Jul 2019 11:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:references:to:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TNNeGa1TkNoeMvJODPjfwiQdr8qH8KrD6z5/xP/FyA8=;
        b=Xe998Mfvs4xJ/DypopPK6sdVhdx7Pke6I2oFWz+UfyIYwODQZrjB1o6hN6+C2BsoHy
         Ulo3Iw3n3slzTWZIeaDRN1aQOYOLd/JJAvS+32SzbipkHAc/z/ffv35wDBa9PE7fd+qN
         HMdPcIw/2Z766tmlo8z2znullJ5f29g1dKjyM9NY9CzJOWQlEhTspyVYwg0dcQy957qd
         0SXc5mN9CmOP2ciExD71VkC4jZKLl1waQpoSSDzK5oT88ECmnkjp4AXMmu65KXAiDbxk
         nBP+3zdlp53jx3fMIr9CE0phWY4+tC2HD73K0JMG+hFq3CQl58o6i6fX5Fhx5/aoFA8F
         Ck7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:references:to:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=TNNeGa1TkNoeMvJODPjfwiQdr8qH8KrD6z5/xP/FyA8=;
        b=HgRGjUsMtMTyA42hH1VrN2uo3ROZeltTtzdYe6FpFfABVwvC2mlGhQwWAlk/BPYh+W
         3JXrr0j6YAPThQ0MZPEGchNGLurX42W/MTAQmbAoLFu7ivPr/zKLAE2mahGYX93cP+oD
         fKb086ld+M/XbNGvkIPbPnHkpsY1Hj3WdAsSihjvIBNhKR81fl/SZ4lb8u+9dNi3/zIy
         0GrvL78zkABSkjCY4J2q3ArIe54owqgC6354InJRsIH9uz8kwvR4Cr2LxIMn855FOhq7
         0S4CWOW93AZTzwQWUSkYmzdGuORrNE2rizSB8CanyrrSssl1nfZclmKUma6/5bpyOIJu
         vQIQ==
X-Gm-Message-State: APjAAAUkhDnmtrNJbgJHepM0P77Ck5hBmz0uUXdJWPxZnR5HMk2pHe3c
        CZn7kvAiXKkYik/dzIGhZXIcmR9E
X-Google-Smtp-Source: APXvYqyOXxSGm25UXFwQBtrPtzNmDrEivgt1HxzfNdr4HxNRWsVf6Z7N3Gjg3yy8e8F0vU7OGeRR+A==
X-Received: by 2002:adf:c003:: with SMTP id z3mr10989001wre.243.1564080421226;
        Thu, 25 Jul 2019 11:47:01 -0700 (PDT)
Received: from [192.168.1.19] (bdr31.neoplus.adsl.tpnet.pl. [83.28.3.31])
        by smtp.gmail.com with ESMTPSA id x20sm38039737wmc.1.2019.07.25.11.47.00
        for <linux-leds@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 11:47:00 -0700 (PDT)
Subject: Fwd: linux-next: build failure after merge of the leds tree
References: <bf55a00a-18f5-d7c4-cae1-8c110b9f0e13@gmail.com>
To:     Linux LED Subsystem <linux-leds@vger.kernel.org>
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
X-Forwarded-Message-Id: <bf55a00a-18f5-d7c4-cae1-8c110b9f0e13@gmail.com>
Message-ID: <5810c4b2-c3d6-560f-b807-351e90b44877@gmail.com>
Date:   Thu, 25 Jul 2019 20:46:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bf55a00a-18f5-d7c4-cae1-8c110b9f0e13@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fwd to linux-leds.

-------- Forwarded Message --------
Subject: Re: linux-next: build failure after merge of the leds tree
Date: Thu, 25 Jul 2019 20:44:33 +0200
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel
Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski
<bgolaszewski@baylibre.com>, Lee Jones <lee.jones@linaro.org>

On 7/25/19 4:31 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the leds tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/leds/leds-max77650.c: In function 'max77650_led_probe':
> drivers/leds/leds-max77650.c:121:8: error: implicit declaration of function 'devm_of_led_classdev_register'; did you mean 'devm_led_classdev_register'? [-Werror=implicit-function-declaration]
>    rv = devm_of_led_classdev_register(dev, child, &led->cdev);
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         devm_led_classdev_register
> 
> Caused by commit
> 
>   4eba5b82096e ("leds: class: Improve LED and LED flash class registration API")
> 
> interacting with commit
> 
>   5be102eb161a ("leds: max77650: Add LEDs support")
> 
> I have used the leds tree from next-20190724 for today.
> 

I forgot about this driver jumping in lately.

But here is the fixup and the rationale:

devm_of_led_classdev_register() API has been useless from the beginning,
since it was just an initial portion of work aiming at adding some
generic DT parser. The actual parser had not been added up to this
commit which also switches the API:

devm_of_led_classdev_register(struct device *parent,
                              struct device_node *np,
                              struct led_classdev *led_cdev);

to:

devm_led_classdev_register_ext(struct device *parent,
                               struct led_classdev *led_cdev,
                               struct led_init_data *init_data)

To not break the bisectibility The remaining users of
devm_of_led_classdev_register are being fixed by this commit to use the
wrapper:

+#define devm_led_classdev_register(parent, led_cdev)           \
+       devm_led_classdev_register_ext(parent, led_cdev, NULL)


leds-max77650.c is the one that was omitted, so I've just applied
the following fix to this commit:

diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
index 04738324b3e6..5a14f9775b0e 100644
--- a/drivers/leds/leds-max77650.c
+++ b/drivers/leds/leds-max77650.c
@@ -118,7 +118,7 @@ static int max77650_led_probe(struct platform_device
*pdev)
                of_property_read_string(child, "linux,default-trigger",
                                        &led->cdev.default_trigger);

-               rv = devm_of_led_classdev_register(dev, child, &led->cdev);
+               rv = devm_led_classdev_register(dev, &led->cdev);
                if (rv)
                        goto err_node_put;

and melded it with the original one to not break the bisect.

If you have any doubts please let me know.


Best regards,
Jacek Anaszewski
