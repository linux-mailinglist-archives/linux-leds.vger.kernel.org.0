Return-Path: <linux-leds+bounces-5883-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE661C0B518
	for <lists+linux-leds@lfdr.de>; Sun, 26 Oct 2025 23:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 689DB3B846A
	for <lists+linux-leds@lfdr.de>; Sun, 26 Oct 2025 22:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFC321255E;
	Sun, 26 Oct 2025 22:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZH9WAhW"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1098F1D514B;
	Sun, 26 Oct 2025 22:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761516403; cv=none; b=QtmjSy9BbY0GvBEIXMaO9tSshMPtu1QJY6D7ajLpOBBCNxzGIyAQAwFfSjE4kMoOa2fJPoSPmrS1W3P2HY9lvcjq1Ean7dpogJwGPRAh7PuuQ5hq0jB7yDpzhSyzh24ct2CL+db9cunjvITnY3ljw890RthjGQivDgQxPWjeTKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761516403; c=relaxed/simple;
	bh=UqMmr/F/eCo9KBoDrSzO7OMu8cCTn9ncdfinzNm7c5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxEzCAnSbJMuY2gg4goWbi3NN3jtrLkoJZcnEMqpmqQukfyXHyqjDmogHFqHXbD3adXMr4FtWA0m8YCA3rNvsgZ9U/PosGDeeqDtPW9O3SJIzsKPYIL+XSkD82LeAobtQqMur2tM6eNmL8jGapQzOZUETH55ilB7nzdFFHqjMdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZH9WAhW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667F3C4CEE7;
	Sun, 26 Oct 2025 22:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761516402;
	bh=UqMmr/F/eCo9KBoDrSzO7OMu8cCTn9ncdfinzNm7c5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kZH9WAhWXibLk49Ydl1GuQb+LDY4rXOxwLM2bN7HSOTidKpKRKUdDoNB+dEum5BTI
	 fFMlEX5Jh2aCqOIV55zEnir05/jAeHYD9LyUVBR8QPMtRbjdxaOO9jztDSgTLzpu9i
	 JGZ31Q56BwzwDJTTEWQhIxhwtTfPwm1j8wZ3s6K7E7noDIz+u/oLEcIsfQQbv8ZRUz
	 4cIUsGbQvi2p0kQbLG2SSBTOiI71FbNakeiKa5DcNduDSiqPBTeIFB0L/GlqCUjDlx
	 /57liXr4ONkel66a1fzPKHhsrSaXmR89wh9bIA9FldE1y3ZOtCiRAJE7HQHojp23Ci
	 zDLvgHwm5tGwg==
Date: Sun, 26 Oct 2025 17:06:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: gregkh@linuxfoundation.org, christophe.jaillet@wanadoo.fr,
	linux-doc@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
	rdunlap@infradead.org, pavel@kernel.org, devicetree@vger.kernel.org,
	corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, lee@kernel.org
Subject: Re: [PATCH v17 1/3] dt-bindings: leds: add TI/National Semiconductor
 LP5812 LED Driver
Message-ID: <176151639828.3021418.5454356445251493268.robh@kernel.org>
References: <20251021155927.140929-1-trannamatk@gmail.com>
 <20251021155927.140929-2-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021155927.140929-2-trannamatk@gmail.com>


On Tue, 21 Oct 2025 22:59:25 +0700, Nam Tran wrote:
> The LP5812 is a 4x3 RGB LED driver with an autonomous animation
> engine and time-cross-multiplexing (TCM) support for up to 12 LEDs
> or 4 RGB LEDs. It supports both analog (256 levels) and PWM (8-bit)
> dimming, including exponential PWM for smooth brightness control.
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  .../devicetree/bindings/leds/ti,lp5812.yaml   | 246 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 252 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


