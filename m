Return-Path: <linux-leds+bounces-4870-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D66E4AE35B6
	for <lists+linux-leds@lfdr.de>; Mon, 23 Jun 2025 08:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5173D7A1FA8
	for <lists+linux-leds@lfdr.de>; Mon, 23 Jun 2025 06:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626A71624E1;
	Mon, 23 Jun 2025 06:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPBX4ywT"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316CE3209;
	Mon, 23 Jun 2025 06:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750660227; cv=none; b=NfovpN/O6sAti0n9zur23izZhTpxwqBzm0mh/7Ij/EK3wjownULix7w756/2WXTmKn6R43UnTD5g9jlEApTjQ8WNlIFlU0vfZHh71PnpijWZaTJVe1IS58qIdgfiqQy84FfI96znMr7mpuetnHfPOC4su1zvl3Anv40GsaMhtO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750660227; c=relaxed/simple;
	bh=l7MYv7SD4EFeBlZkqao9oehF3CWjKyLvD6gNTziI87Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dO9vx9RnfbviQyT7Kcio/AQsKCpRmGihtOOgZmAMfT0fnui1Tjq1pZbVbeQp6jjuxpWvRZnahDe8FyistB0sRYE26xkjFlhbBkN3LSDwUourZTMlF/wqEnsaildjZlvfsinBWYzI9+A3ujDkbAuI2bp8a/tTJhonEHrRB0S45Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPBX4ywT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19922C4CEED;
	Mon, 23 Jun 2025 06:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750660226;
	bh=l7MYv7SD4EFeBlZkqao9oehF3CWjKyLvD6gNTziI87Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPBX4ywTSFtzRlTaBtemPd/dCGfLlKHUCnthVazvzRoVOYNWJCX+I7JgQIRHVWP1H
	 oEYxGJFledllnjw16M52tf2HbdCJElzbOGVdv3KWEk2sMN6i66ql3EVI5L58JDtuvz
	 FPLaWKLsfH2ZFSk6Un9ISA8dDA+63H9XddaMxGpQ3HWMQQIVX32Cyrohn4T8+CEM0o
	 xb4aKhUnF2pmiZqjb66J/vEo9hqKlbOojfJtTuk1111IDqPx4ycKhBeKzPU0VrxUsA
	 YmctDWSL5wC4l7yqONSI8OzwJdwxDdJel9UiC0Cj97Upnsm7TzwZec0n0fulOmpzxg
	 Z9YN61wgutKXw==
Date: Mon, 23 Jun 2025 08:30:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, rdunlap@infradead.org, 
	christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	corbet@lwn.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 1/4] dt-bindings: leds: add TI/National Semiconductor
 LP5812 LED Driver
Message-ID: <yi6w2yqwpnxopj7g6q5hxlpra5hkk46bevk5qps6eaqysphind@w4axxlhysiwj>
References: <20250618183205.113344-1-trannamatk@gmail.com>
 <20250618183205.113344-2-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250618183205.113344-2-trannamatk@gmail.com>

On Thu, Jun 19, 2025 at 01:32:02AM +0700, Nam Tran wrote:
> The LP5812 is a 4x3 RGB LED driver with an autonomous animation
> engine and time-cross-multiplexing (TCM) support for up to 12 LEDs
> or 4 RGB LEDs. It supports both analog (256 levels) and PWM (8-bit)
> dimming, including exponential PWM for smooth brightness control.
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  .../devicetree/bindings/leds/ti,lp5812.yaml   | 229 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 235 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


