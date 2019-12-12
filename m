Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F99911CDF7
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2019 14:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729390AbfLLNO7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 12 Dec 2019 08:14:59 -0500
Received: from foss.arm.com ([217.140.110.172]:46472 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728996AbfLLNO7 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 12 Dec 2019 08:14:59 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F10ED30E;
        Thu, 12 Dec 2019 05:14:57 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15FBD3F718;
        Thu, 12 Dec 2019 05:14:50 -0800 (PST)
Subject: Re: [RFC 00/25] arm64: realtek: Add Xnano X5 and implement
 TM1628/FD628/AiP1618 LED controllers
To:     =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Roc He <hepeng@zidoo.tv>, csd@princeton.com.tw,
        devicetree@vger.kernel.org, sales@fdhisi.com,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, zypeng@titanmec.com,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Dan Murphy <dmurphy@ti.com>
References: <20191212033952.5967-1-afaerber@suse.de>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <7110806f-ddbd-f055-e107-7a1f7e223102@arm.com>
Date:   Thu, 12 Dec 2019 13:14:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191212033952.5967-1-afaerber@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Andreas,

On 12/12/2019 3:39 am, Andreas Färber wrote:
> Hello,
> 
> This patch series implements the LED controllers found in some RTD1295 based
> TV set-top boxes.
> 
> Ever since I've had mainline Linux kernels booting on my Zidoo X9S TV box,
> it's been bugging me that it kept displaying "boot" on its front display.
> A hot lead was a TM1628 chip on the front display's daughterboard, which
> English and Chinese datasheets were available for. The biggest hurdle
> to overcome was whether and how this chip was connected to the SoC.
> Confusingly the datasheet talks about "Serial Interface" and shows pins
> DIO, SCLK and STB; whereas neither UART nor SPI DT nodes seemed to be in use
> for this, no mention of such chipset in the binary vendor DT, and only one
> seemingly unrelated exported GPIO. Sadly Zidoo have refused to share GPL
> sourcecode with me, and the public GPL code drops from NAS and SBC vendors
> didn't seem to include drivers for this chip. Last weekend, review of vendor
> DT pinctrl nodes revealed a "spi@1" pinctrl node in use by the pinctrl node
> itself, despite there being only one GSPI block on the SoC. debugfs under
> Android revealed GPIO pins named "fp_stb", "fp_data" and "fp_clk" (on X5:
> 3x "vfdtest", unhelpfully). So I hereby present my first 3-wire SPI slave,
> using standard spi-gpio driver.
> 
> This required to extend the spi-gpio driver with Little Endian support.
> 
> TM1628 and related chipsets have an internal Display RAM, from which they
> control a two-dimensional array of LED components, often used for
> seven-segment displays, i.e. clock display, but also for indicators.
> Individual LEDs can be turned on/off, but brightness is applied globally.
> Some chipsets also support polling a two-dimensional key pad.
> 
> This initial RFC implements a SPI slave driver within Linux leds subsystem
> and lets DT expose individual LED components as two-state LEDs, allowing
> to assign standard Linux LED triggers and to control them via sysfs.
> 
> It goes on to add a "text" attribute to the driver that enables DT-configured
> seven-segment displays; I was expecting to find precedence in auxdisplay
> subsystem but came up empty. So my driver currently integrates its own
> generic (but incomplete) character-to-8-segments mapping, as well as in a
> second step a combined-characters-to-8-segments mapping, which then gets
> mapped to the chipset's available output lines. Doing this as sysfs device
> attribute had the advantage of being able to test it quickly; it also leaves
> timezone management to userspace and lets it choose between wall clock and
> playback time as needed. LED triggers appeared to be per-LED; otherwise an
> RTC-implemented interrupt based LED trigger would've been nice for RTD1195+,
> since my pending irqchip driver exposes interrupts down to half-second that
> would seem ideal for accurately driving such a display, with blinking colon.
> 
> Finally, it sketches how keypad handling could be integrated into the leds
> driver, but I am lacking a test case for that functionality.
> Distinguishing LEDs and key inputs in DT may get difficult...
> 
> For brightness control I am still investigating the backlight API and
> defaulting to the chipset's default (lowest) brightness.
> 
> Prepended is a new DT for Xnano X5 OTT TV Box, featuring an FD628 display.
> 
> Displays connected to these controllers didn't have any model or vendor
> usually, and for the lengthy numbers from my X9S, Google found no hits.
> Therefore I've been unable to come up with compatible strings for those
> displays and need to configure it per .dts, even though some may be using
> the same, e.g., "88:88" type display model.
> Whereas the same display might be connected to different LED controllers,
> thus is orthogonal to the controller's compatible string.
> 
> Another aspect here is that the leds binding expects to have child nodes
> per LED directly on the LED controller node. So I've gone to lengths to
> shoehorn my display child node into that scheme via wildcard reg property.
> 
> The alternative would be to define some special child node, as done for the
> SPI controller's "slave" node, to use as display. But in theory there might
> be multiple displays connected to one controller (which is neglected here).
> And in theory the same display might be wired up differently, so at most
> the display model could tell us about layout and availability of LEDs, but
> we'd still need a mapping from the LED controller's to the display's pins.
> So far neither of the two displays tested actually use the segment lines
> for the segments, but rather switch segment and grid lines.
> 
> So in theory we might consider the display as LED controller and implement
> binding/driver on that level (moving it to DT root node like gpio-leds),
> if we can hook it up to the actual LED controller in this case on SPI bus?
> Assuming we can actually identify the display with some compatible string,
> that is.
> However, update efficiency has been a concern, with clock display in mind.
> Thus, forcing two SPI commands (three SPI transfers) per LED segment, as the
> the current LED API would entail, should better be avoided. This led to the
> current design of having everything in tm1628 driver, so that we can easily
> determine the scope of an update operation there (one per LED; all for text,
> to be optimized through bit field of dirtied bytes).
> 
> Locking is completely missing still. We'll need at least a mutex to avoid,
> e.g., a heartbeat LED trigger and a text update conflicting on SPI bus or
> "hazards" becoming visible on the display during conflicting byte updates.
> 
> Module remove support is missing, too.
> 
> We may also need to revisit my error checking and either inline functions
> or drop checks on the LED bit level, if it becomes a performance bottleneck.
> 
> On the cosmetic side, some lines are still beyond 80 characters.
> 
> Some more notes:
> * Public TM1628 V1.1 datasheet is in Chinese only and differs from the
>    unversioned English version found elsewhere on datasheet sites by
>    documenting more display modes, included here (guessed from Arabic numbers).
> * Public FD628 datasheet is Chinese only (guesses based on Arabic numbers).
>    FD623 appears to have more output lines, which would fit current data types.
> * AiP1618 links were all broken (404); try Google "site:szfdwdz.com" search
>    to actually find the documents available on their site.
> * Princeton PT6964 is another related LED controller with public datasheet
>    that I did not encounter in my TV boxes yet, thus not included here.
>    Datasheets are linked only for PT6959 and PT6967, but PT6964 V1.3 and V1.4
>    are available elsewhere. PT6967 has more output lines, which my current
>    data types could barely hold. Maybe bump them all to u32 type right away?
> * TM1628 is also found on MeLE V9 TV box, to be tested.
> * FD628 is also found on Amlogic S905X2 based Vontar X96 Max TV box,
>    to be tested (once UART is soldered).
> * AiP1618 was found on Ava and Lake I TV boxes, to be tested.
> * It remained unclear to me which of these many similar chipsets was first.
>    My driver name is therefore based on the chip I encountered first.

It's pretty cool to see this! My Rockchip box has an AiP1618-driven 
display that I've also spent a bit of time hacking around with - I did 
get some way into writing an LED driver, but ultimately gave up and 
wrote a simple thing to bit-bang the GPIO chardev from userspace (and 
since there are enough clocks in my house, I now have a cpufreq display!)

In case it helps, in my research I found that ARTSCHIP are another 
vendor of these things with accessible datasheets[1], and as far as I 
could tell the command set appears to derive from (or is at least common 
to) some old Holtek VFD controllers.

If I can figure out the DT parts (which was one of the areas that 
stalled my attempt) I'll try to have a play with this series over the 
holidays. One thought to ponder is that I have an "88:88" display where 
the entire middle grid is reserved for the colon (which is wired to just 
one segment) - I'm not sure how that could be sanely described :/

Robin.

[1] 
http://www.artschip.com/products.asp?lx=small&anid=779&ParentName=Signal%20management%20_I_O%20Extender

> This series is based on my not-yet-posted RTD1295 pinctrl and GPIO drivers.
> 
> Latest experimental patches at:
> https://github.com/afaerber/linux/commits/rtd1295-next
> 
> Have a lot of fun!
> 
> Cheers,
> Andreas
> 
> Cc: linux-leds@vger.kernel.org
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> 
> Cc: linux-rtc@vger.kernel.org
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> 
> Cc: linux-spi@vger.kernel.org
> Cc: Mark Brown <broonie@kernel.org>
> 
> Cc: linux-amlogic@lists.infradead.org
> 
> Cc: Roc He <hepeng@zidoo.tv>
> # No email for Xnano
> 
> Cc: zypeng@titanmec.com
> Cc: sales@fdhisi.com
> # No email for szfdwdz.com
> Cc: csd@princeton.com.tw
> 
> Andreas Färber (25):
>    dt-bindings: vendor-prefixes: Add Xnano
>    dt-bindings: arm: realtek: Add Xnano X5
>    arm64: dts: realtek: rtd1295: Add Xnano X5
>    spi: gpio: Implement LSB First bitbang support
>    dt-bindings: vendor-prefixes: Add Titan Micro Electronics
>    dt-bindings: leds: Add Titan Micro Electronics TM1628
>    leds: Add Titan Micro Electronics TM1628
>    arm64: dts: realtek: rtd129x-zidoo-x9s: Add TM1628 LED controller
>    arm64: dts: realtek: rtd1295-zidoo-x9s: Add regular LEDs to TM1628
>    dt-bindings: vendor-prefixes: Add Fuda Hisi Microelectronics
>    dt-bindings: leds: tm1628: Add Fuda Hisi Microelectronics FD628
>    leds: tm1628: Add Fuda Hisi Microelectronics FD628
>    arm64: dts: realtek: rtd1295-xnano-x5: Add FD628 LED controller
>    arm64: dts: realtek: rtd1295-xnano-x5: Add regular LEDs to FD628
>    dt-bindings: vendor-prefixes: Add Fude Microelectronics
>    dt-bindings: leds: tm1628: Add Fude Microelectronics AiP1618
>    leds: tm1628: Prepare Fude Microelectronics AiP1618
>    dt-bindings: leds: tm1628: Define display child nodes
>    leds: tm1628: Add 7-segment display support
>    arm64: dts: realtek: rtd1295-zidoo-x9s: Add display to TM1628
>    arm64: dts: realtek: rtd1295-xnano-x5: Add display to FD628
>    leds: tm1826: Add combined glyph support
>    WIP: leds: tm1628: Prepare TM1628 keys
>    WIP: leds: tm1628: Prepare FD628 keys
>    WIP: leds: tm1628: Prepare AiP1618 keys
> 
>   Documentation/devicetree/bindings/arm/realtek.yaml |   1 +
>   .../devicetree/bindings/leds/titanmec,tm1628.yaml  | 134 ++++
>   .../devicetree/bindings/vendor-prefixes.yaml       |   8 +
>   arch/arm64/boot/dts/realtek/Makefile               |   1 +
>   arch/arm64/boot/dts/realtek/rtd1295-xnano-x5.dts   | 108 +++
>   arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts  |  36 +-
>   drivers/leds/Kconfig                               |  12 +
>   drivers/leds/Makefile                              |   1 +
>   drivers/leds/leds-tm1628.c                         | 727 +++++++++++++++++++++
>   drivers/spi/spi-bitbang-txrx.h                     |  68 +-
>   drivers/spi/spi-gpio.c                             |  42 +-
>   11 files changed, 1126 insertions(+), 12 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml
>   create mode 100644 arch/arm64/boot/dts/realtek/rtd1295-xnano-x5.dts
>   create mode 100644 drivers/leds/leds-tm1628.c
> 
