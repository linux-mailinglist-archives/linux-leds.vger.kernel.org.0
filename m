Return-Path: <linux-leds+bounces-4955-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 396E2AF0C63
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 09:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5A234A452F
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 07:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC2922E3F0;
	Wed,  2 Jul 2025 07:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NcDJAVoT"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D1522DF9E;
	Wed,  2 Jul 2025 07:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751440723; cv=none; b=r32aT9AHBmNPrlpwwvTh6yP3hDxAtLbG9gUCZpFQLMHXv0ACq4vGJcFA0ieDeR/FK07V3YaLWrSyNuYorCFwC5RvNhmnpw7MBKZRsY1KqrrxostXUFT5JOgeXtTdv5g6AlU1xrBSyTuBu618MiRiS64MNKwiH3uCn83FRf8bZgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751440723; c=relaxed/simple;
	bh=RvueyRpDQ9hZ+LB+aLiMncsctIGtgEaUGxGOHlRWbes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRZVgJq9AVouGPIiSaHlbkTAZ0xqy5B1HLF119+auQqhudbvY86EFFQWtjKPM4GUNsuENJIN8689hKLGRH78kO9LLcIkhIbEJEOnlyiifM8Dc1yqW9RDr1AQQGwyYhhbqwtJy+kO3O1bHoicl4X3bc8sDp9oYtB6jOI7AqbHVXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NcDJAVoT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483F1C4CEF3;
	Wed,  2 Jul 2025 07:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751440722;
	bh=RvueyRpDQ9hZ+LB+aLiMncsctIGtgEaUGxGOHlRWbes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NcDJAVoTYmRPIN0SZQLBW0xxi4zTdjHmRt0MY0UiF6kn5yKGO9up30cXCiOBhBuhn
	 4r98bTsJ1vSLlqpDDinY5j40uhuHCTKGSU/QOV0gUste+C2bsSDklyvTxfR9cU618z
	 bNwfR8hicOCm3Wxyim2dxM2xUvY3R9ubU6kmCpKr4R8hwy5/8XlxyJiUeatJ5GR8YU
	 Xo5cO4HKNITn17DQVE8aBUWSxstjNa7jRjtNLTA8ClmDGcBrSVFxw54VfzCv8aRa+q
	 Fk5fQXcuP6++OHS7KDV2l6+MZB0/sSB9IWNliGSeKQhvt02s7R+PdAR5qTCnO/EAel
	 +LKHb7ZLxwiiw==
Date: Wed, 2 Jul 2025 09:18:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH V1 1/2] dt-bindings: leds: pwm: Add enable-gpios property
Message-ID: <20250702-enlightened-orange-woodlouse-b2ec37@krzk-bin>
References: <20250702043537.220478-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702043537.220478-1-Qing-wu.Li@leica-geosystems.com.cn>

On Wed, Jul 02, 2025 at 12:35:36PM +0800, LI Qingwu wrote:
> Some PWM LED chips have a dedicated enable GPIO.
> This commit adds the support to specify such GPIO.
> 
> Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> ---
>  Documentation/devicetree/bindings/leds/leds-pwm.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>

Never tested.

Best regards,
Krzysztof


