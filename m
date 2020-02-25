Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8E516C1A0
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2020 14:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730041AbgBYNFt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Feb 2020 08:05:49 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49288 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729193AbgBYNFt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Feb 2020 08:05:49 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01PD0LHw123433;
        Tue, 25 Feb 2020 07:00:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582635621;
        bh=n4t+iSnVQ8VDVIb2I48j7hH+y8NZ1XyrKycrJ1RQK90=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Em9lWr5gFGAJGIVefw5xY+a+Dwwp3Pn1zqurQTmTa86QzSJfB61woe0HHUX/g8ehS
         XLAlCnUyKrUCjo5oq/k/ku4iF5vXr4pkDEUhadl/PRi+CaazR50RDc2zCa/81FX0cB
         wuXtBSeggje7gf1NyIoD0IKvmhnN45jt4LHXNtzo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01PD0LKB096983
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Feb 2020 07:00:21 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 25
 Feb 2020 07:00:20 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 25 Feb 2020 07:00:20 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01PD0KFe036379;
        Tue, 25 Feb 2020 07:00:20 -0600
Subject: Re: [PATCH 1/4] dt-bindings: leds: Add a binding for AXP813 charger
 led
To:     Ondrej Jirman <megous@megous.com>, <linux-sunxi@googlegroups.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200223131435.681620-1-megous@megous.com>
 <20200223131435.681620-2-megous@megous.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <8c4b9ef7-0c18-d5c1-9672-b7fc683c3ce9@ti.com>
Date:   Tue, 25 Feb 2020 06:55:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200223131435.681620-2-megous@megous.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Ondrej

On 2/23/20 7:14 AM, Ondrej Jirman wrote:
> The AXP813 PMIC can control one LED. Add binding to represent the LED.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>   .../devicetree/bindings/leds/leds-axp20x.yaml | 24 +++++++++++++++++++
>   1 file changed, 24 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-axp20x.yaml
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-axp20x.yaml b/Documentation/devicetree/bindings/leds/leds-axp20x.yaml
> new file mode 100644
> index 0000000000000..79282d55764bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-axp20x.yaml
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-axp20x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED driver for AXP813 PMIC from X-Powers.
> +
> +maintainers:
> +  - Ondrej Jirman <megous@megous.com>
> +
> +description: |
> +  This module is part of the AXP20x MFD device. For more details
> +  see Documentation/devicetree/bindings/mfd/axp20x.txt.
> +
> +  The LED controller is represented as a sub-node of the PMIC node on
> +  the device tree.
> +
> +properties:
> +  compatible:
> +    const: x-powers,axp813-charger-led
> +
> +required:
> +  - compatible

You need to add the color and function properties for proper LED device 
name presentation per the bindings/leds/common.yaml binding.

Dan


