Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F42166C273
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jul 2019 23:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbfGQVOU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Jul 2019 17:14:20 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45485 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbfGQVOT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Jul 2019 17:14:19 -0400
Received: by mail-wr1-f65.google.com with SMTP id f9so26285992wre.12;
        Wed, 17 Jul 2019 14:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NAV2k4PQLpVaOv8B5/hd+OkxmtsRot12uEd3jdJAhfo=;
        b=UM/mzhfJ/Yn+yR5Q/4LlDfzuvwk/xCBL4wOvv+O25QzI6mR1+H5sQyOeQvsBCEbgTE
         bBOQhqrRpNuhBZr6dam//gLkhVuwLBX9x2Zcxt2UMcOzO4PLa9HHIfy1SxJYm35+HjV8
         Aw5bAQwZjQxSlcELu+vfURdXS+grglrDeo5l8AvKZzP5h5kI1/1rBD8cLfo4i09EYSR0
         szYvRbwTOoNr63dQK+C22219zb44UVrKuEoR8JicOggYnmmZxFp3nZYY9LDXmlUunKzF
         JGQBI05OIqAFAn/B39dRu940s/sQi9CBo5Qr8ZeV95S7Qrr+evJa66ed5eMmt2pwcFgK
         N/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=NAV2k4PQLpVaOv8B5/hd+OkxmtsRot12uEd3jdJAhfo=;
        b=ED5h6ECrj0ZBwtHolwR7xkyvY1I9busMAz0z3YPEN7uFCBlGkk6vZDnWFMhRN+agb/
         MFLCFRdZo/qgz/JFN7RRe9UEpU1Oi9/hAAkJAKbtW98W4r3FvzIH32DTPi7mMsuZrL90
         Ax3JIB5ytVx+F/HfRWVTEg3ONUOGEXIRfblK7HS8e3SCwGasDWUmjmePw4Di3j85yJDR
         0gM70sAAlO3u0GZE2HsIvzfmv54+RHyHggvHARtzMN/MorntDv8NXvgfQgxhd4u23Pw5
         vjY31XJ3N7SXoku+5Esncd5G3JF1xKNIZ9WUw1dppCyjmsGZM7bEl4Gj9/3+kBP714SH
         GOSg==
X-Gm-Message-State: APjAAAXUkyEL54evrhE+uSo0eYNdUuHYvimzBuQsIOd8IKVIjCUR3WVT
        jdtYMEFd5EXnilz6QHXNg/8=
X-Google-Smtp-Source: APXvYqweWbBWVFhAoSDb9IT9r6wEvrTjeiTpBA8uvdAzgdJn5r+tDGfYZH+wBehlVNCl/WT6Tz1aaw==
X-Received: by 2002:adf:ed04:: with SMTP id a4mr41731543wro.86.1563398056060;
        Wed, 17 Jul 2019 14:14:16 -0700 (PDT)
Received: from [192.168.1.19] (bgq113.neoplus.adsl.tpnet.pl. [83.28.80.113])
        by smtp.gmail.com with ESMTPSA id h8sm25394215wmf.12.2019.07.17.14.14.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 14:14:15 -0700 (PDT)
Subject: Re: [PATCH v5 00/26] Add generic support for composing LED class
 device name
To:     linux-leds@vger.kernel.org, pavel@ucw.cz, dmurphy@ti.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, dtor@google.com, linux@roeck-us.net
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
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
Message-ID: <405b2806-342a-952d-67ab-47516225c54e@gmail.com>
Date:   Wed, 17 Jul 2019 23:14:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi all,

I need explicit acks for some patches from this series, that
were either requested improvements or I modified them by myself
after v4.

The patches I am talking about are the following:

1/26
21/26
23/26
25/26

26/26 would be nice to have but I presume it needs more discussion
and analysis.

Best regards,
Jacek Anaszewski

On 6/9/19 9:07 PM, Jacek Anaszewski wrote:
> Changes from v4:
> 
> - switched "charge" function name to "charging"
> - added "cpu", "mute", "micmute", "disk-activity", "panic", "mtd" LED functions
>   to cover all existing triggers and removed now redundant "nand" and "mmc"
> - added "capslock", "scrollock", "numlock" LED functions
> - removed now redundant "keyboard" and "keypad" since there is "kbd_backlight"
>   already available
> - removed "tv" LED function as depreciated
> - switched LED_COLOR_ID_COUNT to LED_COLOR_ID_MAX
> - fixed led_classdev_register_ext() to not leave struct led_classdev's
>   name pointing to no longer existing composed_name stack variable
> - fixed leds-as3645 and leds-aat1290 to no longer rely on struct led_classdev's
>   name property
> - added basic LED class device name validation to get_led_device_info.sh
> - tweaked LED naming section in leds_class.txt to allow devicename section
>   also for non hot-pluggable devices
> - always initialize all fields of struct led_init_data to zero on declaration
>   in drivers
> - fix leds-gpio to avoid overwriting the LED name coming from platform_data
> - add description of LED function names with regard to whether devicename
>   section is initialized or not
> 
> Changes from v3:
> 
> - allow for devicename section for hot-pluggable devices
> - move led_colors array to led-core.c to avoid build break
>   due to Kconfig dependency issue
> - add a patch fixing led_colors array name clash with ALSA driver
> - change led-enumerator DT property name to more meaningful function-enumerator
> - add LED_FUNCTION_KBD_BACKLIGHT
> - change naming and add new proprties to struct led_init_data
>   and struct led_properties
> 
> Changes from v2:
> 
> - removed from drivers the responsibility of calling led_compose_name()
> - added struct device* argument to led_compose_name() to allow using
>   dev_<level> logging functions for more informative logs
> - adjusted the list of LED_FUNCTION definitions according to the v2 review
>   remarks
> - renamed default_desc to default_label in the struct led_init_data
> - added led-enumerator DT property to the common LED bindings
> - removed LED_COLOR_NAME definitions from include/dt-bindings/leds/common.h
> - change DT color property type from string to integer
> - change struct initialization list to explicit property assignment in leds-sc27xx-bltc.c
> - use led->client->name for led_hw_name in leds-lm3692x.c
> - few other minor improvements to docs etc.
> 
> Changes from v1:
> 
> - improved led_parse_properties() to parse label property at first
>   and return immediately after parsing succeeds
> - added tool get_led_device_info.sh for retrieving LED class device's
>   parent device related information
> - extended LED naming section of Documentation/leds/leds-class.txt
> - adjusted the list of LED_FUNCTION definitions according to the v1 review
>   remarks
> - added standard LED_COLOR_NAME definitions
> - removed functions.h and moved both LED_FUNCTION and LED_COLOR_NAME
>   definitions to include/dt-bindings/common.h
> - rebased leds-as3645a changes on top of the patch switching to fwnode
>   property API
> - updated DT bindings to use new LED_COLOR_NAME definitions
> - improved common LED bindings to not use address unit for sub-nodes
>   without reg property
> 
> Generally I still insist on deprecating label property and devicename
> section of LED name. The tool I added for obtaining LED device name
> proves availability of the related information in other places in
> the sysfs. Other discussed use cases are covered in the updated
> Documentation/leds/leds-class.txt.
> 
> Beside that, I tried also to create macros for automatic composition
> of "-N" suffixed LED functions, so that it would not be necessary
> to pollute common.h with plenty repetitions of the same function,
> differing only with the postfix. Unfortunately, the preprocessor
> of the dtc compiler seems not to accept string concatenetation.
> I.e. it is not possible to to the following assighment:
> 
> function = "hdd""-1"
> 
> If anyone knows how to obviate this shortocoming please let me know.
> 
> Original cover letter:
> 
> LED class device naming pattern included devicename section, which had
> unpleasant effect of varying userspace interface dependent on underlaying
> hardware. Moreover, this information was redundant in the LED name, since
> the LED controller name could have been obtained from sysfs device group
> 
> This patch set introduces a led_compose_name() function in the LED core,
> which unifies and simplifies LED class device name composition. This
> change is accompanied by the improvements in the common LED DT bindings
> where two new properties are introduced: "function" and "color" . The two
> deprecate the old "label" property which was leaving too much room for
> interpretation, leading to inconsistent LED naming.
> 
> There are also changes in LED DT node naming, which are in line with
> DT maintainer's request from [0].
> 
> Since some DT LED naming unification, related to not including devicename
> section in "label" DT property, is being requested during reviews of new
> LED class drivers for almost a year now, then those drivers are the first
> candidates for optimalization and the first users of the new
> led_compose_name() API. The modifications were tested with Qemu,
> by stubbing the driver internals where hardware interaction was needed
> for proper probing.
> 
> Thanks,
> Jacek Anaszewski
> 
> Jacek Anaszewski (26):
>   leds: class: Improve LED and LED flash class registration API
>   dt-bindings: leds: Add LED_COLOR_ID definitions
>   dt-bindings: leds: Add LED_FUNCTION definitions
>   dt-bindings: leds: Add properties for LED name construction
>   leds: core: Add support for composing LED class device names
>   dt-bindings: sc27xx-blt: Add function and color properties
>   leds: sc27xx-blt: Use generic support for composing LED names
>   dt-bindings: lt3593: Add function and color properties
>   leds: lt3593: Use generic support for composing LED names
>   dt-bindings: lp8860: Add function and color properties
>   leds: lp8860: Use generic support for composing LED names
>   dt-bindings: lm3692x: Add function and color properties
>   leds: lm3692x: Use generic support for composing LED names
>   dt-bindings: lm36010: Add function and color properties
>   leds: lm3601x: Use generic support for composing LED names
>   dt-bindings: cr0014114: Add function and color properties
>   leds: cr0014114: Use generic support for composing LED names
>   dt-bindings: aat1290: Add function and color properties
>   leds: aat1290: Use generic support for composing LED names
>   dt-bindings: as3645a: Add function and color properties
>   leds: as3645a: Use generic support for composing LED names
>   dt-bindings: leds-gpio: Add function and color properties
>   leds: gpio: Use generic support for composing LED names
>   dt-bindings: an30259a: Add function and color properties
>   leds: an30259a: Use generic support for composing LED names
>   leds: Document standard LED functions
> 
>  .../devicetree/bindings/leds/ams,as3645a.txt       |  22 +-
>  Documentation/devicetree/bindings/leds/common.txt  |  62 +++++-
>  .../devicetree/bindings/leds/leds-aat1290.txt      |  12 +-
>  .../devicetree/bindings/leds/leds-an30259a.txt     |  22 +-
>  .../devicetree/bindings/leds/leds-cr0014114.txt    |  26 ++-
>  .../devicetree/bindings/leds/leds-gpio.txt         |  23 ++-
>  .../devicetree/bindings/leds/leds-lm3601x.txt      |  10 +-
>  .../devicetree/bindings/leds/leds-lm3692x.txt      |   9 +-
>  .../devicetree/bindings/leds/leds-lp8860.txt       |   9 +-
>  .../devicetree/bindings/leds/leds-lt3593.txt       |  11 +-
>  .../devicetree/bindings/leds/leds-sc27xx-bltc.txt  |  10 +-
>  Documentation/leds/led-functions.txt               | 223 +++++++++++++++++++++
>  Documentation/leds/leds-class.txt                  |  70 ++++++-
>  drivers/leds/led-class-flash.c                     |   9 +-
>  drivers/leds/led-class.c                           |  49 +++--
>  drivers/leds/led-core.c                            | 127 ++++++++++++
>  drivers/leds/leds-aat1290.c                        |  16 +-
>  drivers/leds/leds-an30259a.c                       |  25 +--
>  drivers/leds/leds-as3645a.c                        |  74 +++----
>  drivers/leds/leds-cr0014114.c                      |  33 +--
>  drivers/leds/leds-gpio.c                           |  26 +--
>  drivers/leds/leds-lm3601x.c                        |  38 ++--
>  drivers/leds/leds-lm3692x.c                        |  22 +-
>  drivers/leds/leds-lp8860.c                         |  35 ++--
>  drivers/leds/leds-lt3593.c                         |  20 +-
>  drivers/leds/leds-pwm.c                            |   2 +-
>  drivers/leds/leds-sc27xx-bltc.c                    |  22 +-
>  drivers/leds/leds.h                                |   1 +
>  include/dt-bindings/leds/common.h                  |  55 ++++-
>  include/linux/led-class-flash.h                    |  15 +-
>  include/linux/leds.h                               |  79 +++++++-
>  tools/leds/get_led_device_info.sh                  | 201 +++++++++++++++++++
>  32 files changed, 1086 insertions(+), 272 deletions(-)
>  create mode 100644 Documentation/leds/led-functions.txt
>  create mode 100755 tools/leds/get_led_device_info.sh
> 


