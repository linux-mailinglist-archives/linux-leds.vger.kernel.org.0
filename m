Return-Path: <linux-leds+bounces-3719-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E71A0A05867
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jan 2025 11:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D267F1628B0
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jan 2025 10:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CB71F8661;
	Wed,  8 Jan 2025 10:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNKj1/hk"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8479538F82;
	Wed,  8 Jan 2025 10:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736332917; cv=none; b=fQpxKldbiAx2iHCBfur/i7Y2M9OJZJsM7CZamw/ksoXEq7eQhEQCleIn52hMGbzpNX0HsNer8k0ahsFvfCZZqD+HACmvaBv7E0fGWoB8TG9buhqWx/x6g1Icf4RAtIeCzuunNSEpPzuSr1zfv59h5b6CgNVQJb7w2k2iSn8RORo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736332917; c=relaxed/simple;
	bh=WmfS8WCoNt6jj/+YKKOpy0JjmbTDxj2kikSVgcXZn2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3VmZg0QEl/wKMtCxNEoVb/oPzqpehXzWSPj+jM1NqCLe3rLRP18tO2OCwayL3Yr8Nd0NZCIuDhFH5JsnS4uBb0z1CiS3yx4dZD4IioA1TkAnd6GFKkaVcIXOC4Jz4Cd1UmDKsx2QGvlCMGF8kwzD1hhI15NHaNAwflkZQrmM8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNKj1/hk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDD8C4CEDF;
	Wed,  8 Jan 2025 10:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736332917;
	bh=WmfS8WCoNt6jj/+YKKOpy0JjmbTDxj2kikSVgcXZn2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNKj1/hk9puW7qlcHbCto0eDlorfwprV9zhNVsGDWEridQUVIxw03u11XmjQkjF/9
	 cAZh+Vf9lGdvLZhENGP6Mbdx3XyqcnjiHlPsMTW9s9mHxvLskvxCfa2O5dtigC1Xt1
	 xqi1ZEobsb1YaECz9qBBVHAmm3FO2uAGlt9NIeJJ/UmTgVpbd8GExSHX4Pk9hprv/Z
	 UmjF+3VtydjXWeLCPC3kip1WmuVJ5v4f1SnXn9mW0IYHueiDumdVfNVfTGvGv69cPl
	 0Ok2NSK29wlK9CepBu/6wT9EqtO2purXCLygLGvNS5rNLhxUptfYBONw/R+FgU3/Ko
	 mp9whUKAxCWWg==
Date: Wed, 8 Jan 2025 10:41:50 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add
 Apple DWI backlight
Message-ID: <Z35Wbs3-VrQZu846@aspen.lan>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
 <20241211113512.19009-2-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211113512.19009-2-towinchenmi@gmail.com>

On Wed, Dec 11, 2024 at 07:34:37PM +0800, Nick Chan wrote:
> Add backlight controllers attached via Apple DWI 2-wire interface.
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

