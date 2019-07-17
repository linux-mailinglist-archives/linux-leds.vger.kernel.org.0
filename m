Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 955026C265
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jul 2019 23:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbfGQVDJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Jul 2019 17:03:09 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37234 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbfGQVDJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Jul 2019 17:03:09 -0400
Received: by mail-wr1-f66.google.com with SMTP id n9so1228225wrr.4;
        Wed, 17 Jul 2019 14:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7G3cT9KrL4vNeHNtAQ5iSocM749GHaSrKdFhS+CuwUA=;
        b=hoCONj94MduawEJxaVlnXMMh6ESD3xJVbTeFnMIoOrAX2QaZU4T4Jld/tvzMreanhE
         GB2ZjQp4x4oKAcherQIJ9hTZwc9bcf3iVy0KgQpOMfclJDWocQ4+ya+D3/fySqQlUNTE
         XsYLPNqPUunXSTrMB3faiTm5yh42LOKXJg0ey8+d+CT2ktFsnTz9cIEZOVPQm/dun2z3
         pRNUYSiLiknOypGKcqZfsK4h9Av/cHhxdrJHJuYUD0qJUcONwl74jJRZwpQf+R0OANLM
         QKay6LrxPUI/dqSjhJd4j1xGQBn4FJyFBs0Sjq+bxv4+1bvQAoChVD6GrNRRxkTvQ3D1
         i5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7G3cT9KrL4vNeHNtAQ5iSocM749GHaSrKdFhS+CuwUA=;
        b=f9sqtZsliwe4C5+EKok1AtKYQzo7Eu9MlpsVl2RbJ6WKSdYF7PKHjhnTOAaq9VnrqE
         OpyYecHn/JVe9ByLezWm3e/QGgJIT1c0Zyg3ttPchDc85fBMHq+wWg6mDo/Nc3MzlADG
         i4q0egQOl7ThsYsv11QaD9ImT0iy27TaImpgl0tsqh5DNQtIJVCKWdB7PB902iHmHrKD
         j6oLcpH9cgB9V330eU3uVMIeEHjs4Y3q8bv7YhK/mnOk01iwmP9JeuGno5lbj9XiTWNy
         Vwl81tS7Lm60Lf2YjOivp928rsY3+P/hYINWAsjhDRewX1QPV9mdDkIIewninmr5mEMD
         Gaew==
X-Gm-Message-State: APjAAAVjVOdIECu3MaF8WoK1eHbnJjfJMyspDQgCrFRKSaL7+ox06W04
        i0QRVRJW7f8MgHuavGPdLZI=
X-Google-Smtp-Source: APXvYqyjgjWw1fGWe+pb2/AzRE08V6T3ZUR0Ia24RI5Er50deUUD7ngSJ3gwdov0OmiWRVygjGDdIQ==
X-Received: by 2002:a05:6000:100f:: with SMTP id a15mr25035139wrx.325.1563397386345;
        Wed, 17 Jul 2019 14:03:06 -0700 (PDT)
Received: from [192.168.1.19] (bgq113.neoplus.adsl.tpnet.pl. [83.28.80.113])
        by smtp.gmail.com with ESMTPSA id j10sm24209744wrw.96.2019.07.17.14.03.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 14:03:05 -0700 (PDT)
Subject: Re: [PATCH v5 05/26] leds: core: Add support for composing LED class
 device names
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org, dtor@google.com,
        linux@roeck-us.net, dmurphy@ti.com,
        Baolin Wang <baolin.wang@linaro.org>,
        Daniel Mack <daniel@zonque.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Oleh Kravchenko <oleg@kaa.org.ua>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Simon Shields <simon@lineageos.org>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
 <20190609190803.14815-6-jacek.anaszewski@gmail.com>
 <20190703220043.GA876@amd>
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
Message-ID: <1cc95085-2465-9f01-094b-c4233cd665c1@gmail.com>
Date:   Wed, 17 Jul 2019 23:03:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190703220043.GA876@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On 7/4/19 12:00 AM, Pavel Machek wrote:
> Hi!
> 
> Sorry for the delay.

No problem.

>> @@ -27,6 +29,18 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
>>  LIST_HEAD(leds_list);
>>  EXPORT_SYMBOL_GPL(leds_list);
>>  
>> +const char *led_colors[LED_COLOR_ID_MAX] = {
> 
> const char * const , if we want to play that game?

Ack.

>> +	[LED_COLOR_ID_WHITE] = "white",
>> +	[LED_COLOR_ID_RED] = "red",
>> +	[LED_COLOR_ID_GREEN] = "green",
>> +	[LED_COLOR_ID_BLUE] = "blue",
>> +	[LED_COLOR_ID_AMBER] = "amber",
>> +	[LED_COLOR_ID_VIOLET] = "violet",
>> +	[LED_COLOR_ID_YELLOW] = "yellow",
>> +	[LED_COLOR_ID_IR] = "ir",
>> +};
>> +EXPORT_SYMBOL_GPL(led_colors);
>> +
> 
>> +	if (fwnode_property_present(fwnode, "label")) {
>> +		ret = fwnode_property_read_string(fwnode, "label", &props->label);
>> +		if (ret)
>> +			dev_err(dev, "Error parsing \'label\' property (%d)\n", ret);
>> +		return;
> 
> I don't think you need to escape ' with \.

Right.

>> +	if (fwnode_property_present(fwnode, "function")) {
>> +		ret = fwnode_property_read_string(fwnode, "function", &props->function);
>> +		if (ret) {
>> +			dev_err(dev,
>> +				"Error parsing \'function\' property (%d)\n",
>> +				ret);
>> +		}
>> +	} else {
>> +		return;
>> +	}
> 
>> +
>> +	if (fwnode_property_present(fwnode, "function-enumerator")) {
> 
> I'd do if (!fwnode_property_present()) return; in both occasions, to
> save an indentation level; but that's nitpicking.

Ack.

>> +	if (props.label) {
>> +		/*
>> +		 * If init_data.devicename is NULL, then it indicates that
>> +		 * DT label should be used as-is for LED class device name.
>> +		 * Otherwise the label is prepended with devicename to compose
>> +		 * the final LED class device name.
>> +		 */
>> +		if (!devicename) {
>> +			strncpy(led_classdev_name, props.label,
>> +				LED_MAX_NAME_SIZE);
>> +		} else {
>> +			snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
>> +				 devicename, props.label);
>> +		}
> 
> Unlike snprintf(), strncpy() does not guarantee NULL termination.

Indeed. I'll change strncpy to strscpy.

> I did not check the shell script.
> 
> With that fixed,
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>

Thanks!

-- 
Best regards,
Jacek Anaszewski
