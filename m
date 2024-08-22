Return-Path: <linux-leds+bounces-2506-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F7495B10D
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 11:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCA471F22241
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 09:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A0117A584;
	Thu, 22 Aug 2024 09:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0VNALkv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBF861FF6;
	Thu, 22 Aug 2024 09:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724317241; cv=none; b=jdUPujbqOCDsfsKSQBZx2MbGpJQVGF03lnatC7z5YZwjKfwHYBSu1P3uswRb9CuZCKYf83AIygttW9cN00J2faye/wVmQD/JHtPhfPhRL5yCeqBc3UFxmLE3C0ynRR/7TDqZPrdqbsEvkYz0Q/S28fARAdHq9QTVwVOB6/E90lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724317241; c=relaxed/simple;
	bh=GWLUBE7cQHSG/eY1VEpuAMoT5uWLS0k3m7oJjzp1A9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UbT7aspNwx6Mr2IxVui5pZVAX2TytTUjqae1Lmw4SDZVWtiHWNmNWbESQ7kn8QEVotZOifgICp5Y3R37nDnXG3tYsiVTKOnEtCKViwZ2aBTHA/VFB5l3b5ArlsodqxoL9Ue/RcuWgCN1K4TluoNny0hxzI2JgPP7SiDxV+tcc9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0VNALkv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F2EC4AF0B;
	Thu, 22 Aug 2024 09:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724317240;
	bh=GWLUBE7cQHSG/eY1VEpuAMoT5uWLS0k3m7oJjzp1A9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a0VNALkvxkdfhLcw4Ji4byy9za/tks/m0xlCisPwfG6JMPbm5MlN6ojqtKdDMowBa
	 LhDO8HFZH4GvzzkJ6uM0LUjAUTsEpZDlIYSos//ea7cIXvdMOcYZCOSy/KpaMzSSyP
	 EL/UTMa/tCv/a+jKh+hCFrajzGPku/bk1UzxIJ29RD/3d0iPBSUCu8750Tyq5MJPvp
	 uRjAKvdzbkQ1NwE65pOytWo2iDNK+uwDgtuuelANKGGJmVRNvTgH27IGj81lbaFTxQ
	 S7XxEvbHSD+e/Ndi8hpqLkXVM7C4ABjlrlSTwuXpZ4YgDfe44z36Ezfc2X7iCHFTB8
	 IFNd9WeAGN9CQ==
Date: Thu, 22 Aug 2024 10:00:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
	"open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v3 1/1] dt-bindings: leds: convert leds-lm3692x to yaml
 format
Message-ID: <20240822-reacquire-unseemly-bc651d79993c@spud>
References: <20240821222001.591111-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QHKNtdAdc2HUeO8C"
Content-Disposition: inline
In-Reply-To: <20240821222001.591111-1-Frank.Li@nxp.com>


--QHKNtdAdc2HUeO8C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 21, 2024 at 06:20:00PM -0400, Frank Li wrote:
> diff --git a/Documentation/devicetree/bindings/leds/ti.lm36922.yaml b/Documentation/devicetree/bindings/leds/ti.lm36922.yaml
> new file mode 100644
> index 0000000000000..8ffbc6b785a3e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti.lm36922.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/ti.lm36922.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments - LM3692x Highly Efficient White LED Driver
> +
> +maintainers:
> +  - Dan Murphy <dmurphy@ti.com>
> +
> +description: |
> +  The LM3692x is an ultra-compact, highly efficient,
> +  white-LED driver designed for LCD display backlighting.
> +
> +  The main difference between the LM36922 and LM36923 is the number of
> +  LED strings it supports. The LM36922 supports two strings while the LM36923
> +  supports three strings.
> +
> +  For more product information please see the link below:
> +  https://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,lm36922
> +      - ti,lm36923
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
> +  enable-gpios:
> +    description: gpio pin to enable/disable the device.
> +
> +  vled-supply:
> +    description: LED supply
> +
> +  ti,ovp-microvolt:
> +    description: Overvoltage protection.
> +    default: 29000000
> +    enum: [17000000, 21000000, 25000000, 29000000]
> +
> +patternProperties:
> +  '^led@[0-3]$':
> +    type: object
> +    $ref: common.yaml
> +    properties:
> +      reg:
> +        enum: [0, 1, 2, 3]
> +        description: |
> +          0 - Will enable all LED sync paths
> +          1 - Will enable the LED1 sync
> +          2 - Will enable the LED2 sync
> +          3 - Will enable the LED3 sync (LM36923 only)
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
> +            const: ti,lm36922
> +    then:
> +      properties:
> +        led@3: false

Provided that you tested my psuedo code
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


--QHKNtdAdc2HUeO8C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsb+NAAKCRB4tDGHoIJi
0nw/APoDOrNBnKRN5f3Npw5UsDO9VPRjkkeksmdgPoMM83G2IwEAikLhs/D400Mo
rSfYd0rIIeiwThzfe/QNse31qmejVwI=
=3fMo
-----END PGP SIGNATURE-----

--QHKNtdAdc2HUeO8C--

