Return-Path: <linux-leds+bounces-5791-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 554A9BDFC89
	for <lists+linux-leds@lfdr.de>; Wed, 15 Oct 2025 18:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B847D1A203B7
	for <lists+linux-leds@lfdr.de>; Wed, 15 Oct 2025 16:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBA5338F28;
	Wed, 15 Oct 2025 16:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAts8Yss"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC28325333F;
	Wed, 15 Oct 2025 16:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760547410; cv=none; b=mNmJW9wJFEcP2Kd8qTSXepVoN3hxKHGINN7X8gi6IM6ThoLubpvPz+NcBprpDiRGF4PahRSqG3YpZ6vofOKsTBTBpqYk7larsaE4kb5e2mF9m9G6qLudeuKSgk1KJKtXJkIgm/FhLEceRo4pBwVSbDo+/U7sThXRqobQ5TNcEIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760547410; c=relaxed/simple;
	bh=PYKbb6/RZIWzCrEnMTs12oUuOVy9ens2ny2rUF7vKEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D11DPPMPjN+r6ZJqBtF6boq7tNipfa/5og3My+IKAaqtYrTdvH6QR3SSGxYyIfna/r8/Zv8I8d95QQpiyKLFFzfNPx6agtmYlC3SRc0PH5Aap6PFC7NfNcF463F5EohHnbQEYeySBI+48zWxCfjmAXsK/2G96TVbSZrRGQut/l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QAts8Yss; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C58C4CEF8;
	Wed, 15 Oct 2025 16:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760547410;
	bh=PYKbb6/RZIWzCrEnMTs12oUuOVy9ens2ny2rUF7vKEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QAts8YsscOIQN6mvshK+dJ4WK0P2No3eEfWjNJEn3XWuPSB8D5tkyax7LAHR1HLvi
	 LkipiPKybNksMMIOnV4i5TkglxnLyefQaFUCmZ6Ex9G5Pm28Cq/azwFUHKWEXLLObR
	 Gsdgw70CbD6Ys+62Syr0wgJGAQe5OBuTGtSF39cmf3oNfpENdcJpQOcqS1vlYjO3+d
	 JrwIJ6mN1sJLwefAjfMKLyT865RsBX/4ZmG7jzhbzvl9ICnEChkJCHeQwkGuP9q/Ha
	 fwpQihHTEja8wL5Uw0VPPbgHWD34eaCwJl1CbKl2IOQTPs1UNTV0VdssaBT5i3cvw3
	 vCilP+gEcvhgQ==
Date: Wed, 15 Oct 2025 11:56:48 -0500
From: Rob Herring <robh@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, gregkh@linuxfoundation.org,
	rdunlap@infradead.org, christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v16 1/3] dt-bindings: leds: add TI/National Semiconductor
 LP5812 LED Driver
Message-ID: <20251015165648.GA4046261-robh@kernel.org>
References: <20251013173551.108205-1-trannamatk@gmail.com>
 <20251013173551.108205-2-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013173551.108205-2-trannamatk@gmail.com>

On Tue, Oct 14, 2025 at 12:35:49AM +0700, Nam Tran wrote:
> The LP5812 is a 4x3 RGB LED driver with an autonomous animation
> engine and time-cross-multiplexing (TCM) support for up to 12 LEDs
> or 4 RGB LEDs. It supports both analog (256 levels) and PWM (8-bit)
> dimming, including exponential PWM for smooth brightness control.
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  .../devicetree/bindings/leds/ti,lp5812.yaml   | 249 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 255 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> new file mode 100644
> index 000000000000..5208ddb3bdac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> @@ -0,0 +1,249 @@
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
> +  ti,scan-mode:
> +    description: |
> +      Selects the LED scan mode of the LP5812. The device supports
> +      three modes:
> +        - Direct-drive mode ("direct_mode") drives up to 4 LEDs directly
> +        by internal current sinks (LED0-LED3).
> +        - TCM-drive mode ("tcm:<n>:<order...>") drives up to 12 LEDs
> +        (4 RGB) using 1-4 scan multiplexing. The <n> specifies the number
> +        of scans (1-4), and <order...> defines the scan order of the outputs.
> +        - Mix-drive mode ("mix:<n>:<direct>:<order...>") combines
> +        direct-drive and TCM-drive outputs. The <n> specifies the number
> +        of scans, <direct> selects the direct-drive outputs, and <order...>
> +        defines the scan order.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    oneOf:
> +      - const: direct_mode

My suggestion was to drop direct_mode and make no 'ti,scan-mode' 
property present mean 'use direct mode'. As direct mode is essentially 
what every other LED driver IC supports, supporting it as the 
default with no property makes sense.

> +      - pattern: '^(tcm|mix):[1-4](:[0-3]){1,4}$'

