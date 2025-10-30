Return-Path: <linux-leds+bounces-5945-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB14AC1FDFF
	for <lists+linux-leds@lfdr.de>; Thu, 30 Oct 2025 12:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B690188D5CA
	for <lists+linux-leds@lfdr.de>; Thu, 30 Oct 2025 11:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778222DEA8E;
	Thu, 30 Oct 2025 11:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nd+CpjmI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A27C232395;
	Thu, 30 Oct 2025 11:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761824833; cv=none; b=Gi+UnR+yCnSCIyUhuxASlKVciYWTSiMA+OVktOQsC3XOfffxsIvgT20lrlJFfsz7pjQXUjY2X44SizRY0vqpiTYZ1MdQr89TLrxPfDnMeKasHODCNC4FDm8zE4Rt+Lhbasq+rbd9nn0Ty7iVrfY6XmA+Za8u8LCkWm3pO9kd6K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761824833; c=relaxed/simple;
	bh=NPtLpyBMJ6lKixCBeff+DHHfeoHFoRb6MzwjeRD2Ve0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nptYbqTQeDpwEnSmFSwMb1eI5QFRQiO0Qd16TpLMlG1LbKZbUWegpJFpVkYs+btkJhcQRuLtLqKG/q3/b9Od4wBdS65od52yPLAfJ5Z9Yl0w6WzmXwDeNwliIHMYX9qGIyVpCA3UPjH7gSbsLxGykwSxvGMhKcmhQ/HHyUW3iHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nd+CpjmI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A38C4CEF1;
	Thu, 30 Oct 2025 11:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761824832;
	bh=NPtLpyBMJ6lKixCBeff+DHHfeoHFoRb6MzwjeRD2Ve0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nd+CpjmIm1eD9VFr3DBUOApbeBPryyS/Ln6Ax9h++X2ggQEyzzm6rOGtd/DiE5qta
	 fZdmPq8ZlAEZEoi6igQPRabzrZlorPu01Fl7wJgdagnTgBo1nLbentCtqDBCcNLXKH
	 K9+malVlfl1ORI9PR3O2jaeBtk5lH+5XgvwHhFQL5pqMwdf4xOxGPrx+k4vHmF2xh8
	 +yWNbN7GwctOWz9vWzdrZHU9mE/oyctg2TV/lwaKtMoAKcIVK5pz/M+5ySTSUQBiEa
	 gv401J7j87BqQQPIRPO3leh259+IttAWZUnkCSbPd6nt6/7LZoK+MpCOhVS01oBtSY
	 hA6Sg5YAvILqg==
Date: Thu, 30 Oct 2025 11:48:15 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 2/2] backlight: ktd2801: Depend on GPIOLIB
Message-ID: <aQNQf33cUcvo0HvR@aspen.lan>
References: <20250729-expresswire-dep-fix-v1-0-635cd4cc746b@dujemihanovic.xyz>
 <20250729-expresswire-dep-fix-v1-2-635cd4cc746b@dujemihanovic.xyz>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250729-expresswire-dep-fix-v1-2-635cd4cc746b@dujemihanovic.xyz>

On Tue, Jul 29, 2025 at 07:18:30PM +0200, Duje Mihanović wrote:
> The LEDS_EXPRESSWIRE library used by the driver requires GPIOLIB. Make
> sure this dependency is not left unsatisfied.
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Link: https://lore.kernel.org/all/b6c481bb-e854-405e-a428-90301789fe20@infradead.org/
> Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

