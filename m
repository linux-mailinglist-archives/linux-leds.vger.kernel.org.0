Return-Path: <linux-leds+bounces-3225-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 666209B7FF0
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 17:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A7692810F0
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 16:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C38A1A3047;
	Thu, 31 Oct 2024 16:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A7MK6JGZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BA419D89E
	for <linux-leds@vger.kernel.org>; Thu, 31 Oct 2024 16:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730391779; cv=none; b=Ua6kBcftd2kL8fUQ4yR9EG+H3a1UCtae7INPr2iOr0e0tMZx/jMDvzSst+57BdP+eAwR5zisUe3xrdnggLvTM3elxD29/ERaYetfHVjmHINhVaG4lKlVyvMW/e6pcTB0iVm//74ue1obS8uvsnPnBRBV/HDg24bVkXuCFL1Bl2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730391779; c=relaxed/simple;
	bh=CMBlfEFdpN2RcNM6Fi9RH4xi/WvRASyAqFbYBVqJlJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQYRPX/UvcnJA5Ch6HnhdQaS5i3Qs7RdtrXVsSv0fCYSzE2nGN5azWFsOwVKSY5952V1iEgtpE9jS3hF02u6YF1NWbFjwfuF7wVNR8yeTEkP00qto7cDayZjtmQ7NgLpYWQoTq06NvoYaaWzhXurgGwQrMxQO8E9y3XilPDGQU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A7MK6JGZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCD0C4CEC3;
	Thu, 31 Oct 2024 16:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730391778;
	bh=CMBlfEFdpN2RcNM6Fi9RH4xi/WvRASyAqFbYBVqJlJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A7MK6JGZiGmwyrrRO9fbt95LEfIgMk07NT7KwGfD6s8v8W0VlU1u2AxwWgCYpyNEl
	 5+eMyP8VVgFM1t1fxAu39d/fqncdse7EU4H4EXkA7yVvp2992o8CAVzIQRJwgtssCx
	 KMYTfrayTsUvK4AvA/Cbh9JnigrlT4AUBTXFDFmS0niAQgekB8Ho//36nT1/MrJjoL
	 hXKpQ6DwJimx4QZR3BIMkRX6e3gGgQNWC3cPoBJI29D85leojU8B/aVNAMRaVzpBMK
	 YDSgDiA8pd0YKOjIUAPxtIbNhsF8QzsR71QMI8pAD0nwMPJ/CLhXwBpY5zRVm07qcr
	 vKdJSnM2uORyw==
Date: Thu, 31 Oct 2024 16:22:54 +0000
From: Lee Jones <lee@kernel.org>
To: Zhang Zekun <zhangzekun11@huawei.com>
Cc: pavel@ucw.cz, matthias.bgg@gmail.com, linux-leds@vger.kernel.org,
	chenjun102@huawei.com
Subject: Re: [PATCH] leds: mt6360: Fix error path in
 device_for_each_child_node()
Message-ID: <20241031162254.GM10824@google.com>
References: <20241023120628.15944-1-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241023120628.15944-1-zhangzekun11@huawei.com>

On Wed, 23 Oct 2024, Zhang Zekun wrote:

> When break out from device_for_each_child_node(), the child node
> is refcount added, and requires calls to fwnode_handle_put().
> Use scoped fwnode_handle_put() to put child node automatically in
> error path.
> 
> Fixes: 679f8652064b ("leds: Add mt6360 driver")
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
> ---
>  drivers/leds/flash/leds-mt6360.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

You were beaten to it I'm afraid:

https://lore.kernel.org/r/20240927-leds_device_for_each_child_node_scoped-v1-1-95c0614b38c8@gmail.com

-- 
Lee Jones [李琼斯]

