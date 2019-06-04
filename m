Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89E5034BB5
	for <lists+linux-leds@lfdr.de>; Tue,  4 Jun 2019 17:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727947AbfFDPOv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 4 Jun 2019 11:14:51 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55804 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727976AbfFDPOu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 4 Jun 2019 11:14:50 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x54FEibt022139;
        Tue, 4 Jun 2019 10:14:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559661284;
        bh=Sl5OBcsT70V82QK3ubUuQgvQHwkd1HO9ZqCFNycFHNU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=fIzt6mvrmu7C92OZ5lEXYzJwHk5/WxmY/o+l+4iuXfCKHhcae7HmJ5TI4oHvMR8J4
         c5jTn+giscmdXCIOZt1af8SZG4Fge2VMN7evJIA1f4jxnYErj/ukfI/ravAlyvDsqq
         8EDdTCqPcvM9TkDq1odziB+H6x5x9NUwydc+mJto=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x54FEiMT013864
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 4 Jun 2019 10:14:44 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 4 Jun
 2019 10:14:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 4 Jun 2019 10:14:43 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x54FEhtF014871;
        Tue, 4 Jun 2019 10:14:43 -0500
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
 <afd2e445-09a9-a07f-f020-ede6870dce6e@ti.com>
 <20190530152643.GS2456@sirena.org.uk>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <f9ad6600-3060-65c5-6f87-8a167c75f8b0@ti.com>
Date:   Tue, 4 Jun 2019 10:14:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190530152643.GS2456@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Mark

On 5/30/19 10:26 AM, Mark Brown wrote:
>
> That code is rather far away from the code you're changing and it's
> really not clear that this will do the right thing for new devices, it
> already appears that we're handling two devices without obvious code for
> that (the regulator IDs get reused AFAICT).  If there were a switch
> statement right there it'd be clearer.
>
> Part of this is a reviewability thing - I initially stopped on the patch
> because it looked like it was using the enable field for something other
> than the intended purpose and now there's all this chasing around to see
> if the code is OK.

I am going to introduce this update in patch 4 of this series when the 
LM36274 is introduced to the regulator driver.

It makes more sense to add it there as in patch 1 there is not really a 
need to extend the value or mask as it only supports the LM3632 device.  
It makes sense to add the condition when adding another device to support

Thoughts?

Dan

