Return-Path: <linux-leds+bounces-4604-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 743ADAAFD47
	for <lists+linux-leds@lfdr.de>; Thu,  8 May 2025 16:37:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D72A9C1811
	for <lists+linux-leds@lfdr.de>; Thu,  8 May 2025 14:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F972741C7;
	Thu,  8 May 2025 14:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNphbLh+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66139272E6F;
	Thu,  8 May 2025 14:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714779; cv=none; b=gDjrB58PVRGlwN+4fLJG9+aoPGkgONCZTOmnAFp45q+EkYhofJOj5B9YidUhD8rkjVydFoKHJ9XiQ8Vd+LmGExAdiVutCd6ZjL2B6kx3IepyFLt9Qc/LZF1UPDW7EPIl0123Ct01BPGt5yg/tE3DnhQfS9MaTW+A6dR+I/N57Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714779; c=relaxed/simple;
	bh=NxGW7N90fDSOJso1seyJ02kkBD8Q8q5t1i2zP+DewbQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UazF6K9vUodirN12VAXy8dgdDf3yXKqrZ33j1xoy0Yu14zngPiMTTKZ6qSTKsqjJEUxRNou7qzhYPiYXmIh+QEmz7j5ARUqozDVjg4S7RPSB16bVhWieu0CFT+gkddru78c3KwwA+xCOqNysZkN4cHddXxyTlgZQO8ywNMtzc0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNphbLh+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03CB0C4CEE7;
	Thu,  8 May 2025 14:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746714778;
	bh=NxGW7N90fDSOJso1seyJ02kkBD8Q8q5t1i2zP+DewbQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FNphbLh+p/iHJGO4w1vz+b+pnDN8vnpU1X/khuU1FqyyQqtMF8Y1NNiPwv50TXq2+
	 i2OnOQOsktJSkWMGlwy5A3v0ZMJq8dIL0eu0FoFnI09BpNRyGNQtrbQadE3Ntnb6iU
	 h5kTmoFA0Us1pEpAkjaZHi/aK08Dbid9571r64KdpvzwrjBNS9Ymq1Gj17EIhNibG/
	 AZIbeLlwbBS4g/VsrQWCHrLbAuckzEPF22Ylxm7Uh40BseiZbMVk13qwgXp/F+0SXD
	 J571fk6toXXaiG/oWU9+r4ZdIxqermazZoszKU1xDFJ18NW31t93n6QedfYRL/u/Ic
	 LMeywq/Uv1/TA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <1ce4245107e0a51dce502a007a69899bda018d5f.1746197460.git.christophe.jaillet@wanadoo.fr>
References: <1ce4245107e0a51dce502a007a69899bda018d5f.1746197460.git.christophe.jaillet@wanadoo.fr>
Subject: Re: (subset) [PATCH] leds: rgb: leds-mt6370-rgb: Improve
 definition of some struct linear_range
Message-Id: <174671477676.2472260.13790392166774211195.b4-ty@kernel.org>
Date: Thu, 08 May 2025 15:32:56 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-39345

On Fri, 02 May 2025 16:51:22 +0200, Christophe JAILLET wrote:
> Use LINEAR_RANGE() instead of hand-writing it. It is more robust, should
> the layout of the structure change one day.
> 
> 

Applied, thanks!

[1/1] leds: rgb: leds-mt6370-rgb: Improve definition of some struct linear_range
      commit: 4e055c846de470cb4a9bf4be0811c7d624785abc

--
Lee Jones [李琼斯]


