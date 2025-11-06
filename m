Return-Path: <linux-leds+bounces-6027-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B5DC3CAF1
	for <lists+linux-leds@lfdr.de>; Thu, 06 Nov 2025 18:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6CCA62094C
	for <lists+linux-leds@lfdr.de>; Thu,  6 Nov 2025 16:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3905B34B693;
	Thu,  6 Nov 2025 16:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRiTQyzo"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBE034B661;
	Thu,  6 Nov 2025 16:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762448188; cv=none; b=kpq/4SzuNNOnr645aAKSjJ2eV19QEbs/zflIy4A1wj5t+P2ChtzuXAUKKaUKrbm54Crvd7Lqml3U4rv/SNODlKLlUGdjKSJ/JnPLPvFmsFsFrAmkO9NpX9YHlj98qBFbfJem0sqj+NEB5/TpsoPlmuipamknRh1bOJrduZL2rjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762448188; c=relaxed/simple;
	bh=g8hhqYAlLRPy0OO8aW+VM4dqaefjEpSWoUgU+32L+Ko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E0nnbD7TMO15mk/X6dktPJRujvPzgXIEScdQgkKdKeSQ41mYf855Eu6RXWpYBXC/Y4MdeABuglIFiIvfr2XBd18EK0cV4sMsQ7ZxetEGmIg2n3HZ7wF+BgdqPYlxayZb7wB/HmnRGNlP1ty0RIGblOUlCGxouJcMtfISG0ndHHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRiTQyzo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F67DC19421;
	Thu,  6 Nov 2025 16:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762448187;
	bh=g8hhqYAlLRPy0OO8aW+VM4dqaefjEpSWoUgU+32L+Ko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KRiTQyzoeXHPV3ZgoIDaRR/5bkTrDMu3LXTDeswLnqvUsIHubMVgJzxY0pDXgcR1W
	 jx8PIe5ieZxbb3ENAIXYmzy0SdbYd7xFQCmgd3atLpTlNQP5dFpMjfN+HWaLIjtEax
	 X/GDQgi/C5D/1xgqSarpTSKrdOYdeQ2hCd81CN1aqKfoEithXlnK+Y6bZICIZiJHC+
	 7nv4SuTGY1vzUkq/lidwnF6vvvxgbpb/PusDqFuvU/BO8gd43XtKja4CFV+mdzLINr
	 ebPTgu1fkZcd4BTOhnMmWNnpChNlBV35POmfYzfEQOWWDHLxM3DBOdcIvlYfRI671A
	 jpUjSaBY9pKqg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
In-Reply-To: <20250729-expresswire-dep-fix-v1-0-635cd4cc746b@dujemihanovic.xyz>
References: <20250729-expresswire-dep-fix-v1-0-635cd4cc746b@dujemihanovic.xyz>
Subject: Re: [PATCH 0/2] ExpressWire dependency fixes
Message-Id: <176244818496.1958671.2173337292589676568.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 16:56:24 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Tue, 29 Jul 2025 19:18:28 +0200, Duje Mihanović wrote:
> This tiny series fixes two dependency issues with the ExpressWire
> library and the KTD2801 backlight driver. Thanks to Randy for reporting
> these.
> 
> 

Applied, thanks!

[1/2] leds: Drop duplicate LEDS_EXPRESSWIRE config
      (no commit info)
[2/2] backlight: ktd2801: Depend on GPIOLIB
      commit: d95963e309bc1211e28051314e72638d98225614

--
Lee Jones [李琼斯]


