Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 167301BDCC0
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2020 14:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgD2M43 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 29 Apr 2020 08:56:29 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35104 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbgD2M43 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 Apr 2020 08:56:29 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TCuOIE031057;
        Wed, 29 Apr 2020 07:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588164984;
        bh=BGf8csyyHcOLjssO7OFly5YKTdo9iXmFjjWWBgojWc8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LftLBldNNhHKfNu2OgzSSOyhj+HzsOPSUr+e3JSyAXoA15in5OGwhHTjjuZQ34IAX
         /wEFMyr7vk17SPBz+uOiGyO/dYOejTbrJvz3HXqYl1pQ2fbSnFeHdu2gEefU2ciQ1w
         oOS0kXq1s+x3/VvcrMoM+nAqibaqlgZ8Qz00tgng=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TCuOQX104101;
        Wed, 29 Apr 2020 07:56:24 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 07:56:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 07:56:24 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TCuOXl089811;
        Wed, 29 Apr 2020 07:56:24 -0500
Subject: Re: [PATCH v21 01/16] dt: bindings: Add multicolor class dt bindings
 documention
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
References: <20200428160338.2793-1-dmurphy@ti.com>
 <20200428160338.2793-2-dmurphy@ti.com>
 <919e7c4d-0b4e-4335-0a9b-670752fd4845@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <498ad87f-72f1-937a-6014-54b1355a1cd0@ti.com>
Date:   Wed, 29 Apr 2020 07:50:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <919e7c4d-0b4e-4335-0a9b-670752fd4845@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 4/28/20 3:30 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 4/28/20 6:03 PM, Dan Murphy wrote:
>> Add DT bindings for the LEDs multicolor class framework.
>> Add multicolor ID to the color ID list for device tree bindings.
>>
>> CC: Rob Herring <robh@kernel.org>
>> Acked-by: Pavel Machek <pavel@ucw.cz>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../bindings/leds/leds-class-multicolor.txt   | 98 +++++++++++++++++++
>>   drivers/leds/led-core.c                       |  1 +
>>   include/dt-bindings/leds/common.h             |  3 +-
>>   3 files changed, 101 insertions(+), 1 deletion(-)
>>   create mode 100644 
>> Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt 
>> b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>> new file mode 100644
>> index 000000000000..4b1bd82f2a42
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
>
> Why isn't it yaml?
>
Converted

Dan

