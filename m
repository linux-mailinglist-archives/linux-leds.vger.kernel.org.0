Return-Path: <linux-leds+bounces-3297-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 870299BE006
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 09:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ED411F23AAB
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 08:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366421D278C;
	Wed,  6 Nov 2024 08:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaSP8zW3"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0704E1D0BA3;
	Wed,  6 Nov 2024 08:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730880764; cv=none; b=bjiTceqvKqBGxl1DISRje/2FOtWUYZZzZb8VJ9VD9BXMY44VYOLLWngyQ/+a73CAXpGwdHjcc/Jh1Fh0pWAt0SF7Czu/eKqOT3D5pUvYDPzmYuey+Fx1Uua9MhPb9VIu7guXiXHsrgCxHQTqICEgqWCtP8xtr500gMx6fNHtmdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730880764; c=relaxed/simple;
	bh=Bzz8BI0yTbgHw41rt4dG5ysW2QdpyvtGdvL0fmsCv2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BIuQ9HYVTx/fK5URlH/Xz7vFi72jUhzF+W63pPUA3io+djMI2LUf26AJnbAoCT0z0GTuGmnhAmoU1fjHUZcPV+hItAVmbsx6UClal6C8q0JJYgo2sixKwkq4SDKw5WvxQ8RIvS5g7t41K6Vg0FH0GEDpIerW6lYyloc4y6XKkfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaSP8zW3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23106C4CED3;
	Wed,  6 Nov 2024 08:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730880763;
	bh=Bzz8BI0yTbgHw41rt4dG5ysW2QdpyvtGdvL0fmsCv2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BaSP8zW3z1hT1kEYjQ0iUzD/LnFKjFN4pPgzxyx+Lt4b8azE5daFR/6FP4jgRF4A8
	 3Wcav3Fy3BzD7GQijRS5QPuDbGwgq+kDC7C3x2VNxuVWjHTSgxepIVeQuBl3FOcH/o
	 bsZkbWHBa5Dut9kdE5eLrgHxCoGQvkvojFJUKzIi0keJ0TRbs4OgGpP0XRfT5P+V7z
	 WBiw9aBH9Kxx23ZqMcq6E6q/dd3cXP4c6hOGUF2TkuzEwkangkfT9o0DS/xYf6KXn7
	 bwIzXkcOf5xLuLVOgpy0Bo5HDwH+J1YqZmSHDs1zFyR5wJXbeArbcuAptteWt+vjDr
	 AgPHp7ffFjyfA==
Date: Wed, 6 Nov 2024 08:12:39 +0000
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	kernel@salutedevices.com, rockosov@gmail.com,
	Alexey Romanov <avromanov@salutedevices.com>
Subject: Re: (subset) [PATCH v2] leds: introduce ordered workqueue for leds
 events instead of system_wq
Message-ID: <20241106081239.GF1807686@google.com>
References: <20240903223936.21292-1-ddrokosov@salutedevices.com>
 <173088071827.3234293.7159770328606603865.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <173088071827.3234293.7159770328606603865.b4-ty@kernel.org>

On Wed, 06 Nov 2024, Lee Jones wrote:

> On Wed, 04 Sep 2024 01:39:30 +0300, Dmitry Rokosov wrote:
> > This allows to setup ordered workqueue for leds events. This may be
> > useful, because default 'system_wq' does not guarantee execution order
> > of each work_struct, thus for several brightness update requests (for
> > multiple leds), real brightness switch could be in random order.
> > 
> > Yes, for sysfs-based leds we have flush_work() call inside
> > brightness_store() operation, but it's blocking call, so userspace
> > caller can be blocked at a long time, which means leds animation stream
> > can be broken.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] leds: introduce ordered workqueue for leds events instead of system_wq
>       commit: 32360bf6a5d4016669c3545e7b0ec939937f5331

With a couple of style fix-ups.

-- 
Lee Jones [李琼斯]

