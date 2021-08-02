Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55FBF3DE25F
	for <lists+linux-leds@lfdr.de>; Tue,  3 Aug 2021 00:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231827AbhHBWSA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 2 Aug 2021 18:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbhHBWR7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 2 Aug 2021 18:17:59 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8CDFC06175F
        for <linux-leds@vger.kernel.org>; Mon,  2 Aug 2021 15:17:48 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id h11so25736000ljo.12
        for <linux-leds@vger.kernel.org>; Mon, 02 Aug 2021 15:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KFSn9bFWX5R3uMZYYsUrZO5gb0YcODIyOW1PTMw3DAg=;
        b=Sq4K6+efh+FYoqUXrm/eKVt6SSp+TtIDycn5GEnsqVI9BmtBYu6Fy868zl5z1beSW5
         GbQBmsU6oo0e4ZOtc1s0CT6NQdtQbsnPTnx+UC6JuLFQRiD1KeXix5bGFNeDbA9TFIho
         LuHOiwje3UQr5AxUL/pfFXNgYtn9n4ld2aNwmfFhWwWKl8zuTB9+8hCwE5CBKpxUKcBh
         0NECkR3KIUYSrk22+y7dW5OzCRzIBaJRG/JVgsimsJP2tu7bMEbDbCvrTAZeXkZkWL8p
         jNWlVQLMrU1sU6AueLf3i8iGD5ceQLz1/W2kEegrBmA2Hd2NGNU6aghabPmRqfVeEpsi
         u3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KFSn9bFWX5R3uMZYYsUrZO5gb0YcODIyOW1PTMw3DAg=;
        b=VwLqiLK7mS1hLIz9w3Xc7Ce5aUOx2tag6cpQ8d6JCWo1F84EfEd6iY31b9Qwz/e4R1
         bKrOCLTFbJS0Fb94zG6RAGdMXkx3cTL1kUipNHDOr0JGiEw0smCDH32f0P6lzYiaWHqN
         QPowwv9EbP7nZyXYk6zA23QFJUowODQA9bNDuOXxymTaj9Y1u0fsTosEBTfOh0c7a9Pp
         7bL+IseWVUIj+/G3QKybMZm9s3GlYoMYOKb3k3I48PlJjeM/Nuwj1QqYuTw60/fY7zVs
         4cU+RTifYaXfBzGYFxiCiPA2F3LfBn1ETx40TSYMdVQuWNI245C6CDT5TZmVBwjshucM
         77MQ==
X-Gm-Message-State: AOAM533iyH8OcLYDYkMYXpU2aVPideIX/Lgo7rVqnwMWqOPqsd2iqJvv
        NZC2KobgOlj0WsycxUPM3Rk=
X-Google-Smtp-Source: ABdhPJyScIig6zQk9OYn1ZF4i7mSP8wRq3dmFvWPEnf+sRHnODtpgjP1zUBVQryENPFeBrnF+hLakA==
X-Received: by 2002:a2e:82cf:: with SMTP id n15mr12610013ljh.294.1627942666983;
        Mon, 02 Aug 2021 15:17:46 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id z11sm1069449lfb.52.2021.08.02.15.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Aug 2021 15:17:46 -0700 (PDT)
Subject: Re: lp50xx: LED banking appears to be broken
To:     =?UTF-8?Q?Jan_Kundr=c3=a1t?= <jan.kundrat@cesnet.cz>,
        linux-leds@vger.kernel.org
Cc:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
References: <d049e22d-5ff8-4a68-a46c-3a1d533afcd0@cesnet.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <b3fc778d-c94e-c8a3-3f3b-84e146a08627@gmail.com>
Date:   Tue, 3 Aug 2021 00:17:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <d049e22d-5ff8-4a68-a46c-3a1d533afcd0@cesnet.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jan,

On 7/31/21 10:14 AM, Jan Kundrát wrote:
> Hi there,
> I'm trying to use the LP5009 chip with the following HW setup:
> 
> - channels 1-6 drive a big, 20mm LED module which internally consists of 
> six independent LEDs
> - channels 7, 8 and 9 drive a RGB LED as usual.
> 
> I thought that a DT bindings like this will work:
> 
>      led-controller@0c {
>          compatible = "ti,lp5009";
>          reg = <0x0c>;
>          #address-cells = <1>;
>          #size-cells = <0>;
>          status = "okay";
> 
>          multi-led@1 {
>              #address-cells = <1>;
>              #size-cells = <0>;
>              reg = <1>;
>              label = "tally:1";
>              led {
>                  color = <LED_COLOR_ID_RED>;
>              };
>          };
>          multi-led@2 {
>              #address-cells = <1>;
>              #size-cells = <0>;
>              reg = <2>;
>              label = "tally:2";
>              led {
>                  color = <LED_COLOR_ID_RED>;
>              };
>          };
>          multi-led@3 {
>              #address-cells = <1>;
>              #size-cells = <0>;
>              reg = <3>;
>              label = "tally:3";
>              led {
>                  color = <LED_COLOR_ID_RED>;
>              };
>          };
>          multi-led@4 {
>              #address-cells = <1>;
>              #size-cells = <0>;
>              reg = <4>;
>              label = "tally:4";
>              led {
>                  color = <LED_COLOR_ID_RED>;
>              };
>          };
>          multi-led@5 {
>              #address-cells = <1>;
>              #size-cells = <0>;
>              reg = <5>;
>              label = "tally:5";
>              led {
>                  color = <LED_COLOR_ID_RED>;
>              };
>          };
>          multi-led@6 {
>              #address-cells = <1>;
>              #size-cells = <0>;
>              reg = <6>;
>              label = "tally:6";
>              led {
>                  color = <LED_COLOR_ID_RED>;
>              };
>          };
> 
>          multi-led@7 {
>              #address-cells = <1>;
>              #size-cells = <2>;
>              reg = <7 8 9>;
>              color = <LED_COLOR_ID_RGB>;
>              label = "preview";
> 
>              led@7 {
>                  color = <LED_COLOR_ID_RED>;
>              };
>              led@8 {
>                  color = <LED_COLOR_ID_GREEN>;
>              };
>              led@9 {
>                  color = <LED_COLOR_ID_BLUE>;
>              };
>          };
>      };
> 
> This has drawbacks:
> 
> - I get a multicolor sysfs entry for each of the six red sub-LEDs, which 
> probably doesn't make much sense.

Feel free to add support for monochrome LED class to the driver,
similarly like it was done for drivers/leds/leds-lp55xx-common.c.

> I cannot do a one "multicolor" LED

This is due to the limitation imposed by Pavel Machek in the LED core:

BUG_ON(props.color == LED_COLOR_ID_MULTI);

You'd have to convince him that having multi color LED other than RGB
is reasonable :-)

> with six channels because there appears to be a limit of 3 channels, and 
> because the order of channels is documented to be non-deterministic, so 

You can determine the order of LEDs via multi_index file.
See Documentation/ABI/testing/sysfs-class-led-multicolor.

> that would require me to come up with fake names or something. Also, 
> driving this from userspace means two writes for each sub-LED.
> 
> - The sysfs entries do not appear to drive correct LEDs. For example, a 
> write to tally:5 or tally:6 results in an error:
> 
> lp50xx 1-000c: Cannot write intensity value -5
> leds tally:6: Setting an LED's brightness failed (-5)

You mixed deprecated 'label' DT property with 'color' in your DT nodes.
I haven't tracked down that in detail, but it may certainly have some
negative impact on how LEDs are named and presented in sysfs.
Please first sort it out, and let's see if something gets better
afterwards.

> I tried to simplify this, and kept just the one RGB LED (that is, the 
> multi-led@7 and led@7, led@8 and led@9 stanzas). This resulted in the 
> following regmap entries after init:
> 
> # cat /sys/kernel/debug/regmap/1-000c/registers 00: 40
> 01: 3c
> 02: 80
> 03: ff
> 04: 0f
> 05: 0f
> 06: 0f
> 07: 0f
> 08: ff
> 09: ff
> 0a: ff
> 0b: 0f
> 0c: 00
> 0d: 00
> 0e: 00
> 0f: 00
> 10: 00
> 11: 00
> 12: 00
> 13: 00
> 14: 00
> 15: 00
> 16: 00
> 17: ff
> 
> Clearly, that's wrong because it sets register's 0x02 reserved bits to 
> non-zero. It looks as if the LED's channel number gets translated to the 
> bank number, which is wrong. There are nine LEDs on LP5009, but only 
> three individual banks.
> 
> Also, I don't think that the concept of "banks" as defined in LP50xx 
> chips should be used in the Linux driver. The datasheet is not terribly 
> specific on details, but it looks to me that the "banks" are for a use 
> case where multiple physical LEDs are to, e.g., "breathe together". The 
> chip indeed imposes some limitations when banking is enabled:
> 
> - LED0 will always be on channels 1-3. That's incompatible with the 
> current code which uses the `reg` DT property and allows arbitrary 
> assigning of channels to a LED's color inputs. I can have a Linux RGB 
> LED which uses channels 1, 5 and 9 just fine, but I cannot use banking 
> for that.
> 
> - Bank A always drives the first color of all LEDs that have banking 
> enabled. Bank B is always for the second color, and bank C always 
> applies to the third color.
> 
> As far as I can tell, there's no support for cross-LED control in Linux, 

That's for LED multicolor class was designed for.

> so I think that we can just rip support for banking from this driver. 
> The main motivation appears to be saving some I2C bandwidth and MCU 
> cycles. If the driver was serious about this, it would use register 
> auto-increment as a first step I suppose, but the regmap subsystem as-is 
> updates all registers independently.

The main motivation for having support for banking was taking
advantage of hardware support for synchronous setting of intensity
on multiple iouts.

> Before I send a patch which implements all that, I wanted to ask if I 
> understood everything right, and to check whether these suggestions make 
> sense to the maintainer and to the original author of the driver (and, 
> hopefully, to the users as well).

As I mentioned above, adding a support for monochrome LEDs to the driver
would be probably welcome, but you would need to hear the final word on
that from Pavel.

-- 
Best regards,
Jacek Anaszewski
