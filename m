Return-Path: <linux-leds+bounces-3573-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BA09ED16F
	for <lists+linux-leds@lfdr.de>; Wed, 11 Dec 2024 17:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84103284E61
	for <lists+linux-leds@lfdr.de>; Wed, 11 Dec 2024 16:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDD71DC19E;
	Wed, 11 Dec 2024 16:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t1TzczlE"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809DC1DC054;
	Wed, 11 Dec 2024 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733934387; cv=none; b=Z5VguZYisfWLko/QJo1m/DN+/5gRkTeh8BJw+tbLjK6jhX9zwJR99CxXkXnKT4RFGAlibd85agud9kM1tHWLs4GxrJdcehIPUMLwcDVPsllDMyX9IwJQg9Hp1keWhdKPCW6dWfgZ0+q6JevdlweZPd107TbupX6d98sL63ssuoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733934387; c=relaxed/simple;
	bh=n+o+yxNM5ZdJCr6WQ8RcBhGt5N5Huo3K/n45JJPZ7SI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxVnmim70pA4PAdsmsgw4SWXYvternYXfdhMWqqoWUl08zdAtI9oBuFXqdE0dD7NpqbVso5dQzo77Htlxfh5Fz/4Hh+YVJKaylYf61+owEuqFyviTnGVKKK3PDF2jEIL3tx7Z0VnqEe297YQl9NU+4TmeGdqNUTgAHyonnEsZA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t1TzczlE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84AEC4CEDE;
	Wed, 11 Dec 2024 16:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733934385;
	bh=n+o+yxNM5ZdJCr6WQ8RcBhGt5N5Huo3K/n45JJPZ7SI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t1TzczlEhe3cIj/7BvHzBsfxBedyDw1QWL/1b2bM6yfOr90pw8QBIaOgKvZAbR8Qs
	 DS/mPcI7LMkHzhU4Tr+HuWDRMm/3XTBbbHm288QjMcF1FuOKie8EHlED733NxpD0sz
	 wLDBxjjlB6dA6zsJ2xTGd63apr8HBIYiQkrzhVYiN+jqBxdGgXBlLGHL5Ifbret1ia
	 yIS7hCIDo3Jk2K1MaMta1ggwwfGyRYxkwSHxMM8rdTcgxlZomYMDsSS3S7+cSXd8XU
	 eMHPrIBvBjRNBSi6SOOopfpZXRTNeGzrNvztp5nfddMjFs3X9/TKRWjwK+olG1y4lX
	 Sh5DIYWn7eaYw==
Date: Wed, 11 Dec 2024 10:26:22 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: "A. Sverdlin" <alexander.sverdlin@siemens.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: Convert LP8860 into YAML format
Message-ID: <20241211162622.GA3242096-robh@kernel.org>
References: <20241206203103.1122459-1-alexander.sverdlin@siemens.com>
 <de6039a6-b7e6-4960-afcc-5f0d29fb27a8@ti.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de6039a6-b7e6-4960-afcc-5f0d29fb27a8@ti.com>

On Mon, Dec 09, 2024 at 08:29:00AM -0600, Andrew Davis wrote:
> On 12/6/24 2:31 PM, A. Sverdlin wrote:
> > From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > 
> > Convert Texas Instruments' LP8860 LED driver bindings into YAML format.
> > 
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > ---
> > The patch is now separated from the LP8864 series:
> > https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241206170717.1090206-2-alexander.sverdlin@siemens.com/
> > 
> >   .../devicetree/bindings/leds/leds-lp8860.txt  | 50 ----------
> >   .../devicetree/bindings/leds/ti,lp8860.yaml   | 95 +++++++++++++++++++
> >   2 files changed, 95 insertions(+), 50 deletions(-)
> >   delete mode 100644 Documentation/devicetree/bindings/leds/leds-lp8860.txt
> >   create mode 100644 Documentation/devicetree/bindings/leds/ti,lp8860.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> > deleted file mode 100644
> > index 8bb25749a3da3..0000000000000
> > --- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> > +++ /dev/null
> > @@ -1,50 +0,0 @@
> > -* Texas Instruments - lp8860 4-Channel LED Driver
> > -
> > -The LP8860-Q1 is an high-efficiency LED
> > -driver with boost controller. It has 4 high-precision
> > -current sinks that can be controlled by a PWM input
> > -signal, a SPI/I2C master, or both.
> > -
> > -Required properties:
> > -	- compatible :
> > -		"ti,lp8860"
> > -	- reg : I2C slave address
> > -	- #address-cells : 1
> > -	- #size-cells : 0
> > -
> > -Optional properties:
> > -	- enable-gpios : gpio pin to enable (active high)/disable the device.
> > -	- vled-supply : LED supply
> > -
> > -Required child properties:
> > -	- reg : 0
> > -
> > -Optional child properties:
> > -	- function : see Documentation/devicetree/bindings/leds/common.txt
> > -	- color : see Documentation/devicetree/bindings/leds/common.txt
> > -	- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
> > -	- linux,default-trigger :
> > -	   see Documentation/devicetree/bindings/leds/common.txt
> > -
> > -Example:
> > -
> > -#include <dt-bindings/leds/common.h>
> > -
> > -led-controller@2d {
> > -	compatible = "ti,lp8860";
> > -	#address-cells = <1>;
> > -	#size-cells = <0>;
> > -	reg = <0x2d>;
> > -	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
> > -	vled-supply = <&vbatt>;
> > -
> > -	led@0 {
> > -		reg = <0>;
> > -		function = LED_FUNCTION_BACKLIGHT;
> > -		color = <LED_COLOR_ID_WHITE>;
> > -		linux,default-trigger = "backlight";
> > -	};
> > -}
> > -
> > -For more product information please see the link below:
> > -https://www.ti.com/product/lp8860-q1
> > diff --git a/Documentation/devicetree/bindings/leds/ti,lp8860.yaml b/Documentation/devicetree/bindings/leds/ti,lp8860.yaml
> > new file mode 100644
> > index 0000000000000..62f133006fd0e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/ti,lp8860.yaml
> > @@ -0,0 +1,95 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/ti,lp8860.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Texas Instruments - lp8860 4-Channel LED Driver
> > +
> > +maintainers:
> > +  - Andrew Davis <afd@ti.com>
> > +
> > +description: |
> > +  The LP8860-Q1 is an high-efficiency LED driver with boost controller.
> > +  It has 4 high-precision current sinks that can be controlled by a PWM input
> > +  signal, a SPI/I2C master, or both.
> > +
> > +  For more product information please see the link below:
> > +    https://www.ti.com/product/lp8860-q1
> > +
> > +properties:
> > +  compatible:
> > +    const: ti,lp8860
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: I2C slave address
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  enable-gpios:
> > +    maxItems: 1
> > +    description: GPIO pin to enable (active high) / disable the device
> > +
> > +  vled-supply:
> > +    description: LED supply
> > +
> > +patternProperties:
> > +  "^led@[0]$":
> > +    type: object
> > +    $ref: common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        description:
> > +          Index of the LED.
> > +        const: 0
> > +
> > +      function: true
> > +      color: true
> > +      label: true
> > +      linux,default-trigger: true
> > +
> > +    required:
> > +      - reg
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/leds/common.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        led-controller@2d {
> > +            compatible = "ti,lp8860";
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            reg = <0x2d>;
> > +            enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
> > +            vled-supply = <&vbatt>;
> > +
> > +            led@0 {
> 
> So same comment I made in the pre-public review, lets see what the DT
> folks think:
> 
> I don't think we want to have the "@0" node naming. It forces us to
> add the "reg =" below, and that then forces us to add the #*-cells above.
> All this to work around not just calling the node "led-0". The driver
> doesn't care either way, and there are no in-tree users of the old way,
> so now should be a safe time to fix this while converting the binding.

Just 'led' should be allowed for the single child case.

However, as there are 4 channels, shouldn't the schema be '^led@[0-3]$'? 
If you want to support both that and just 'led', then that can be done 
too.

Rob

