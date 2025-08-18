Return-Path: <linux-leds+bounces-5234-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C645B29710
	for <lists+linux-leds@lfdr.de>; Mon, 18 Aug 2025 04:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80CFD1964BA3
	for <lists+linux-leds@lfdr.de>; Mon, 18 Aug 2025 02:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B8D256C9E;
	Mon, 18 Aug 2025 02:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvhcQeBh"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A51111A8;
	Mon, 18 Aug 2025 02:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755484308; cv=none; b=pAiCg7WqcRXOFirufHYl4zu6OSfCH+7jQKSG7VKLwdGxxYglZhBTn/M8j/3WXj64dY96fWFCumJQKqS2ef1aNzXhGgioyZtT3v3pF4uz6u9vcD1gCwnJZATMyTUK6VU2Pyh0cjTxf40Pcdl+94tY5hZSoF2uMehC6Y3yQjF3JoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755484308; c=relaxed/simple;
	bh=+4qNgvQy+1/DLXb5T9gVXI3Pk7l/GEhUmzDE8+k73io=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mIWTyGdRE2Oi6xRJ8gGEuglR3PIfdtqV7wUaFZYVxaQP87JlJDK/UBcbD1UbENFak5G9uZDqtNKD4x/kHHubAQOGI7mltN4rVODN9i1xhqFqo2tiZH844zAGczn3UJbY3V5zMLhsyjwEX6h38adzRIylv5TJs7dLrUpVpVGF+k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvhcQeBh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444D3C4CEEB;
	Mon, 18 Aug 2025 02:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755484308;
	bh=+4qNgvQy+1/DLXb5T9gVXI3Pk7l/GEhUmzDE8+k73io=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FvhcQeBhjPfGwyTq8WFWxQUK2NfwdnlgZlEwiUIyhorqrJYjszn5bZ95MvUQq6jv9
	 6FXfDMGRXYXq+dUZ2zvu4bXlYoPDTQMF05e3tHCqX34ERBlbWc7zrqPnEEqjtsxtgN
	 oK0iuWPFZwaRhRsMmWajOAOeQE8ZcMA1f5kS5qjHpmHKrAFLK9Ml4IBfb1AL9A29/8
	 nC26G72IUWXFFQSu61NCKXHBjX9HVy5a6xnJfOutnGrJ6uToteAKyNAmM1A23W3lvc
	 tf7NsvzJSpmqS+M+6b6pa6O3bgamHYIpEgPE89UQ6oNMFFOW4V69Bsym1rSBg04rVj
	 3e3vOdYHuCZeQ==
Date: Sun, 17 Aug 2025 21:31:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lee@kernel.org, linux-leds@vger.kernel.org, corbet@lwn.net, 
 christophe.jaillet@wanadoo.fr, devicetree@vger.kernel.org, 
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 rdunlap@infradead.org, pavel@kernel.org, conor+dt@kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Nam Tran <trannamatk@gmail.com>
In-Reply-To: <20250818012654.143058-2-trannamatk@gmail.com>
References: <20250818012654.143058-1-trannamatk@gmail.com>
 <20250818012654.143058-2-trannamatk@gmail.com>
Message-Id: <175548430728.3642063.6873272310272616172.robh@kernel.org>
Subject: Re: [PATCH v13 RESEND 1/4] dt-bindings: leds: add TI/National
 Semiconductor LP5812 LED Driver


On Mon, 18 Aug 2025 08:26:51 +0700, Nam Tran wrote:
> The LP5812 is a 4x3 RGB LED driver with an autonomous animation
> engine and time-cross-multiplexing (TCM) support for up to 12 LEDs
> or 4 RGB LEDs. It supports both analog (256 levels) and PWM (8-bit)
> dimming, including exponential PWM for smooth brightness control.
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/leds/ti,lp5812.yaml   | 229 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 235 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250818012654.143058-2-trannamatk@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


