Return-Path: <linux-leds+bounces-5016-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AC4AFE25D
	for <lists+linux-leds@lfdr.de>; Wed,  9 Jul 2025 10:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6831F7BA5B0
	for <lists+linux-leds@lfdr.de>; Wed,  9 Jul 2025 08:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1D523C4F4;
	Wed,  9 Jul 2025 08:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGrJBJWc"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C53623BCFD;
	Wed,  9 Jul 2025 08:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752049070; cv=none; b=dRV2m0vVUyUPo9B5oFhknnJ+1AsjPFxp0Gf26lhKz9DnnnVc8VRmdzA6Zs+RtuxYK/0RBqlmPMpRY5qMpK7vhg2uk87ELCmx28BnDw9mnhcNBPxv46TYtUvDyvA5g9cIBwHyYlhwPyCslKJB7+hOYNkNjJYy9HLBHKd7JLilBFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752049070; c=relaxed/simple;
	bh=/kYCP1jcX6pH1+1VaWK2ovgN8n6K+bsAYDb2E124br8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xk5cqZA/sQQIZnXD5r+VRhyYsa1oP0bMKWZ7Aks//3rSaCD8A7GEBnzBqVjrkPEC4rhB7FC02neA9NVHkbpp7ljqD7tB423zSWaNCs68q1nqFdCGLhzHCYLvSNa/Mso5QLvoXAJr5jpnDLd+hj8GGF5Ymu6Err2a9Nu58U+grQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGrJBJWc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B472C4CEF0;
	Wed,  9 Jul 2025 08:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752049070;
	bh=/kYCP1jcX6pH1+1VaWK2ovgN8n6K+bsAYDb2E124br8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GGrJBJWcmZzOlS5iLHstmP5oXeaJqfsSXpdAPlr8KQ0ys4ckluy+zbawQj2utnHQB
	 nFKXXdoHhKKyyqvW073GbZ4GmmJDKSzcEMwgFY71LE+JMpuKcfzQrf2s9M3RlpRXNv
	 XMW9nlnDTq/S30VSIovETw8WJ4U60QIP4YBtIcEN/xIQpjWr+iZIO8IoltXLKgUpa3
	 3ug/+RB+kgvNF6Aoy3tJuuuV+u7M0Mvohgx3go+K5Tk2WY/QjtbXJ2GUb9rM8xjWlf
	 rPXLTAVohucehi2PoJXa5+MpIi5VZcQhfZMHm0bXtvTIO/FA21pQ/uy5fN4ZXH/4VK
	 uAs33VLYnhl6g==
Date: Wed, 9 Jul 2025 10:17:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
	Lucca Fachinetti <luccafachinetti@gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: leds: is31fl32xx: convert the
 binding to yaml
Message-ID: <20250709-happy-gazelle-of-fascination-fe0fd4@krzk-bin>
References: <20250708-leds-is31fl3236a-v3-0-d68979b042dd@thegoodpenguin.co.uk>
 <20250708-leds-is31fl3236a-v3-2-d68979b042dd@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708-leds-is31fl3236a-v3-2-d68979b042dd@thegoodpenguin.co.uk>

On Tue, Jul 08, 2025 at 03:59:46PM +0100, Pawel Zalewski wrote:
> From: Lucca Fachinetti <luccafachinetti@gmail.com>
> 
> Keep the old maintainers field as is.
> Add datasheets for reference, NB that I was not able to find an
> up-to-date, funtional direct URL for si-en products datasheet
> so they were skipped.
> 
> Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
> Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> ---
>  .../devicetree/bindings/leds/issi,is31fl3236.yaml  | 98 ++++++++++++++++++++++
>  .../devicetree/bindings/leds/leds-is31fl32xx.txt   | 52 ------------
>  2 files changed, 98 insertions(+), 52 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d0f9add5af01ac06c4bb87b0cd0faec71d0ef37c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/issi,is31fl3236.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: is31fl32xx and Si-En SN32xx IC LED driver

Driver as Linux driver or LED driver? If the first, then drop.

> +
> +maintainers:
> +  - Pavel Machek <pavel@ucw.cz>
> +  - Lee Jones <lee@kernel.org>

These should be people interested in this hardware, not subsystem
maintainers.

> +
> +description: |
> +  The is31fl32xx/SN32xx family of LED drivers are I2C devices with multiple
> +  constant-current channels, each with independent 256-level PWM control.
> +  Each LED is represented as a sub-node of the device.
> +
> +  For more product information please see the links below:
> +    https://www.lumissil.com/assets/pdf/core/IS31FL3236_DS.pdf
> +    https://www.lumissil.com/assets/pdf/core/IS31FL3236A_DS.pdf
> +    https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
> +    https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
> +    https://www.lumissil.com/assets/pdf/core/IS31FL3216_DS.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - issi,is31fl3236
> +      - issi,is31fl3236a
> +      - issi,is31fl3235
> +      - issi,is31fl3218
> +      - issi,is31fl3216
> +      - si-en,sn3218
> +      - si-en,sn3216
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  "#size-cells":

Keep consistent quotes, either " or '. You made different choice for the
same properties even...

> +    const: 0
> +
> +patternProperties:
> +  "^led@[1-9a-f]+$":

Pattern does not match entirely the reg constraints. 36 is 0x24.


Best regards,
Krzysztof


