Return-Path: <linux-leds+bounces-4303-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6BFA66F4F
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 10:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2D143B873B
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 09:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF091205AD2;
	Tue, 18 Mar 2025 09:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjhFxyND"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7442205ACB;
	Tue, 18 Mar 2025 09:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742288861; cv=none; b=DGr+ykSWdH2pql1Snxormd1JuPgp9vjCT/QGJGQDmkgRF1yteb7uugpyXNK3s14WVP6cCMR49UUAnOaj+GboN2i1BLtE113c7dUa0k04zXRBb2uyMIBW2qJeCFbg6QpyLYlI5ULOluKamsPdrlY1L7M3kyiccNp42wIvVmh6SC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742288861; c=relaxed/simple;
	bh=IHci5lRxtBx9YJ3KtlM88aIeZwODGFyVgGYkUDGWHEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+gVTPIGAfEkJ102dohLOQp1DVPMpzSClSwJE9gIP5ovSCm7ciHW3dy9GhFvzTK+ZZVxEKk61HkmqWwPgcjxw8KMm9oC+6SPAzX78cgyfhs1CtzAkSiI/nY3xC7cNsDmXRgcqo2yJCYAGVoOCwOq2No2UVq/Gd13ffTGllN8ijM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjhFxyND; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5D0C4CEDD;
	Tue, 18 Mar 2025 09:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742288861;
	bh=IHci5lRxtBx9YJ3KtlM88aIeZwODGFyVgGYkUDGWHEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZjhFxyNDerX+cAU//b+bfZ46cBK2tc7+1OBVTHv2aVNbqukpkAbTUsGTgHNKIU6g9
	 ZVb2Ugzk+s2RNW7Md/prcMBthdBTVzTMBppRZ9DIKt5bfWBRb2KF+dhe8cJQXoQ1Ef
	 LBU6AqVSb+QCffsHpMCPL3qIACIVlkc/2MH7yMrsfFKbIeyOIlTtCSVoI4YriVtgl1
	 qXFksAbfhmf1y5k7Ct9kTlGQ2Wlci8WQMC8S1nRflfoTA7Z/EMSRq9YCBc9tFr4Qr+
	 A40+p6aLQQVbyns4Mpq6bayabZjbIuwa/yBpxR2PLUmazLlQMk/7wfH7Ut45FuqBPL
	 L8O4Q+YMuKvCA==
Date: Tue, 18 Mar 2025 09:07:36 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, pavel@ucw.cz, jingoohan1@gmail.com, deller@gmx.de,
	simona@ffwll.ch, linux-leds@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 05/11] backlight: Move blank-state handling into helper
Message-ID: <Z9k32GMvv4KSu_Sl@aspen.lan>
References: <20250306140947.580324-1-tzimmermann@suse.de>
 <20250306140947.580324-6-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306140947.580324-6-tzimmermann@suse.de>

On Thu, Mar 06, 2025 at 03:05:47PM +0100, Thomas Zimmermann wrote:
> Move the handling of blank-state updates into a separate helper,
> so that is can be called without the fbdev event. No functional
> changes.
>
> As a minor improvement over the original code, the update replaces
> manual locking with a guard.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

