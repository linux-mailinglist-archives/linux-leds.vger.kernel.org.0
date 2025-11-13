Return-Path: <linux-leds+bounces-6106-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD2FC59076
	for <lists+linux-leds@lfdr.de>; Thu, 13 Nov 2025 18:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C1DF5364ABF
	for <lists+linux-leds@lfdr.de>; Thu, 13 Nov 2025 16:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8DE359711;
	Thu, 13 Nov 2025 16:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8mEga9R"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B7921D3F3;
	Thu, 13 Nov 2025 16:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763052370; cv=none; b=mcZIXpYzxeNzNPPCkorNA5TIXNCDIT/3GhxU2MzKuaAidgCnKu3jBzPfsFrbIJrzUbXja6fC+Fa2Upr1/5NNwklz1N+57qTn2m80RNbJ/9a6qKikJ3n2D3fQwH7X6SFZpKfFNnJqE1vqbN6unpF5r1Olau0YNsLTOj6b4eL8C6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763052370; c=relaxed/simple;
	bh=+SNBZZpwIVsQ1NMm9S2r0CGt8y213OHdKQwYS8JlXzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnlEmWNgSWpkpBzozjRHmmPbNuklH28V+SI3lHMiwlgbYgNezoNWIdsSVcH6jpDOQz/ewMsnGgaFb0wCXUYMuMTgnFXrvp6U6loCL2Tt/rqlgZsvdWq3o4FEXkXQB4W7ZK5ls9y3JouSRCu64Cu6Cgm2QdKM0BREQW2NQdPQpNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8mEga9R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C27C4CEF5;
	Thu, 13 Nov 2025 16:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763052369;
	bh=+SNBZZpwIVsQ1NMm9S2r0CGt8y213OHdKQwYS8JlXzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8mEga9Rmp51/7zGCoyQ8Ecsah26vWq7zE+u+7YzNSypa+OURY3wOD2ntrIuOCb1Q
	 JEme03y2PBUgJ6J7Mp85nDQX+CFPREH8wMRLN3+c2kRiUPFPW/nOOmWqEiWXG083h8
	 uz9cLSjIlrbHa1AOSCluR/uR5MDJoiQrHfrEa2fJGBWgYcRdJVmUkgzSiLZJ4bNCkt
	 oSzBElibE5+KtXZ8X1XieuXRYpC6bQ/jJqg1F3wG1yqut6gGbG4VE8WG3m7ZOl3DZ3
	 B/KpoJKIZjzpNQOpX22bjmrJsseposwHAbEzV5bL+KeDFZpp0N6vUKn20rp8ud9a3M
	 fwIlh14+ShhuA==
Date: Thu, 13 Nov 2025 16:46:03 +0000
From: Lee Jones <lee@kernel.org>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: backlight: Add Awinic AW99706
 backlight
Message-ID: <20251113164603.GP1949330@google.com>
References: <20251109032240.3422503-1-caojunjie650@gmail.com>
 <20251109032240.3422503-2-caojunjie650@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251109032240.3422503-2-caojunjie650@gmail.com>

On Sun, 09 Nov 2025, Junjie Cao wrote:

> Add Awinic AW99706 backlight binding documentation.
> 
> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> ---
> Changes in v3:
> - breaking a long line (Krzysztof)
> - rename backlight node (Krzysztof)
> - Link to v2: https://lore.kernel.org/linux-leds/20251103110648.878325-2-caojunjie650@gmail.com
> 
> Changes in v2:
> - use proper units for properties (Krzysztof)
> - drop non-fixed properties (Krzysztof)
> - add properties(max-brightness, default-brightness) (Krzysztof)
> - Link to v1: https://lore.kernel.org/linux-leds/20251026123923.1531727-2-caojunjie650@gmail.com
> 
>  .../leds/backlight/awinic,aw99706.yaml        | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml

Applied (manually), thanks

-- 
Lee Jones [李琼斯]

