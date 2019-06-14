Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1D9F46098
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jun 2019 16:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728619AbfFNOXr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Jun 2019 10:23:47 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44138 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728545AbfFNOXr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Jun 2019 10:23:47 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5EENYNY087791;
        Fri, 14 Jun 2019 09:23:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560522214;
        bh=jqWIXPxQ0tUVep8/8V0HZ+0jev3IjHrnjzBzntRpW+E=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=eZVJpZ1mJwnABWygXpv6c60oFL4KxmnDdnaP0oazfPYjrTxeFgR6OhRr8sEVjoZXF
         gFb56vWyLFWSrz4tLjyvXaXAoGlfANGuNZHmg9BijIv8ml0vQADpCsje3hAQ7nVsT7
         7jNXnEdGJZ3SMEnFrCFN9ojx2s4/LtloBWK88K18=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5EENY7j068628
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 14 Jun 2019 09:23:34 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 14
 Jun 2019 09:23:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 14 Jun 2019 09:23:34 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5EENXEF102349;
        Fri, 14 Jun 2019 09:23:34 -0500
Subject: Re: [PATCH v3 0/9] Multicolor Framework update
To:     Alexander Dahl <ada@thorsis.com>, <linux-leds@vger.kernel.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190523190820.29375-1-dmurphy@ti.com> <55737098.K72IVJ5cDM@ada>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <adfe9901-5428-3cd5-32a2-1e9ee3654460@ti.com>
Date:   Fri, 14 Jun 2019 09:23:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <55737098.K72IVJ5cDM@ada>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 6/14/19 2:02 AM, Alexander Dahl wrote:
> Hello Dan,
>
> Am Donnerstag, 23. Mai 2019, 14:08:11 CEST schrieb Dan Murphy:
>>    leds: multicolor: Add sysfs interface definition
>>    dt: bindings: Add multicolor class dt bindings documention
>>    documention: leds: Add multicolor class documentation
>>    dt-bindings: leds: Add multicolor ID to the color ID  list
>>    leds: Add multicolor ID to the color ID list
>>    leds: multicolor: Introduce a multicolor class definition
>>    dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
>>    leds: lp50xx: Add the LP50XX family of the RGB LED driver
>>    leds: Update the lp55xx to use the multi color framework
> While not having much experience with the implementation of the LED subsystem,
> I've had a short look at those. Curious question: would it be possible to take
> three gpio-leds and group those together to one multicolor-led? I know at
> least one board, where things are wired up like this, see e.g.
> at91-sama5d27_som1_ek.dts

I have been thinking a lot about how gpio LEDs would fit into the mix here.

The leds-gpio.c would need to be extended to register to the multicolor 
framework for this to work.

I would need to get or create a gpio led cluster to test it out.

Dan


> Greets
> Alex
>
