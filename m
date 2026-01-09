Return-Path: <linux-leds+bounces-6607-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E324D0BB19
	for <lists+linux-leds@lfdr.de>; Fri, 09 Jan 2026 18:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A903300379F
	for <lists+linux-leds@lfdr.de>; Fri,  9 Jan 2026 17:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2FB365A1A;
	Fri,  9 Jan 2026 17:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ntVYkMVm"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD5C364EB1;
	Fri,  9 Jan 2026 17:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767979507; cv=none; b=Ea+9POLHlABW8JyiJpQpuBABGNVeoIzHycMZpsrnslukTAXo7sxQh3yAQhVyG2iIMGUCbh5JJoikQ7zS2TR+VL9M8ddss7AkU7yjVAumJQY5OgkDtX02zvA9Rc3DNsmL+6knSaxLXEXy84++0PksVja460VINkvsIh07rxfUp38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767979507; c=relaxed/simple;
	bh=u0z8hE3jLPeC7ggCcA8xBcv4VLFbK5RbroxlgJSXdCM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RCDrHLMWx8CqVLrZiRP1Wg6Q/TRgkSKYLjUjETvKtyDv02q52B+BUoV1JwchXdIMww2JgU8HleztNBtgW/8fwr5e8lXih7tT5x2bzKJJ9ZoZjFzpEAlRLBIjW6kIESAunE0FHJ7evx60rZNReJWPrPpRNLyr0zHSqppFr3hZ5i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ntVYkMVm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D735C4CEF1;
	Fri,  9 Jan 2026 17:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767979506;
	bh=u0z8hE3jLPeC7ggCcA8xBcv4VLFbK5RbroxlgJSXdCM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ntVYkMVmAEib/zeFfAmiMLu0IPe8NNcPIwHdl1GfSk+9cloByob31bYyPzhaf+r9o
	 /bz/P89dNBcabpMxuykqj6JrD2v1xLxCZRBA2YfmF6+KsUHNL/8AvQm3R9W7Gj+8k6
	 z0JXTWqt2/Tm5gpVyVJYddK7OwUv1O2YSlbtmkndG0FOzSazqhtSVkronppgev+UyO
	 28JoGYZVAUlaonubeJaJ8YrHz6wvJbJXqNBZQE07tckBalY3FmzNS4UN7jHEkuaMWP
	 J3rypcCL5HApNeT4l5dn8UNskZQmKcSDxEmTVQ0y2t2W2nq5Hk3KWtK7IXZTNahQpY
	 lWtYFZ0C9gVwg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
 Pavel Machek <pavel@kernel.org>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20260101-multi-led-v3-1-e29ca8dedd37@posteo.net>
References: <20260101-multi-led-v3-1-e29ca8dedd37@posteo.net>
Subject: Re: (subset) [PATCH v3] dt-bindings: leds: Allow differently named
 multicolor leds
Message-Id: <176797950401.1884223.13105930657262711602.b4-ty@kernel.org>
Date: Fri, 09 Jan 2026 17:25:04 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Thu, 01 Jan 2026 18:19:26 +0100, J. Neuschäfer wrote:
> In some cases, for example when using multiple instances of
> leds-group-multicolor, a board may have multiple multi-leds which can't
> be distinguished by unit address. In such cases it should be possible to
> name them differently, for example multi-led-0 and multi-led-1. This
> patch adds another node name pattern to leds-class-multicolor.yaml to
> allow such names.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: leds: Allow differently named multicolor leds
      commit: df3cfc33b24dd238a85b7c51ec052ffcf00aaf09

--
Lee Jones [李琼斯]


