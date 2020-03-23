Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC3219007B
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2020 22:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgCWVgO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Mar 2020 17:36:14 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56804 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgCWVgO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Mar 2020 17:36:14 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02NLZsXq059531;
        Mon, 23 Mar 2020 16:35:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584999354;
        bh=Wvw1D63rekymXu1Ggt19/vs1VYdgX6m9pJ7jrcHqaus=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=w617zcJ4nZPSrbmRZGmTxrF4uXUOH/PzsObEbAJhaM1zgICAlZOydKp4JEI3FmkV0
         ak+1/OrXb2SsBe21lgiTtDfpKaVTdR7K2+xUDlTheTkUPo5RcUhgieA08aSZoqnkJn
         O1VOFcmBBz78RK/wZd7iYAcb2U0YmVF22OLrVJ6M=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02NLZsXP055546;
        Mon, 23 Mar 2020 16:35:54 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 23
 Mar 2020 16:35:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 23 Mar 2020 16:35:53 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02NLZpPI047330;
        Mon, 23 Mar 2020 16:35:52 -0500
Subject: Re: [PATCH 2/3] dt-bindings: leds: Add binding for sgm3140
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Weiss <luca@z3ntu.xyz>
CC:     <linux-leds@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>
References: <20200309203558.305725-1-luca@z3ntu.xyz>
 <20200309203558.305725-3-luca@z3ntu.xyz>
 <4f848ab3-0e76-ae63-0771-758b1eaa0660@ti.com> <3051566.44csPzL39Z@g550jk>
 <20200315105345.GB4732@pendragon.ideasonboard.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <fb5e504e-c448-124e-09ed-a2bba003c8ff@ti.com>
Date:   Mon, 23 Mar 2020 16:30:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200315105345.GB4732@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Luca

On 3/15/20 5:53 AM, Laurent Pinchart wrote:
> Hi Luca,
>
> On Sun, Mar 15, 2020 at 11:47:36AM +0100, Luca Weiss wrote:
>> On Mittwoch, 11. März 2020 13:49:35 CET Dan Murphy wrote:
>>> On 3/9/20 3:35 PM, Luca Weiss wrote:
>>>> Add YAML devicetree binding for SGMICRO SGM3140 charge pump used for
>>>> camera flash LEDs.
>>>>
>>>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>>>> ---
>>>> Changes since RFC:
>>>> - new patch
>>>>
>>>> I'm not sure about the completeness of this binding as it doesn't
>>>> mention the led subnode at all.
>>>> The only existing led yaml binding is leds/leds-max77650.yaml which
>>>> mentions the subnode but duplicates properties from documented in
>>>> leds/common.txt.
>>>>
>>>>    .../bindings/leds/leds-sgm3140.yaml           | 53 +++++++++++++++++++
>>>>    1 file changed, 53 insertions(+)
>>>>    create mode 100644
>>>>    Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
>>>> b/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml new file mode
>>>> 100644
>>>> index 000000000000..be9384573d02
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
>>>> @@ -0,0 +1,53 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/leds/leds-sgm3140.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: SGMICRO SGM3140 500mA Buck/Boost Charge Pump LED Driver
>>>> +
>>>> +maintainers:
>>>> +  - Luca Weiss <luca@z3ntu.xyz>
>>>> +
>>>> +description: |
>>>> +  The SGM3140 is a current-regulated charge pump which can regulate two
>>>> current +  levels for Flash and Torch modes.
>>>> +
>>>> +  It is controlled with two GPIO pins.
>>> Please define "It".  Not sure what is controlled here.
>>>
>> "It" means the SGM3140. Not sure how else to write that or what the correct
>> term for such a component is.
> Maybe "The device" ? I think Dan's concern is that he wasn't sure if
> "It" referred to "the device" or to "flash and torch modes".

Laurent is correct.  Are the flash and torch modes controlled by GPIOs 
the device or the current levels?



>
