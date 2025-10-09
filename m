Return-Path: <linux-leds+bounces-5719-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D63CBCAC65
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 22:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4A54835488A
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 20:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7326426A0DD;
	Thu,  9 Oct 2025 20:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FP3xQ7GX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5791EA7EC;
	Thu,  9 Oct 2025 20:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760040982; cv=none; b=Ou5WvHtMq04NL0+5ZTnMiziz4h8O5Kkw//6B9OqngFo/VNaTW6NoBnfvyr36DyWOE7MgKzdsyxjxAAoeT6UwFZqAvAQbUYIO4flq7VD5rZtHB6Xo3E1rk45GJvlwvSdJz0iyL349WfhU+ipASc+VDPVBjfgkXGK5DWF8Fzl30Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760040982; c=relaxed/simple;
	bh=IWSnNSei8RRn9htiOUVDRbUjeFnamuDaQ4nZ4n46zLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8Jt62rnU2jdMYe5ElXEDr8wSAZApD8nvyyjIP/LIVQO6K9/aN59qZDvyfKZrqBkadERKRboyiY51FS0Hk+uWuz8dHFyzqr2cijfAJeQep0tIZhcf2uUChZY+f7o5njr/XcdGJRJIAC313j5v7s5yOyceoQ/EfPomcIKQxzHFGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FP3xQ7GX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5526FC4CEE7;
	Thu,  9 Oct 2025 20:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760040981;
	bh=IWSnNSei8RRn9htiOUVDRbUjeFnamuDaQ4nZ4n46zLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FP3xQ7GXQp/QP+gpUaLPNEvB4S8G+2unZHJq/Q3L3XBufoDkCFIjQs2cvk1nOhW5G
	 X3oggIEsnEjcWhnuidq7ynvjwZ02SAFXfFXOmFldkxXKs0Y7zUR6HjoJIdCpXQW9cx
	 +ALVNkipODgz9r+kGGUKPYeaU+c+hx/kumOpyqz6WFhscNLQ8ygVyRvZ0ZOcPP1jld
	 cJh28wb1uKFTNw+A0YM3mQWqKgbo00hF/19PwY/hG33WUb3IOw9kbxqjVz1hF9eQhh
	 ONefS/VVhVblCjmG9Q7OuE2HBFvbsIvzTQcuRNUy+dvD33FHoU8nK3YFF4wX1ZRunt
	 Pc3RJXPJ0J/sw==
Date: Thu, 9 Oct 2025 15:16:20 -0500
From: Rob Herring <robh@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, gregkh@linuxfoundation.org,
	rdunlap@infradead.org, christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v15 1/3] dt-bindings: leds: add TI/National Semiconductor
 LP5812 LED Driver
Message-ID: <20251009201620.GA3267176-robh@kernel.org>
References: <20251005153337.94025-1-trannamatk@gmail.com>
 <20251005153337.94025-2-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005153337.94025-2-trannamatk@gmail.com>

On Sun, Oct 05, 2025 at 10:33:35PM +0700, Nam Tran wrote:
> The LP5812 is a 4x3 RGB LED driver with an autonomous animation
> engine and time-cross-multiplexing (TCM) support for up to 12 LEDs
> or 4 RGB LEDs. It supports both analog (256 levels) and PWM (8-bit)
> dimming, including exponential PWM for smooth brightness control.
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  .../devicetree/bindings/leds/ti,lp5812.yaml   | 290 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 296 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> new file mode 100644
> index 000000000000..d759ba7a86fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> @@ -0,0 +1,290 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/ti,lp5812.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI LP5812 4x3 Matrix RGB LED Driver with Autonomous Control
> +
> +maintainers:
> +  - Nam Tran <trannamatk@gmail.com>
> +
> +description: |
> +  The LP5812 is a 4x3 matrix RGB LED driver with I2C interface
> +  and autonomous animation engine control.
> +  For more product information please see the link below:
> +  https://www.ti.com/product/LP5812#tech-docs
> +
> +properties:
> +  compatible:
> +    const: ti,lp5812
> +
> +  reg:
> +    maxItems: 1
> +
> +  ti,operation-mode:
> +    description: |
> +      Selects the LED operation mode of the LP5812. The device supports
> +      three modes:
> +        - Direct-drive mode ("direct_mode") drives up to 4 LEDs directly
> +        by internal current sinks (LED0-LED3).

I would make this the default and call the property 'ti,scan-mode'.

> +        - TCM-drive mode ("tcmscan:<n>:<order...>") drives up to 12 LEDs
> +        (4 RGB) using 1-4 scan multiplexing. The <n> specifies the number
> +        of scans (1-4), and <order...> defines the scan order of the outputs.
> +        - Mix-drive mode ("mixscan:<n>:<direct>:<order...>") combines
> +        direct-drive and TCM-drive outputs. The <n> specifies the number
> +        of scans, <direct> selects the direct-drive outputs, and <order...>
> +        defines the scan order.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - direct_mode
> +      - tcmscan:1:0
> +      - tcmscan:1:1
> +      - tcmscan:1:2
> +      - tcmscan:1:3
> +      - tcmscan:2:0:1
> +      - tcmscan:2:0:2
> +      - tcmscan:2:0:3
> +      - tcmscan:2:1:2
> +      - tcmscan:2:1:3
> +      - tcmscan:2:2:3
> +      - tcmscan:3:0:1:2
> +      - tcmscan:3:0:1:3
> +      - tcmscan:3:0:2:3
> +      - tcmscan:4:0:1:2:3
> +      - mixscan:1:0:1
> +      - mixscan:1:0:2
> +      - mixscan:1:0:3
> +      - mixscan:1:1:0
> +      - mixscan:1:1:2
> +      - mixscan:1:1:3
> +      - mixscan:1:2:0
> +      - mixscan:1:2:1
> +      - mixscan:1:2:3
> +      - mixscan:1:3:0
> +      - mixscan:1:3:1
> +      - mixscan:1:3:2
> +      - mixscan:2:0:1:2
> +      - mixscan:2:0:1:3
> +      - mixscan:2:0:2:3
> +      - mixscan:2:1:0:2
> +      - mixscan:2:1:0:3
> +      - mixscan:2:1:2:3
> +      - mixscan:2:2:0:1
> +      - mixscan:2:2:0:3
> +      - mixscan:2:2:1:3
> +      - mixscan:2:3:0:1
> +      - mixscan:2:3:0:2
> +      - mixscan:2:3:1:2
> +      - mixscan:3:0:1:2:3
> +      - mixscan:3:1:0:2:3
> +      - mixscan:3:2:0:1:3
> +      - mixscan:3:3:0:1:2

I'm not sure its worth listing out every combination. I'd just do this 
even if illegal combinations are allowed:

pattern: '^(tcm|mix):[1-4](:[0-3]){1,4}$'

Rob

