Return-Path: <linux-leds+bounces-3089-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AC699E1E7
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 11:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A43A1C23050
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 09:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B3D1CF7DB;
	Tue, 15 Oct 2024 08:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mL3AQxYh"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE301CF296;
	Tue, 15 Oct 2024 08:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728982727; cv=none; b=UwLcNAhzIclA1CwvbtBYpf5pGE+sEBUvu0s9mPs520veGDXxno6XpGZWjB6jBazXzQCK8m7c9CYoIK9qC6b2OFck+v6n/X/gGTTa/Rgh82RFyeo+sHYD7jmR1XRNL1DXu/zCHQbrIaXjfj1WqDCjgSFz+TLjh6R0kWaW9y3ZLi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728982727; c=relaxed/simple;
	bh=jAGoNoLVAbRIcXL7z9HRSFMPr+Mhu705XIwf+Uer1jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+HMS1CYceFb5XHbZZU/tpdwZHzgvNrg21tgUvggPzyhthbhaASArwDGpVI/2WdBr7KtK7Upuk8dnYHejeIM36uyvQUI9qMRUlmAtixObIqEq4Lqjqdqn2Ct8ECQi8OPxVMV/V4YnOR+o4MgKs3e+TinZqOxJ4QkgOVgDDkyPu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mL3AQxYh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC14C4CEC6;
	Tue, 15 Oct 2024 08:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728982726;
	bh=jAGoNoLVAbRIcXL7z9HRSFMPr+Mhu705XIwf+Uer1jQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mL3AQxYhpqOS657KY4KyNUFpIpD0dZiiW8+n21zMH916n1KfWI2lTQ5OwCKcsgiaO
	 MMmDNerfrPDwONsQjoORWai+TitJErYqNQRtHr+9GBnXU7GL6QOoVUPBu1Fxh26AE4
	 41j0WRrEZXJoTUHrBK2IQ6jHVpQzWpmuJnrx4VsDJUNOLzJOlGRSbnNaZUFkmjkNe3
	 zGDupd0EbdeYEBUp67fLA+XGOPsEnG3+btDBBgw8akmvG+GEMUq6pFmZk1MOa8ZJhg
	 7AbZTooqfZru4R9+OXZi8aVQdkFNpc1a+QsA6Gzrke5aczhY+AOOa42gE3VR7f9hSa
	 r/d4sAAMDOryg==
Date: Tue, 15 Oct 2024 09:58:42 +0100
From: Lee Jones <lee@kernel.org>
To: Suraj Sonawane <surajsonawane0215@gmail.com>
Cc: pavel@ucw.cz, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: (subset) [PATCH] leds: Fix uninitialized variable 'ret' in
 mt6370_mc_pattern_clear
Message-ID: <20241015085842.GC8348@google.com>
References: <20241006131337.48442-1-surajsonawane0215@gmail.com>
 <172863776565.3130628.18378710932238203204.b4-ty@kernel.org>
 <7274be28-aefe-49b1-b8e1-dd1c2bad96d0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7274be28-aefe-49b1-b8e1-dd1c2bad96d0@gmail.com>

On Fri, 11 Oct 2024, Suraj Sonawane wrote:

> On 11/10/24 14:39, Lee Jones wrote:
> > On Sun, 06 Oct 2024 18:43:37 +0530, SurajSonawane2415 wrote:
> > > Fix the uninitialized symbol 'ret' in the function mt6370_mc_pattern_clear
> > > to resolve the following warning:
> > > drivers/leds/rgb/leds-mt6370-rgb.c:604 mt6370_mc_pattern_clear()
> > > error: uninitialized symbol 'ret'.
> > > Initialize 'ret' to 0 to prevent undefined behavior from uninitialized
> > > access.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/1] leds: Fix uninitialized variable 'ret' in mt6370_mc_pattern_clear
> >        commit: b5a5659aebfffbcddb81abafe042fb4044b6ff9e
> > 
> > --
> > Lee Jones [李琼斯]
> > 
> Thank you! I'm glad the patch was applied. I'll ensure future patches follow
> the necessary guidelines.

Sorry, this is a tooling error.  The patch was not meant to be applied.

Please resubmit it using your updated .gitconfig file.

-- 
Lee Jones [李琼斯]

