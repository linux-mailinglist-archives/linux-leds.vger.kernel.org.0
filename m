Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAB19B6E93
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 23:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387850AbfIRVCe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Sep 2019 17:02:34 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39873 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387641AbfIRVCd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Sep 2019 17:02:33 -0400
Received: by mail-wm1-f68.google.com with SMTP id v17so1521421wml.4;
        Wed, 18 Sep 2019 14:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=39DBmL3NPZlYaGf2+mi/vyYd4g8/3d1k8AdxLdaVlho=;
        b=LskLBf+Z6Sc66bVK95AoqlWO8+9NPpipXXyUkIg3j4KCLGpVHrLQxH+oXKM6TBjleh
         +AUAdY84igHIOrhpYKSl+pXnyi9TCnZYC6+ASSfxD1xdbzIkPPWHj37BkqvOO4PJjpeJ
         nKOrf1hsNSCD7T3tPpoZbvGvGyXnziQMx6atKQXNPEyhPak5/0Mwvk82ThxZm88gMN+Q
         +Yx/lfSSr3k4QI/xbP7dv+4Ki0bY2Vnm3TIYU9AXlphhUwemC5qllBFjSmRsBy5eDm+Q
         19blilI7myOncukD4vmJL6YP9EUHcVby8TdCWoyV5cM7pykbnUyCTmZLgf46H/VhPMse
         kWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=39DBmL3NPZlYaGf2+mi/vyYd4g8/3d1k8AdxLdaVlho=;
        b=ZjlkpVwZQ3Gc6fzkm3V9+Hm/s0UNKWVF/0IuSt1XEP9aBHBl/G7A0JDC6LOk3qOJKl
         /snK5mkoV/EVOacxGS9NNfmLAH/PQQ6wzQsohXTu46novqfKGFTIlVT/xmXgC+0xC1Ro
         wBRp5X/1OCdTbA8krSZ62wtMqLs8hxtEDbRLJgBZPceop/pkzJ2kWDHwBxn8X3l//2jL
         3kSu279gmOnZtInj2Cl/SQd1TRhiPF7IcRuDfRCDYs3mnnvYXEkJ7p+Fbyw0zaNy9+i3
         2Tbg7+2HtefMmwCMxkF9EdnRCR0Zl8U2SB/ZEUKmg4NKvONZ9LiHOKakdq1rY3UJBZdR
         Sqvg==
X-Gm-Message-State: APjAAAWvofsAOXsi2UOW/OEqx/C8ag8EgW8u86F2uSoT6Clcpy2xeQxu
        AhAYxm+NqSqCq6Nn8bWMgGk=
X-Google-Smtp-Source: APXvYqzHL4wU4jXe0cPM6oXEL/1Hw8z3FHtp/ci3EhjItJ6+pKBuBFxdOzB2TnsCCcj98GpMEBADJw==
X-Received: by 2002:a1c:ed02:: with SMTP id l2mr4272505wmh.155.1568840550555;
        Wed, 18 Sep 2019 14:02:30 -0700 (PDT)
Received: from [192.168.1.19] (dma211.neoplus.adsl.tpnet.pl. [83.24.56.211])
        by smtp.gmail.com with ESMTPSA id u11sm2111695wmd.32.2019.09.18.14.02.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2019 14:02:29 -0700 (PDT)
Subject: Re: [PATCH v9 1/2] dt-bindings: Add docs for EL15203000
To:     Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, pavel@ucw.cz
References: <20190918105250.22855-1-oleg@kaa.org.ua>
 <20190918105250.22855-2-oleg@kaa.org.ua>
Cc:     Rob Herring <robh+dt@kernel.org>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <5219879e-84af-a98e-2fca-10684548d416@gmail.com>
Date:   Wed, 18 Sep 2019 23:02:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918105250.22855-2-oleg@kaa.org.ua>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Oleh,

Thank you for the update.

I have some comments below. Please take a look.

On 9/18/19 12:52 PM, Oleh Kravchenko wrote:
> Add documentation and example for dt-bindings EL15203000.
> LED board (aka RED LED board) from Crane Merchandising Systems.
> 
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>  .../bindings/leds/leds-el15203000.txt         | 147 ++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.txt b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> new file mode 100644
> index 000000000000..4a9b29cc9f46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> @@ -0,0 +1,147 @@
> +Crane Merchandising System - EL15203000 LED driver
> +--------------------------------------------------
> +
> +This LED Board (aka RED LEDs board) is widely used in
> +coffee vending machines produced by Crane Merchandising Systems.
> +The board manages 3 LEDs and supports predefined blinking patterns
> +for specific leds.
> +
> +Vending area LED encoded with symbol 'V' (hex code 0x56).
> +Doesn't have any hardware blinking pattern.
> +
> +Screen light tube LED which surrounds vending machine screen and
> +encoded with symbol 'S' (hex code 0x53). Supports blinking breathing pattern:
> +
> +    ^
> +    |
> +Max >_____***___________**
> +    |    *   *         *
> +    |   *     *       *
> +    |  *       *     *
> +    | *         *   *
> +Min >*___________***______
> +    |
> +    +------^------^------> time (sec)
> +    0      4      8
> +
> +
> +Water Pipe LED actually consists from 5 LEDs

"(hex code 0x50)" is here missing if you want to be consistent.

> +that exposed by protocol like one LED. Supports next patterns:
> +
> +- cascade pattern
> +
> +     ^
> +     |
> +LED0 >*****____________________*****____________________*****
> +     |
> +LED1 >_____*****____________________*****____________________
> +     |
> +LED2 >__________*****____________________*****_______________
> +     |
> +LED3 >_______________*****____________________*****__________
> +     |
> +LED4 >____________________*****____________________*****_____
> +     |
> +     +----^----^----^----^----^----^----^----^----^----^----> time (sec)
> +     0   0.8  1.6  2.4  3.2   4   4.8  5.6  6.4  7.2   8
> +
> +- inversed cascade pattern
> +
> +     ^
> +     |
> +LED0 >_____********************_____********************_____
> +     |
> +LED1 >*****_____********************_____********************
> +     |
> +LED2 >**********_____********************_____***************
> +     |
> +LED3 >***************_____********************_____**********
> +     |
> +LED4 >********************_____********************_____*****
> +     |
> +     +----^----^----^----^----^----^----^----^----^----^----> time (sec)
> +     0   0.8  1.6  2.4  3.2   4   4.8  5.6  6.4  7.2   8
> +
> +- bounce pattern
> +
> +     ^
> +     |
> +LED0 >*****________________________________________*****_____
> +     |
> +LED1 >_____*****______________________________*****_____*****
> +     |
> +LED2 >__________*****____________________*****_______________
> +     |
> +LED3 >_______________*****__________*****____________________
> +     |
> +LED4 >____________________**********_________________________
> +     |
> +     +----^----^----^----^----^----^----^----^----^----^----> time (sec)
> +     0   0.8  1.6  2.4  3.2   4   4.8  5.6  6.4  7.2   8
> +
> +- inversed bounce pattern
> +
> +     ^
> +     |
> +LED0 >_____****************************************_____*****
> +     |
> +LED1 >*****_____******************************_____*****_____
> +     |
> +LED2 >**********_____********************_____***************
> +     |
> +LED3 >***************_____**********_____********************
> +     |
> +LED4 >********************__________*************************
> +     |
> +     +----^----^----^----^----^----^----^----^----^----^----> time (sec)
> +     0   0.8  1.6  2.4  3.2   4   4.8  5.6  6.4  7.2   8

Regarding this ASCII art - I presume you wanted to follow
Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt.

It was added to bindings because we support 'pattern' value
for linux,default-trigger, which in turn looks for 'led-pattern'
property, whose format needs to be documented in the LED bindings.

leds-trigger-pattern.txt documents only common syntax for software
pattern engine. Currently we don't have a means to setup hw_pattern
for the pattern trigger from DT, which is obvious omission and your
patch just brings it to light.

That said, I propose to fix it alongside and introduce led-hw-pattern
property. When present, ledtrig-pattern would setup the pattern
using pattern_set op, similarly as if it was set via sysfs hw_pattern
file.

Only in this case placing the pattern depiction here would be justified.
Otherwise, it would have to land in the ABI documentation.

> +
> +Required properties:
> +- compatible : "crane,el15203000"
> +- #address-cells : must be 1
> +- #size-cells : must be 0
> +
> +Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
> +apply. In particular, "reg" and "spi-max-frequency" properties must be given.
> +
> +Optional LED sub-node properties:
> +- function:
> +	see Documentation/devicetree/bindings/leds/common.txt
> +- color:
> +	see Documentation/devicetree/bindings/leds/common.txt
> +- label:
> +	see Documentation/devicetree/bindings/leds/common.txt (deprecated)
> +
> +Example
> +-------
> +
> +#include <dt-bindings/leds/common.h>
> +
> +led-controller@0 {
> +	compatible = "crane,el15203000";
> +	reg = <0>;
> +	spi-max-frequency = <50000>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* water pipe */
> +	led@50 {
> +		reg = <0x50>;
> +		function = "pipe";
> +		color = <LED_COLOR_ID_RED>;
> +	};
> +
> +	/* screen frame */
> +	led@53 {
> +		reg = <0x53>;
> +		function = "screen";
> +		color = <LED_COLOR_ID_RED>;
> +	};
> +
> +	/* vending area */
> +	led@56 {
> +		reg = <0x56>;
> +		function = "vend";
> +		color = <LED_COLOR_ID_RED>;
> +	};
> +};
> 

-- 
Best regards,
Jacek Anaszewski
