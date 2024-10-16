Return-Path: <linux-leds+bounces-3111-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5939A0321
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2024 09:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71049286BC5
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2024 07:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE2B1CB9F1;
	Wed, 16 Oct 2024 07:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rQOZyXIf"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3C81B2193;
	Wed, 16 Oct 2024 07:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729065194; cv=none; b=cwnVPvc6Xnn2pB8U0dcXHl7KqXKrbXfY698ezbE/6KobubDIY2eabRT4pZtWq54VJrkpB4smANN/dxoLgAP/+yEciyTEvE8kzcmitwKgM2Xra5lb4PW7OepsK0BZWGyIk5FSMbsLLA4sOnFnoXDeV408t6wMdz/JVjDJ7hNvTC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729065194; c=relaxed/simple;
	bh=CdR8EE//SOPyuvKFZrlrubTDwzoKKu3oOsW6BoIRT24=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JwAHQe9WG5pVqS+KVae57lWLylejffiqKGDjM3FP0K2YZbfoSaVeHTP3QHx2fT33G6SY0+7P/ZW17tHg+tQ2D6OsnOWxjoLfXnpvYtZJm4Laf2oeGWl3ezYREiM8HwEWgj/pnT+GXqPeH365uPR5HrCSZ6oFjpOKK89RZ9YQGas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rQOZyXIf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316B0C4CEC5;
	Wed, 16 Oct 2024 07:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729065193;
	bh=CdR8EE//SOPyuvKFZrlrubTDwzoKKu3oOsW6BoIRT24=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rQOZyXIfzz2lA1I0B3vM5sYcykRSJla3uMsKGR3du0xOeKnKDf+6wUcX12ZNnWrar
	 dUk1bicChzZH/BA6FHgyRvQbhFvGgqDX1Hey9pZ/qFDky27iffuKDd5xEKfgVebpJb
	 GdJzSYVM8rI8VZlCp1/oHJXQksqXI29WVQBPg0bfa4zl96/BUs1Qh274rSGxI0yquE
	 dBHZh5YGOLebIyGCqairav3qIbETpaXv0jqOjOKyQG+/DPOExPmWumjpw5cqY1BK8C
	 VXnkJmjW0Thfo4fhnO6dnIhwUS5W74uAzKZ796dHnO6cF98ibmD8F5SPvqqBBV2eBT
	 ZBFMaefss7ivg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Suraj Sonawane <surajsonawane0215@gmail.com>
Cc: angelogioacchino.delregno@collabora.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 matthias.bgg@gmail.com, pavel@ucw.cz
In-Reply-To: <20241016042142.8088-1-surajsonawane0215@gmail.com>
References: <20241015085842.GC8348@google.com>
 <20241016042142.8088-1-surajsonawane0215@gmail.com>
Subject: Re: (subset) [PATCH v2] leds: Fix uninitialized variable 'ret' in
 mt6370_mc_pattern_clear
Message-Id: <172906519188.1139310.1418498131501157586.b4-ty@kernel.org>
Date: Wed, 16 Oct 2024 08:53:11 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 16 Oct 2024 09:51:42 +0530, Suraj Sonawane wrote:
> Fix the uninitialized symbol 'ret' in the function mt6370_mc_pattern_clear
> to resolve the following warning:
> drivers/leds/rgb/leds-mt6370-rgb.c:604 mt6370_mc_pattern_clear()
> error: uninitialized symbol 'ret'.
> Initialize 'ret' to 0 to prevent undefined behavior from uninitialized
> access.
> 
> [...]

Applied, thanks!

[1/1] leds: Fix uninitialized variable 'ret' in mt6370_mc_pattern_clear
      commit: 6cbf5c99541ac681cf5c6155b582dfbcd879eae3

--
Lee Jones [李琼斯]


