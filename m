Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69D3D242CCD
	for <lists+linux-leds@lfdr.de>; Wed, 12 Aug 2020 18:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgHLQAp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Aug 2020 12:00:45 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:44740 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgHLQAp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Aug 2020 12:00:45 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07CG0T8O050082;
        Wed, 12 Aug 2020 11:00:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597248029;
        bh=02ZEbPG60T+9TFX2JsaFFkktquPFZf1Si0VmO18RfTI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=H9w2mY6fm2wsqTgq5ZDyXKbESuoPz5xCTPTw7JcD1v+0frmNswa+/P16xRDrueRTq
         BxxFRwmDae62UFwrI9pzsW/wOURR2wYtkG3oZNYI7RGKvUfxmRGQXdkeCabpSxLYXz
         u0UE60yVj57QY2U2dVV0MljMtnwdtj0hAe30Rsus=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07CG0Tlf109184
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Aug 2020 11:00:29 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 12
 Aug 2020 11:00:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 12 Aug 2020 11:00:29 -0500
Received: from [10.250.38.37] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07CG0Sa2007723;
        Wed, 12 Aug 2020 11:00:29 -0500
Subject: Re: [PATCH v32 2/6] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh@kernel.org>,
        <marek.behun@nic.cz>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200722153146.8767-1-dmurphy@ti.com>
 <20200722153146.8767-3-dmurphy@ti.com>
 <20200811105413.r2m2f7bubuz55rrt@duo.ucw.cz>
 <935119fa-6d1f-8e99-51f9-87966b4d03ad@ti.com> <20200811220109.GA9105@amd>
 <3ce38a31-a4f0-4cd7-ad09-6bdad27e6756@ti.com> <20200811222602.GA10181@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <5efcba1b-995e-b6fd-9004-fbafaae5b8a3@ti.com>
Date:   Wed, 12 Aug 2020 11:00:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811222602.GA10181@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 8/11/20 5:26 PM, Pavel Machek wrote:
> Hi!
>
>>>> Well it depends on where we want to create the default cache values.
>>>>
>>>> Either we run through a for..loop during driver probe and delay device start
>>>> up or we keep the simple arrays and increase the driver total size.
>>> for loop will be better.
>>>
>>> Plus, REGCACHE_RBTREE is very likely overkill.
>> Well if I eliminate the reg_cache then I can eliminate the defaults too.
> I'm not asking for that. But please investigate REGCACHE_FLAT.
>
> 									Pavel

After looking at this a loop makes no sense here.  The regmap call back 
values are determined at build time not during runtime.

Adding a loop here makes the code more complex just to reduce the 
overall LoC.  In adding the loop the reg_default array will have to be 
re-allocated and copied at run time and then be expanded to include the 
additional values.

And the regmap defaults call backs will need to be updated to reflect 
the new values.  And these are part of a const struct because the 
devm_regmap_init declares the config as a const.

     .reg_defaults = lp5012_reg_defs,
     .num_reg_defaults = ARRAY_SIZE(lp5012_reg_defs),

So I am not sure that adding a loop here just to eliminate some LoC is 
adding any value here.  I can remove the #defines for the unused runtime 
registers and hard code the additional register addresses in the default 
array.  That will at least eliminate some LoC and reduce the object size.

I have no issue with using the REGCACHE_FLAT so I will make that change.

Dan

