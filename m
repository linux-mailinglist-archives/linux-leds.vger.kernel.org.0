Return-Path: <linux-leds+bounces-2802-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F843984D09
	for <lists+linux-leds@lfdr.de>; Tue, 24 Sep 2024 23:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0460F1F2405F
	for <lists+linux-leds@lfdr.de>; Tue, 24 Sep 2024 21:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5D913D509;
	Tue, 24 Sep 2024 21:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jb+nwJln"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A1213D25E;
	Tue, 24 Sep 2024 21:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727214677; cv=none; b=EBEwik2K4L90fxk//2SZme+ATsyCscJJdVtxLnqHIEXBWoB2S9g24OF2186H5K3D401C10I2ydc+FmrQbNAKTPhR0jQuAHZNPZDtMDRM4+ERlzsuGTYeljE4CaacbfarlfoV4C5/c87DzJgqCBtUnV4oyA9U8MmkgtHmfax+T9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727214677; c=relaxed/simple;
	bh=I9fZdNKVo0YbAuWP4prBW4eICPhqhX2GRyCChLp2E4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqYMYx4ckzZf+6IEsHwcyIaEtPH6zCVmte1K9bXXxXJFpI2kux/ZbLK8jUU3F93T0CsYAGNWdBCUjKMxOpyBuumm5Xly7sEq5aI6tDwwlNnQc7Xcs0OAOfYC3WdT0LRcMJvxAfZjxcpmWwZfAOJjeVIoAMJ7FALQU37k8oZ7EFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jb+nwJln; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677BDC4CEC4;
	Tue, 24 Sep 2024 21:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727214676;
	bh=I9fZdNKVo0YbAuWP4prBW4eICPhqhX2GRyCChLp2E4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jb+nwJlnW8haS4qVzviAlxWAoP+1xjlqf3jvPEZRQDuzxYPbOGgq+HKsWlYgImZOC
	 ldPCKbAY7/Ey78AKhCwvhPLBbNVBL8XBiT3AyVWsp1h0JAWDCLhUWnoeOjb0YAIIE+
	 XV9tfAzpQMV968yltvOBa/sgBGql5r1imrCv+Li5B3JLmRnbWJXBmxg2AcOXiDV6S1
	 YwMxiJHmGdti/3arNhlvszj+4U2nKbnCtkwMSj3ooE0KMWIosBaGlTNHi61HJ1eUyJ
	 QRphlaE8po2GPPfV1nJWkucOAwNj76xZkMSIJpnJoSZDAl/HjScFPZrkzL3buJlm+j
	 KNUY1Yj1PBKoQ==
Date: Tue, 24 Sep 2024 16:51:15 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: bcmbca: Add bindings for BRCMBCA
 LEDs
Message-ID: <20240924215115.GA289875-robh@kernel.org>
References: <20240920-bcmbca-leds-v1-0-5f70e692c6ff@linaro.org>
 <20240920-bcmbca-leds-v1-1-5f70e692c6ff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920-bcmbca-leds-v1-1-5f70e692c6ff@linaro.org>

On Fri, Sep 20, 2024 at 01:15:12PM +0200, Linus Walleij wrote:
> The Broadcom BCA (Broadband Access) SoCs contain a unique
> LED block. Add bindings for it.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/leds/brcm,bcmbca-leds.yaml | 88 ++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/brcm,bcmbca-leds.yaml b/Documentation/devicetree/bindings/leds/brcm,bcmbca-leds.yaml
> new file mode 100644
> index 000000000000..7fe2222c0c58
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/brcm,bcmbca-leds.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/brcm,bcmbca-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCMBCA LEDs
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |

Don't need '|' if no formatting.

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +  The Broadcom BCA (Broadband Access) SoCs have a LED control
> +  block that can support either parallel (directly connected)
> +  LEDs or serial (connected to 1-4 shift registers) LEDs.
> +  The LEDs can optionally be hardware-triggered by ethernet port
> +  traffic.

