Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 658F2122C18
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 13:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbfLQMoD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 07:44:03 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46968 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbfLQMoC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Dec 2019 07:44:02 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHChk1p096977;
        Tue, 17 Dec 2019 06:43:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576586626;
        bh=fBE++3ilO6IUmK3o0yQscRjirNExl2DOv8fz3sakjvo=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=E3QhkF8ybUKO93tbkloFLpppJfdXzD0bjEgghZNSYUsXyGsgtZU6vjmG86jLFsPyd
         Eb+qlxWfnNDrttCV4h+QdwhB4ULlJICecsoOn9kiE0l9bK+msMVxFXetBQaFIhwxnJ
         uDfmTETbgWGN5Vz13Nf+KN5UYDjSM8cV1Yy6S8os=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHChkR2098566
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Dec 2019 06:43:46 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 06:43:45 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 06:43:45 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHChjMt109382;
        Tue, 17 Dec 2019 06:43:45 -0600
Subject: Re: [PATCH 1/2] dt: bindings: lm3692x: Document new properties
To:     =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <cover.1576499103.git.agx@sigxcpu.org>
 <35a23315938909c80e7772838e1de0d2d46302f2.1576499103.git.agx@sigxcpu.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <c523ccf6-6958-7457-c47b-f98e08588cfe@ti.com>
Date:   Tue, 17 Dec 2019 06:41:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <35a23315938909c80e7772838e1de0d2d46302f2.1576499103.git.agx@sigxcpu.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Guido

Thanks for the patch

On 12/16/19 6:28 AM, Guido Günther wrote:
> We allow configuration of brightness mode and over voltage
> protection.
>
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>   Documentation/devicetree/bindings/leds/leds-lm3692x.txt | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> index 4c2d923f8758..f195e8b45d85 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> @@ -18,6 +18,10 @@ Required properties:
>   Optional properties:
>   	- enable-gpios : gpio pin to enable/disable the device.
>   	- vled-supply : LED supply
> +	- ti,brightness-mapping-exponential: Whether to use exponential
> +	    brightness mapping
> +	- ti,overvoltage-volts: Overvoltage protection in Volts, can
> +	    be 0 (unprotected), 21, 25 or 29V
>   

Can you show examples of these in the DT binding?

Dan


