Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA895CC050
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2019 18:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389835AbfJDQNI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Oct 2019 12:13:08 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:39292 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389131AbfJDQNI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Oct 2019 12:13:08 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94GCvqx072936;
        Fri, 4 Oct 2019 11:12:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570205577;
        bh=0PAb9wQ779A+UUuanlZ/JxOdY2JJP1B4/U8SIFI1PX4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=jhTqWXoqKdfQs2prUz5qSrpTe/i+PJ068NeZP5ioQbUlnGP0ZMB40KVgT5vc9NyD0
         DSkdXI4EFzYxyFWptINVbhDHyaOm1CAn1How2no7p+crNP/iwrIYCcFM6cDKXFuFIr
         6D2qf0r0gKQ4vwSYjFozQChr7cunbSYZh/IaYTQk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x94GCv0L037657
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 4 Oct 2019 11:12:57 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 11:12:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 11:12:55 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94GCrQZ006137;
        Fri, 4 Oct 2019 11:12:53 -0500
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
References: <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
 <62591735-9082-1fd7-d791-07929ddaa223@gmail.com>
 <20191003183554.GA37096@sirena.co.uk>
 <25b9614f-d6be-9da5-0fe5-eb58c8c93850@gmail.com>
 <20191003194140.GE6090@sirena.co.uk>
 <a9f668f9-ad26-4e18-178a-8403b8b3b1db@gmail.com>
 <20191004113942.GB4866@sirena.co.uk>
 <b6318ba5-e76e-dc1c-6921-a702abf6749c@ti.com>
 <20191004144029.GC4866@sirena.co.uk>
 <6df68ecb-f92e-fd9c-7f55-f66fa463263a@ti.com>
 <20191004155838.GE4866@sirena.co.uk>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <95a43632-57d0-2705-a2d3-d64827212692@ti.com>
Date:   Fri, 4 Oct 2019 18:12:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004155838.GE4866@sirena.co.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 04/10/2019 17:58, Mark Brown wrote:
> On Fri, Oct 04, 2019 at 05:13:13PM +0200, Jean-Jacques Hiblot wrote:
>> On 04/10/2019 16:40, Mark Brown wrote:
>>> Why is the LED core populating anything?  Is the LED core copying bits
>>> out of the struct device for the actual device into a synthetic device
>>> rather than passing the actual device in?  That really doesn't seem like
>>> a good idea, it's likely to lead to things like this where you don't
>>> copy something that's required (or worse where something directly in the
>>> struct device that can't be copied is needed).
>> This is not a copy of a device of parent's of_node or something like that.
>> You can think of a LED controller as a bus. It 'enumerates' its children
>> LED, create the children devices (one per LED) and provides the functions to
>> interact with them.
>> The device node we are talking about here is a per-LED thing, it is a child
>> node of the node of the LED controller.
>> here is an example:
>>
>>      tlc59108: tlc59116@40 { /* this is the node for the LED controller */
>>          status = "okay";
>>          #address-cells = <1>;
>>          #size-cells = <0>;
>>          compatible = "ti,tlc59108";
>>          reg = <0x40>;
>>
>>          backlight_led: led@2 { /* this is the node of one LED attached to
>> pin#2 of the LED controller */
>>              power-supply = <&bkl_fixed>;
>>              reg = <0x2>;
>>          };
> Regulator supplies are supposed to be defined at the chip level rather
> than subfunctions with names corresponding to the names on the chip.
> This ensures that all chips look similar when you're mapping the
> schematic into a DT, you shouldn't need to know about the binding for a
> given chip to write a DT for it and if multiple people (perhaps working
> on different OSs) write bindings for the same chip there should be a
> good chance that they come up with the same mapping.  The supply_alias
> interface is there to allow mapping these through to subfunctions if
> needed, it looks like the LED framework should be using this.

In case of current-sink LED drivers, each LED can be powered by a 
different regulator, because the driver is only a switch between the LED 
cathod and the ground.

>
> That said if you are doing the above and the LEDs are appearing as
> devices it's extremely surprising that their of_node might not be
> initialized.

That is because this is usually done by the platform core which is not 
involved here.

JJ

