Return-Path: <linux-leds+bounces-367-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14393811855
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 16:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DEB2280DF4
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 15:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0155885353;
	Wed, 13 Dec 2023 15:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKztP1lF"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA77C85346
	for <linux-leds@vger.kernel.org>; Wed, 13 Dec 2023 15:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54BE9C433C7;
	Wed, 13 Dec 2023 15:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702482701;
	bh=lxJCcGbbxfAwBtbFof+dXVYcdJ07I0Oov4OUeX5bS60=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TKztP1lFM6Ir+68v/iA/HLLBSKAdawZJsJudSnwNBQOzLEp1R02dMVD9QjcHWhQKQ
	 h81up+Lpg9EbrQHP7cFVzuGtfeCJU8oE3F8FDPsEJL20ic/HTjYnFFuK3bxBc9GKa2
	 0K8aZJOv6xztIPA3ipJTDpLBkSL3M318PTLTSVzT6nkPraGsDg6z9ce+VL5yDQqJl/
	 uv+bmRu5GCuIM11qLRAuMFunFQHce5TjcHeehinVlLSNoL6ic18M3VM4dT9ewc/LNB
	 wAVn3rSYYoVS9gDy5yeblhoAMYv4qD585+NpSLwrieAJyoA1FBezVHHv67hFSWfLpn
	 6BYs4Qzg+i6kA==
From: Lee Jones <lee@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: kernel@pengutronix.de, Pavel Machek <pavel@ucw.cz>, 
 Lee Jones <lee@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Anjelique Melendez <quic_amelende@quicinc.com>, 
 Lu Hongfei <luhongfei@vivo.com>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, Luca Weiss <luca@z3ntu.xyz>, 
 linux-leds@vger.kernel.org
In-Reply-To: <631d24f0edaa7ac8ebeb22bb66260db8d8823aff.1701860672.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
 <631d24f0edaa7ac8ebeb22bb66260db8d8823aff.1701860672.git.u.kleine-koenig@pengutronix.de>
Subject: Re: (subset) [PATCH v4 003/115] leds: qcom-lpg: Use
 devm_pwmchip_add() simplifying driver removal
Message-Id: <170248269907.994103.11905260462452250629.b4-ty@kernel.org>
Date: Wed, 13 Dec 2023 15:51:39 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Wed, 06 Dec 2023 12:43:17 +0100, Uwe Kleine-König wrote:
> With pwmchip_remove() being automatically called after switching to
> devm_pwmchip_add() the remove function can be dropped completely. Yay!
> With lpg_remove() gone there is no user of the platform device's drvdata
> left, so platform_set_drvdata() can be dropped from .probe(), too.
> 
> 

Applied, thanks!

[003/115] leds: qcom-lpg: Use devm_pwmchip_add() simplifying driver removal
          commit: 9e1815f8c77155aa0818d65b1903a5a39af0ab75

--
Lee Jones [李琼斯]


