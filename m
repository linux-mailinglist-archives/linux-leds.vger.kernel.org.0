Return-Path: <linux-leds+bounces-365-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D869581184B
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 16:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 015492813CC
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 15:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51ECC33CFA;
	Wed, 13 Dec 2023 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gHMS347L"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3385133CF9
	for <linux-leds@vger.kernel.org>; Wed, 13 Dec 2023 15:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E75EC433C7;
	Wed, 13 Dec 2023 15:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702482525;
	bh=Nl9nFnDHapzZqypu+xQ58UZjEI97nL3gd1POrXSYFcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gHMS347Lligc2Z5r3Cn9BPqQ6z44W2Gv93mPibmyXc1WnmjfKB8liyEoz82SytqD0
	 Rup4B64dl6bnwzbuHbP7XyQD9t9INfJDhTRPRNU7Zv5mP4LRJOiPNaxH5SHYjrNchz
	 37odbDbYwpazJVeU4BAOv/o1dpQHtDnkHhvNkYbAipuhF70/gSxharq9P/n1FDvwOt
	 WeQrBkXiV5nIIIyLKNO9k2mgLLMj++BlbeKx6hneqJ9OTQ8H7W5kAhWD+D3C2Q+AID
	 F3V0B7H1Rb6WpQD4ayr2CSyrac8/8MZbGzBiHK3WuEglQrmYnjTTf1uHqIVhSu863k
	 y9jxiIaukTemA==
Date: Wed, 13 Dec 2023 15:48:40 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
	Pavel Machek <pavel@ucw.cz>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Anjelique Melendez <quic_amelende@quicinc.com>,
	Lu Hongfei <luhongfei@vivo.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Luca Weiss <luca@z3ntu.xyz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 003/115] leds: qcom-lpg: Use devm_pwmchip_add()
 simplifying driver removal
Message-ID: <20231213154840.GN111411@google.com>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
 <631d24f0edaa7ac8ebeb22bb66260db8d8823aff.1701860672.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <631d24f0edaa7ac8ebeb22bb66260db8d8823aff.1701860672.git.u.kleine-koenig@pengutronix.de>

On Wed, 06 Dec 2023, Uwe Kleine-König wrote:

> With pwmchip_remove() being automatically called after switching to
> devm_pwmchip_add() the remove function can be dropped completely. Yay!
> With lpg_remove() gone there is no user of the platform device's drvdata
> left, so platform_set_drvdata() can be dropped from .probe(), too.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Note this patch was already sent out individually, find it at
> https://lore.kernel.org/linux-leds/20231126095230.683204-2-u.kleine-koenig@pengutronix.de/
> 
>  drivers/leds/rgb/leds-qcom-lpg.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)

I already applied this on the 1st December.

-- 
Lee Jones [李琼斯]

