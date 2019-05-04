Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91F2C13BF4
	for <lists+linux-leds@lfdr.de>; Sat,  4 May 2019 21:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbfEDTet (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 May 2019 15:34:49 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36457 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbfEDTet (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 May 2019 15:34:49 -0400
Received: by mail-lf1-f65.google.com with SMTP id u17so6574520lfi.3;
        Sat, 04 May 2019 12:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1wfn3Q2cybCONCJ5+1Sj9jHv6C9CJfPk7+W2BIzpFe0=;
        b=LVZZ5ogs5afBfrLHUJbOJTdoV1fLIvKZFiaOo2/MwKCYRG9swlTX+P3vaoS7BLeYHk
         +Iw4BDQdX+r3jCHJaVKXuGoQ0Yh0v4WE5JVB289OIaOdJogw/kA1KeHuxcjIpmOVAOst
         QoGPLRpEMeplHXL2qUJhLqbElOrkGPwya0CHpjuFFZWIi/NG+93vPNH49gTbbeJQET9x
         s6c6JyubkwkM5XgLvwBXW9FkviaTr40EAYGeNPoz/GS6nvBU74Tr1//H68OhnVsbsed2
         tr+ZhtpEg6vqfjOWwvl0AALq/DOTUE6j3ZbFNRlx8/8oToJV5BplHrHHcVBXKy4zb7nn
         1BJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1wfn3Q2cybCONCJ5+1Sj9jHv6C9CJfPk7+W2BIzpFe0=;
        b=HnRIjrRHG9GhSbDckeV3iPlIpaymO6eFsdVbbuUtgEiwVbSgOULLmMwduZ4KGE4qLP
         fYJ6NMZuMiKuJlpJbWa0VpG68dTzct58S9GTd7oiCYHKKkgjjUXl/wp1UNsI/uqIQT4l
         9vfXQ0NY1WX+2mZb+cag40uzXhuAd0wM2YbTS0pKxjzie8nbMc1p4VwSfMKqWu4i77O6
         Y+7LFFPj69gg99e5PWK5PGgAB7K1asPGvNfEk9BBeLruaj8BlwxvNGblty8q1SGOv/BM
         iywg+dHBW4vxg4QFLn5Ho0lblYc38ojb8Ww2652bwcEgAhh5AnNrRkHjSGWNFWh0H3I1
         5VqQ==
X-Gm-Message-State: APjAAAX1z/qVfTg2NLEUm11jDA3nHf0fJNwR+WxbVjk1DqG5a4Dbn4Zj
        lzKNReubBd90iZJxiY8PpFQ=
X-Google-Smtp-Source: APXvYqyPTk8WcjZTWHH8ZNIu/I4ktyIMDhh2u21IG1wz+08/enNNXivhOnvQwPBqLKZ7mNPk5ULVzA==
X-Received: by 2002:a19:ae15:: with SMTP id f21mr2468307lfc.86.1556998486608;
        Sat, 04 May 2019 12:34:46 -0700 (PDT)
Received: from [192.168.1.19] (cit41.neoplus.adsl.tpnet.pl. [83.31.43.41])
        by smtp.gmail.com with ESMTPSA id c25sm934485ljb.20.2019.05.04.12.34.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 May 2019 12:34:45 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add binding for ubnt-spi LED.
To:     list@c-mauderer.de, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Christian Mauderer <oss@c-mauderer.de>
References: <20190504122825.11883-1-list@c-mauderer.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <4889e87a-5c7a-da74-bff6-c20fd07ea0f4@gmail.com>
Date:   Sat, 4 May 2019 21:34:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190504122825.11883-1-list@c-mauderer.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Christian,

Thank you for the patch.

On 5/4/19 2:28 PM, list@c-mauderer.de wrote:
> From: Christian Mauderer <oss@c-mauderer.de>
> 
> This patch adds the binding documentation for the LED controller found
> in Ubiquity airCube ISP devices.
> 
> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
> ---
> 
> I tested the patches with a 4.14 and a 4.19 kernel on the current OpenWRT.
> Although I didn't get the kernel running due to file system problems they build
> fine with a 5.1-rc7.
> 
> I shortly described the protocol of the controller in a comment in the driver
> file in the second patch.
> 
> Checkpatch gives the following warning for both patches:
> 
>    WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> 
> To be honest: I don't know what to do with it. Please excuse my ignorance here.
> It's the first driver that I want to add to the Linux kernel.

You can add yourself as a maintainer of this driver, but it is customary
rather for more complex drivers.

> Please point me to some documentation if I did miss some big points for
> submitting patches.
> 
> 
>   .../bindings/leds/leds-ubnt-spi.txt           | 49 +++++++++++++++++++
>   1 file changed, 49 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-ubnt-spi.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-ubnt-spi.txt b/Documentation/devicetree/bindings/leds/leds-ubnt-spi.txt
> new file mode 100644
> index 000000000000..ab1478cdc139
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-ubnt-spi.txt
> @@ -0,0 +1,49 @@
> +Binding for the controller based LED found in Ubiquity airCube ISP and most
> +likely some other Ubiquity devices.
> +
> +The protocol of the controller is quite simple. Only one byte will be sent. The
> +value of the byte can be between the ubnt-spi,off_bright value and the
> +ubnt-spi,max_bright value.
> +
> +The driver maybe can be used for other devices with a similar protocol too.
> +
> +Required properties:
> +- compatible:		Should be "ubnt,spi-led".
> +- spi-max-frequency:	Should be <100000> for this device.
> +
> +Optional sub-node properties:
> +- ubnt-spi,off_bright:	The value that will be sent if the LED should be
> +			switched off. Default value is 0.
> +- ubnt-spi,max_bright:	Value for the maximum brightness. Default value for that
> +			is 63.
> +- label:		A label for the LED. If one is given, the LED will be
> +			named "ubnt-spi:<label>" or "ubnt-spi::" otherwise.
> +
> +Being a SPI device this driver should be a sub-node of a SPI controller. The
> +controller only supports one LED. For consistence with other controllers, the
> +LED is defined as a sub-node.
> +
> +Example for the airCube ISP (with SPI controller matching that device):
> +
> +led_spi {
> +	compatible = "spi-gpio";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	gpio-sck = <&gpio 3 GPIO_ACTIVE_HIGH>;
> +	gpio-mosi = <&gpio 2 GPIO_ACTIVE_HIGH>;
> +	cs-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
> +	num-chipselects = <1>;

SPI node implementation is out of LED bindings scope.
Here you're showing spi-gpio configuration, but people are free to use
hardware SPI module if available on the platform of their choice.

Effectively, please remove above led_spi node. You can compare other SPI
based LED bindings, e.g.:

Documentation/devicetree/bindings/leds/leds-cr0014114.txt

> +	led_ubnt@0 {

s/led_usbnt/led-controller/

> +		compatible = "ubnt,spi-led";
> +		reg = <0>;
> +		spi-max-frequency = <100000>;
> +
> +		led {
> +			label = "system";

In label we expect "color:function" pattern. If section is to be left
empty than just leave it blank, e.g.:

			label = ":system"

But, is this LED function name telling something useful?
What is the actual function of this LED?

I work for some time on LED unification patch set and there is
a patch with common LED function names [0], but there is nothing
suitable for access points. There is "wlan", but is is rather for
wifi dongle LEDs (side note: "wifi" seems to be more ubiquitous,
so I will probably go for it finally).

So, maybe we for access points "wifi-ap" would work?
i.e. I propose the label in the form:

			label  = ":wifi-ap"


> +			/* keep the LED slightly on to show powered device */
> +			ubnt-spi,off_bright = /bits/ 8 <4>;
> +		};
> +	};
> +};
> 

[0] https://www.spinics.net/lists/kernel/msg3103824.html

-- 
Best regards,
Jacek Anaszewski
