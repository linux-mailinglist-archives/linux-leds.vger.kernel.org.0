Return-Path: <linux-leds+bounces-4031-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE7CA3DE4F
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 16:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF8C7701912
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 15:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130441FCCF7;
	Thu, 20 Feb 2025 15:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e335FwFJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8AF1D61A3;
	Thu, 20 Feb 2025 15:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740064745; cv=none; b=WyalfTUiFR/i+9kKWBA1fqumeWbFvcXLXIQiXYzw9oYiqkyiGIvtyMKhp3VS25UHuHY/Y7q0tYlImyAX8zpcECIKEX5lWlrNQAKaHU567zktBRLnhp+z0El4YGqicBKVShf0kCsmUmmQzAxySUnYChyvFwrkR6e9bgxONutUxx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740064745; c=relaxed/simple;
	bh=OtwKfsAMdvxWfORd+MiNhDG6k+wpeSxgEQzVGVfxOK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5fCTgTaz+pSItV6ZPYYXIyhuOocwUM8fRCiNEzfTludLmgjs8gxZvI73fTZYBqZUtSOEEIBevJ5Vip5Z98ip7XVnwlkarj5P9ZmbBTgi3j7ZTrMr/VFlCuU+PmgTlj/A+yRtKDRxJZkQtq7tOpvPiWxqqwaJXyE2WhrvjXG0e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e335FwFJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633D8C4CED1;
	Thu, 20 Feb 2025 15:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740064744;
	bh=OtwKfsAMdvxWfORd+MiNhDG6k+wpeSxgEQzVGVfxOK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e335FwFJ1WWxFDUJmm16RoV5O33H2Mf9m3p/HqN1Ctbls83eSMVg8+XQAXwRTj2ih
	 RiGa+DgNMpTj2FZIYEtVCet3yVfCGc2uj8a3ghKTGaOJY/EgdO3j6yFWbUGtFVoT/C
	 DaZnkJSGcUm9DnrgjK3ag/8M/azoUJmpQG+ZJTsvAtzvIVnIRqpRreXjiJ71PJDnq8
	 zQm5C/jt6qZbwQkegABk7gQlnuOmotdCs7NeOfKLZUi14ANQzfO4xNGk22UN4kDEK0
	 rzLqRNkkww/r/Ef+ibDm7xRkgKIjo4UrwyD6hoysedCLE4aLPAhqt4Dw0Nqt8sdATh
	 E6qA1d7tWjRnA==
Date: Thu, 20 Feb 2025 15:19:00 +0000
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] leds: aw200xx: don't use return with gpiod_set_value()
 variants
Message-ID: <20250220151900.GF778229@google.com>
References: <20250212085918.6902-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250212085918.6902-1-brgl@bgdev.pl>

On Wed, 12 Feb 2025, Bartosz Golaszewski wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> While it now returns void, it will soon be converted to return an
> integer instead. Don't do `return gpiod_set...`.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502121512.CmoMg9Q7-lkp@intel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/leds/leds-aw200xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]

