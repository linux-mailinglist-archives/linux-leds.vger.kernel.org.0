Return-Path: <linux-leds+bounces-6629-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F127D17352
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 09:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EDFE3014D8E
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 08:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0AD2378D8E;
	Tue, 13 Jan 2026 08:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFp92bCP"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA292F6925;
	Tue, 13 Jan 2026 08:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291622; cv=none; b=OvSHZ2Xbmi3SuIuYxec2n9sEEgdKN7TJOyp3Wog+1xxgShmsjVjl7CWdBbse/bWwCn5+hzDDYWmxE8pUZyqrYGyccQqYV+Fd/P5oVqHLO2rNHWY/E0fMoIROwTc9f+OHjJfAWof0HsQFyRvlzkmS89rvb17vOSWnvivt4e6FN9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291622; c=relaxed/simple;
	bh=tl0LvjbKamYGyoZPZjCIGjKCgfTZTdlHGgKC0fbqXt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kx8S5J1W1GPizt6om0TFA2PmD8RHtU8zc/QIt7x/1NNs8nLpew4Yi59CuL+cNQwNTi3b2qs96bdoo4JeCfCLpM5SMtrU3nqVHXLQrt3MMp0UHdxEgDz2iqJrip7gamQJS649NX32QfJaAi4/G/mKRsGkOoylOcoawCErdnokeko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFp92bCP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C309C116C6;
	Tue, 13 Jan 2026 08:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768291622;
	bh=tl0LvjbKamYGyoZPZjCIGjKCgfTZTdlHGgKC0fbqXt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NFp92bCPmSjbL4utwb/0i7OkgbhlBUvyKs2Hxq0nVpmBdVt7M5zIdcsU99axDrFpf
	 wt08/US1GoooACkX5srReymFp4Dk5yWpTpVM6vxy5HETCo1T3rQJsOajWMkgt9F1mz
	 yhC5mnBkLooG2EylObCjeDhociEYr4+0iw88kPOb9tSBtR4AmOQl6PfzmV6PauGO99
	 jFZPY5fNoaJm9VNSqox33lmDE3R/th04nXnziaAj2WTRzcVs5gVPYAf9ox4ENEi3QE
	 T1SermmCuRwb3j+gW6N0i38Jh3KsHmpIiyVddXcj+vOY/3vv2EOIe00JuLpdZUe+5F
	 4GS8p+TiMT3xg==
Date: Tue, 13 Jan 2026 09:06:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Edelweise Escala <edelweise.escala@analog.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Message-ID: <20260113-wine-kingfisher-of-glee-cdac0c@quoll>
References: <20260112-ltc3220-driver-v2-0-d043058fc4df@analog.com>
 <20260112-ltc3220-driver-v2-1-d043058fc4df@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260112-ltc3220-driver-v2-1-d043058fc4df@analog.com>

On Mon, Jan 12, 2026 at 04:55:54PM +0800, Edelweise Escala wrote:
> Document device tree bindings for the LTC3220 18-channel LED driver
> with I2C interface, individual brightness control, and hardware-assisted
> blink/gradation features.
> 
> Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
> ---

No changelog in the cover letter, no changelog here.

>  .../devicetree/bindings/leds/leds-ltc3220.yaml     | 120 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 ++
>  2 files changed, 127 insertions(+)
> 

> +  adi,quick-write:
> +    type: boolean
> +    description:
> +      Enables the hardware quick-write feature where a write to the LED 1
> +      output register simultaneously updates all 18 LED output registers
> +      to the same value. Only applicable when LED 1 output is physically
> +      present and defined in the device tree.

I have doubts that this works fine. If you define 18 different LED
nodes, each can be controlled by user-space or kernel independently, but
with this property updates to LED 1 would overwrite updates to other
LEDs.

Isn't this then an aggregated LED, so in such case only one LED can be
defined in DT (optionally with 18 led-sources)?

> +
> +patternProperties:
> +  '^led@([1-9]|1[0-8])$':
> +    type: object
> +    $ref: /schemas/leds/common.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      reg:
> +        description: Output channel for the LED (1-18 maps to LED outputs D1-D18).
> +        minimum: 1
> +        maximum: 18

Best regards,
Krzysztof


