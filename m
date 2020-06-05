Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 789361EF829
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2020 14:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgFEMmv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 5 Jun 2020 08:42:51 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33110 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbgFEMmv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 5 Jun 2020 08:42:51 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 055Cgjed040494;
        Fri, 5 Jun 2020 07:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591360965;
        bh=oT1gIBxDDUEHLfBPD+U2tTYn+54H+gzmNsjUa42oJTI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=U+K1MK30/03I0t/wRyi73OF265yw11zdP54ULxAbvMhKNLkLMsnNAlWiYA0H7vLqi
         MMzFsMl4Qd41UpXPE/e7DKIWGrS0Wh35/tRJXe7OVNRGxxSc6bNJMdiKEg/ABI7Gvk
         6rx1gjhrlvHjXJm+bNvaHMBF6MXSy8C3GJX3whOg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 055CgjWU068954
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 5 Jun 2020 07:42:45 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Jun
 2020 07:42:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Jun 2020 07:42:45 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 055Cgi4D020074;
        Fri, 5 Jun 2020 07:42:45 -0500
Subject: Re: [PATCH v26 01/15] dt: bindings: Add multicolor class dt bindings
 documention
To:     Rob Herring <robh@kernel.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200604120504.32425-1-dmurphy@ti.com>
 <20200604120504.32425-2-dmurphy@ti.com> <20200604224026.GA4153787@bogus>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <8b32231a-90d8-258e-d828-362af8cbfbb5@ti.com>
Date:   Fri, 5 Jun 2020 07:42:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200604224026.GA4153787@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Rob

On 6/4/20 5:40 PM, Rob Herring wrote:
> On Thu, Jun 04, 2020 at 07:04:50AM -0500, Dan Murphy wrote:
>> Add DT bindings for the LEDs multicolor class framework.
>> Add multicolor ID to the color ID list for device tree bindings.
>>
>> CC: Rob Herring <robh@kernel.org>
>> Acked-by: Pavel Machek <pavel@ucw.cz>
>> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../bindings/leds/leds-class-multicolor.yaml  | 39 +++++++++++++++++++
>>   include/dt-bindings/leds/common.h             |  3 +-
>>   2 files changed, 41 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
>> new file mode 100644
>> index 000000000000..6cab2a1405e1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
>> @@ -0,0 +1,39 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/leds/leds-class-multicolor.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Common properties for the multicolor LED class.
>> +
>> +maintainers:
>> +  - Dan Murphy <dmurphy@ti.com>
>> +
>> +description: |
>> +  Bindings for multi color LEDs show how to describe current outputs of
>> +  either integrated multi-color LED elements (like RGB, RGBW, RGBWA-UV
>> +  etc.) or standalone LEDs, to achieve logically grouped multi-color LED
>> +  modules. This is achieved by adding multi-led nodes layer to the
>> +  monochrome LED bindings.
>> +  The nodes and properties defined in this document are unique to the multicolor
>> +  LED class.  Common LED nodes and properties are inherited from the common.txt
>> +  within this documentation directory.
>> +
>> +patternProperties:
>> +  "^multi-led@([0-9a-f])$":
>> +    type: object
>> +    description: Represents the LEDs that are to be grouped.
>> +    properties:
>> +      #allOf:
>> +        #- $ref: "common.yaml#"
> Why is this commented out? Other than it is wrong. Uncommented, this
> would be defining a DT property called 'allOf'.
>
> You can drop 'allOf' now. '$ref' should be at the level of 'properties'.

I used the example from the rohm,bd71828-leds.yaml where these lines appear.

So that binding is wrong as well.

>> +
>> +      color:
>> +        $ref: /schemas/types.yaml#definitions/uint32
> common.yaml already defines the type, so drop this.

OK

Dan

