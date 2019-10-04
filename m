Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0AC8CBEBE
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2019 17:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389668AbfJDPNa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Oct 2019 11:13:30 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55362 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389086AbfJDPN3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Oct 2019 11:13:29 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94FDH8I117781;
        Fri, 4 Oct 2019 10:13:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570201997;
        bh=aWz10fmIXx+gUjLiGBjJkxuwFaREky92Azp3aqmUDuU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=jAXv7dVQrIT8YcJvuU675D0UM7cua4NjMs5nlDwC2L8cWQmYZauOR9OvXbPScu4Kx
         7iT72jT1qpqZ7TO9iemlztLdY+kwsCe/vpTVZcE77u1c+umE8P3p56zdPnVAYE8+kL
         t0qToAANSv7YI0YFgHAJExcVRDbmj5G0HRae2ru8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94FDH0o102033;
        Fri, 4 Oct 2019 10:13:17 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 10:13:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 10:13:16 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94FDEUv040225;
        Fri, 4 Oct 2019 10:13:14 -0500
Subject: Re: Should regulator core support parsing OF based fwnode?
To:     Mark Brown <broonie@kernel.org>
CC:     <mark.rutland@arm.com>, <daniel.thompson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, <tomi.valkeinen@ti.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <lee.jones@linaro.org>, <linux-leds@vger.kernel.org>,
        <dmurphy@ti.com>
References: <20191003082812.28491-3-jjhiblot@ti.com>
 <20191003104228.c5nho6eimwzqwxpt@earth.universe>
 <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
 <62591735-9082-1fd7-d791-07929ddaa223@gmail.com>
 <20191003183554.GA37096@sirena.co.uk>
 <25b9614f-d6be-9da5-0fe5-eb58c8c93850@gmail.com>
 <20191003194140.GE6090@sirena.co.uk>
 <a9f668f9-ad26-4e18-178a-8403b8b3b1db@gmail.com>
 <20191004113942.GB4866@sirena.co.uk>
 <b6318ba5-e76e-dc1c-6921-a702abf6749c@ti.com>
 <20191004144029.GC4866@sirena.co.uk>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <6df68ecb-f92e-fd9c-7f55-f66fa463263a@ti.com>
Date:   Fri, 4 Oct 2019 17:13:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004144029.GC4866@sirena.co.uk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 04/10/2019 16:40, Mark Brown wrote:
> On Fri, Oct 04, 2019 at 03:33:13PM +0200, Jean-Jacques Hiblot wrote:
>> On 04/10/2019 13:39, Mark Brown wrote:
>>> Consumers should just be able to request a regulator without having to
>>> worry about how that's being provided - they should have no knowledge at
>>> all of firmware bindings or platform data for defining this.  If they
>>> do that suggests there's an abstraction issue somewhere, what makes you
>>> think that doing something with of_node is required?
>> The regulator core accesses consumer->of_node to get a phandle to a
>> regulator's node. The trouble arises from the fact that the LED core does
>> not populate of_node anymore, instead it populates fwnode. This allows the
>> LED core to be agnostic of ACPI or OF to get the properties of a LED.
> Why is the LED core populating anything?  Is the LED core copying bits
> out of the struct device for the actual device into a synthetic device
> rather than passing the actual device in?  That really doesn't seem like
> a good idea, it's likely to lead to things like this where you don't
> copy something that's required (or worse where something directly in the
> struct device that can't be copied is needed).

This is not a copy of a device of parent's of_node or something like that.

You can think of a LED controller as a bus. It 'enumerates' its children 
LED, create the children devices (one per LED) and provides the 
functions to interact with them.

The device node we are talking about here is a per-LED thing, it is a 
child node of the node of the LED controller.

here is an example:

     tlc59108: tlc59116@40 { /* this is the node for the LED controller */
         status = "okay";
         #address-cells = <1>;
         #size-cells = <0>;
         compatible = "ti,tlc59108";
         reg = <0x40>;

         backlight_led: led@2 { /* this is the node of one LED attached 
to pin#2 of the LED controller */
             power-supply = <&bkl_fixed>;
             reg = <0x2>;
         };
         other_led: led@3 { /* this is the node another LED attached to 
pin #3 of the LED controller */
             power-supply = <&reg_3v3>;
             reg = <0x3>;
         };
     };


>
>> IMO it is better to populate both of_node and fwnode in the LED core at the
>> moment. It has already been fixed this way for the platform driver [0], MTD
>> [1] and PCI-OF [2].
> Yeah, if you're going to be copying stuff out of the real device I'd
> copy the of_node as well.
>
>>> Further, unless you have LEDs that work without power you probably
>>> shouldn't be using _get_optional() for their supply.  That interface is
>>> intended only for supplies that may be physically absent.
>> Not all LEDs have a regulator to provide the power. The power can be
>> supplied by the LED controller for example.
> This code probably shouldn't be being run at all for LEDs like that, I
> was assuming this was just for GPIO LEDs and similar rather than all
> LEDs.

>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
