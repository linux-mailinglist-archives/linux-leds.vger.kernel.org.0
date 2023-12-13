Return-Path: <linux-leds+bounces-366-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A58811851
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 16:51:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65FF41C20EF9
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 15:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA448535E;
	Wed, 13 Dec 2023 15:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AiPXHdUS"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE7B85346
	for <linux-leds@vger.kernel.org>; Wed, 13 Dec 2023 15:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D4DC433C7;
	Wed, 13 Dec 2023 15:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702482628;
	bh=5bLjVub8GlOBHZ0IpoiQFHkW+Q+8psXwTdhqUVyGyaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AiPXHdUSauUrPXnBziyzpktm0q02t8r6JJMx6gUQJVU3Zd6OyuXDAFMiC5uUr9rgS
	 uMKgmtFOYSQ6wVuTZa9FuofzN5Yax549wxRr7Gz/LltJJ6HcPA8yMcPFSpiCQuscyD
	 xKEc06SJ2i3jQ/iT59BovHjKVcUIwXp/xgjUOeEcPCwFpYkTGdQ0e0u9xl/6lBn4Jg
	 KJu0UtR1x9Iewq/xsG9lRvHaHyPixhK8/jV6URSroGUzyytBI5c/L/wNCauzimjp8s
	 dJVNvBbPL66WyZHONpR12nNf6oMjCka9nS1hdb90cXp0eSfNOwMXLb8muGAVVL4FAn
	 +nqzsAQmtF3qg==
Date: Wed, 13 Dec 2023 15:50:24 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
	Pavel Machek <pavel@ucw.cz>,
	Anjelique Melendez <quic_amelende@quicinc.com>,
	Lu Hongfei <luhongfei@vivo.com>, Rob Herring <robh@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 004/115] leds: qcom-lpg: Consistenly use
 dev_err_probe() in .probe()'s error path
Message-ID: <20231213155024.GO111411@google.com>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
 <1884e7d6928764ef230587d68ec79f04aa0e79a0.1701860672.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1884e7d6928764ef230587d68ec79f04aa0e79a0.1701860672.git.u.kleine-koenig@pengutronix.de>

On Wed, 06 Dec 2023, Uwe Kleine-König wrote:

> One error path already used dev_err_probe(). Adapt the other error paths
> that emit an error message to also use this function for consistency and
> slightly simplified code.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Note this patch was already sent out individually, find it at
> https://lore.kernel.org/linux-pwm/20231130074133.969806-3-u.kleine-koenig@pengutronix.de
> 
>  drivers/leds/rgb/leds-qcom-lpg.c | 40 ++++++++++++++------------------
>  1 file changed, 17 insertions(+), 23 deletions(-)

Already applied on the 1st December.

-- 
Lee Jones [李琼斯]

