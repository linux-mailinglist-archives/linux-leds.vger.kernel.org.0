Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A83CB220D4E
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2020 14:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730739AbgGOMro (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Jul 2020 08:47:44 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41532 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728861AbgGOMro (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Jul 2020 08:47:44 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06FClTiN090361;
        Wed, 15 Jul 2020 07:47:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594817249;
        bh=mNYG7C2AFo+DMWqI9KN0mrqcpSYNSNfj3TajtzUuWj8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Mq7Uv2p9Gabl4xRqsSPQpYb5VP9SEXn3+T6Pg3wu8U1MO9WJMe+aRDf+5Hckbg6sU
         lpIMNWm6l+dAT7eoa0j2czHUWnF54xSxcCp+59p29HtFGI6fMpg8TyielsW1zipFfN
         YunM5pTJyt8L5XZHZicAaKCi5J1abI6MIRSHhVbU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06FClTVm128096
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jul 2020 07:47:29 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 15
 Jul 2020 07:47:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 15 Jul 2020 07:47:28 -0500
Received: from [10.250.32.229] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06FClSKZ075347;
        Wed, 15 Jul 2020 07:47:28 -0500
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: add cznic,turris-omnia-leds
 binding
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        <linux-leds@vger.kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>, <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
References: <20200715124034.9804-1-marek.behun@nic.cz>
 <20200715124034.9804-2-marek.behun@nic.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <c1bfdb2a-f11e-9f67-1569-10c48f40407c@ti.com>
Date:   Wed, 15 Jul 2020 07:47:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715124034.9804-2-marek.behun@nic.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

On 7/15/20 7:40 AM, Marek Behún wrote:
> Add device-tree bindings documentation for Turris Omnia RGB LEDs.
>
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>   .../leds/cznic,turris-omnia-leds.yaml         | 88 +++++++++++++++++++
>   1 file changed, 88 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
>
> diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> new file mode 100644
> index 000000000000..0b33ebf22e27
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/cznic,turris-omnia-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CZ.NIC's Turris Omnia LEDs driver
> +
> +maintainers:
> +  - Marek Behún <marek.behun@nic.cz>
> +
> +description:
> +  This module adds support for the RGB LEDs found on the fron panel of the
s/fron/front
> +  Turris Omnia router. There are 12 RGB LEDs, they are controlled by device's
> +  microcontroller with which the system communicates via I2C. Each LED is

This is a bit confusing and reads very rough can maybe

There are 12 RGB LEDs that are controlled via a micro controller that 
communicates via the I2C bus.

Dan


