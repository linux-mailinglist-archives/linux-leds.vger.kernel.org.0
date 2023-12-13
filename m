Return-Path: <linux-leds+bounces-368-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B22811856
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 16:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21FB1B209A9
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 15:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74EB285356;
	Wed, 13 Dec 2023 15:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g1iXx68K"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BA985346
	for <linux-leds@vger.kernel.org>; Wed, 13 Dec 2023 15:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C8AC433C9;
	Wed, 13 Dec 2023 15:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702482703;
	bh=F5l770QdZEO1rcQ1zczk0/Hztqc/1Pwoyw1SS8hVjPE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=g1iXx68K8RFuLVd9FzbkEKlB3uDU5pEMpQEBDwGd0jCr2jILqdqufZroPfkPZk6wQ
	 5Rwe+ehSvNXWelKJnyqxZYDEBM7l2AslHGvR+jIvmtXEVJMgm9SkDwLnc/ofs9vFWm
	 cdPnFUJOg5nECvxehlXOXpU3J6QHILZYPnaZy1A0oZIp+F3I/mF6+0HANeSS15lRlp
	 zoEL2vqVUx74fECr3KupcngIBFRgsdcMD0U4fqjTdqW/V36Ep7VCnAQxjmAg9+A5K1
	 csut3A/0K7GMrwZ9QUv/E7tB42asXzrWf69HNDiNx8+gYpvS2oSwBW7DQSD7bJWHcj
	 9cz+zIEl3AY4A==
From: Lee Jones <lee@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: kernel@pengutronix.de, Pavel Machek <pavel@ucw.cz>, 
 Lee Jones <lee@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Anjelique Melendez <quic_amelende@quicinc.com>, Luca Weiss <luca@z3ntu.xyz>, 
 Lu Hongfei <luhongfei@vivo.com>, Kees Cook <keescook@chromium.org>, 
 linux-leds@vger.kernel.org
In-Reply-To: <4785982785812615d15c7dd6d2755270bd8670b2.1701860672.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
 <4785982785812615d15c7dd6d2755270bd8670b2.1701860672.git.u.kleine-koenig@pengutronix.de>
Subject: Re: (subset) [PATCH v4 005/115] leds: qcom-lpg: Introduce a
 wrapper for getting driver data from a pwm chip
Message-Id: <170248270159.994103.8331767719199318616.b4-ty@kernel.org>
Date: Wed, 13 Dec 2023 15:51:41 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Wed, 06 Dec 2023 12:43:19 +0100, Uwe Kleine-König wrote:
> 


Applied, thanks!

[005/115] leds: qcom-lpg: Introduce a wrapper for getting driver data from a pwm chip
          commit: 9e314ded2832908ef270468a5d8337c83f25f550

--
Lee Jones [李琼斯]


