Return-Path: <linux-leds+bounces-4305-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F74A66FA9
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 10:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 077963AC36D
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 09:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F347206F3E;
	Tue, 18 Mar 2025 09:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKHjivh/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DCF146D6A;
	Tue, 18 Mar 2025 09:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742289919; cv=none; b=WJbVajqUFQB5MwfnHxOJPB09SateSXz07zSJI7k9hm8/EyLzd7OV2I/BcwuJYSrGAJPQPZc/9DwTkaD2wwp8BLRCHOf+RU5KCGUao2uZu92O4gloHb4eQbb4KMUHzS3qZAKTElpcyly7wUkZ7flvqxPpk8dEO8Ts4LrfSO/6l+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742289919; c=relaxed/simple;
	bh=j1zdG4ZOjJIBP1tsoIN/vYQ8EZ6ZbGzdt1VixGyX+SU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pe2K21V1RVM2G6pRZzpyTLGvUjopgPMER8tARqziuJYyO7x/ao85XTHe8Lc3gGITtDL4mo3lLAYeDWiSmxEPapXeeiKB4nm1UTyaJuHIGt5HjY47kmkk2hRTUQES5CNXBfXqzaKgMaLDBnNTosO59FMMY3ACKBffMAO+Hqx5nxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKHjivh/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5EDC4CEDD;
	Tue, 18 Mar 2025 09:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742289918;
	bh=j1zdG4ZOjJIBP1tsoIN/vYQ8EZ6ZbGzdt1VixGyX+SU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eKHjivh/F5uMxgduy4ljIwL7yh2tC/xcxKqJYH02Q8jzUU0LWeu0g7uDMcuLAiEx3
	 J8CZCseqQX1U0EzshnFHaCSjaJJdAsE8dFyRV7TVlMPa4LcdhHNi9lCKPYQTTV01Dh
	 WVxxxLvMhaYEFALYH6SlxE3MXMB+Z9hO6nBvYlHAd35wvJAtFgXX/C025YPVerbo3x
	 T01x1VmadmjyXpbWguHQqji9zEedtp7pMxYNACm+jyegWEvmHLvP+Oj4EtSQi5n1Ce
	 aSZNUx1zFDmAhDV5XmE05gB7ht4hrxHUSFk56sl5sa98h0E1iLkyTtyaGOBtwlmr4y
	 qUWpEWjKpeL+g==
Date: Tue, 18 Mar 2025 09:25:14 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, pavel@ucw.cz, jingoohan1@gmail.com, deller@gmx.de,
	simona@ffwll.ch, linux-leds@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 07/11] backlight: lcd: Move event handling into helpers
Message-ID: <Z9k7-lejr0NU-y1D@aspen.lan>
References: <20250306140947.580324-1-tzimmermann@suse.de>
 <20250306140947.580324-8-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306140947.580324-8-tzimmermann@suse.de>

On Thu, Mar 06, 2025 at 03:05:49PM +0100, Thomas Zimmermann wrote:
> Move the handling of display updates to separate helper functions.
> There is code for handling fbdev blank events and fbdev mode changes.
> The code currently runs from fbdev event notifiers, which will be
> replaced.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

