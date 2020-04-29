Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D33B11BE482
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2020 19:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbgD2RAY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 29 Apr 2020 13:00:24 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:59316 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726887AbgD2RAY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 Apr 2020 13:00:24 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TH0JiN090371;
        Wed, 29 Apr 2020 12:00:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588179619;
        bh=Gkb8r/lvh8DxwFW35aN6Aah5IE1jRxmHP9nOjBhNVic=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=Km16cS1+6eBBdUA4Xlint5P2uG4vnu+embrE7OTCNKG1znPv672Z887E62DCF0i/8
         xZZVB1UCDiMF6GwaUzKpZtDdfB4O0Y0nCpyhhWfJguMEcOQfY/NrkgKjr6K5StyxmP
         Li7GC0gJNbwXEr2P9UFHYGR5PLb1A1FqIPUDw3tM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03TH0JxE089843
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 Apr 2020 12:00:19 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 12:00:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 12:00:19 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TH0IAk095517;
        Wed, 29 Apr 2020 12:00:18 -0500
Subject: Re: [PATCH v22 01/16] dt: bindings: Add multicolor class dt bindings
 documention
From:   Dan Murphy <dmurphy@ti.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
References: <20200429125631.7044-1-dmurphy@ti.com>
 <20200429125631.7044-2-dmurphy@ti.com>
 <769c19a1-4124-b674-5b03-6100f176768e@gmail.com>
 <8991ffea-3ac6-555d-1cab-b50ec4d46372@ti.com>
Message-ID: <8d35f760-1d32-0541-6f5d-da6ce4324f2f@ti.com>
Date:   Wed, 29 Apr 2020 11:54:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8991ffea-3ac6-555d-1cab-b50ec4d46372@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 4/29/20 10:44 AM, Dan Murphy wrote:
> Jacek
>
> On 4/29/20 10:37 AM, Jacek Anaszewski wrote:
>> Hi Dan,
>>
>> Thanks for the conversion, but now the binding example is missing.
>> In Documentation/devicetree/bindings/leds/common.yaml we do have
>> examples.
>>
> I have looked at a few recent examples of yaml files 
> (rohm,bd71828-leds and max77650) and there are no examples.
>
> I am not sure if examples are required but more of a nice to have 
> especially for peripherals.
>
> But additionalProperties: false is required
>
> I can add a really basic example but I thought the intent of the 
> examples was to derive a sample dts.
>
I added examples to both the multicolor yaml and the LP50xx yaml.

I will post v23 tomorrow to give this series some soak time.

Dan


> Dan
>
