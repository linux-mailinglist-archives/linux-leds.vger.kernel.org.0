Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE282E66B
	for <lists+linux-leds@lfdr.de>; Wed, 29 May 2019 22:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbfE2UrQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 29 May 2019 16:47:16 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50212 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbfE2UrP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 May 2019 16:47:15 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4TKl9tC064314;
        Wed, 29 May 2019 15:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559162829;
        bh=/u1lKI847WB7IJTbX53QktaEfAzgbk7lH21l9jQO71k=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=NwiOOvf0ZSQgTegr3OtzFa0hVS1C5rX+k2Tj6a8yHDo6c9/axnXYmUALLZnbngrtm
         cK8Ib606XvccMW1ws8I14qO8qKMLa2Js7N34V/6O5of3F2dkT6kOF63aYEM8j91ugx
         eyRP5VR1ZrTQev+avjQaRj848FIWd/E3fbudcXZg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4TKl95e125259
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 May 2019 15:47:09 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 29
 May 2019 15:47:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 29 May 2019 15:47:08 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4TKl8PB016357;
        Wed, 29 May 2019 15:47:08 -0500
Subject: Re: [RESEND PATCH v4 1/6] regulator: lm363x: Make the gpio register
 enable flexible
To:     Mark Brown <broonie@kernel.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <lgirdwood@gmail.com>, <lee.jones@linaro.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-2-dmurphy@ti.com>
 <20190523130311.GA17245@sirena.org.uk>
 <d4673abc-442c-83eb-1830-7f7ed9d8419e@ti.com>
 <20190526124838.GH2456@sirena.org.uk>
 <2398099b-16e6-f155-5852-45ba3dbc21ef@ti.com>
 <20190529151000.GP2456@sirena.org.uk>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <afd2e445-09a9-a07f-f020-ede6870dce6e@ti.com>
Date:   Wed, 29 May 2019 15:47:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529151000.GP2456@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Mark

On 5/29/19 10:10 AM, Mark Brown wrote:
> On Wed, May 29, 2019 at 06:51:32AM -0500, Dan Murphy wrote:
>
>> Although I don't disagree with you I don't see how the interface is fragile
>> with only these 3 regulators defined.
>> Would it not be prudent to amend this driver if/when a new regulator is
>> needed that has a different enable bit/register combination?   And if that
> The fragility I'm worried about is someone forgetting to make suitable
> updates, especially if they don't use the feature in their own system.

If they don't define the enable GPIO in the device tree then the gpio 
descriptor pointer is NULL and the register write does not occur.

The documentation indicates that this is only applicable for 3632 I need 
to add the LM36274.

>> was the case I would almost expect a different driver completely if the
>> regmap did not line up correctly.  I only reused this driver because the
>> registers and bits lined up and did not think it was necessary to create a
>> whole new driver.
> This is a single register bit which is set once on startup isn't it?  It
> seems like exactly the sort of thing that a hardware designer might
> change incompatibly, perhaps even for good reasons like adding more
> flexibility over which pins can be used to control the enable and far
> from something that would require a totally new driver if it was handled
> differently.

Currently I don't have a device in this family that requires this level 
of flexibility for this pin or configuration.

So if a need should arise should we not implement that flexibility at 
that point?

Not only this but the gpio descriptor is protected in 
lm363x_regulator_of_get_enable_gpio due to checking of the regulator 
ID.  As in patch #4 of this series if LM3632 or LM36274 check for enable 
definition in the DT and create the descriptor if found.  If it is any 
other regulator then don't do anything.

If the HW designer changes these bits we end up with a new part and then 
at that point we could add code to redefine the bit mask as well.

Dan

