Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1301D1136C7
	for <lists+linux-leds@lfdr.de>; Wed,  4 Dec 2019 21:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbfLDUwz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 Dec 2019 15:52:55 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40581 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbfLDUwz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Dec 2019 15:52:55 -0500
Received: by mail-wr1-f66.google.com with SMTP id c14so856015wrn.7;
        Wed, 04 Dec 2019 12:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wmCpBK5gKfNHkehfVw0oOjmIqfu20jWLSFxK7s8CnWs=;
        b=OoFLFYixY2AfF+VyBlD1cF+DZ1WKmEOtVBMCB2bN1SGSSXcy4gPFGq6Y+PQ+Mf8gOx
         bBPhTyIoib4LVgdjUIj203iTZu8rZJu8Kti0CbxNyEDIhKnSX6juMges8H5Ky+3xYKYi
         Q67yiqmRoulqT3mCJhWFCvrOVIhm46nQTt1bfDnpDAfJNW+3sX1Hq75ygzLL0oOf10GM
         bpTCFSPNK4UylN9uAHkVg9kkOx91aDeUMpUpytHJPrRgdnVtwRWV7BGpSNSTzI6nQXnY
         d9bvLDFVRbUBnktZ8lBsft1obFtaQan4u2r7l5voT/7GwCmErM8XNMYWSRP1ZaWPoBM6
         jXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wmCpBK5gKfNHkehfVw0oOjmIqfu20jWLSFxK7s8CnWs=;
        b=PFp9+uu4KflPgvWdZ/iWXXKQWK6nxh3WmReaOChZQVrsSIjSaX0vo60WAOTOrVJaF+
         3vhWec41UNIZAK+4GLHa/jS8HPUWkrXjt1LJNI7nTE6rVq33ijXhpO5ZqCNu4mKEcQ2f
         lBsfseegnFCGlKsw7cyrVEl3Y70cGiZrQxVuinihFhaEtc+/LstQ5RKkSpcCZDk4Yjpc
         RRRMsqW5ps6qlKM70Vhqt6zjkzELIOaCp10lEfHzO8FJqGIbr3g/PNPSuFnv7NrarO7G
         KfnQ6wUIAVlpLpXNZZjiRVlzoHQvaIM4CPLaBNNay4Fn405CWPvFnJD4EYGUXXj3k+u6
         8pZQ==
X-Gm-Message-State: APjAAAUdEduq3uGeGIrjR4X7+lm6EiKwcGUK5INtQU+PhaL0XlnbCUYI
        JyzsI2yR3IQRz5MuYqHPLFdAFcoV
X-Google-Smtp-Source: APXvYqx+bYv1DQGBl83+Eeq4X705HZYCFA6Q0ckfUXAI67YjcQ0weIWLFwYxBfNFLmS+7up1TSvWIA==
X-Received: by 2002:a5d:6390:: with SMTP id p16mr6451840wru.170.1575492771741;
        Wed, 04 Dec 2019 12:52:51 -0800 (PST)
Received: from [192.168.1.19] (cjl224.neoplus.adsl.tpnet.pl. [83.31.61.224])
        by smtp.gmail.com with ESMTPSA id 188sm7707856wmz.13.2019.12.04.12.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2019 12:52:51 -0800 (PST)
Subject: Re: "leds: gpio: Use generic support for composing LED names" breaks
 gpio debugfs
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191204110219.GV25745@shell.armlinux.org.uk>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <fb88206c-a094-df37-04af-71a1174fb0f6@gmail.com>
Date:   Wed, 4 Dec 2019 21:52:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191204110219.GV25745@shell.armlinux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Russel,

On 12/4/19 12:02 PM, Russell King - ARM Linux admin wrote:
> Hi,
> 
> Patch d7235f5feaa0 ("leds: gpio: Use generic support for composing LED
> names") changed the way labels are used.
> 
> devm_fwnode_get_gpiod_from_child() is passed led.name, which used to be
> set to the label or node name, resulting in /sys/kernel/debug/gpio
> containing useful information.  For example:
> 
>  gpio-487 (                    |udpu:green:power    ) out lo
>  gpio-488 (                    |udpu:red:power      ) out hi
>  gpio-489 (                    |udpu:green:network  ) out hi
>  gpio-490 (                    |udpu:red:network    ) out hi
>  gpio-491 (                    |udpu:green:alarm    ) out hi
>  gpio-492 (                    |udpu:red:alarm      ) out hi
> 
> After this commit, it now contains a rather less useful:
> 
>  gpio-487 (                    |?                   ) out hi ACTIVE LOW
>  gpio-488 (                    |?                   ) out hi ACTIVE LOW
>  gpio-489 (                    |?                   ) out hi ACTIVE LOW
>  gpio-490 (                    |?                   ) out hi ACTIVE LOW
>  gpio-491 (                    |?                   ) out hi ACTIVE LOW
>  gpio-492 (                    |?                   ) out hi ACTIVE LOW
> 
> This is because led.name is now NULL prior to the call to
> devm_fwnode_get_gpiod_from_child().

Ugh, my bad. But it actually has been wrong since the patch
a96aa64cb5723 ("leds/led-class: Handle LEDs with the same name"),
which enabled LED core to amend the LED name just beforehand
the registration of a LED class device.

It seem that the only proper solution would be introducing a new
pre_register_cdev(const char *name) op to the LED core, that would allow
drivers to come up with their implementation thereof. In this particular
case leds-gpio driver would need to put there gpiod initialization.

The pre_register_device op would need to be called (when available)
from the led_classdev_register_ext() after calling
led_classdev_next_name() and before device_create_with_groups().
The op would have to be passed the final_name variable then.

> While this is not an API, it is useful for debugging, and given the
> dynamic allocation of GPIOs to physical GPIOs, having the labels
> present is an advantage.
> 
> Can this be fixed / old behaviour restored?

If there are no objections I can come up with a fix, but no
sooner than at the weekend.

-- 
Best regards,
Jacek Anaszewski
