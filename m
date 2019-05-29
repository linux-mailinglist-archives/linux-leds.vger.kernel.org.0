Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2D372DC2F
	for <lists+linux-leds@lfdr.de>; Wed, 29 May 2019 13:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbfE2Lvk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 29 May 2019 07:51:40 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39860 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbfE2Lvk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 May 2019 07:51:40 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4TBpXMd058379;
        Wed, 29 May 2019 06:51:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559130693;
        bh=Ubwl+/mZf6d2scCucv5MwBfAvJ9g/1PXNaEggSvKc6c=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=UJ1KIwaDI2d47VP3j2UpmyowXVfhZs1myBX21/croF8hRdccnpwndrNSB/iCn1Jgr
         eKxkDg0WAnCKn1NQ1ADgbE2/c+FLEPfznDPMhjvf4uqUh2RV2V7ennMpYTYerEBOnj
         bUahMEIc4WeoblDElEXcuShXmDHHaFJqeRignryA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4TBpXPO076661
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 May 2019 06:51:33 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 29
 May 2019 06:51:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 29 May 2019 06:51:33 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4TBpWju070508;
        Wed, 29 May 2019 06:51:32 -0500
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
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <2398099b-16e6-f155-5852-45ba3dbc21ef@ti.com>
Date:   Wed, 29 May 2019 06:51:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190526124838.GH2456@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Mark

On 5/26/19 7:48 AM, Mark Brown wrote:
> On Thu, May 23, 2019 at 08:50:20AM -0500, Dan Murphy wrote:
>> On 5/23/19 8:03 AM, Mark Brown wrote:
>>> On Wed, May 22, 2019 at 02:27:28PM -0500, Dan Murphy wrote:
>>> Is it guaranteed that the bitmask for enabling the use of the GPIO is
>>> going to be the same for all regulators?  The bitmasks for the regulator
>>> enable look to be different, and it also looks like this setting might
>>> affect multiple regulators since it seems there are multiple enable bits
>>> in the same register.  If this affects multiple regulators then how's
>>> that working at the minute?
>> Yes for the 3632 and 36274 bit0 is the EXT_EN for LCM on these chips.
>> LM3631 does not have LCM GPIO control so there is no setting and this should not be called.
>> If it is then the developer implemented the DT wrong.
> This feels fragile - it works for the current users but it's just
> assuming that the placement of this bit will always be in the same
> position in the same register as the enable and will silently fail if a
> new chip variant does things differently.  Either storing the data
> separately somewhere driver specific or just having explicit switch
> statements would be more robust.


Although I don't disagree with you I don't see how the interface is 
fragile with only these 3 regulators defined.

Would it not be prudent to amend this driver if/when a new regulator is 
needed that has a different enable bit/register combination?   And if 
that was the case I would almost expect a different driver completely if 
the regmap did not line up correctly.  I only reused this driver because 
the registers and bits lined up and did not think it was necessary to 
create a whole new driver.

Dan

