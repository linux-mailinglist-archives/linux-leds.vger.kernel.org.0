Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71EFB15238
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 19:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfEFRDn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 13:03:43 -0400
Received: from hamsrv800.servertools24.de ([213.238.32.28]:56761 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726386AbfEFRDn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 May 2019 13:03:43 -0400
Received: from christian-pc.localdomain (p54A59A9B.dip0.t-ipconnect.de [84.165.154.155])
        by hamsrv800.servertools24.de (Postfix) with ESMTPSA id 5BDDA2382BE2;
        Mon,  6 May 2019 19:03:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-mauderer.de;
        s=default; t=1557162219;
        bh=6A9X4ULypNI5yNraHZG6a+ELI/XCIsmNtXaT5jjhERY=; l=6546;
        h=Subject:To:From;
        b=R9LxbGX64TQtmMYVEqBxLzx+4KnOVLg4zQxrk1LgMLS2Ljqs2IEt82M1EAQ4PG694
         uqGLkVc+FBdwz4Jk6vS3V8gllsauHj52poLe5OGWHN6tSvN6/HyJnenzC9pmI/QseW
         lFMs4LP3Pxk9MfaegiekMwWlYh5w9KEC0oxsuEq8=
Authentication-Results: hamsrv800.servertools24.de;
        spf=pass (sender IP is 84.165.154.155) smtp.mailfrom=oss@c-mauderer.de smtp.helo=christian-pc.localdomain
Received-SPF: pass (hamsrv800.servertools24.de: connection is authenticated)
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add binding for spi-byte LED.
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <CAL_JsqKmKzSw2-mfmBbhpyY=Ku6H7cE2KZrgkcPD7kAS_GqbFw@mail.gmail.com>
From:   Christian Mauderer <oss@c-mauderer.de>
Message-ID: <4e91d5e7-a583-58d5-9c14-ad86029ed9e7@c-mauderer.de>
Date:   Mon, 6 May 2019 19:03:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKmKzSw2-mfmBbhpyY=Ku6H7cE2KZrgkcPD7kAS_GqbFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <155716221969.11683.17010260934176343184@hamsrv800.servertools24.de>
X-PPP-Vhost: c-mauderer.de
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 06/05/2019 18:21, Rob Herring wrote:
> On Sun, May 5, 2019 at 3:00 PM <oss@c-mauderer.de> wrote:
>>
>> From: Christian Mauderer <oss@c-mauderer.de>
>>
>> This patch adds the binding documentation for a simple SPI based LED
>> controller which use only one byte for setting the brightness.
>>
>> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
>> ---
>>
>> Changes compared to v2:
>> - None
>>
>> Changes compared to v1:
>> - rename ubnt-spi to leds-spi-byte
>> - rename "ubnt-spi,off_bright" and "ubnt-spi,max_bright" to
>>   "leds-spi-byte,off-value" and "leds-spi-byte,max-value" and mark them required
>> - rename led-controller node to "led-controller"
>> - extend description
>> - remove SPI controller
>> - use "white:status" for the example label
>>
>>
>>  .../bindings/leds/leds-spi-byte.txt           | 47 +++++++++++++++++++
>>  1 file changed, 47 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-spi-byte.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-spi-byte.txt b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
>> new file mode 100644
>> index 000000000000..1dd6ab03a56d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
>> @@ -0,0 +1,47 @@
>> +* Single Byte SPI LED Device Driver.
>> +
>> +The driver can be used for controllers with a very simple SPI protocol: Only one
>> +byte will be sent. The value of the byte can be any value between the off-value
>> +and max-value defined in the properties.
>> +
>> +One example where the driver can be used is the controller in Ubiquiti airCube
>> +ISP devices. That LED controller is based on a 8 bit microcontroller (SONiX
>> +8F26E611LA) that has been programmed to control the single LED of the device.
> 
> What about power control of the uC?

You mean if the uC receives a reset or power cycle independent of the
main controller? I don't think that this can happen on that board. But I
don't have any schematics to prove that.

> 
>> +The controller supports four modes depending on the highest two bits in a byte:
>> +One setting for brightness, the other three provide different blink patterns.
> 
> This part seems in no way generic.
> 
> How does one support the blink patterns?

You are correct that this part is not generic. But a multi-purpose
driver like the one I proposed could deliver a basic support for the
device by controlling the brightness.

It's only a basic support so the blink patterns are not supported.

I had a look at the functions in "struct led_classdev". There is a
blink_set(..) function that expects that delay_on and delay_off can be
set independent. That's not possible for hardware supported blinking on
this device. The other function pattern_set(..) would allow an even more
universal interface. All possible patterns of the LED could be covered
in that but I don't think that this is true the other way round.

So in my opinion the only thing that can be implemented in a useful way
for that controller is the brightness.

> 
>> +With the leds-spi-byte driver a basic support for the brightness mode of that
>> +controller can be easily achieved by setting the minimum and maximum to the
>> +brightness modes minimum and maximum byte value.
>> +
>> +Required properties:
>> +- compatible:          Should be "leds-spi-byte".
> 
> Generally, we don't do "generic" bindings like this. The exceptions
> are either we have confidence they really can be generic or they where
> created before we knew better. A sample size of 1 doesn't convince me
> the former is true.

I could construct another sample (some SPI-based digital potentiometer
where you set values between 17 and 213) but I doubt that it would be a
good idea to fight for the name.

My original target device is a quite special one: I don't have a chip
number. The controller Ubiquiti built here is based on a microcontroller
that could be anything. The general device is named "Ubiquiti airCube
ISP" or (a short form that I found at some locations) ubnt-acb-isp. I
assume that they used the same controller in the non-ISP-version but I
haven't checked that. So how about one of these:

- ubnt,spi-byte-led
- ubnt,spi-acb-led
- ubnt,acb-isp-led

Most likely I'll get the off-value and max-value based on the binding
name then (0 and 63 for that device). So I'll just remove the two
parameters then.

> 
> This comment *only* applies to the binding, not the driver. Specific
> bindings can easily be bound to generic drivers.
> 

So the driver should still be called spi-byte (or something similar)?

>> +
>> +Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
>> +apply. In particular, "reg" and "spi-max-frequency" properties must be given.
> 
> What's the SPI mode configuration?

For this controller the mode seems to be CPOL = 0, CPHA = 0 (clock low
when idle, data valid on rising edge). CS is active low. The values are
MSB first (otherwise it would be an odd counter). Note that this is
based on reverse engineering (just like the protocol). So it's just a
justified guess.

If you are really interested in a lot of details, you can have a look at
the analysis that I did on that controller here:

https://github.com/c-mauderer/openwrt-Ubiquity-Aircube-notes/blob/5eb66d274db32238fc3249748be3a0eb26d1c91b/notes/Notes.asciidoc#led-controller

> 
>> +
>> +The driver currently only supports one LED. The properties of the LED are
>> +configured in a sub-node in the device node.
>> +
>> +LED sub-node properties:
>> +- label:
>> +       see Documentation/devicetree/bindings/leds/common.txt
>> +- leds-spi-byte,off-value:
>> +       The SPI byte value that should be sent to switch the LED off. Has to be
>> +       smaller than max-value. Range: 0 to 254.
>> +- leds-spi-byte,max-value:
>> +       The SPI byte value that should be sent to set the LED to the maximum
>> +       brightness. Has to be bigger than off-value. Range: 1 to 255.
> 
> Can't we already express this with brightness-levels and
> num-interpolated-steps properties? Some reason those ended up in
> pwm-backlight.txt, but really could apply to any LED with level
> controls.

The parameters gave the minimum and maximum SPI byte that should be
sent. But like said above: If the binding is based on the device name,
these parameters can just be a look up table or something similar based
on the binding name in the driver. So I can remove them.

> 
> Rob
> 

Best regards

Christian
