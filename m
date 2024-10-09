Return-Path: <linux-leds+bounces-3022-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 835D8996E44
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 16:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B51701C2178A
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 14:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FAB6F307;
	Wed,  9 Oct 2024 14:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOnAwFQ4"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5763BBEB;
	Wed,  9 Oct 2024 14:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728484748; cv=none; b=SG/TzUuHcYpjPe5ucI3o7b35YjWT5+ImD55FBXmFnb9ynz/3cob1iIF612cl1E6xflLsjPlXDUuK2kjHHNIhR7x4O7E02QLA91V1wwcFCtICkVcwSJGuJvYm/qjlrxyeP5UpPnuZgEwL9l0n5jgMQ+68QleSvIgPYCcJFnScxWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728484748; c=relaxed/simple;
	bh=x/NP/skFyVirDq7NleZWKTVC4o17L0/jCPs9bvIuCRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHzZugUVgL0pL2l45/jC6I9cP8DuTIoIlUT8FryfRElRzPxb9aToT/Gwj7Ldt+wNziixcvNKkDoXkD4+7SWd47svB+SvQ3yM9Z2vN9yJTFpUQ0nZ59UkkRsEEwRU5BmxGlGOo3A4tCSjUhMBgVPym0vzgQEHB4Q9Gvxd7fhz7os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOnAwFQ4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD6BC4CEC3;
	Wed,  9 Oct 2024 14:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728484748;
	bh=x/NP/skFyVirDq7NleZWKTVC4o17L0/jCPs9bvIuCRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oOnAwFQ4DgOh+WKq6fEWT8jH1bGT+gX4Yly02dxpRjec9iyTCYGo2LpbSZHz43Jv1
	 qBlPh4qVyEK7FwF4QXvS6QDeMyJlDVerbRu2vEQpIiaeOYqajmqtB2AYLlYxr0vC5x
	 8qmauEb343Z95zN/8nRxp+qj9lNjbTd/iVCtq1R61eU3AbtN/09v2iJn3y6q1Z452P
	 Ieju1Eg8zFLFPRYNAPYv9V7jk0iLV3ywhVkGxnZtrBrBCwECuW11vBOkFWA2gFIQZb
	 ERfoHfgMkNMSsWUBpBEgU+jQNAfluB+fKjN/JqTMp7gndg5AXVpzA8K1fVQoa1LjpU
	 H/GQ/L90Wz/jA==
Date: Wed, 9 Oct 2024 15:39:03 +0100
From: Lee Jones <lee@kernel.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: pavel@ucw.cz, aren@peacevolution.org, tzimmermann@suse.de,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	jjhiblot@traphandler.com, guanwentao@uniontech.com,
	zhanjun@uniontech.com
Subject: Re: [RESEND. PATCH] leds: rgb: leds-group-multicolor: Correct the
 typo 'acccess'
Message-ID: <20241009143903.GL276481@google.com>
References: <DA8E8FA1F45D2F5A+20240929092057.1037448-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DA8E8FA1F45D2F5A+20240929092057.1037448-1-wangyuli@uniontech.com>

On Sun, 29 Sep 2024, WangYuli wrote:

> There is a spelling mistake of 'acccess' which should be instead of
> 'access'.
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://lore.kernel.org/all/0c768bf6-bc19-43de-a30b-ff5e3ddfd0b3@suse.de/
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  drivers/leds/rgb/leds-group-multicolor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Already applied.

-- 
Lee Jones [李琼斯]

