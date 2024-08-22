Return-Path: <linux-leds+bounces-2515-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD9895B77E
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 15:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E9BC281282
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 13:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A0D1CC8A3;
	Thu, 22 Aug 2024 13:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6RaX5oX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7ED1CBE87;
	Thu, 22 Aug 2024 13:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724334649; cv=none; b=BdzmIdKu0me6Jy4MaV0mQgibbiyuSQXlloMloWcTesY7j3sbYh3r80PLw+fRrxsXzXBfzeOqQLvD1rWiFSHUosSjpuUysygWUl6tCS0ggQA7qj3jpPgan7ihmFYEStM0HQTtOfNF3ObxIUoyd8H7VjF8DEUxeqrsZEguzjcuSOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724334649; c=relaxed/simple;
	bh=JoDIlM/kYDmQOyZPWx3O6oRAWReJnrwEbWkJ9E8rqEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g1bKuDOGZolGWOVee2oqduQIBziSnCeHcOw50HISQsN9vDtUq92krpIrEMmACZadtSqNthxoxi9eTgmQpwj/9/ptKdfoOCBqGGbiRhewB9pK7KXE/BfeJPtMwLAqenGbTq3nV6dTXvk2QZL35Lu/3j+aoAPHL3b5sOtTA8dSF/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6RaX5oX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6D5C4AF09;
	Thu, 22 Aug 2024 13:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724334649;
	bh=JoDIlM/kYDmQOyZPWx3O6oRAWReJnrwEbWkJ9E8rqEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d6RaX5oX3zMpojTrmLBvBdYKB1BUOj89OUzweKlDddPX05eekP777TWewzFuYL6wF
	 dOJwvJUPNzWSGfOLJw5HEpTrtR2qdZ+wXwc1DOVogNV6hX/CjhduRGmbXROWChIrFR
	 DXwAF3HoaH0xyg9f+Me59yXkvNmxmo1ZiS+4l+Eel6Yc8ihPybJ2UiDmwxrvHrXdu+
	 DnYjB+uG6iLP6/wLzImffrVzbPkG8amYP4xl01FEZnAh5Qp7lp4J8s78rWa21XDf6i
	 1lpBDx5krdKGJ6FnaPeEvuwQYwOmQi+rxKM9PR5imjgiLMCbQ07laHKaHj0vwKMZoJ
	 zIhUK9f4K8p7g==
Date: Thu, 22 Aug 2024 14:50:45 +0100
From: Lee Jones <lee@kernel.org>
To: Huan Yang <link@vivo.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v3] leds: lp55xx: Use devm_clk_get_enabled() helpers
Message-ID: <20240822135045.GL6858@google.com>
References: <20240822020339.474715-1-link@vivo.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240822020339.474715-1-link@vivo.com>

On Thu, 22 Aug 2024, Huan Yang wrote:

> lp55xx lp55xx_is_extclk_used get, enable clk and
> deinit_device disable and unprepare it.
> 
> This can use a simplifies helper to cover. And no need to save clk
> pointer, this can save a little memory.
> 
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
> v2 -> v3: remove unneccessary suggested tag.

Sorry, what's this?

> v1 -> v2: remove clk pointer from lp55xx_chip
> 
>  drivers/leds/leds-lp55xx-common.c | 15 ++-------------
>  drivers/leds/leds-lp55xx-common.h |  1 -
>  2 files changed, 2 insertions(+), 14 deletions(-)

-- 
Lee Jones [李琼斯]

