Return-Path: <linux-leds+bounces-2511-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A35195B69E
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 15:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6C521F23D17
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 13:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E4E1C9ED7;
	Thu, 22 Aug 2024 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qgS3wUbt"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ACE1C9EC6;
	Thu, 22 Aug 2024 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724333309; cv=none; b=mNgL8Kx4hcuplmqQJ2WOjHuRZZLIDLg2c7BaRkG5nKwfkslc+Xag3/nSyjnp2rf/fDbYvYWA9qdbeIDZQ9YwoK5tr7NJVWim838f3wg5P4oowj/vQfQ+XGnKaeFO9iQRk1fp/f9eyWBSGmwr/wYK5DisN1GdboDFyWF4tvPCNLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724333309; c=relaxed/simple;
	bh=I0aGL23c3tcdoGEW2vNb1kjfInsGeH7wYqB9D+EkJd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdywUa2E/ukV8olx2E3pmo9ASAQl2fTX5Mo+ocI34qYM8Qkzu96NQUOvOh9bbEN2DOA7QQ9Sw2w9MY4c4CSvU9ipw2J0n+v8BYBo5wRwuVXNtmgO91Fva1Q3n2ha0cNsuuXula7lVUPRdJsuIrLsKV0vnidxVTXE6cd2mIFgBy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qgS3wUbt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175CDC32782;
	Thu, 22 Aug 2024 13:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724333309;
	bh=I0aGL23c3tcdoGEW2vNb1kjfInsGeH7wYqB9D+EkJd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qgS3wUbtDEtgbgC/RBKnJsOixAyC6QUH/HGkhw0wxr6dFlWt0JjuAx0tUcYR3EoC/
	 /LGfLFcp0KQKbBmwCzK2r+E9sjsp4zXvvpqMwOYnDP7wYLKUyHppzLaw8ks/V3diCK
	 iCr/MOtgsDLQueH9OADXOAPhZLOodSbb7pvqFiFWE2MD+cfRGNZ9r6brrpxp32IwWL
	 wYPxASwYy9M904Ap4MleSb+a7DLevzbmse7QEKfU8WYt9eAwgisImYbeD+AguyX2ZC
	 58pSK0gLbtpF7AbWFRMoWuC/7I7/64BjLBcePk4yb5Pm+8jdfyGA7BVWOQV4lMr8wZ
	 5vIgzWZHadPYg==
Date: Thu, 22 Aug 2024 14:28:25 +0100
From: Lee Jones <lee@kernel.org>
To: Huan Yang <link@vivo.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH] leds: lp55xx: Use devm_clk_get_enabled() helpers
Message-ID: <20240822132825.GI6858@google.com>
References: <20240820102006.128840-1-link@vivo.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240820102006.128840-1-link@vivo.com>

On Tue, 20 Aug 2024, Huan Yang wrote:

> lp55xx lp55xx_is_extclk_used get, enable clk and
> deinit_device disable and unprepare it.
> 
> This can use a simplifies helper to cover.
> 
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>  drivers/leds/leds-lp55xx-common.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)

The commit message makes little sense, so I rewrote it for you.

-- 
Lee Jones [李琼斯]

