Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE202AFB72
	for <lists+linux-leds@lfdr.de>; Wed, 11 Nov 2020 23:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbgKKWgk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Nov 2020 17:36:40 -0500
Received: from mga09.intel.com ([134.134.136.24]:3528 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726901AbgKKWej (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Nov 2020 17:34:39 -0500
IronPort-SDR: UQMY7DpzyrG/ucXXb3ZziAvTEMOXYANZWIEJlYiA7Ca2VvO40iP0WgVt3dQpyWLRcGnsZXqufX
 wV19+UeIU6GA==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="170394632"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="170394632"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:34:38 -0800
IronPort-SDR: ZWVZ785rIL5gz3V66m3Rngatgnao4gMINkrgMEZ4Tl6+c4HIkEM29kgv4+JjtBBzFn6rWxvJZJ
 gSZ/4/NY+TXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="474022598"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga004.jf.intel.com with ESMTP; 11 Nov 2020 14:34:37 -0800
Received: from [10.215.242.65] (mreddy3x-MOBL.gar.corp.intel.com [10.215.242.65])
        by linux.intel.com (Postfix) with ESMTP id 80907580B99;
        Wed, 11 Nov 2020 14:34:35 -0800 (PST)
Subject: Re: [PATCH v1 1/2] dt-bindings: leds: Add bindings for intel LGM SOC
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, cheol.yong.kim@intel.com,
        qi-ming.wu@intel.com, malliamireddy009@gmail.com,
        yixin.zhu@intel.com
References: <c9c963a2d03fbd03bd21f71f3d776ac5800cf6cc.1604331498.git.mallikarjunax.reddy@linux.intel.com>
 <20201105095257.GA7994@amd>
From:   "Reddy, MallikarjunaX" <mallikarjunax.reddy@linux.intel.com>
Message-ID: <06f20e58-405a-438e-641b-a7e0bf7d48e9@linux.intel.com>
Date:   Thu, 12 Nov 2020 06:34:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201105095257.GA7994@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

Thanks for your valuable comments, Please see my comments inline.

On 11/5/2020 5:52 PM, Pavel Machek wrote:
> On Thu 2020-11-05 17:43:50, Amireddy Mallikarjuna reddy wrote:
>> Add DT bindings YAML schema for SSO controller driver
>> of Lightning Mountain(LGM) SoC.
>>
> intel -> Intel in the title.
> "Lightning Mountain(LGM)" -> 'Lightning Mountain (LGM)"

ok.

>
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/leds/leds-lgm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Intel LGM Soc LED SSO driver
> Please spell out LGM and SSO here. Soc -> SoC?
ok.

>
>
>> +          intel,sso-brightness:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: brightness level of the LED.
>> +            minimum: 0
>> +            maximum: 255
> ?
In case of using "default-state" property, it is redundant.
>
>> +          intel,sso-hw-trigger:
>> +            type: boolean
>> +            description: This property indicates Hardware driven/control LED.
> Why is this intel specific?
This is not common property, so i used vendor name.
do you suggest only property name without vendor name?
>
>> +          intel,sso-hw-blink:
>> +            type: boolean
>> +            description: This property indicates Enable LED blink by Hardware.
> ?
This is not common property, so i used vendor name.
do you suggest only property name without vendor name?
>
>> +          intel,sso-blink-rate:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: LED HW blink frequency.
> ?
This is not common property, so i used vendor name.
do you suggest only property name without vendor name?
>
> Best regards,
> 						Pavel
