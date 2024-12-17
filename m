Return-Path: <linux-leds+bounces-3623-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 683059F4BFD
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 14:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF3527A7F68
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 13:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A02D1F1312;
	Tue, 17 Dec 2024 13:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vNlo9qLO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A6EA29;
	Tue, 17 Dec 2024 13:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734441125; cv=none; b=QrjxqnvdVoWljechJx1p5uwn1DqHNWOVj0PFcn7JdDMMFwI6uZWKBQU6Hkgs6QZDIKKeVNxaz5gG9LcL8DtgfXb0qIy0MtmnEY6s0HrWrZyC9VyG+5DP9ddVPQFWodFXUzYh67jchcETHqDiMSL8yRXOIV5RoubF1eOLJSwCsnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734441125; c=relaxed/simple;
	bh=D/SJURUuzN5/fZOaZjKkoURarq2fLgSwyYakD0IggJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNyTWRuilWLJVBID1stnYXdLKM8y+0W48V+BpOQIdlYEyB7OIqFZMBHJ30RyDrVMw0XgJvW8RYlmeTErTL6BItmeJbf9xyh0uQF+1Vx30kw5W/AUoaAeAgje/g18ewrr2eu0OUJRG65JaxGx63q3G0kTXTq0vMcCLipxhsSibIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vNlo9qLO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D1AC4CED3;
	Tue, 17 Dec 2024 13:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734441125;
	bh=D/SJURUuzN5/fZOaZjKkoURarq2fLgSwyYakD0IggJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vNlo9qLORpH0vDQdyIaIIfK+qBScqcqEdglH/20lJBrIBjfATyJL0vKBgWcR1LPZI
	 /PSuYzyFvcZVdyn/7dDUw0Yv+IkubGzxWPIeA0mJhrPO7bJQgwh7Km6RtIXumTr10b
	 oi55thkRvdJZE+tIimhsXDKez+yBogZFnfbXt1jI97eoROf65z63bjP7+HI8+aTAOw
	 eP/jTOn3m412AI7VpS0MaKJYuHbVG5+xCB0AZqiCmnqLnD1D0Ksp8kD8vqpHCuohyl
	 qFKq6wxUOi3lQibB+lpVmNu+1T077LkPD15eVGWcXKDWPw7a951QUM43z3ZhbNZ7w7
	 8SaJQ2hHh6xPA==
Date: Tue, 17 Dec 2024 07:12:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: devicetree@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, Daniel Thompson <danielt@kernel.org>,
	Andrew Davis <afd@ti.com>, Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: backlight: add TI LP8864/LP8866
 LED-backlight drivers
Message-ID: <173444111812.1260250.17926048342741894289.robh@kernel.org>
References: <20241209084602.1199936-1-alexander.sverdlin@siemens.com>
 <20241209084602.1199936-2-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209084602.1199936-2-alexander.sverdlin@siemens.com>


On Mon, 09 Dec 2024 09:45:53 +0100, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Add bindings for Texas Instruments' LP8864/LP8866 LED-backlight drivers.
> Note that multiple channels in these models are used for load-balancing and
> brightness is controlled gobally, so from a user perspective it's only one
> LED.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> Changelog:
> v3: no changes
> v2: ti,8860 has been decoupled from this series and converted to YAML separately
> 
>  .../bindings/leds/backlight/ti,lp8864.yaml    | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


