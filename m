Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 458582560A0
	for <lists+linux-leds@lfdr.de>; Fri, 28 Aug 2020 20:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgH1Sjs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Aug 2020 14:39:48 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:57412 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgH1Sjp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Aug 2020 14:39:45 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07SIdK9k098272;
        Fri, 28 Aug 2020 13:39:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598639960;
        bh=3UuyyKN7ultk/87MUAdHtYec/2uP+f2TyQ4odszIrGE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=C8q+DaFZlo+9hsOD3F9pdDBLCcK16dogrSd9b2TJZ3oIpRs6y/NKJN6PVOqaWbl6S
         VTgg6KM77J3KHsJFAoVq8yvXsLcJ3j2tvl2j3C7CPY8XfpkJ2oXvspQ8mQbieSCkxl
         tmicD7p0ifWdWcuGmmzK6czbk4mV57UAZUqo6rR4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07SIdKjP102525
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 28 Aug 2020 13:39:20 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 28
 Aug 2020 13:39:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 28 Aug 2020 13:39:20 -0500
Received: from [10.250.38.37] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07SIdJwf068281;
        Fri, 28 Aug 2020 13:39:19 -0500
Subject: Re: [PATCH v33 6/6] ARM: dts: ste-href: Add reg property to the
 LP5521 channel nodes
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20200812195020.13568-1-dmurphy@ti.com>
 <20200812195020.13568-7-dmurphy@ti.com>
 <CACRpkdY1pCcUONFhEXeyXa3f+JFB=Wg1nSB-qRJF5njM=L+CVw@mail.gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <f253bf11-3422-4f49-fce3-ac6b51d91c25@ti.com>
Date:   Fri, 28 Aug 2020 13:39:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdY1pCcUONFhEXeyXa3f+JFB=Wg1nSB-qRJF5njM=L+CVw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Linus

On 8/27/20 5:58 PM, Linus Walleij wrote:
> On Wed, Aug 12, 2020 at 9:50 PM Dan Murphy <dmurphy@ti.com> wrote:
>
>> Add the reg property to each channel node.  This update is
>> to accommodate the multicolor framework.  In addition to the
>> accommodation this allows the LEDs to be placed on any channel
>> and allow designs to skip channels as opposed to requiring
>> sequential order.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> CC: Linus Walleij <linus.walleij@linaro.org>
>> Acked-by: Pavel Machek <pavel@ucw.cz>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> I don't knof if I should just apply these two patches or if there are
> dependencies that need to go in first. I guess yes?

I believe all dependencies have been met for these

Dan

> Yours,
> Linus Walleij
