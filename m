Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 838818C21B
	for <lists+linux-leds@lfdr.de>; Tue, 13 Aug 2019 22:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbfHMUbO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 13 Aug 2019 16:31:14 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:59174 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfHMUbO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Aug 2019 16:31:14 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7DKV9Cu100047;
        Tue, 13 Aug 2019 15:31:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565728269;
        bh=jLhK86Oecet3GUKCruU64ZUr3SjgwUKfS2GudCyLPUw=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=wNU0UYOmYWbPMq22e8MXkLzWUUsetp4O1wPlsOJFCAUCFnxzfm+naEeoRPrLm6WwC
         eGRiGcDM4aa0Z1zS2h5QFOh6z9PZqFKJjjmuRjP/yXmWfWhXOFYOJwOUlPOUmC9db5
         g07gHxxD91I0pYP+7hMRJSCYHjt4ZbL2/6yHBFMI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7DKV9IE035581
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 13 Aug 2019 15:31:09 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 13
 Aug 2019 15:31:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 13 Aug 2019 15:31:09 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7DKV96Z043501;
        Tue, 13 Aug 2019 15:31:09 -0500
Subject: Re: [PATCH v4 1/2] dt-bindings: Add docs for EL15203000
To:     Oleh Kravchenko <oleg@kaa.org.ua>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>
References: <20190808203204.8614-1-oleg@kaa.org.ua>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <ea3d06b2-3689-bcfc-8f5f-6345634cfa2b@ti.com>
Date:   Tue, 13 Aug 2019 15:31:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190808203204.8614-1-oleg@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

Need your input below

On 8/8/19 3:32 PM, Oleh Kravchenko wrote:
> Add documentation and example for dt-bindings EL15203000.
> LED board (aka RED LED board) from Crane Merchandising Systems.
>
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>   .../bindings/leds/leds-el15203000.txt         | 47 +++++++++++++++++++
>   1 file changed, 47 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.txt b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> new file mode 100644
> index 000000000000..4c2245babfdc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> @@ -0,0 +1,47 @@
> +Crane Merchandising System - el15203000 LED driver
> +--------------------------------------------------
> +
> +This LED Board (aka RED LEDs board) is widely used in
> +coffee vending machines produced by Crane Merchandising Systems.
> +
> +Required properties:
> +- compatible : "crane,el15203000"
> +- reg :
> +	see Documentation/devicetree/bindings/spi/spi-bus.txt
> +- spi-max-frequency : (optional)
> +	see Documentation/devicetree/bindings/spi/spi-bus.txt
> +
> +Optional LED sub-node properties:
> +- label :
> +	see Documentation/devicetree/bindings/leds/common.txt
> +- linux,default-trigger :
> +	see Documentation/devicetree/bindings/leds/common.txt
> +
> +Example
> +-------
> +
> +led-controller@0 {
> +	compatible = "crane,el15203000";
> +	reg = <0>;
> +	spi-max-frequency = <50000>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* water pipe */
> +	pipe@50 {
> +		reg = <0x50>;
> +		label = "red:pipe";

Should we use the color and function property here?

Not sure what function would be for pipe, screen or vending but there may be

comparable functions that may fit.

Dan

<snip>

