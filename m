Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89B9B2D5440
	for <lists+linux-leds@lfdr.de>; Thu, 10 Dec 2020 07:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732661AbgLJG5z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Dec 2020 01:57:55 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9146 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727852AbgLJG5z (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Dec 2020 01:57:55 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cs4TM2l3Sz15Zy2;
        Thu, 10 Dec 2020 14:56:39 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.9) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Thu, 10 Dec 2020
 14:57:10 +0800
Subject: Re: [PATCH] dt-bindings: leds: Document commonly used LED triggers
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <dmurphy@ti.com>,
        <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-leds@vger.kernel.org>
References: <20201210061431.23144-1-manivannan.sadhasivam@linaro.org>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <a1dde00a-3b39-51c5-b15a-d9cd56ba969c@huawei.com>
Date:   Thu, 10 Dec 2020 14:57:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20201210061431.23144-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 2020/12/10 14:14, Manivannan Sadhasivam wrote:
> This commit documents the LED triggers used commonly in the SoCs. Not
> all triggers are documented as some of them are very application specific.
> Most of the triggers documented here are currently used in devicetrees
> of many SoCs.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../devicetree/bindings/leds/common.yaml      | 72 ++++++++++++++-----
>  1 file changed, 54 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> index f1211e7045f1..eee4eb7a4535 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -79,24 +79,60 @@ properties:
>        the LED.
>      $ref: /schemas/types.yaml#definitions/string
>  
> -    enum:
> -        # LED will act as a back-light, controlled by the framebuffer system
> -      - backlight
> -        # LED will turn on (but for leds-gpio see "default-state" property in
> -        # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
> -      - default-on
> -        # LED "double" flashes at a load average based rate
> -      - heartbeat
> -        # LED indicates disk activity
> -      - disk-activity
> -        # LED indicates IDE disk activity (deprecated), in new implementations
> -        # use "disk-activity"
> -      - ide-disk
> -        # LED flashes at a fixed, configurable rate
> -      - timer
> -        # LED alters the brightness for the specified duration with one software
> -        # timer (requires "led-pattern" property)
> -      - pattern
> +    oneOf:
> +      - items:
> +          - enum:
> +                # LED will act as a back-light, controlled by the framebuffer system
> +              - backlight
> +                # LED will turn on (but for leds-gpio see "default-state" property in
> +                # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
> +              - default-on
> +                # LED "double" flashes at a load average based rate
> +              - heartbeat
> +                # LED indicates disk activity
> +              - disk-activity
> +                # LED indicates IDE disk activity (deprecated), in new implementations
> +                # use "disk-activity"
> +              - ide-disk
> +                # LED flashes at a fixed, configurable rate
> +              - timer
> +                # LED alters the brightness for the specified duration with one software
> +                # timer (requires "led-pattern" property)
> +              - pattern
> +                # LED indicates camera flash state
> +              - flash
> +                # LED indicates camera torch state
> +              - torch
> +                # LED indicates audio mute state
> +              - audio-mute
> +                # LED indicates mic mute state
> +              - audio-micmute
> +                # LED indicates bluetooth power state
> +              - bluetooth-power
> +                # LED indicates USB gadget activity
> +              - usb-gadget
> +                # LED indicates USB host activity
> +              - usb-host
> +                # LED indicates MTD memory activity
> +              - mtd
> +                # LED indicates NAND memory activity (deprecated),
> +                # in new implementations use "mtd"
> +              - nand-disk
> +                # LED indicates disk read activity
> +              - disk-read
> +                # LED indicates disk write activity
> +              - disk-write
> +                # No trigger assigned to the LED. This is the default mode
> +                # if trigger is absent
> +              - none
> +                # LED indicates activity of all CPUs
> +              - cpu
The triggers phy0tx and hci0-power are missed.

Since you've rewritten it, please consider sorting these property strings
in ascending alphabetical order.

> +      - items:
> +            # LED indicates activity of [N]th CPU
> +          - pattern: "^cpu[0-9][0-9]$"
should be ^cpu[0-9]{1,2}$, otherwise, it always requires two digit.

> +      - items:
> +            # LED indicates [N]th MMC storage activity
> +          - pattern: '^mmc[0-9][0-9]$'
should be '^mmc[0-9]{1,2}$'

Why CPU use "", and mmc use ''，It's better to keep them consistent.

>  
>    led-pattern:
>      description: |
> 

