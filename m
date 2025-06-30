Return-Path: <linux-leds+bounces-4931-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAEEAED469
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 08:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EEA93A6B81
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 06:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC821D516F;
	Mon, 30 Jun 2025 06:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lgkcU0sU"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4400539A;
	Mon, 30 Jun 2025 06:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751264359; cv=none; b=ayjp19tOAV07i/57Sca0oZ1ZCHMKVoBZxFwe8yE2HuDPlUPsMzX1Ctcn9iVxzI2OaBMXdPo3DBBRSlnLxWqJSkuzkqPLbeKryqgXYMmssrUOPs+We5USAFQyvEQrsxZBee4KwyonBHaqqnWwTcK4yeJqa8E9iA/jBUJVLwehB1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751264359; c=relaxed/simple;
	bh=YNi3rUKfDL2d2tPhS2MhabwQpR8siG4/oYCgsTm5bYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l0q3zMyr1gqs65rWiW5n/VzoHh+YU1UbEE4cESPSLkrEG2dNloCu/YJ4X/K8PR54YsaO82Xjh6BmyT9v8z8Cqyn1egLXGSHpfGN9wQZ5MJKrrznJtGerj+rA6mWXT0gBAPgZ9arm868OAFsHleSE9skfglcnUC4SoHimcqw5jVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lgkcU0sU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D26C4CEE3;
	Mon, 30 Jun 2025 06:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751264359;
	bh=YNi3rUKfDL2d2tPhS2MhabwQpR8siG4/oYCgsTm5bYo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lgkcU0sUYoXyWxCed4o3zUj4ahiLewh6LuRhrswOAr9ygHV7k5nffVxrbdOb1o9l6
	 z4kc019A6hNE6HUVLV4ggLCyekMAZQb7duMHe32dF2TXH3dkxkGGC0HiIccrh5pGIl
	 g+6bjkjlU3JjYGteO0qJjqcW3uKNeKgEX4+VnLLtpQT+tB+LmanxQEkMV6jdjDVFU/
	 EoFCiR4PvDOmserHl2ZYrz4YjLEpAoDbrfCes0jG9fhlZ80o3wpkd8IxN7dKZcAo2K
	 2FkLauR2alPhNQtj8wA2JcZUmif6NJhmlwlHEHfucvS448Wn9avitxB3V2fxF6GLia
	 NJ+5pxiMbxGnA==
Message-ID: <d3d8f72a-e4fe-4f85-8ead-6c104aa32893@kernel.org>
Date: Mon, 30 Jun 2025 08:19:11 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] dt-bindings: auxdisplay: add Titan Micro
 Electronics TM16XX
To: =?UTF-8?Q?Jean-Fran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Boris Gjenero <boris.gjenero@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Paolo Sabatino <paolo.sabatino@gmail.com>
References: <20250629130002.49842-1-jefflessard3@gmail.com>
 <20250629130002.49842-8-jefflessard3@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250629130002.49842-8-jefflessard3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/06/2025 14:59, Jean-François Lessard wrote:
> Add documentation for Titanmec TM16XX and compatible LED display controllers.
> 
> This patch is inspired by previous work from Andreas Färber and Heiner Kallweit.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> 
> Co-developed-by: Andreas Färber <afaerber@suse.de>
> Co-developed-by: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
> ---
>  .../bindings/auxdisplay/titanmec,tm16xx.yaml  | 210 ++++++++++++++++++
>  1 file changed, 210 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
> new file mode 100644
> index 0000000000..65c43e3ba4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
> @@ -0,0 +1,210 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/auxdisplay/titanmec,tm16xx.yaml#

Why isn't this in leds directory? Everything below describes it as LED
controller.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Auxiliary displays based on TM16xx and compatible LED controllers
> +
> +maintainers:
> +  - Jean-François Lessard <jefflessard3@gmail.com>
> +
> +description: |
> +  TM16xx controllers manage a matrix of LEDs organized in grids (rows) and segments (columns).
> +  Each grid or segment can be wired to drive either a digit or individual icons, depending on the

Wrap according to Linux coding style, so at 80.

> +  board design.
> +
> +  Typical display example:
> +
> +           ---    ---       ---    ---
> +    WIFI  |   |  |   |  -  |   |  |   |  USB  PLAY
> +           ---    ---       ---    ---
> +    LAN   |   |  |   |  -  |   |  |   |  BT   PAUSE
> +           ---    ---       ---    ---
> +
> +  The controller itself is agnostic of the display layout. The specific arrangement
> +  (which grids and segments drive which digits or icons) is determined by the board-level
> +  wiring. Therefore, these bindings describe hardware configuration at the PCB level
> +  to enable support of multiple display implementations using these LED controllers.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - titanmec,tm1618
> +      - titanmec,tm1620
> +      - titanmec,tm1628
> +      - titanmec,tm1650
> +      - fdhisi,fd620
> +      - fdhisi,fd628
> +      - fdhisi,fd650
> +      - fdhisi,fd6551
> +      - fdhisi,fd655
> +      - icore,aip650
> +      - icore,aip1618
> +      - icore,aip1628
> +      - princeton,pt6964
> +      - winrise,hbs658

Several devices are compatible, so express it here and drop redundant
entries in the driver.

> +
> +  reg:
> +    maxItems: 1
> +
> +  titanmec,digits:
> +    description: |
> +      Array of grid (row) indexes corresponding to specific wiring of digits in the display matrix.

What is wiring of digits? This and other descriptions don't tell me much.

Wrap according to Linux coding style, so at 80.

> +      Defines which grid lines are connected to digit elements.
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    items:
> +      minimum: 0
> +      maximum: 7
> +    minItems: 1
> +    maxItems: 8
> +
> +  titanmec,segment-mapping:
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      Array of segment (column) indexes specifying the hardware layout mapping used for digit display.
> +      Each entry gives the segment index corresponding to a standard 7-segment element (a-g).

Wrap according to Linux coding style, so at 80.

This looks like duplicating the reg property.


> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    items:
> +      minimum: 0
> +      maximum: 7
> +    minItems: 7
> +    maxItems: 7
> +
> +  titanmec,transposed:
> +    description: |
> +      Optional flag indicating if grids and segments are swapped compared to standard matrix orientation.
> +      This accommodates devices where segments are wired to rows and grids to columns.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^led@[0-7],[0-7]$":

Why do you have two addresses? It's not used in your example.

> +    $ref: /schemas/leds/common.yaml#
> +    properties:
> +      reg:
> +        description: Grid (row) and segment (column) index in the matrix of this individual LED icon

Missing constraints.

> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - titanmec,digits
> +  - titanmec,segment-mapping
> +
> +additionalProperties: true

No, this cannot be true. Look at any other binding, look at example-schema.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      display-controller@24 {
> +        reg = <0x24>;
> +        compatible = "fdhisi,fd655";
> +        titanmec,digits = [01 02 03 04];
> +        titanmec,segment-mapping = [03 04 05 00 01 02 06];
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +
> +        led@0,0 {
> +          reg = <0 0>;
> +          function = LED_FUNCTION_ALARM;
> +        };
> +
> +        led@0,1 {
> +          reg = <0 1>;
> +          function = LED_FUNCTION_USB;
> +        };
> +
> +        led@0,2 {
> +          reg = <0 2>;
> +          function = "play";
> +        };
> +
> +        led@0,3 {
> +          reg = <0 3>;
> +          function = "pause";
> +        };
> +
> +        led@0,4 {
> +          reg = <0 4>;
> +          function = "colon";
> +        };
> +
> +        led@0,5 {
> +          reg = <0 5>;
> +          function = LED_FUNCTION_LAN;
> +        };
> +
> +        led@0,6 {
> +          reg = <0 6>;
> +          function = LED_FUNCTION_WLAN;
> +        };
> +      };
> +    };
> +
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    spi {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      display-controller@0 {
> +        reg = <0x0>;
> +        compatible = "fdhisi,fd628";
> +        titanmec,transposed;
> +        titanmec,digits = [00 01 02 03];
> +        titanmec,segment-mapping = [00 01 02 03 04 05 06];
> +        spi-3wire;
> +        spi-lsb-first;
> +        spi-rx-delay-us = <1>;
> +        spi-max-frequency = <500000>;
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +
> +        led@4,0 {
> +          reg = <4 0>;
> +          function = "apps";
> +        };
> +
> +        led@4,1 {
> +          reg = <4 1>;
> +          function = "setup";
> +        };
> +
> +        led@4,2 {
> +          reg = <4 2>;
> +          function = LED_FUNCTION_USB;
> +        };
> +
> +        led@4,3 {
> +          reg = <4 3>;
> +          function = LED_FUNCTION_SD;
> +        };
> +
> +        led@4,4 {
> +          reg = <4 4>;
> +          function = "colon";
> +        };
> +
> +        led@4,5 {
> +          reg = <4 5>;
> +          function = "hdmi";
> +        };
> +
> +        led@4,6 {
> +          reg = <4 6>;
> +          function = "video";
> +        };
> +      };
> +    };


Best regards,
Krzysztof

