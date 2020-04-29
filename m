Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 174171BE31C
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2020 17:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgD2Puk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 29 Apr 2020 11:50:40 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54846 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgD2Puk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 Apr 2020 11:50:40 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TFoYTN051130;
        Wed, 29 Apr 2020 10:50:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588175434;
        bh=5nY8gwiNRgZ3ZAWjsz6MminkpMk9pTq3Re+mM4PEwLI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Y20XMnjJihHM9YAAhNvoKFLJZGcBQ1tGJadpcIVibWb5D0T+hNeuZLAm4zTyxIVkZ
         E/aGxZu4VFRa6AJM7ZNg40e1wFx1OFL+HSeRtTRvTo5jlyJtT8tWdh2hERdBhPp7x8
         iA2rohI0g5Rkl/OVODSAEMnIOyrA6u3IXVukvkGs=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03TFoYV0043468
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 Apr 2020 10:50:34 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 10:50:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 10:50:34 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TFoYqe007051;
        Wed, 29 Apr 2020 10:50:34 -0500
Subject: Re: [PATCH v22 01/16] dt: bindings: Add multicolor class dt bindings
 documention
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
References: <20200429125631.7044-1-dmurphy@ti.com>
 <20200429125631.7044-2-dmurphy@ti.com>
 <769c19a1-4124-b674-5b03-6100f176768e@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <8991ffea-3ac6-555d-1cab-b50ec4d46372@ti.com>
Date:   Wed, 29 Apr 2020 10:44:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <769c19a1-4124-b674-5b03-6100f176768e@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 4/29/20 10:37 AM, Jacek Anaszewski wrote:
> Hi Dan,
>
> Thanks for the conversion, but now the binding example is missing.
> In Documentation/devicetree/bindings/leds/common.yaml we do have
> examples.
>
I have looked at a few recent examples of yaml files (rohm,bd71828-leds 
and max77650) and there are no examples.

I am not sure if examples are required but more of a nice to have 
especially for peripherals.

But additionalProperties: false is required

I can add a really basic example but I thought the intent of the 
examples was to derive a sample dts.

Dan

