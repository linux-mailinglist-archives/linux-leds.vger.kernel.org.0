Return-Path: <linux-leds+bounces-3714-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DC3A03325
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jan 2025 00:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBBF13A03BB
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jan 2025 23:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2831DF73A;
	Mon,  6 Jan 2025 23:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rH8dAlj0"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE741DA614;
	Mon,  6 Jan 2025 23:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736204792; cv=none; b=YefTparzhiNH+FvIykmnlOwipCf+yrx9fZ7P2QcYG8MD6Divxe5HtZbVld2TaesCe6rVai9GVvOllPCmtI7gdCBogtBgSQxZoOa1+YZYMZvZ0F1LQqXxOfyvFKbCmQOoxbHdb6c2E14B5bF2GW09bsPDtCicgkoP049IT7EknuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736204792; c=relaxed/simple;
	bh=L8NoW+GWrw6LkXXrWhcopZuOZE6yMFONkdHwl1YdEPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/t19C+MoAyKmqA80ESyFEXaDjVN5poWYMPyfBRrxYrDLVOoPmArltbR442Ge6MheNtKXNz14FOegaef0pB0Rutf25Tl3wWIOjqf/YS2S2nH/lt+ScmFEMque0I0zOvtA/JBLMqvWUhxvpLfl4WMgXFVkf83I/W0kujSFkCA9Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rH8dAlj0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AB6C4CEDD;
	Mon,  6 Jan 2025 23:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736204792;
	bh=L8NoW+GWrw6LkXXrWhcopZuOZE6yMFONkdHwl1YdEPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rH8dAlj0wtUy7xFErwehEOX1KyySG6mvDaTZkoAK+Iu+BFNQBU272riKgcMKBopha
	 jq936IQKtT/s5znsFkcm9TnOSRVyrrCOu5gTlA7XzwvIzilUHbkLIqWzB/dGcgffas
	 wfbuEPcExSKcgS166KigyzOThbXW3ZqbZeXUc6mFylNnxq2riEKSqBmPz/5co/KmD3
	 De84AKZf7hXRaJjfOzWr+r0pyOBkKClVKmHqksy6JgdUVUjcxXtkN2hmKSB8MKpxTB
	 lor3UVkfdR1H6XiA29mBCqvzSQ1moyeiXO0IPnf9GpMiBg8fvEX/I7kROmM/bp7oDO
	 EzZvtKb5W4Mkg==
Date: Mon, 6 Jan 2025 17:06:31 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	"open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: leds: Convert leds-tlc591xx.txt to yaml
 format
Message-ID: <20250106230631.GA1287822-robh@kernel.org>
References: <20250106210621.526224-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106210621.526224-1-Frank.Li@nxp.com>

On Mon, Jan 06, 2025 at 04:06:20PM -0500, Frank Li wrote:
> Convert binding doc leds-tlc591xx.txt to yaml format to fix below DTB_CHECK
> warning.
> 
> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb:
>   /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to match any schema with compatible: ['ti,tlc59108']
> 
> Additional change:
> - ref to common.yaml for child nodes.
> - limit child's reg to 0 - 7 for ti,tlc59108.
> - fix typo 'linux,default_trigger' in example.
> - change child node name's prefix to led-.
> - change nodename to led-controller.
> - fix properties order in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/leds/leds-tlc591xx.txt           | 40 --------
>  .../devicetree/bindings/leds/ti,tlc59116.yaml | 91 +++++++++++++++++++
>  2 files changed, 91 insertions(+), 40 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,tlc59116.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-tlc591xx.txt b/Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
> deleted file mode 100644
> index 3bbbf70244119..0000000000000
> --- a/Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -LEDs connected to tlc59116 or tlc59108
> -
> -Required properties
> -- compatible: should be "ti,tlc59116" or "ti,tlc59108"
> -- #address-cells: must be 1
> -- #size-cells: must be 0
> -- reg: typically 0x68
> -
> -Each led is represented as a sub-node of the ti,tlc59116.
> -See Documentation/devicetree/bindings/leds/common.txt
> -
> -LED sub-node properties:
> -- reg: number of LED line, 0 to 15 or 0 to 7
> -- label: (optional) name of LED
> -- linux,default-trigger : (optional)
> -
> -Examples:
> -
> -tlc59116@68 {
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -	compatible = "ti,tlc59116";
> -	reg = <0x68>;
> -
> -	wan@0 {
> -		label = "wrt1900ac:amber:wan";
> -		reg = <0x0>;
> -	};
> -
> -	2g@2 {
> -		label = "wrt1900ac:white:2g";
> -		reg = <0x2>;
> -	};
> -
> -	alive@9 {
> -		label = "wrt1900ac:green:alive";
> -		reg = <0x9>;
> -		linux,default_trigger = "heartbeat";
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/leds/ti,tlc59116.yaml b/Documentation/devicetree/bindings/leds/ti,tlc59116.yaml
> new file mode 100644
> index 0000000000000..cbf1a79b9cf6c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,tlc59116.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/ti,tlc59116.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LEDs connected to tlc59116 or tlc59108
> +
> +maintainers:
> +  - Andrew Lunn <andrew@lunn.ch>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tlc59108
> +      - ti,tlc59116
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "(^led-[0-9a-f]$|led)":

You have reg, so this should always have a unit-address: "^led@[0-9a-f]$"

> +    type: object
> +    $ref: common.yaml#
> +    properties:
> +      reg:
> +        items:
> +          minimum: 0
> +          maximum: 15
> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,tlc59108
> +    then:
> +      patternProperties:
> +        "(^led-[0-9a-f]$|led)":
> +          properties:
> +            reg:
> +              items:
> +                minimum: 0

0 is already the min.

> +                maximum: 7
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@68 {
> +            compatible = "ti,tlc59116";
> +            reg = <0x68>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            led-wan@0 {
> +                reg = <0x0>;
> +                label = "wrt1900ac:amber:wan";
> +            };
> +
> +            led-2g@2 {
> +                reg = <0x2>;
> +                label = "wrt1900ac:white:2g";
> +            };
> +
> +            led-alive@9 {
> +                reg = <0x9>;
> +                label = "wrt1900ac:green:alive";
> +                linux,default-trigger = "heartbeat";
> +            };
> +        };
> +    };
> +
> -- 
> 2.34.1
> 

