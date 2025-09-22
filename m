Return-Path: <linux-leds+bounces-5539-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C82BB92486
	for <lists+linux-leds@lfdr.de>; Mon, 22 Sep 2025 18:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19C3A1904ED0
	for <lists+linux-leds@lfdr.de>; Mon, 22 Sep 2025 16:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B79F19A288;
	Mon, 22 Sep 2025 16:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIfyz9AG"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E0F17C203;
	Mon, 22 Sep 2025 16:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758559508; cv=none; b=iIuVbt5m0sZJtVkL5nGxnQ3Eu+XfE/OunRx+ay17CYBeTBum1MtFm1S5N7k/WXSeUpsE9xy+kQHuT7VvHSgAk1JgQhKQ+o7uftn+Caia68zANTQZiwPD/2Vimf0ec7ngXQTwC/oAn2E/kSWS4JrDXeCzeWEPsHe99tw+6v0AP6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758559508; c=relaxed/simple;
	bh=0t57xInRak71R35ROrahgnSbv1afzy9QNVSLOtl8+fU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FtSUfULMhKQ0Xa7DemxAX6JZZL+kCHThV/+DFL3K2pZ3HtELynLYJM6R/eUNgXokGOvZE+ViucAHk0AF2hqTNkfWE76Jm20E0ABVd6JIzxS7gSriHkF+Tp2c4AMo50Eue5TKv59hJ0rxRYNpoe85IA7uawROcppv7by+dAYkG9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UIfyz9AG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C23C4CEF0;
	Mon, 22 Sep 2025 16:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758559507;
	bh=0t57xInRak71R35ROrahgnSbv1afzy9QNVSLOtl8+fU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UIfyz9AGQHVaiVvfyGSqO9MDNU63T/YbqonAyTokYTMR8sTYtxojQtZK7wa13gxIB
	 IMUlkJNnjTFopLrOiGFqOqz2igYKgDgYGFNUBrVy+Rm7eTkV5kcy+H1w0Xv9wahAoZ
	 ZEsJ6K0HKIelrQHGgURmubysIs4f1N6EzemN+hMYWVyRUNJChkoelXozHPi5EQy+eS
	 oYNj+mazTy06/rzkQPjccuZtq9KfzAVlfiqHrhvf5RZHaxo6HSdFWn6bvM6evCYXt2
	 17K4QVCXJfk0jaZona8dUHVRmNlU8b5KI+m9Od9rZ5W99DbIhEvTIDNn9wqlss4UiV
	 s+FRriqtB7nxQ==
Date: Mon, 22 Sep 2025 11:45:05 -0500
From: Rob Herring <robh@kernel.org>
To: Jonathan Brophy <professorjonny98@gmail.com>
Cc: lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: leds: Add YAML bindings for Virtual
 Color LED Group driver
Message-ID: <20250922164505.GA390320-robh@kernel.org>
References: <20250916110217.45894-1-professorjonny98@gmail.com>
 <20250916110217.45894-3-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916110217.45894-3-professorjonny98@gmail.com>

On Tue, Sep 16, 2025 at 11:02:15PM +1200, Jonathan Brophy wrote:
> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> Document Virtual Color device tree bindings.
> 
> Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
> ---
>  .../leds/leds-group-virtualcolor.yaml         | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
> new file mode 100644
> index 000000000..945058415
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/leds/leds-group-virtualcolor.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +title: Virtual LED Group with Priority Control
> +
> +maintainers:
> +  - Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> +
> +description: |
> +  Virtual LED group driver that combines multiple monochromatic LEDs into logical
> +  groups with priority-based control. The driver ensures only the highest-priority
> +  LED state is active at any given time.

Isn't this what the multi-led binding already does?

