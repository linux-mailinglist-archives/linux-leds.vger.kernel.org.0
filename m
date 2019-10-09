Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8F7D1A00
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2019 22:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728804AbfJIUoo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Oct 2019 16:44:44 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:46972 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730955AbfJIUoo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Oct 2019 16:44:44 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x99Kid12082323;
        Wed, 9 Oct 2019 15:44:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570653879;
        bh=YA1WU586yiuQsLm90Wav7tyFG1FM8+LIvO3AWd1ofHs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=QTs4jMd2slKKTBhgT5dYCoLFBH9V8USwFTUvYhe5Wgd/q7GrFur+UNpHhzyVNqJTL
         l2p+jm13OIwjeWIvFxIPM7GHdr13gzfr9PaKqTZ5FEsPtAbymbdWGyZlua3fz6sTw3
         4gMT2WYp8+Qo1GCkDTT/jLm8vH2g4BowdHHJ15zU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x99KidsH022638
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 15:44:39 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 15:44:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 15:44:35 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x99KicoM125755;
        Wed, 9 Oct 2019 15:44:38 -0500
Subject: Re: [PATCH v11 04/16] leds: multicolor: Introduce a multicolor class
 definition
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <20191008204800.19870-1-dmurphy@ti.com>
 <20191008204800.19870-5-dmurphy@ti.com>
 <CAOCOHw5uQL56T_DcZA47721yS1tLsp9cyUEdmiWr+Ccfh7YpRQ@mail.gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <d6b68a79-235a-0a9b-bbf3-519571646eff@ti.com>
Date:   Wed, 9 Oct 2019 15:44:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOCOHw5uQL56T_DcZA47721yS1tLsp9cyUEdmiWr+Ccfh7YpRQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Bjorn

On 10/9/19 3:11 PM, Bjorn Andersson wrote:
> On Tue, Oct 8, 2019 at 1:49 PM Dan Murphy <dmurphy@ti.com> wrote:
>> Introduce a multicolor class that groups colored LEDs
>> within a LED node.
>>
>> The multi color class groups monochrome LEDs and allows controlling two
>> aspects of the final combined color: hue and lightness. The former is
>> controlled via <color>_intensity files and the latter is controlled
>> via brightness file.
>>
> Thanks for making progress on this, it's been the one outstanding
> question mark for the long overdue respin of the Qualcomm LPG driver.

> But while it works for the LPG, in that it has outputs named "RGB" I
> have boards with "generic" LED drivers that are connected to RGB LEDs.
> So per your proposed solution we would need to add the additional

You don't have to add the MC class to those drivers.  This is an 
optional framework but if you wanted to use the framework for specific 
devices then yes you would need to add that support. This is why I did 
the LP55xx patches to demonstrate the feasibility since the LP50xx has 
the MC class intelligence already.

The LP55xx driver can register to the LED class and/or the MC LED class 
pending on the DT organization.

I don't plan on going through all of TI's RGB drivers and retrofitting 
them to the MC class.  I do have to update the GPIO LED driver to use 
the class but that work is still pending.

I may also update the Motorola PCAP driver as well since I have a Droid4 
to test.

> mc_class handling to every single LED driver that might be used to
> sink current into an RGB LED.
>
> I also don't see anything preventing hardware designers from feeding
> single RGB LEDs from multiple different LED controllers, something the
> current proposal would prohibit.

What do you mean by a single RGB LED? Are you referring to a RGB module?

http://wiki.sunfounder.cc/index.php?title=RGB_LED_Module

There is no prevention for HW designers to put a driver on each LED 
output but I am not sure why they would incur

the additional BOM cost seems quite silly unless you have an unlimited 
budget ;)

If they did design the system that way then the SW would need to revert 
back to the standard LED class as it is done today.

Dan


