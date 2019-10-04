Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3CECBBD0
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2019 15:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388341AbfJDNdc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Oct 2019 09:33:32 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46378 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388743AbfJDNdb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Oct 2019 09:33:31 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94DXHsZ011535;
        Fri, 4 Oct 2019 08:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570195997;
        bh=ICdFi7+va2YgW8u1kII9BM7D1dGZnBwB8N4tj2oyY6U=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=xm/cy/ZDQpxKlKJ+HJJJn6+nRj73V0KAzK9nRnc0pENSQCLduGunQFABQaxTHDLQ5
         JT0h7F76kq0dqVtFEUOaAn6n/gFylvUXKmrEV2mFDC1s2RsMcb2nyJFz9JE0DZ+Kpq
         MiFZCdf1n0DNgc0LfeHX1pmv3lY45z+x6k1YN1gI=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x94DXHfK086791
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 4 Oct 2019 08:33:17 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 08:33:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 08:33:15 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94DXDQw076936;
        Fri, 4 Oct 2019 08:33:14 -0500
Subject: Re: Should regulator core support parsing OF based fwnode?
To:     Mark Brown <broonie@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
CC:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        <pavel@ucw.cz>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <lee.jones@linaro.org>, <daniel.thompson@linaro.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, <dmurphy@ti.com>,
        <linux-leds@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003082812.28491-3-jjhiblot@ti.com>
 <20191003104228.c5nho6eimwzqwxpt@earth.universe>
 <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
 <62591735-9082-1fd7-d791-07929ddaa223@gmail.com>
 <20191003183554.GA37096@sirena.co.uk>
 <25b9614f-d6be-9da5-0fe5-eb58c8c93850@gmail.com>
 <20191003194140.GE6090@sirena.co.uk>
 <a9f668f9-ad26-4e18-178a-8403b8b3b1db@gmail.com>
 <20191004113942.GB4866@sirena.co.uk>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <b6318ba5-e76e-dc1c-6921-a702abf6749c@ti.com>
Date:   Fri, 4 Oct 2019 15:33:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004113942.GB4866@sirena.co.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 04/10/2019 13:39, Mark Brown wrote:
> On Thu, Oct 03, 2019 at 10:27:26PM +0200, Jacek Anaszewski wrote:
>> On 10/3/19 9:41 PM, Mark Brown wrote:
>>> Why would we want to do that?  We'd continue to support only DT systems,
>>> just with code that's less obviously DT only and would need to put
>>> checks in.  I'm not seeing an upside here.
>> For instance few weeks ago we had a patch [0] in the LED core switching
>> from using struct device's of_node property to fwnode for conveying
>> device property data. And this transition to fwnode property API can be
>> observed as a frequent pattern across subsystems.
> For most subsystems the intent is to reuse DT bindings on embedded ACPI
> systems via _DSD.
>
>> Recently there is an ongoing effort aiming to add generic support for
>> handling regulators in the LED core [1], but it turns out to require
>> bringing back initialization of of_node property for
>> devm_regulator_get_optional() to work properly.
> Consumers should just be able to request a regulator without having to
> worry about how that's being provided - they should have no knowledge at
> all of firmware bindings or platform data for defining this.  If they
> do that suggests there's an abstraction issue somewhere, what makes you
> think that doing something with of_node is required?

The regulator core accesses consumer->of_node to get a phandle to a 
regulator's node. The trouble arises from the fact that the LED core 
does not populate of_node anymore, instead it populates fwnode. This 
allows the LED core to be agnostic of ACPI or OF to get the properties 
of a LED.

IMO it is better to populate both of_node and fwnode in the LED core at 
the moment. It has already been fixed this way for the platform driver 
[0], MTD [1] and PCI-OF [2].

>
> Further, unless you have LEDs that work without power you probably
> shouldn't be using _get_optional() for their supply.  That interface is
> intended only for supplies that may be physically absent.

Not all LEDs have a regulator to provide the power. The power can be 
supplied by the LED controller for example.


[0] f94277af03ead0d3bf2 of/platform: Initialise dev->fwnode appropriately

[1] c176c6d7e932662668 mfd: core: Set fwnode for created devices

[2] 9b099a6c75e4ddceea PCI: OF: Initialize dev->fwnode appropriately

