Return-Path: <linux-leds+bounces-3721-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A24A058BF
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jan 2025 11:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46C157A03DE
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jan 2025 10:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AFD31F8666;
	Wed,  8 Jan 2025 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MO1leYDT"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E131A0BF8;
	Wed,  8 Jan 2025 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736333632; cv=none; b=dcHj1pAlwR0TBRDEQEp1dzkee5e6AZNBZpy7IqJ99tq01h3na6abZmZQFS9/e9k2WSVm8MpYGdNkWwWk/CTEDY1WuAlk9fJenwUmcvZB3+cgW5byheaPem14Z2V7Mj92FLe1UcWrH9f86hnHMdx/rYUAB9KngQBCVkfDLopX0HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736333632; c=relaxed/simple;
	bh=MdzLiNiMUefIpEMjWF8sA0mgOuEA1ymjFocAvj83YU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPiLOQnX9Mr9VJFmYosHejaZbnQpIXCYEyaMwvCOLBfa42ZGD/dSF7v93WKgVn0R0UPeFFwb6K+vUZX8cgEgyNoxUSjQ2oWz6dPVvIvXURKbIe4jnsRmlegFSePRkHLiZyScv3qvCsCh5+4pnAezf5Mn1Tc3nPJnbCC0Wy6F/X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MO1leYDT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F66C4CEDD;
	Wed,  8 Jan 2025 10:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736333632;
	bh=MdzLiNiMUefIpEMjWF8sA0mgOuEA1ymjFocAvj83YU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MO1leYDT/KQycCDok3dZtz1b6lChQeKjS47nI43y7an5N4Bourgc3jaRzijGYmyDR
	 uEddCwqBeHSJREvXhnz1HfrlFH6cppD6r2xUMMaC8NO9RX1EyNQjz8nH0Ng7O/Jm5T
	 k74EwS0aMvRpEWWVWjLm9Ix+ErZzdx1jcmEXC8/rhhKGJzwUYT0abRBFqdfyNqrsbN
	 iyY+NNT4c2llVFqWtm8vzBFW/OjWbF59iCH5ZrbLJyw2xQY1Ta1NL+SDGaFcKp0FGY
	 bQ3JT6KdT8EAlJuzOg4rJtqeb66RXgMjFsypTFOLuNhympArzLKxsPRouZoNuhZ+ZJ
	 2JcCjRbMlesXg==
Date: Wed, 8 Jan 2025 10:53:45 +0000
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
Subject: Re: [PATCH v4 3/3] MAINTAINERS: Add entries for Apple DWI backlight
 controller
Message-ID: <Z35ZOckf90QkbwHg@aspen.lan>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
 <20241211113512.19009-4-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211113512.19009-4-towinchenmi@gmail.com>

On Wed, Dec 11, 2024 at 07:34:39PM +0800, Nick Chan wrote:
> Add MAINTAINERS entries for the driver.
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
(keep this R-b if you rename any files)


Daniel.

