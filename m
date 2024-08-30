Return-Path: <linux-leds+bounces-2542-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ECE965950
	for <lists+linux-leds@lfdr.de>; Fri, 30 Aug 2024 10:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 642D61C2090F
	for <lists+linux-leds@lfdr.de>; Fri, 30 Aug 2024 08:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FEF15C12B;
	Fri, 30 Aug 2024 08:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qtG8fV2P"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A884414B96F;
	Fri, 30 Aug 2024 08:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725004928; cv=none; b=U4iiEbB3fM/UhgerhBgCMPIC6srq28/22Jl/JgBLLuS6N0H0S9SD34a0KMCkItNsaarYgDD3hcy9KtfyWc5lyC+3w+NOO3hsD/HPcda82W220QCj/KrT532KRoMpY3xGPSqZB1+dhbf1Ww9eSj2/T9le/6h+yGISD24Z3+8/FYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725004928; c=relaxed/simple;
	bh=cSpUz9tGreeQZHZ76mO099ESTCd1OjL4+gJ/XohMhsQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hdjAlLAejBNh11Fimd3RYt9LkIemLAxjhQgC+OSK784fS+CnkTCqOmmBA9oQ/TbVtMqRT/ZoqdTbqhc0RJ/niamDxoTf0OIqtkrFKFlJZYS4rCtC2niaQk+SH4wYNkopmJF4xlGm0sqJPuXj5LSaJEzN2DaBMXN64mO2SUVUWa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qtG8fV2P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54048C4CEC2;
	Fri, 30 Aug 2024 08:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725004928;
	bh=cSpUz9tGreeQZHZ76mO099ESTCd1OjL4+gJ/XohMhsQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qtG8fV2PJlKSLxVuo6PjovFFE4tj7AQV/mnSLoxwwvYFZXSW1JRHCMZb+n1OZbUvr
	 cuUDYefhU3fjMSRdhLM3CNGu+pcYHjpB2sXInG4aX3+9ebDlZQ70wAhvlhzEiEy3GI
	 qgw2NMOip6ioGmKuSXg95Q81d5ny8HBMbj6FfWK3ffY83cQJBKx87xdivwqyYIk3Nc
	 Hw3LW5cqLiguAA7YZlI4a9PKFcA+WeCVuC7+TC6Ol0MbhOAB+p1JPgTRNhBW8R0wHs
	 IHTsnHuhcPLyPsIha1ttHTVyeiwWXOIFg7uYF4YoDOZWrfplo6jA0FXxstcLZ0WKAH
	 Ml2kFjpQOd/Ew==
From: Lee Jones <lee@kernel.org>
To: Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>, 
 Lee Jones <lee@kernel.org>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Christopher Cordahi <christophercordahi@nanometrics.ca>, 
 stable@vger.kernel.org
In-Reply-To: <20240826133237.134604-1-bastien.curutchet@bootlin.com>
References: <20240826133237.134604-1-bastien.curutchet@bootlin.com>
Subject: Re: (subset) [PATCH] leds: pca9532: Remove irrelevant error
 message
Message-Id: <172500492610.73690.11744937448959919672.b4-ty@kernel.org>
Date: Fri, 30 Aug 2024 09:02:06 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 26 Aug 2024 15:32:37 +0200, Bastien Curutchet wrote:
> The update_hw_blink() function prints an error message when hardware is
> not able to handle a blink configuration on its own. IMHO, this isn't a
> 'real' error since the software fallback is used afterwards.
> 
> Remove the error messages to avoid flooding the logs with unnecessary
> messages.
> 
> [...]

Applied, thanks!

[1/1] leds: pca9532: Remove irrelevant error message
      commit: 2aad93b6de0d874038d3d7958be05011284cd6b9

--
Lee Jones [李琼斯]


